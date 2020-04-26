Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E001B8E65
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 11:41:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 135C684CF4;
	Sun, 26 Apr 2020 09:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IQaap2JMjdng; Sun, 26 Apr 2020 09:41:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8044784B80;
	Sun, 26 Apr 2020 09:41:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5F5BBC0172;
	Sun, 26 Apr 2020 09:41:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09D73C0172
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 05FEE87364
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 852HaTc8HhaT
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:41:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0DC128734E
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587894103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17hksfwyCJTCUBDrT+a24OdYKmf01qS7RQ93GGRGAUE=;
 b=PToRscjWQJwCY48ie2AOYq6oyMhJuEAul9yfLTgJvUg4g38By8NGp+RpMcwPs/sErqUGmj
 wW4+B6/R3GI4kF9ALYx199bhOHDKdnNO1HRVWybe3BdvSigP7wgmmgzXJjSqJERMBphfjl
 wNUVoGWvdsuXPwBTAYtyl/ASOHoo19o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-VjE_cIJVNDiMv8qyKlDPCA-1; Sun, 26 Apr 2020 05:41:40 -0400
X-MC-Unique: VjE_cIJVNDiMv8qyKlDPCA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F23F8014D9;
 Sun, 26 Apr 2020 09:41:38 +0000 (UTC)
