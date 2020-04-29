Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BC61BD815
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 11:22:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 62E3122DE3;
	Wed, 29 Apr 2020 09:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7HkKA0ZvNwjY; Wed, 29 Apr 2020 09:22:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D10D422E89;
	Wed, 29 Apr 2020 09:22:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A173BC0172;
	Wed, 29 Apr 2020 09:22:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45704C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2BB8C22E89
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhURwomVKiBe
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:21:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 6E55D22DE3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 09:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588152116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VZvr/skNPOFKMD3ogXhoD9tnQHqLrRRqrmLtubG1DcI=;
 b=bXRhx8efqDzHNDTwyu6wp7SnFZptiDXeMokD7XE5hs/U+N7+r+W5UgEcNVTOuXoAa8ow2L
 1xYU3jdexUXHFwHWSWGWbk0OmE2YgLe/orTlUA9kb48fJWxY9LqgDBcLq0FYIWliVks/O+
 ebuQKuPcbXQycqfhP+5264r60LtUOl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-urpKaGkpMHmnm-m04i_PzA-1; Wed, 29 Apr 2020 05:21:55 -0400
X-MC-Unique: urpKaGkpMHmnm-m04i_PzA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96E72107ACF4;
 Wed, 29 Apr 2020 09:21:53 +0000 (UTC)
