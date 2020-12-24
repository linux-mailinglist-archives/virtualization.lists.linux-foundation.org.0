Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9D2E23F0
	for <lists.virtualization@lfdr.de>; Thu, 24 Dec 2020 04:10:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DE3486770;
	Thu, 24 Dec 2020 03:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bsa4SV8Q6CQf; Thu, 24 Dec 2020 03:10:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C02A867A1;
	Thu, 24 Dec 2020 03:10:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7489DC0893;
	Thu, 24 Dec 2020 03:10:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F15C8C0893
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 03:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DBCCC871C3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 03:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaYK7SIvx4P4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 03:10:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E3F96871BE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Dec 2020 03:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608779437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d5ECQoERo7ozEZ7ZyUdd7rpKW0sc1bjVRvw6JsEPNx0=;
 b=MSLK7TjPtFox2l6ngRXZ8qTHUVFGndlvuEoSWPyVlUoHRPYFW7pbCgztuqSjSatZQ3KAIg
 nTkHoggytEpIeDkYN7YBwoffgQ7D2fZ3ylIgtk0WcYpG31Tsvxr+sA4J5Bh0VRy0By9+LW
 14qH6JUrXADHgurFZwgEegmavlDPc2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-d9-m4xBwMgqmP6KrJLO4rA-1; Wed, 23 Dec 2020 22:10:35 -0500
X-MC-Unique: d9-m4xBwMgqmP6KrJLO4rA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F7A5107ACE6;
 Thu, 24 Dec 2020 03:10:33 +0000 (UTC)
