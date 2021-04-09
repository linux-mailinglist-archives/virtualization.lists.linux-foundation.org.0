Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9447D359423
	for <lists.virtualization@lfdr.de>; Fri,  9 Apr 2021 06:48:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BDE40677;
	Fri,  9 Apr 2021 04:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CcBpKJpVM26; Fri,  9 Apr 2021 04:48:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D3D1406A5;
	Fri,  9 Apr 2021 04:48:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF55EC000A;
	Fri,  9 Apr 2021 04:48:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDD62C000A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Apr 2021 04:48:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C439940168
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Apr 2021 04:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6a7p-DyawWDV
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Apr 2021 04:48:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C3DF40164
 for <virtualization@lists.linux-foundation.org>;
 Fri,  9 Apr 2021 04:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617943685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lr7bSaeCS5k9NdjAFj7VzPTVSXRHhHksxSYeZxBEhok=;
 b=GLWA7zyrkbxzgFMl6zSi7kjtq1UNxWec9jit8gvigcoc44KlPJXkpw31obpufBpx9a/jTZ
 oE0NZJJTGFg8Dm6sae52ZYFyLC8+6OUi7J4eim2dWfRCKjhY0ne1kf3EWFWc8QQin/PmHY
 CS0WZ96/RH44OCmivsn651w2bSipFYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-nyENpqnlOoK5mGYgUCFRFA-1; Fri, 09 Apr 2021 00:48:03 -0400
X-MC-Unique: nyENpqnlOoK5mGYgUCFRFA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5554D51A4;
 Fri,  9 Apr 2021 04:48:02 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-155.pek2.redhat.com
 [10.72.13.155])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45ABC5D9DC;
 Fri,  9 Apr 2021 04:47:57 +0000 (UTC)
Subject: Re: [RFC PATCH] vdpa: mandate 1.0 device
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210408082648.20145-1-jasowang@redhat.com>
 <20210408115834-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a6a4ab68-c958-7266-c67c-142960222b67@redhat.com>