Received: from [10.72.13.2] (ovpn-13-2.pek2.redhat.com [10.72.13.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 752B65C1BE;
 Wed, 29 Apr 2020 09:21:44 +0000 (UTC)
Subject: Re: [PATCH net-next 0/3] vsock: support network namespace
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200427142518.uwssa6dtasrp3bfc@steredhat>
 <224cdc10-1532-7ddc-f113-676d43d8f322@redhat.com>
 <20200428160052.o3ihui4262xogyg4@steredhat>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <6dc937e4-0ef9-617d-c9c8-8b1f8c428d90@redhat.com>
Date: Wed, 29 Apr 2020 17:21:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428160052.o3ihui4262xogyg4@steredhat>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, davem@davemloft.net,
 Jorgen Hansen <jhansen@vmware.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjAvNC8yOSDkuIrljYgxMjowMCwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+IE9u
IFR1ZSwgQXByIDI4LCAyMDIwIGF0IDA0OjEzOjIyUE0gKzA4MDAsIEphc29uIFdhbmcgd3JvdGU6
Cj4+IE9uIDIwMjAvNC8yNyDkuIvljYgxMDoyNSwgU3RlZmFubyBHYXJ6YXJlbGxhIHdyb3RlOgo+
Pj4gSGkgRGF2aWQsIE1pY2hhZWwsIFN0ZWZhbiwKPj4+IEknbSByZXN0YXJ0aW5nIHRvIHdvcmsg
b24gdGhpcyB0b3BpYyBzaW5jZSBLYXRhIGd1eXMgYXJlIGludGVyZXN0ZWQgdG8KPj4+IGhhdmUg
dGhhdCwgZXNwZWNpYWxseSBvbiB0aGUgZ3Vlc3Qgc2lkZS4KPj4+Cj4+PiBXaGlsZSB3b3JraW5n
IG9uIHRoZSB2MiBJIGhhZCBmZXcgZG91YnRzLCBhbmQgSSdkIGxpa2UgdG8gaGF2ZSB5b3VyCj4+
PiBzdWdnZXN0aW9uczoKPj4+Cj4+PiAgICAxLiBuZXRucyBhc3NpZ25lZCB0byB0aGUgZGV2aWNl
IGluc2lkZSB0aGUgZ3Vlc3QKPj4+Cj4+PiAgICAgIEN1cnJlbnRseSBJIGFzc2lnbmVkIHRoaXMg
ZGV2aWNlIHRvICdpbml0X25ldCcuIE1heWJlIGl0IGlzIGJldHRlcgo+Pj4gICAgICBpZiB3ZSBh
bGxvdyB0aGUgdXNlciB0byBkZWNpZGUgd2hpY2ggbmV0bnMgYXNzaWduIHRvIHRoZSBkZXZpY2UK
Pj4+ICAgICAgb3IgdG8gZGlzYWJsZSB0aGlzIG5ldyBmZWF0dXJlIHRvIGhhdmUgdGhlIHNhbWUg
YmVoYXZpb3IgYXMgYmVmb3JlCj4+PiAgICAgIChob3N0IHJlYWNoYWJsZSBmcm9tIGFueSBuZXRu
cykuCj4+PiAgICAgIEkgdGhpbmsgd2UgY2FuIGhhbmRsZSB0aGlzIGluIHRoZSB2c29jayBjb3Jl
IGFuZCBub3QgaW4gdGhlIHNpbmdsZQo+Pj4gICAgICB0cmFuc3BvcnRzLgo+Pj4KPj4+ICAgICAg
VGhlIHNpbXBsZXN0IHdheSB0aGF0IEkgZm91bmQsIGlzIHRvIGFkZCBhIG5ldwo+Pj4gICAgICBJ
T0NUTF9WTV9TT0NLRVRTX0FTU0lHTl9HMkhfTkVUTlMgdG8gL2Rldi92c29jayB0byBlbmFibGUg
dGhlIGZlYXR1cmUKPj4+ICAgICAgYW5kIGFzc2lnbiB0aGUgZGV2aWNlIHRvIHRoZSBzYW1lIG5l
dG5zIG9mIHRoZSBwcm9jZXNzIHRoYXQgZG8gdGhlCj4+PiAgICAgIGlvY3RsKCksIGJ1dCBJJ20g
bm90IHN1cmUgaXQgaXMgY2xlYW4gZW5vdWdoLgo+Pj4KPj4+ICAgICAgTWF5YmUgaXQgaXMgYmV0
dGVyIHRvIGFkZCBuZXcgcnRuZXRsaW5rIG1lc3NhZ2VzLCBidXQgSSdtIG5vdCBzdXJlIGlmCj4+
PiAgICAgIGl0IGlzIGZlYXNpYmxlIHNpbmNlIHdlIGRvbid0IGhhdmUgYSBuZXRkZXYgZGV2aWNl
Lgo+Pj4KPj4+ICAgICAgV2hhdCBkbyB5b3Ugc3VnZ2VzdD8KPj4gQXMgd2UndmUgZGlzY3Vzc2Vk
LCBpdCBzaG91bGQgYmUgYSBuZXRkZXYgcHJvYmFibHkgaW4gZWl0aGVyIGd1ZXN0IG9yIGhvc3QK
Pj4gc2lkZS4gQW5kIGl0IHdvdWxkIGJlIG11Y2ggc2ltcGxlciBpZiB3ZSB3YW50IGRvIGltcGxl
bWVudCBuYW1lc3BhY2UgdGhlbi4KPj4gTm8gbmV3IEFQSSBpcyBuZWVkZWQuCj4+Cj4gVGhhbmtz
IEphc29uIQo+Cj4gSXQgd291bGQgYmUgY29vbCwgYnV0IEkgZG9uJ3QgaGF2ZSBtdWNoIGV4cGVy
aWVuY2Ugb24gbmV0ZGV2Lgo+IERvIHlvdSBzZWUgYW55IHBhcnRpY3VsYXIgb2JzdGFjbGVzPwoK
CkkgZG9uJ3Qgc2VlIGJ1dCBpZiB0aGVyZSdzIHdlIGNhbiB0cnkgdG8gZmluZCBhIHNvbHV0aW9u
IG9yIGFzayBmb3IgCm5ldGRldiBleHBlcnRzIGZvciB0aGF0LiBJIGRvIGhlYXIgZnJvbSBzb21l
Ym9keSB0aGF0IGlzIGludGVyZXN0ZWQgaW4gCmhhdmluZyBuZXRkZXYgaW4gdGhlIHBhc3QuCgoK
Pgo+IEknbGwgdGFrZSBhIGxvb2sgdG8gdW5kZXJzdGFuZCBob3cgdG8gZG8gaXQsIHN1cmVseSBp
biB0aGUgZ3Vlc3Qgd291bGQKPiBiZSB2ZXJ5IHVzZWZ1bCB0byBoYXZlIHRoZSB2c29jayBkZXZp
Y2UgYXMgYSBuZXRkZXYgYW5kIG1heWJlIGFsc28gaW4gdGhlIGhvc3QuCgoKWWVzLCBpdCdzIHdv
cnRoIHRvIGhhdmUgYSB0cnkgdGhlbiB3ZSB3aWxsIGhhdmUgYSB1bmlmaWVkIG1hbmFnZW1lbnQg
CmludGVyZmFjZSBhbmQgd2Ugd2lsbCBiZW5lZml0IGZyb20gaXQgaW4gdGhlIGZ1dHVyZS4KClN0
YXJ0aW5nIGZvcm0gZ3Vlc3QgaXMgZ29vZCBpZGVhIHdoaWNoIHNob3VsZCBiZSBsZXNzIGNvbXBs
aWNhdGVkIHRoYW4gaG9zdC4KClRoYW5rcwoKCj4KPiBTdGVmYW5vCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