Received: from [10.72.13.109] (ovpn-13-109.pek2.redhat.com [10.72.13.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 054165D9CD;
 Thu, 24 Dec 2020 03:10:26 +0000 (UTC)
Subject: Re: [PATCH net v4 2/2] vhost_net: fix tx queue stuck when sendmsg
 fails
To: wangyunjian <wangyunjian@huawei.com>, netdev@vger.kernel.org,
 mst@redhat.com, willemdebruijn.kernel@gmail.com
References: <1608776746-4040-1-git-send-email-wangyunjian@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c854850b-43ab-c98d-a4d8-36ad7cd6364c@redhat.com>
Date: Thu, 24 Dec 2020 11:10:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1608776746-4040-1-git-send-email-wangyunjian@huawei.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: xudingke@huawei.com, brian.huangbin@huawei.com, jerry.lilijun@huawei.com,
 chenchanghu@huawei.com, virtualization@lists.linux-foundation.org
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

Ck9uIDIwMjAvMTIvMjQg5LiK5Y2IMTA6MjUsIHdhbmd5dW5qaWFuIHdyb3RlOgo+IEZyb206IFl1
bmppYW4gV2FuZyA8d2FuZ3l1bmppYW5AaHVhd2VpLmNvbT4KPgo+IEN1cnJlbnRseSB0aGUgZHJp
dmVyIGRvZXNuJ3QgZHJvcCBhIHBhY2tldCB3aGljaCBjYW4ndCBiZSBzZW50IGJ5IHR1bgo+IChl
LmcgYmFkIHBhY2tldCkuIEluIHRoaXMgY2FzZSwgdGhlIGRyaXZlciB3aWxsIGFsd2F5cyBwcm9j
ZXNzIHRoZQo+IHNhbWUgcGFja2V0IGxlYWQgdG8gdGhlIHR4IHF1ZXVlIHN0dWNrLgo+Cj4gVG8g
Zml4IHRoaXMgaXNzdWU6Cj4gMS4gaW4gdGhlIGNhc2Ugb2YgcGVyc2lzdGVudCBmYWlsdXJlIChl
LmcgYmFkIHBhY2tldCksIHRoZSBkcml2ZXIKPiBjYW4gc2tpcCB0aGlzIGRlc2NyaXB0b3IgYnkg
aWdub3JpbmcgdGhlIGVycm9yLgo+IDIuIGluIHRoZSBjYXNlIG9mIHRyYW5zaWVudCBmYWlsdXJl
IChlLmcgLUVBR0FJTiBhbmQgLUVOT01FTSksIHRoZQo+IGRyaXZlciBzY2hlZHVsZXMgdGhlIHdv
cmtlciB0byB0cnkgYWdhaW4uCgoKSSBtaWdodCBiZSB3cm9uZyBidXQgbG9va2luZyBhdCBhbGxv
Y19za2Jfd2l0aF9mcmFncygpLCBpdCByZXR1cm5zIAotRU5PQlVGUyBhY3R1YWxseToKCiDCoMKg
wqAgKmVycmNvZGUgPSAtRU5PQlVGUzsKIMKgwqDCoCBza2IgPSBhbGxvY19za2IoaGVhZGVyX2xl
biwgZ2ZwX21hc2spOwogwqDCoMKgIGlmICghc2tiKQogwqDCoMKgIMKgwqDCoCByZXR1cm4gTlVM
TDsKClRoYW5rcwoKCj4KPiBGaXhlczogM2E0ZDVjOTRlOTU5ICgidmhvc3RfbmV0OiBhIGtlcm5l
bC1sZXZlbCB2aXJ0aW8gc2VydmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBZdW5qaWFuIFdhbmcgPHdh
bmd5dW5qaWFuQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL3Zob3N0L25ldC5jIHwgMTYg
KysrKysrKystLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L25ldC5jIGIvZHJpdmVy
cy92aG9zdC9uZXQuYwo+IGluZGV4IGM4Nzg0ZGZhZmRkNy4uZTc2MjQ1ZGFhN2Y2IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvdmhvc3QvbmV0LmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L25ldC5jCj4g
QEAgLTgyNywxNCArODI3LDEzIEBAIHN0YXRpYyB2b2lkIGhhbmRsZV90eF9jb3B5KHN0cnVjdCB2
aG9zdF9uZXQgKm5ldCwgc3RydWN0IHNvY2tldCAqc29jaykKPiAgIAkJCQltc2cubXNnX2ZsYWdz
ICY9IH5NU0dfTU9SRTsKPiAgIAkJfQo+ICAgCj4gLQkJLyogVE9ETzogQ2hlY2sgc3BlY2lmaWMg
ZXJyb3IgYW5kIGJvbWIgb3V0IHVubGVzcyBFTk9CVUZTPyAqLwo+ICAgCQllcnIgPSBzb2NrLT5v
cHMtPnNlbmRtc2coc29jaywgJm1zZywgbGVuKTsKPiAtCQlpZiAodW5saWtlbHkoZXJyIDwgMCkp
IHsKPiArCQlpZiAodW5saWtlbHkoZXJyID09IC1FQUdBSU4gfHwgZXJyID09IC1FTk9NRU0pKSB7
Cj4gICAJCQl2aG9zdF9kaXNjYXJkX3ZxX2Rlc2ModnEsIDEpOwo+ICAgCQkJdmhvc3RfbmV0X2Vu
YWJsZV92cShuZXQsIHZxKTsKPiAgIAkJCWJyZWFrOwo+ICAgCQl9Cj4gLQkJaWYgKGVyciAhPSBs
ZW4pCj4gKwkJaWYgKGVyciA+PSAwICYmIGVyciAhPSBsZW4pCj4gICAJCQlwcl9kZWJ1ZygiVHJ1
bmNhdGVkIFRYIHBhY2tldDogbGVuICVkICE9ICV6ZFxuIiwKPiAgIAkJCQkgZXJyLCBsZW4pOwo+
ICAgZG9uZToKPiBAQCAtOTIyLDcgKzkyMSw2IEBAIHN0YXRpYyB2b2lkIGhhbmRsZV90eF96ZXJv
Y29weShzdHJ1Y3Qgdmhvc3RfbmV0ICpuZXQsIHN0cnVjdCBzb2NrZXQgKnNvY2spCj4gICAJCQlt
c2cubXNnX2ZsYWdzICY9IH5NU0dfTU9SRTsKPiAgIAkJfQo+ICAgCj4gLQkJLyogVE9ETzogQ2hl
Y2sgc3BlY2lmaWMgZXJyb3IgYW5kIGJvbWIgb3V0IHVubGVzcyBFTk9CVUZTPyAqLwo+ICAgCQll
cnIgPSBzb2NrLT5vcHMtPnNlbmRtc2coc29jaywgJm1zZywgbGVuKTsKPiAgIAkJaWYgKHVubGlr
ZWx5KGVyciA8IDApKSB7Cj4gICAJCQlpZiAoemNvcHlfdXNlZCkgewo+IEBAIC05MzEsMTEgKzky
OSwxMyBAQCBzdGF0aWMgdm9pZCBoYW5kbGVfdHhfemVyb2NvcHkoc3RydWN0IHZob3N0X25ldCAq
bmV0LCBzdHJ1Y3Qgc29ja2V0ICpzb2NrKQo+ICAgCQkJCW52cS0+dXBlbmRfaWR4ID0gKCh1bnNp
Z25lZCludnEtPnVwZW5kX2lkeCAtIDEpCj4gICAJCQkJCSUgVUlPX01BWElPVjsKPiAgIAkJCX0K
PiAtCQkJdmhvc3RfZGlzY2FyZF92cV9kZXNjKHZxLCAxKTsKPiAtCQkJdmhvc3RfbmV0X2VuYWJs
ZV92cShuZXQsIHZxKTsKPiAtCQkJYnJlYWs7Cj4gKwkJCWlmIChlcnIgPT0gLUVBR0FJTiB8fCBl
cnIgPT0gLUVOT01FTSkgewo+ICsJCQkJdmhvc3RfZGlzY2FyZF92cV9kZXNjKHZxLCAxKTsKPiAr
CQkJCXZob3N0X25ldF9lbmFibGVfdnEobmV0LCB2cSk7Cj4gKwkJCQlicmVhazsKPiArCQkJfQo+
ICAgCQl9Cj4gLQkJaWYgKGVyciAhPSBsZW4pCj4gKwkJaWYgKGVyciA+PSAwICYmIGVyciAhPSBs
ZW4pCj4gICAJCQlwcl9kZWJ1ZygiVHJ1bmNhdGVkIFRYIHBhY2tldDogIgo+ICAgCQkJCSAiIGxl
biAlZCAhPSAlemRcbiIsIGVyciwgbGVuKTsKPiAgIAkJaWYgKCF6Y29weV91c2VkKQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