Received: from [10.72.13.147] (ovpn-13-147.pek2.redhat.com [10.72.13.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65E0360612;
 Sun, 26 Apr 2020 09:41:32 +0000 (UTC)
Subject: Re: [PATCH V3 1/2] vdpa: Support config interrupt in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1587890572-39093-1-git-send-email-lingshan.zhu@intel.com>
 <1587890572-39093-2-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <ec8b274c-657f-38b0-2b7d-77ab735969c3@redhat.com>
Date: Sun, 26 Apr 2020 17:41:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587890572-39093-2-git-send-email-lingshan.zhu@intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Ck9uIDIwMjAvNC8yNiDkuIvljYg0OjQyLCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgaW1wbGVtZW50cyBjb25maWcgaW50ZXJydXB0IHN1cHBvcnQgaW4KPiB2aG9zdF92ZHBhIGxh
eWVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgICAgICAgfCA0NyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICBkcml2ZXJzL3Zob3N0L3Zo
b3N0LmMgICAgICB8ICAyICstCj4gICBpbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCB8ICA0ICsr
KysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdmRwYS5jIGIvZHJpdmVycy92aG9zdC92ZHBh
LmMKPiBpbmRleCA0MjFmMDJhLi5jMzcwZWM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhvc3Qv
dmRwYS5jCj4gKysrIGIvZHJpdmVycy92aG9zdC92ZHBhLmMKPiBAQCAtMjEsNiArMjEsNyBAQAo+
ICAgI2luY2x1ZGUgPGxpbnV4L25vc3BlYy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3Zob3N0Lmg+
Cj4gICAjaW5jbHVkZSA8bGludXgvdmlydGlvX25ldC5oPgo+ICsjaW5jbHVkZSA8bGludXgva2Vy
bmVsLmg+Cj4gICAKPiAgICNpbmNsdWRlICJ2aG9zdC5oIgo+ICAgCj4gQEAgLTcwLDYgKzcxLDcg
QEAgc3RydWN0IHZob3N0X3ZkcGEgewo+ICAgCWludCBudnFzOwo+ICAgCWludCB2aXJ0aW9faWQ7
Cj4gICAJaW50IG1pbm9yOwo+ICsJc3RydWN0IGV2ZW50ZmRfY3R4ICpjb25maWdfY3R4Owo+ICAg
fTsKPiAgIAo+ICAgc3RhdGljIERFRklORV9JREEodmhvc3RfdmRwYV9pZGEpOwo+IEBAIC0xMDEs
NiArMTAzLDE3IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB2aG9zdF92ZHBhX3ZpcnRxdWV1ZV9jYih2
b2lkICpwcml2YXRlKQo+ICAgCXJldHVybiBJUlFfSEFORExFRDsKPiAgIH0KPiAgIAo+ICtzdGF0
aWMgaXJxcmV0dXJuX3Qgdmhvc3RfdmRwYV9jb25maWdfY2Iodm9pZCAqcHJpdmF0ZSkKPiArewo+
ICsJc3RydWN0IHZob3N0X3ZkcGEgKnYgPSBwcml2YXRlOwo+ICsJc3RydWN0IGV2ZW50ZmRfY3R4
ICpjb25maWdfY3R4ID0gdi0+Y29uZmlnX2N0eDsKPiArCj4gKwlpZiAoY29uZmlnX2N0eCkKPiAr
CQlldmVudGZkX3NpZ25hbChjb25maWdfY3R4LCAxKTsKPiArCj4gKwlyZXR1cm4gSVJRX0hBTkRM
RUQ7Cj4gK30KPiArCj4gICBzdGF0aWMgdm9pZCB2aG9zdF92ZHBhX3Jlc2V0KHN0cnVjdCB2aG9z
dF92ZHBhICp2KQo+ICAgewo+ICAgCXN0cnVjdCB2ZHBhX2RldmljZSAqdmRwYSA9IHYtPnZkcGE7
Cj4gQEAgLTI4OCw2ICszMDEsMzYgQEAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV9nZXRfdnJpbmdf
bnVtKHN0cnVjdCB2aG9zdF92ZHBhICp2LCB1MTYgX191c2VyICphcmdwKQo+ICAgCXJldHVybiAw
Owo+ICAgfQo+ICAgCj4gK3N0YXRpYyB2b2lkIHZob3N0X3ZkcGFfY29uZmlnX3B1dChzdHJ1Y3Qg
dmhvc3RfdmRwYSAqdikKPiArewo+ICsJaWYgKHYtPmNvbmZpZ19jdHgpCj4gKwkJZXZlbnRmZF9j
dHhfcHV0KHYtPmNvbmZpZ19jdHgpOwo+ICt9Cj4gKwo+ICtzdGF0aWMgbG9uZyB2aG9zdF92ZHBh
X3NldF9jb25maWdfY2FsbChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTMyIF9fdXNlciAqYXJncCkK
PiArewo+ICsJc3RydWN0IHZkcGFfY2FsbGJhY2sgY2I7Cj4gKwlpbnQgZmQ7Cj4gKwlzdHJ1Y3Qg
ZXZlbnRmZF9jdHggKmN0eDsKPiArCj4gKwljYi5jYWxsYmFjayA9IHZob3N0X3ZkcGFfY29uZmln
X2NiOwo+ICsJY2IucHJpdmF0ZSA9IHYtPnZkcGE7Cj4gKwlpZiAoY29weV9mcm9tX3VzZXIoJmZk
LCBhcmdwLCBzaXplb2YoZmQpKSkKPiArCQlyZXR1cm4gIC1FRkFVTFQ7Cj4gKwo+ICsJY3R4ID0g
ZmQgPT0gVkhPU1RfRklMRV9VTkJJTkQgPyBOVUxMIDogZXZlbnRmZF9jdHhfZmRnZXQoZmQpOwo+
ICsJc3dhcChjdHgsIHYtPmNvbmZpZ19jdHgpOwo+ICsKPiArCWlmICghSVNfRVJSX09SX05VTEwo
Y3R4KSkKPiArCQlldmVudGZkX2N0eF9wdXQoY3R4KTsKPiArCj4gKwlpZiAoSVNfRVJSKHYtPmNv
bmZpZ19jdHgpKQo+ICsJCXJldHVybiBQVFJfRVJSKHYtPmNvbmZpZ19jdHgpOwo+ICsKPiArCXYt
PnZkcGEtPmNvbmZpZy0+c2V0X2NvbmZpZ19jYih2LT52ZHBhLCAmY2IpOwo+ICsKPiArCXJldHVy
biAwOwo+ICt9Cj4gICBzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX3ZyaW5nX2lvY3RsKHN0cnVjdCB2
aG9zdF92ZHBhICp2LCB1bnNpZ25lZCBpbnQgY21kLAo+ICAgCQkJCSAgIHZvaWQgX191c2VyICph
cmdwKQo+ICAgewo+IEBAIC0zOTgsNiArNDQxLDkgQEAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV91
bmxvY2tlZF9pb2N0bChzdHJ1Y3QgZmlsZSAqZmlsZXAsCj4gICAJY2FzZSBWSE9TVF9TRVRfTE9H
X0ZEOgo+ICAgCQlyID0gLUVOT0lPQ1RMQ01EOwo+ICAgCQlicmVhazsKPiArCWNhc2UgVkhPU1Rf
VkRQQV9TRVRfQ09ORklHX0NBTEw6Cj4gKwkJciA9IHZob3N0X3ZkcGFfc2V0X2NvbmZpZ19jYWxs
KHYsIGFyZ3ApOwo+ICsJCWJyZWFrOwo+ICAgCWRlZmF1bHQ6Cj4gICAJCXIgPSB2aG9zdF9kZXZf
aW9jdGwoJnYtPnZkZXYsIGNtZCwgYXJncCk7Cj4gICAJCWlmIChyID09IC1FTk9JT0NUTENNRCkK
PiBAQCAtNzM0LDYgKzc4MCw3IEBAIHN0YXRpYyBpbnQgdmhvc3RfdmRwYV9yZWxlYXNlKHN0cnVj
dCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkKPiAgIAl2aG9zdF9kZXZfc3RvcCgm
di0+dmRldik7Cj4gICAJdmhvc3RfdmRwYV9pb3RsYl9mcmVlKHYpOwo+ICAgCXZob3N0X3ZkcGFf
ZnJlZV9kb21haW4odik7Cj4gKwl2aG9zdF92ZHBhX2NvbmZpZ19wdXQodik7Cj4gICAJdmhvc3Rf
ZGV2X2NsZWFudXAoJnYtPnZkZXYpOwo+ICAgCWtmcmVlKHYtPnZkZXYudnFzKTsKPiAgIAltdXRl
eF91bmxvY2soJmQtPm11dGV4KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92aG9zdC5j
IGIvZHJpdmVycy92aG9zdC92aG9zdC5jCj4gaW5kZXggZDQ1MGUxNi4uZThmNWIyMCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Zob3N0LmMKPiArKysgYi9kcml2ZXJzL3Zob3N0L3Zob3N0
LmMKPiBAQCAtMTU5MCw3ICsxNTkwLDcgQEAgbG9uZyB2aG9zdF92cmluZ19pb2N0bChzdHJ1Y3Qg
dmhvc3RfZGV2ICpkLCB1bnNpZ25lZCBpbnQgaW9jdGwsIHZvaWQgX191c2VyICphcmcKPiAgIAkJ
CXIgPSAtRUZBVUxUOwo+ICAgCQkJYnJlYWs7Cj4gICAJCX0KPiAtCQljdHggPSBmLmZkID09IC0x
ID8gTlVMTCA6IGV2ZW50ZmRfY3R4X2ZkZ2V0KGYuZmQpOwo+ICsJCWN0eCA9IGYuZmQgPT0gVkhP
U1RfRklMRV9VTkJJTkQgPyBOVUxMIDogZXZlbnRmZF9jdHhfZmRnZXQoZi5mZCk7Cj4gICAJCWlm
IChJU19FUlIoY3R4KSkgewo+ICAgCQkJciA9IFBUUl9FUlIoY3R4KTsKPiAgIAkJCWJyZWFrOwo+
IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCBiL2luY2x1ZGUvdWFwaS9s
aW51eC92aG9zdC5oCj4gaW5kZXggOWZlNzJlNC4uMGMyMzQ5NiAxMDA2NDQKPiAtLS0gYS9pbmNs
dWRlL3VhcGkvbGludXgvdmhvc3QuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5o
Cj4gQEAgLTE1LDYgKzE1LDggQEAKPiAgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgo+ICAgI2lu
Y2x1ZGUgPGxpbnV4L2lvY3RsLmg+Cj4gICAKPiArI2RlZmluZSBWSE9TVF9GSUxFX1VOQklORCAt
MQoKCkkgdGhpbmsgd2UgbmVlZCBhIHNlcGFyYXRlIHBhdGNoIGZvciBpbnRyb2R1Y2luZyB0aGlz
IHNpbmNlIHdlIHRvdWNoZXMgCnZob3N0LmMKClRoYW5rcwoKCj4gKwo+ICAgLyogaW9jdGxzICov
Cj4gICAKPiAgICNkZWZpbmUgVkhPU1RfVklSVElPIDB4QUYKPiBAQCAtMTQwLDQgKzE0Miw2IEBA
Cj4gICAvKiBHZXQgdGhlIG1heCByaW5nIHNpemUuICovCj4gICAjZGVmaW5lIFZIT1NUX1ZEUEFf
R0VUX1ZSSU5HX05VTQlfSU9SKFZIT1NUX1ZJUlRJTywgMHg3NiwgX191MTYpCj4gICAKPiArLyog
U2V0IGV2ZW50IGZkIGZvciBjb25maWcgaW50ZXJydXB0Ki8KPiArI2RlZmluZSBWSE9TVF9WRFBB
X1NFVF9DT05GSUdfQ0FMTAlfSU9XKFZIT1NUX1ZJUlRJTywgMHg3NywgaW50KQo+ICAgI2VuZGlm
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
