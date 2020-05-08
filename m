Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F12E21CA057
	for <lists.virtualization@lfdr.de>; Fri,  8 May 2020 03:54:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C7A986F33;
	Fri,  8 May 2020 01:54:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrHJpcRx__iH; Fri,  8 May 2020 01:54:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E57F28701D;
	Fri,  8 May 2020 01:54:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8859C07FF;
	Fri,  8 May 2020 01:54:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7448BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 69FFA86F33
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4MTkq9wQY75
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:54:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 095AC86E34
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 01:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588902859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8is+as/IWe32hsvVt9oXkFSeTwtP1mvlBgfZZAeexYQ=;
 b=YNF8tkfS9yOxP3EwvaD52eCcZ1SwVQruGY5+HSbXtjAXfX3VeKRGIVICPn/wF6QQLStN4X
 +haheQYEhckquG+qggGwYjoPXZ0OqranK90HblAjDZ0OQq33nU8ivXYvegnJU/r6Zf3GNY
 JQpr2Gl7F9kdDAAO6yUEIdtSCk8Gslw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-hkaK7xe3NF6q51s7VNlBWg-1; Thu, 07 May 2020 21:54:15 -0400
X-MC-Unique: hkaK7xe3NF6q51s7VNlBWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DDF6835BC5;
 Fri,  8 May 2020 01:54:14 +0000 (UTC)
Received: from [10.72.13.98] (ovpn-13-98.pek2.redhat.com [10.72.13.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCD765D9C5;
 Fri,  8 May 2020 01:54:06 +0000 (UTC)
Subject: Re: [PATCH net-next 2/2] virtio-net: fix the XDP truesize calculation
 for mergeable buffers
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
 <20200506061633.16327-2-jasowang@redhat.com>
 <20200506033259-mutt-send-email-mst@kernel.org>
 <789fc6e6-9667-a609-c777-a9b1fed72f41@redhat.com>
 <20200506075807-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <0e59287f-8333-c715-da03-91306cef9878@redhat.com>
Date: Fri, 8 May 2020 09:54:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506075807-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvNS82IOS4i+WNiDg6MDgsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBX
ZWQsIE1heSAwNiwgMjAyMCBhdCAwNDoyMToxNVBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzUvNiDkuIvljYgzOjM3LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4+PiBP
biBXZWQsIE1heSAwNiwgMjAyMCBhdCAwMjoxNjozM1BNICswODAwLCBKYXNvbiBXYW5nIHdyb3Rl
Ogo+Pj4+IFdlIHNob3VsZCBub3QgZXhjbHVkZSBoZWFkcm9vbSBhbmQgdGFpbHJvb20gd2hlbiBY
RFAgaXMgc2V0LiBTbyB0aGlzCj4+Pj4gcGF0Y2ggZml4ZXMgdGhpcyBieSBpbml0aWFsaXppbmcg
dGhlIHRydWVzaXplIGZyb20gUEFHRV9TSVpFIHdoZW4gWERQCj4+Pj4gaXMgc2V0Lgo+Pj4+Cj4+
Pj4gQ2M6IEplc3BlciBEYW5nYWFyZCBCcm91ZXI8YnJvdWVyQHJlZGhhdC5jb20+Cj4+Pj4gU2ln
bmVkLW9mZi1ieTogSmFzb24gV2FuZzxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4gU2VlbXMgdG9v
IGFnZ3Jlc3NpdmUsIHdlIGRvIG5vdCB1c2UgdXAgdGhlIHdob2xlIHBhZ2UgZm9yIHRoZSBzaXpl
Lgo+Pj4KPj4+Cj4+Pgo+PiBGb3IgWERQIHllcywgd2UgZG86Cj4+Cj4+IHN0YXRpYyB1bnNpZ25l
ZCBpbnQgZ2V0X21lcmdlYWJsZV9idWZfbGVuKHN0cnVjdCByZWNlaXZlX3F1ZXVlICpycSwKPj4g
IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqAgc3RydWN0IGV3bWFfcGt0X2xl
biAqYXZnX3BrdF9sZW4sCj4+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
IHVuc2lnbmVkIGludCByb29tKQo+PiB7Cj4+ICDCoMKgwqAgY29uc3Qgc2l6ZV90IGhkcl9sZW4g
PSBzaXplb2Yoc3RydWN0IHZpcnRpb19uZXRfaGRyX21yZ19yeGJ1Zik7Cj4+ICDCoMKgwqAgdW5z
aWduZWQgaW50IGxlbjsKPj4KPj4gIMKgwqDCoCBpZiAocm9vbSkKPj4gIMKgwqDCoCDCoMKgwqAg
cmV0dXJuIFBBR0VfU0laRSAtIHJvb207Cj4+Cj4+IC4uLgo+Pgo+PiBUaGFua3MKPiBIbW0uIEJ1
dCB0aGF0J3Mgb25seSBmb3IgbmV3IGJ1ZmZlcnMuIEJ1ZmZlcnMgdGhhdCB3ZXJlIG91dHN0YW5k
aW5nCj4gYmVmb3JlIHhkcCB3YXMgYXR0YWNoZWQgZG9uJ3QgdXNlIHRoZSB3aG9sZSBwYWdlLCBk
byB0aGV5PwoKClRoZXkgZG9uJ3QgYW5kIGluIGVpdGhlciBjYXNlLCB3ZSd2ZSBlbmNvZGVkIHRy
dWVzaXplIGluIHRoZSBjdHguIEFueSAKaXNzdWUgeW91IHNhdz8KCgo+Cj4KPgo+Cj4gQWxzbywg
d2l0aCBUQ1Agc21hbGxxdWV1ZXMgYmxvY2tpbmcgdGhlIHF1ZXVlIGxpa2UgdGhhdCBtaWdodCBi
ZSBhIHByb2JsZW0uCj4gQ291bGQgeW91IHRyeSBhbmQgY2hlY2sgcGVyZm9ybWFuY2UgaW1wYWN0
IG9mIHRoaXM/CgoKSSdtIG5vdCBzdXJlIEkgZ2V0IHlvdSwgVENQIHNtYWxsIHF1ZXVlIGlzIG1v
cmUgYWJvdXQgVFggSSBndWVzcy4gQW5kIApzaW5jZSB3ZSd2ZSBpbnZhbGlkYXRlZCB0aGUgdm5l
dCBoZWFkZXIsIHRoZSBwZXJmb3JtYW5jZSBvZiBYRFBfUEFTUyAKd29uJ3QgYmUgZ29vZC4KCgo+
IEkgbG9va2VkIGF0IHdoYXQgb3RoZXIgZHJpdmVycyBkbyBhbmQgSSBzZWUgdGhleSB0ZW5kIHRv
IGNvcHkgdGhlIHNrYgo+IGluIFhEUF9QQVNTIGNhc2UuIEFUTSB3ZSBkb24ndCBub3JtYWxseSAt
IGJ1dCBzaG91bGQgd2U/CgoKTXkgdW5kZXJzdGFuZGluZyBpcyBYRFAgcnVucyBiZWZvcmUgc2ti
LCBzbyBJIGRvbid0IGdldCBoZXJlLiBPciBtYXliZSAKeW91IGNhbiBwb2ludCBtZSB0aGUgZHJp
dmVyIHlvdSBtZW50aW9uZWQgaGVyZT8gSSd2ZSBjaGVja2VkIGk0MGUgYW5kIAptbHg1ZSwgYm90
aCBvZiB0aGVtIGJ1aWxkIHNrYiBhZnRlciBYRFAuCgpUaGFua3MKCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
