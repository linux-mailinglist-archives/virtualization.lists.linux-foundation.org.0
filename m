Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B8186232F29
	for <lists.virtualization@lfdr.de>; Thu, 30 Jul 2020 11:05:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 166D78763E;
	Thu, 30 Jul 2020 09:04:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZfO4WhUFEyw; Thu, 30 Jul 2020 09:04:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4137887C0C;
	Thu, 30 Jul 2020 09:04:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09E70C004D;
	Thu, 30 Jul 2020 09:04:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D505C004D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:04:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1586F869D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:04:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrJWCYBrcs5O
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:04:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BA35B869C9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Jul 2020 09:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596099893;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bg0cMMWh6rv/tsMc0n2SfWIP3kBSOKA8UU2YlDJdXis=;
 b=KNxrTjDNg8FaLAyea3ezgcMhCr7k0Hbf7l3VW8nBjhe7xjea8wHJN2u0KVl2RsCM8kFEoJ
 G9bKRYSUblxTCJ6wfY242uNe/trn2Q6kcVnkb4BXYLpnGE/eCHVXvfO0Jd4ZGsSH54GGDs
 1QOdfio5qUDV+eDeakJIXH2Ys3Y99jU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-0Dyf40OgMFSFdMaLty-ZQg-1; Thu, 30 Jul 2020 05:04:51 -0400
X-MC-Unique: 0Dyf40OgMFSFdMaLty-ZQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0001100960F;
 Thu, 30 Jul 2020 09:04:50 +0000 (UTC)
