Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45E1B8D17
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 08:59:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3BE9687B0F;
	Sun, 26 Apr 2020 06:59:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78g1LeID7mRA; Sun, 26 Apr 2020 06:59:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66E9087AFF;
	Sun, 26 Apr 2020 06:59:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4143DC0172;
	Sun, 26 Apr 2020 06:59:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 537F5C0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 06:59:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3A33685514
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 06:59:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AD36YWUG6c8k
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 06:59:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D8C6F85329
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 06:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587884338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nzpyfv1Z6VEBidKjguuGbAmxFY96l0LyJXnhGt0vsLM=;
 b=bkrY++XlhKnOfQLgDBekNggdb1zb5Bieg373QMOU0/O6m931tN/y4i/Yn+oGP6lNK0aEfY
 nzFJYojJkX0S9kiP/ALZNJQCUUtoFSaUP6LEt+lUf50++D2SwyiUO7mmYJLwqXcwyB4885
 kUD2WvG1FgDDKeKbSKwzlEFWgH8LdDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-aJ0xuxzYOcqNo5y_I5t1WQ-1; Sun, 26 Apr 2020 02:58:53 -0400
X-MC-Unique: aJ0xuxzYOcqNo5y_I5t1WQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89CE91005510;
 Sun, 26 Apr 2020 06:58:51 +0000 (UTC)