Date: Fri, 9 Apr 2021 12:47:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408115834-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: elic@nvidia.com, linux-kernel@vger.kernel.org,
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvNC84IM/CzucxMTo1OSwgTWljaGFlbCBTLiBUc2lya2luINC0tcA6Cj4gT24gVGh1
LCBBcHIgMDgsIDIwMjEgYXQgMDQ6MjY6NDhQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToKPj4g
VGhpcyBwYXRjaCBtYW5kYXRlcyAxLjAgZm9yIHZEUEEgZGV2aWNlcy4gVGhlIGdvYWwgaXMgdG8g
aGF2ZSB0aGUKPj4gc2VtYW50aWMgb2Ygbm9ybWF0aXZlIHN0YXRlbWVudCBpbiB0aGUgdmlydGlv
IHNwZWMgYW5kIGVsaW1pbmF0ZSB0aGUKPj4gYnVyZGVuIG9mIHRyYW5zaXRpb25hbCBkZXZpY2Ug
Zm9yIGJvdGggdkRQQSBidXMgYW5kIHZEUEEgcGFyZW50Lgo+Pgo+PiB1QVBJIHNlZW1zIGZpbmUg
c2luY2UgYWxsIHRoZSB2RFBBIHBhcmVudCBtYW5kYXRlcwo+PiBWSVJUSU9fRl9BQ0NFU1NfUExB
VEZPUk0gd2hpY2ggaW1wbGllcyAxLjAgZGV2aWNlcy4KPj4KPj4gRm9yIGxlZ2FjeSBndWVzdHMs
IGl0IGNhbiBzdGlsbCB3b3JrIHNpbmNlIFFlbXUgd2lsbCBtZWRpYXRlIHdoZW4KPj4gbmVjZXNz
YXJ5IChlLmcgZG9pbmcgdGhlIGVuZGlhbiBjb252ZXJzaW9uKS4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBIbW0uIElmIHdlIGRvIHRoaXMs
IGRvbid0IHdlIHN0aWxsIGhhdmUgYSBwcm9ibGVtIHdpdGgKPiBsZWdhY3kgZHJpdmVycyB3aGlj
aCBkb24ndCBhY2sgMS4wPwoKClllcywgYnV0IGl0J3Mgbm90IHNvbWV0aGluZyB0aGF0IGlzIGlu
dHJvZHVjZWQgaW4gdGhpcyBjb21taXQuIFRoZSAKbGVnYWN5IGRyaXZlciBuZXZlciB3b3JrIC4u
LgoKCj4gTm90ZSAxLjAgYWZmZWN0cyByaW5nIGVuZGlhbm5lc3Mgd2hpY2ggaXMgbm90IG1lZGlh
dGVkIGluIFFFTVUKPiBzbyBRRU1VIGNhbid0IHByZXRlbmQgdG8gZGV2aWNlIGd1ZXN0IGlzIDEu
MC4KCgpSaWdodCwgSSBwbGFuIHRvIHNlbmQgcGF0Y2hlcyB0byBkbyBtZWRpYXRpb24gaW4gdGhl
IFFlbXUgdG8gdW5icmVhayAKbGVnYWN5IGRyaXZlcnMuCgpUaGFua3MKCgo+Cj4KPgo+Cj4KPj4g
LS0tCj4+ICAgaW5jbHVkZS9saW51eC92ZHBhLmggfCA2ICsrKysrKwo+PiAgIDEgZmlsZSBjaGFu
Z2VkLCA2IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdmRw
YS5oIGIvaW5jbHVkZS9saW51eC92ZHBhLmgKPj4gaW5kZXggMGZlZmViOTc2ODc3Li5jZmRlNGVj
OTk5YjQgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvdmRwYS5oCj4+ICsrKyBiL2luY2x1
ZGUvbGludXgvdmRwYS5oCj4+IEBAIC02LDYgKzYsNyBAQAo+PiAgICNpbmNsdWRlIDxsaW51eC9k
ZXZpY2UuaD4KPj4gICAjaW5jbHVkZSA8bGludXgvaW50ZXJydXB0Lmg+Cj4+ICAgI2luY2x1ZGUg
PGxpbnV4L3Zob3N0X2lvdGxiLmg+Cj4+ICsjaW5jbHVkZSA8dWFwaS9saW51eC92aXJ0aW9fY29u
ZmlnLmg+Cj4+ICAgCj4+ICAgLyoqCj4+ICAgICogdkRQQSBjYWxsYmFjayBkZWZpbml0aW9uLgo+
PiBAQCAtMzE3LDYgKzMxOCwxMSBAQCBzdGF0aWMgaW5saW5lIGludCB2ZHBhX3NldF9mZWF0dXJl
cyhzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkZXYsIHU2NCBmZWF0dXJlcykKPj4gICB7Cj4+ICAgICAg
ICAgICBjb25zdCBzdHJ1Y3QgdmRwYV9jb25maWdfb3BzICpvcHMgPSB2ZGV2LT5jb25maWc7Cj4+
ICAgCj4+ICsgICAgICAgIC8qIE1hbmRhdGluZyAxLjAgdG8gaGF2ZSBzZW1hbnRpY3Mgb2Ygbm9y
bWF0aXZlIHN0YXRlbWVudHMgaW4KPj4gKyAgICAgICAgICogdGhlIHNwZWMuICovCj4+ICsgICAg
ICAgIGlmICghKGZlYXR1cmVzICYgQklUX1VMTChWSVJUSU9fRl9WRVJTSU9OXzEpKSkKPj4gKwkJ
cmV0dXJuIC1FSU5WQUw7Cj4+ICsKPj4gICAJdmRldi0+ZmVhdHVyZXNfdmFsaWQgPSB0cnVlOwo+
PiAgICAgICAgICAgcmV0dXJuIG9wcy0+c2V0X2ZlYXR1cmVzKHZkZXYsIGZlYXR1cmVzKTsKPj4g
ICB9Cj4+IC0tIAo+PiAyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