Received: from [10.72.13.179] (ovpn-13-179.pek2.redhat.com [10.72.13.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 898651EA;
 Thu, 30 Jul 2020 09:04:46 +0000 (UTC)
Subject: Re: [PATCH] virtio-blk: fix discard buffer overrun
To: Jeffle Xu <jefflexu@linux.alibaba.com>, mst@redhat.com
References: <20200730083050.128458-1-jefflexu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <92b416a1-ed2c-8077-7363-60efb4a03684@redhat.com>
Date: Thu, 30 Jul 2020 17:04:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200730083050.128458-1-jefflexu@linux.alibaba.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: Joseph Qi <joseph.qi@linux.alibaba.com>,
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

Ck9uIDIwMjAvNy8zMCDkuIvljYg0OjMwLCBKZWZmbGUgWHUgd3JvdGU6Cj4gQmVmb3JlIGNvbW1p
dCBlZGVkMzQxYzA4NWIgKCJibG9jazogZG9uJ3QgZGVjcmVtZW50IG5yX3BoeXNfc2VnbWVudHMg
Zm9yCj4gcGh5c2ljYWxseSBjb250aWdvdXMgc2VnbWVudHMiKSBhcHBsaWVkLCB0aGUgZ2VuZXJp
YyBibG9jayBsYXllciBtYXkgbm90Cj4gZ3VhcmFudGVlIHRoYXQgQHJlcS0+bnJfcGh5c19zZWdt
ZW50cyBlcXVhbHMgdGhlIG51bWJlciBvZiBiaW9zIGluIHRoZQo+IHJlcXVlc3QuIFdoZW4gbGlt
aXRzLkBtYXhfZGlzY2FyZF9zZWdtZW50cyA9PSAxIGFuZCB0aGUgSU8gc2NoZWR1bGVyIGlzCj4g
c2V0IHRvIHNjaGVkdWxlciBleGNlcHQgZm9yICJub25lIiAobXEtZGVhZGxpbmUsIGt5YmVyIG9y
IGJmcSwgZS5nLiksCj4gdGhlIHJlcXVlc3RzIG1lcmdlIHJvdXRpbmUgbWF5IGJlIGNhbGxlZCB3
aGVuIGVucXVldWluZyBhIERJU0NBUkQgYmlvLgo+IFdoZW4gbWVyZ2luZyB0d28gcmVxdWVzdHMs
IEByZXEtPm5yX3BoeXNfc2VnbWVudHMgd2lsbCBtaW51cyBvbmUgaWYgdGhlCj4gbWlkZGxlIHR3
byBiaW9zIG9mIHRoZSByZXF1ZXN0cyBjYW4gYmUgbWVyZ2VkIGludG8gb25lIHBoeXNpY2FsIHNl
Z21lbnQsCj4gY2F1c2luZyBAcmVxLT5ucl9waHlzX3NlZ21lbnRzIG9uZSBsZXNzIHRoYW4gdGhl
IG51bWJlciBvZiBiaW9zIGluIHRoZQo+IERJU0NBUkQgcmVxdWVzdC4KPgo+IEluIHRoaXMgY2Fz
ZSwgd2UgYXJlIGluIHJpc2sgb2Ygb3ZlcnJ1bmluZyB2aXJ0aW9fYmxrX2Rpc2NhcmRfd3JpdGVf
emVyb2VzCj4gYnVmZmVycy4gVGhvdWdoIHRoaXMgaXNzdWUgaGFzIGJlZW4gZml4ZWQgYnkgY29t
bWl0IGVkZWQzNDFjMDg1Ygo+ICgiYmxvY2s6IGRvbid0IGRlY3JlbWVudCBucl9waHlzX3NlZ21l
bnRzIGZvciBwaHlzaWNhbGx5IGNvbnRpZ291cyBzZWdtZW50cyIpLAo+IGl0IGNhbiByZWN1cmUg
b25jZSB0aGUgZ2VuZXJpYyBibG9jayBsYXllciBicmVha3MgdGhlIGd1YXJhbnRlZSBhcyBjb2Rl
Cj4gcmVmYWN0b3JpbmcuCj4KPiBjb21taXQgOGNiNmFmN2IzYTZkICgibnZtZTogRml4IGRpc2Nh
cmQgYnVmZmVyIG92ZXJydW4iKSBoYXMgZml4ZWQgdGhlIHNpbWlsYXIKPiBpc3N1ZSBpbiBudm1l
IGRyaXZlci4gVGhpcyBwYXRjaCBpcyBhbHNvIGluc3BpcmVkIGJ5IHRoaXMgY29tbWl0Lgo+Cj4g
U2lnbmVkLW9mZi1ieTogSmVmZmxlIFh1IDxqZWZmbGV4dUBsaW51eC5hbGliYWJhLmNvbT4KPiBS
ZXZpZXdlZC1ieTogSm9zZXBoIFFpIDxqb3NlcGgucWlAbGludXguYWxpYmFiYS5jb20+Cj4gLS0t
Cj4gICBkcml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYyB8IDIzICsrKysrKysrKysrKysrKysrKy0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkK
Pgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYyBiL2RyaXZlcnMvYmxv
Y2svdmlydGlvX2Jsay5jCj4gaW5kZXggOTgwZGY4NTNlZTQ5Li4yNDhjOGY0NmI1MWMgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ibG9jay92aXJ0aW9fYmxrLmMKPiArKysgYi9kcml2ZXJzL2Jsb2Nr
L3ZpcnRpb19ibGsuYwo+IEBAIC0xMzAsMTIgKzEzMCwxOSBAQCBzdGF0aWMgaW50IHZpcnRibGtf
c2V0dXBfZGlzY2FyZF93cml0ZV96ZXJvZXMoc3RydWN0IHJlcXVlc3QgKnJlcSwgYm9vbCB1bm1h
cCkKPiAgIAkJdTY0IHNlY3RvciA9IGJpby0+YmlfaXRlci5iaV9zZWN0b3I7Cj4gICAJCXUzMiBu
dW1fc2VjdG9ycyA9IGJpby0+YmlfaXRlci5iaV9zaXplID4+IFNFQ1RPUl9TSElGVDsKPiAgIAo+
IC0JCXJhbmdlW25dLmZsYWdzID0gY3B1X3RvX2xlMzIoZmxhZ3MpOwo+IC0JCXJhbmdlW25dLm51
bV9zZWN0b3JzID0gY3B1X3RvX2xlMzIobnVtX3NlY3RvcnMpOwo+IC0JCXJhbmdlW25dLnNlY3Rv
ciA9IGNwdV90b19sZTY0KHNlY3Rvcik7Cj4gKwkJaWYgKG4gPCBzZWdtZW50cykgewo+ICsJCQly
YW5nZVtuXS5mbGFncyA9IGNwdV90b19sZTMyKGZsYWdzKTsKPiArCQkJcmFuZ2Vbbl0ubnVtX3Nl
Y3RvcnMgPSBjcHVfdG9fbGUzMihudW1fc2VjdG9ycyk7Cj4gKwkJCXJhbmdlW25dLnNlY3RvciA9
IGNwdV90b19sZTY0KHNlY3Rvcik7Cj4gKwkJfQoKCk5vdCBmYW1pbGlhciB3aXRoIGJsb2NrIGJ1
dCBpZiB3ZSBzdGFydCB0byBkdXBsaWNhdGUgY2hlY2tzIGxpa2UgdGhpcywgCml0J3MgYSBoaW50
IHRvIG1vdmUgaXQgaW4gdGhlIGNvcmUuCgoKPiAgIAkJbisrOwo+ICAgCX0KPiAgIAo+ICsJaWYg
KFdBUk5fT05fT05DRShuICE9IHNlZ21lbnRzKSkgewo+ICsJCWtmcmVlKHJhbmdlKTsKPiArCQly
ZXR1cm4gLUVJTzsKPiArCX0KPiArCj4gICAJcmVxLT5zcGVjaWFsX3ZlYy5idl9wYWdlID0gdmly
dF90b19wYWdlKHJhbmdlKTsKPiAgIAlyZXEtPnNwZWNpYWxfdmVjLmJ2X29mZnNldCA9IG9mZnNl
dF9pbl9wYWdlKHJhbmdlKTsKPiAgIAlyZXEtPnNwZWNpYWxfdmVjLmJ2X2xlbiA9IHNpemVvZigq
cmFuZ2UpICogc2VnbWVudHM7Cj4gQEAgLTI0Niw4ICsyNTMsMTQgQEAgc3RhdGljIGJsa19zdGF0
dXNfdCB2aXJ0aW9fcXVldWVfcnEoc3RydWN0IGJsa19tcV9od19jdHggKmhjdHgsCj4gICAKPiAg
IAlpZiAodHlwZSA9PSBWSVJUSU9fQkxLX1RfRElTQ0FSRCB8fCB0eXBlID09IFZJUlRJT19CTEtf
VF9XUklURV9aRVJPRVMpIHsKPiAgIAkJZXJyID0gdmlydGJsa19zZXR1cF9kaXNjYXJkX3dyaXRl
X3plcm9lcyhyZXEsIHVubWFwKTsKPiAtCQlpZiAoZXJyKQo+IC0JCQlyZXR1cm4gQkxLX1NUU19S
RVNPVVJDRTsKPiArCQlpZiAoZXJyKSB7Cj4gKwkJCXN3aXRjaCAoZXJyKSB7Cj4gKwkJCWNhc2Ug
LUVOT01FTToKPiArCQkJCXJldHVybiBCTEtfU1RTX1JFU09VUkNFOwo+ICsJCQlkZWZhdWx0Ogo+
ICsJCQkJcmV0dXJuIEJMS19TVFNfSU9FUlI7Cj4gKwkJCX0KPiArCQl9CgoKVGhpcyBsb29rcyBu
b3QgZWxlZ2FudCwgd2h5IG5vdCBzaW1wbGUgaWYgKGVycsKgID09IC1FTk9NRU0pIGVsc2UgaWYg
CihlcnIpIC4uLgoKVGhhbmtzCgoKPiAgIAl9Cj4gICAKPiAgIAludW0gPSBibGtfcnFfbWFwX3Nn
KGhjdHgtPnF1ZXVlLCByZXEsIHZici0+c2cpOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxp
emF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3Vu
ZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