Received: from [10.72.13.103] (ovpn-13-103.pek2.redhat.com [10.72.13.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 506925D9CD;
 Sun, 26 Apr 2020 06:58:44 +0000 (UTC)
Subject: Re: [PATCH V2 1/2] vdpa: Support config interrupt in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1587881384-2133-1-git-send-email-lingshan.zhu@intel.com>
 <1587881384-2133-2-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <055fb826-895d-881b-719c-228d0cc9a7bf@redhat.com>
Date: Sun, 26 Apr 2020 14:58:43 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587881384-2133-2-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: lulu@redhat.com
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

Ck9uIDIwMjAvNC8yNiDkuIvljYgyOjA5LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgaW1wbGVtZW50cyBjb25maWcgaW50ZXJydXB0IHN1cHBvcnQgaW4KPiB2aG9zdF92ZHBhIGxh
eWVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgICAgICAgfCA0NyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3Zob3N0L3Zo
b3N0LmMgICAgICB8ICAyICstCj4gICBkcml2ZXJzL3Zob3N0L3Zob3N0LmggICAgICB8ICAyICsr
Cj4gICBpbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCB8ICAyICsrCj4gICA0IGZpbGVzIGNoYW5n
ZWQsIDUyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3Zob3N0L3ZkcGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gaW5kZXggNDIxZjAyYS4u
Yjk0ZTM0OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+ICsrKyBiL2RyaXZl
cnMvdmhvc3QvdmRwYS5jCj4gQEAgLTIxLDYgKzIxLDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9u
b3NwZWMuaD4KPiAgICNpbmNsdWRlIDxsaW51eC92aG9zdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4
L3ZpcnRpb19uZXQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAgCj4gICAjaW5j
bHVkZSAidmhvc3QuaCIKPiAgIAo+IEBAIC03MCw2ICs3MSw3IEBAIHN0cnVjdCB2aG9zdF92ZHBh
IHsKPiAgIAlpbnQgbnZxczsKPiAgIAlpbnQgdmlydGlvX2lkOwo+ICAgCWludCBtaW5vcjsKPiAr
CXN0cnVjdCBldmVudGZkX2N0eCAqY29uZmlnX2N0eDsKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBE
RUZJTkVfSURBKHZob3N0X3ZkcGFfaWRhKTsKPiBAQCAtMTAxLDYgKzEwMywxNyBAQCBzdGF0aWMg
aXJxcmV0dXJuX3Qgdmhvc3RfdmRwYV92aXJ0cXVldWVfY2Iodm9pZCAqcHJpdmF0ZSkKPiAgIAly
ZXR1cm4gSVJRX0hBTkRMRUQ7Cj4gICB9Cj4gICAKPiArc3RhdGljIGlycXJldHVybl90IHZob3N0
X3ZkcGFfY29uZmlnX2NiKHZvaWQgKnByaXZhdGUpCj4gK3sKPiArCXN0cnVjdCB2aG9zdF92ZHBh
ICp2ID0gcHJpdmF0ZTsKPiArCXN0cnVjdCBldmVudGZkX2N0eCAqY29uZmlnX2N0eCA9IHYtPmNv
bmZpZ19jdHg7Cj4gKwo+ICsJaWYgKGNvbmZpZ19jdHgpCj4gKwkJZXZlbnRmZF9zaWduYWwoY29u
ZmlnX2N0eCwgMSk7Cj4gKwo+ICsJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICt9Cj4gKwo+ICAgc3Rh
dGljIHZvaWQgdmhvc3RfdmRwYV9yZXNldChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikKPiAgIHsKPiAg
IAlzdHJ1Y3QgdmRwYV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+IEBAIC0yODgsNiArMzAxLDM2
IEBAIHN0YXRpYyBsb25nIHZob3N0X3ZkcGFfZ2V0X3ZyaW5nX251bShzdHJ1Y3Qgdmhvc3RfdmRw
YSAqdiwgdTE2IF9fdXNlciAqYXJncCkKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtzdGF0
aWMgdm9pZCB2aG9zdF92ZHBhX2NvbmZpZ19wdXQoc3RydWN0IHZob3N0X3ZkcGEgKnYpCj4gK3sK
PiArCWlmICh2LT5jb25maWdfY3R4KQo+ICsJCWV2ZW50ZmRfY3R4X3B1dCh2LT5jb25maWdfY3R4
KTsKPiArfQo+ICsKPiArc3RhdGljIGxvbmcgdmhvc3RfdmRwYV9zZXRfY29uZmlnX2NhbGwoc3Ry
dWN0IHZob3N0X3ZkcGEgKnYsIHUzMiBfX3VzZXIgKmFyZ3ApCj4gK3sKPiArCXN0cnVjdCB2ZHBh
X2NhbGxiYWNrIGNiOwo+ICsJdTMyIGZkOwo+ICsJc3RydWN0IGV2ZW50ZmRfY3R4ICpjdHg7Cj4g
Kwo+ICsJY2IuY2FsbGJhY2sgPSB2aG9zdF92ZHBhX2NvbmZpZ19jYjsKPiArCWNiLnByaXZhdGUg
PSB2LT52ZHBhOwo+ICsJaWYgKGNvcHlfZnJvbV91c2VyKCZmZCwgYXJncCwgc2l6ZW9mKGZkKSkp
Cj4gKwkJcmV0dXJuICAtRUZBVUxUOwo+ICsKPiArCWN0eCA9IGZkID09IFZIT1NUX0ZJTEVfVU5C
SU5EID8gTlVMTCA6IGV2ZW50ZmRfY3R4X2ZkZ2V0KGZkKTsKPiArCXN3YXAoY3R4LCB2LT5jb25m
aWdfY3R4KTsKPiArCj4gKwlpZiAoIUlTX0VSUl9PUl9OVUxMKGN0eCkpCj4gKwkJZXZlbnRmZF9j
dHhfcHV0KGN0eCk7Cj4gKwo+ICsJaWYgKElTX0VSUih2LT5jb25maWdfY3R4KSkKPiArCQlyZXR1
cm4gUFRSX0VSUih2LT5jb25maWdfY3R4KTsKPiArCj4gKwl2LT52ZHBhLT5jb25maWctPnNldF9j
b25maWdfY2Iodi0+dmRwYSwgJmNiKTsKPiArCj4gKwlyZXR1cm4gMDsKPiArfQo+ICAgc3RhdGlj
IGxvbmcgdmhvc3RfdmRwYV92cmluZ19pb2N0bChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdW5zaWdu
ZWQgaW50IGNtZCwKPiAgIAkJCQkgICB2b2lkIF9fdXNlciAqYXJncCkKPiAgIHsKPiBAQCAtMzk4
LDYgKzQ0MSw5IEBAIHN0YXRpYyBsb25nIHZob3N0X3ZkcGFfdW5sb2NrZWRfaW9jdGwoc3RydWN0
IGZpbGUgKmZpbGVwLAo+ICAgCWNhc2UgVkhPU1RfU0VUX0xPR19GRDoKPiAgIAkJciA9IC1FTk9J
T0NUTENNRDsKPiAgIAkJYnJlYWs7Cj4gKwljYXNlIFZIT1NUX1ZEUEFfU0VUX0NPTkZJR19DQUxM
Ogo+ICsJCXIgPSB2aG9zdF92ZHBhX3NldF9jb25maWdfY2FsbCh2LCBhcmdwKTsKPiArCQlicmVh
azsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlyID0gdmhvc3RfZGV2X2lvY3RsKCZ2LT52ZGV2LCBjbWQs
IGFyZ3ApOwo+ICAgCQlpZiAociA9PSAtRU5PSU9DVExDTUQpCj4gQEAgLTczNCw2ICs3ODAsNyBA
QCBzdGF0aWMgaW50IHZob3N0X3ZkcGFfcmVsZWFzZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1
Y3QgZmlsZSAqZmlsZXApCj4gICAJdmhvc3RfZGV2X3N0b3AoJnYtPnZkZXYpOwo+ICAgCXZob3N0
X3ZkcGFfaW90bGJfZnJlZSh2KTsKPiAgIAl2aG9zdF92ZHBhX2ZyZWVfZG9tYWluKHYpOwo+ICsJ
dmhvc3RfdmRwYV9jb25maWdfcHV0KHYpOwo+ICAgCXZob3N0X2Rldl9jbGVhbnVwKCZ2LT52ZGV2
KTsKPiAgIAlrZnJlZSh2LT52ZGV2LnZxcyk7Cj4gICAJbXV0ZXhfdW5sb2NrKCZkLT5tdXRleCk7
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3Qvdmhvc3QuYyBiL2RyaXZlcnMvdmhvc3Qvdmhv
c3QuYwo+IGluZGV4IGQ0NTBlMTYuLmU4ZjViMjAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aG9z
dC92aG9zdC5jCj4gKysrIGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gQEAgLTE1OTAsNyArMTU5
MCw3IEBAIGxvbmcgdmhvc3RfdnJpbmdfaW9jdGwoc3RydWN0IHZob3N0X2RldiAqZCwgdW5zaWdu
ZWQgaW50IGlvY3RsLCB2b2lkIF9fdXNlciAqYXJnCj4gICAJCQlyID0gLUVGQVVMVDsKPiAgIAkJ
CWJyZWFrOwo+ICAgCQl9Cj4gLQkJY3R4ID0gZi5mZCA9PSAtMSA/IE5VTEwgOiBldmVudGZkX2N0
eF9mZGdldChmLmZkKTsKPiArCQljdHggPSBmLmZkID09IFZIT1NUX0ZJTEVfVU5CSU5EID8gTlVM
TCA6IGV2ZW50ZmRfY3R4X2ZkZ2V0KGYuZmQpOwo+ICAgCQlpZiAoSVNfRVJSKGN0eCkpIHsKPiAg
IAkJCXIgPSBQVFJfRVJSKGN0eCk7Cj4gICAJCQlicmVhazsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aG9zdC92aG9zdC5oIGIvZHJpdmVycy92aG9zdC92aG9zdC5oCj4gaW5kZXggMTgxMzgyMS4u
ODY2MzEzOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmgKPiArKysgYi9kcml2
ZXJzL3Zob3N0L3Zob3N0LmgKPiBAQCAtMTgsNiArMTgsOCBAQAo+ICAgdHlwZWRlZiB2b2lkICgq
dmhvc3Rfd29ya19mbl90KShzdHJ1Y3Qgdmhvc3Rfd29yayAqd29yayk7Cj4gICAKPiAgICNkZWZp
bmUgVkhPU1RfV09SS19RVUVVRUQgMQo+ICsjZGVmaW5lIFZIT1NUX0ZJTEVfVU5CSU5EIC0xCgoK
SSB0aGluayBpdCdzIGJldHRlciB0byBkb2N1bWVudCB0aGlzIGluIHVhcGkuCgoKPiArCj4gICBz
dHJ1Y3Qgdmhvc3Rfd29yayB7Cj4gICAJc3RydWN0IGxsaXN0X25vZGUJICBub2RlOwo+ICAgCXZo
b3N0X3dvcmtfZm5fdAkJICBmbjsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3Zo
b3N0LmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaAo+IGluZGV4IDlmZTcyZTQuLjM0NWFj
YjMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmgKPiArKysgYi9pbmNs
dWRlL3VhcGkvbGludXgvdmhvc3QuaAo+IEBAIC0xNDAsNCArMTQwLDYgQEAKPiAgIC8qIEdldCB0
aGUgbWF4IHJpbmcgc2l6ZS4gKi8KPiAgICNkZWZpbmUgVkhPU1RfVkRQQV9HRVRfVlJJTkdfTlVN
CV9JT1IoVkhPU1RfVklSVElPLCAweDc2LCBfX3UxNikKPiAgIAo+ICsvKiBTZXQgZXZlbnQgZmQg
Zm9yIGNvbmZpZyBpbnRlcnJ1cHQqLwo+ICsjZGVmaW5lIFZIT1NUX1ZEUEFfU0VUX0NPTkZJR19D
QUxMCV9JT1coVkhPU1RfVklSVElPLCAweDc3LCB1MzIpCj4gICAjZW5kaWYKCgpTaG91bGQgYmUg
ImludCIgaW5zdGVhZCBvZiAidTMyIi4KClRoYW5rcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1
YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhm
b3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
