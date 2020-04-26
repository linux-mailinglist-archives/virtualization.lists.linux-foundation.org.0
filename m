Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E261B8B97
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 05:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5BBCA2052C;
	Sun, 26 Apr 2020 03:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0bUfQsCnbZDy; Sun, 26 Apr 2020 03:07:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5D59520519;
	Sun, 26 Apr 2020 03:07:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33669C0175;
	Sun, 26 Apr 2020 03:07:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E008C0175
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7CC7087B96
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bx10cC1+YSUY
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:07:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B06DE87B84
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Apr 2020 03:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587870437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s1MicnzhZx2u3w8NPjiKXXdCFazde/j1mUrPvZOE1Hk=;
 b=fhjFnvwP4e2M9IS+7Rl6+FhsNZwioAcdY805pyaEZloY1fgUZ4yZ1lsWxwIX9aEAKP/rpn
 UjQ8s3Lrbhk3JBRq2ILtsrCAFXl71OYNjGoaI2/yUStxShZkGBRe0bsiivsI/RoSUU5QWB
 wsO0dr3t5URkC3ZHIJY5bfs9d0kvJ+A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-wWW3QRZlNf-4qS8M6O2DLQ-1; Sat, 25 Apr 2020 23:07:13 -0400
X-MC-Unique: wWW3QRZlNf-4qS8M6O2DLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6812F800D24;
 Sun, 26 Apr 2020 03:07:11 +0000 (UTC)
Received: from [10.72.13.103] (ovpn-13-103.pek2.redhat.com [10.72.13.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F5B75D9CC;
 Sun, 26 Apr 2020 03:07:05 +0000 (UTC)
Subject: Re: [PATCH 1/2] vdpa: Support config interrupt in vhost_vdpa
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com,
 kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <1587722659-1300-1-git-send-email-lingshan.zhu@intel.com>
 <1587722659-1300-2-git-send-email-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <cb656c27-22a8-3a18-9e3a-68fa0c3ff06b@redhat.com>
Date: Sun, 26 Apr 2020 11:07:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587722659-1300-2-git-send-email-lingshan.zhu@intel.com>
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

Ck9uIDIwMjAvNC8yNCDkuIvljYg2OjA0LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgaW1wbGVtZW50cyBjb25maWcgaW50ZXJydXB0IHN1cHBvcnQgaW4KPiB2aG9zdF92ZHBhIGxh
eWVyLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxsaW5nc2hhbi56aHVAaW50ZWwu
Y29tPgoKCk9uZSBzaG91bGQgYmUgc3VmZmljaWVudC4KCgo+IC0tLQo+ICAgZHJpdmVycy92aG9z
dC92ZHBhLmMgICAgICAgICAgICAgfCA1MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4gICBpbmNsdWRlL3VhcGkvbGludXgvdmhvc3QuaCAgICAgICB8ICAyICsrCj4g
ICBpbmNsdWRlL3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaCB8ICAyICsrCj4gICAzIGZpbGVzIGNo
YW5nZWQsIDU3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0L3Zk
cGEuYyBiL2RyaXZlcnMvdmhvc3QvdmRwYS5jCj4gaW5kZXggNDIxZjAyYS4uZjFmNjliZiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+ICsrKyBiL2RyaXZlcnMvdmhvc3QvdmRw
YS5jCj4gQEAgLTIxLDYgKzIxLDcgQEAKPiAgICNpbmNsdWRlIDxsaW51eC9ub3NwZWMuaD4KPiAg
ICNpbmNsdWRlIDxsaW51eC92aG9zdC5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19uZXQu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICAgCj4gICAjaW5jbHVkZSAidmhvc3Qu
aCIKPiAgIAo+IEBAIC03MCw2ICs3MSw3IEBAIHN0cnVjdCB2aG9zdF92ZHBhIHsKPiAgIAlpbnQg
bnZxczsKPiAgIAlpbnQgdmlydGlvX2lkOwo+ICAgCWludCBtaW5vcjsKPiArCXN0cnVjdCBldmVu
dGZkX2N0eCAqY29uZmlnX2N0eDsKPiAgIH07Cj4gICAKPiAgIHN0YXRpYyBERUZJTkVfSURBKHZo
b3N0X3ZkcGFfaWRhKTsKPiBAQCAtMTAxLDYgKzEwMywxNyBAQCBzdGF0aWMgaXJxcmV0dXJuX3Qg
dmhvc3RfdmRwYV92aXJ0cXVldWVfY2Iodm9pZCAqcHJpdmF0ZSkKPiAgIAlyZXR1cm4gSVJRX0hB
TkRMRUQ7Cj4gICB9Cj4gICAKPiArc3RhdGljIGlycXJldHVybl90IHZob3N0X3ZkcGFfY29uZmln
X2NiKHZvaWQgKnByaXZhdGUpCj4gK3sKPiArCXN0cnVjdCB2aG9zdF92ZHBhICp2ID0gcHJpdmF0
ZTsKPiArCXN0cnVjdCBldmVudGZkX2N0eCAqY29uZmlnX2N0eCA9IHYtPmNvbmZpZ19jdHg7Cj4g
Kwo+ICsJaWYgKGNvbmZpZ19jdHgpCj4gKwkJZXZlbnRmZF9zaWduYWwoY29uZmlnX2N0eCwgMSk7
Cj4gKwo+ICsJcmV0dXJuIElSUV9IQU5ETEVEOwo+ICt9Cj4gKwo+ICAgc3RhdGljIHZvaWQgdmhv
c3RfdmRwYV9yZXNldChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikKPiAgIHsKPiAgIAlzdHJ1Y3QgdmRw
YV9kZXZpY2UgKnZkcGEgPSB2LT52ZHBhOwo+IEBAIC0yODgsNiArMzAxLDQyIEBAIHN0YXRpYyBs
b25nIHZob3N0X3ZkcGFfZ2V0X3ZyaW5nX251bShzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwgdTE2IF9f
dXNlciAqYXJncCkKPiAgIAlyZXR1cm4gMDsKPiAgIH0KPiAgIAo+ICtzdGF0aWMgdm9pZCB2aG9z
dF92ZHBhX2NvbmZpZ19wdXQoc3RydWN0IHZob3N0X3ZkcGEgKnYpCj4gK3sKPiArCWlmICh2LT5j
b25maWdfY3R4KQo+ICsJCWV2ZW50ZmRfY3R4X3B1dCh2LT5jb25maWdfY3R4KTsKPiArfQo+ICsK
PiArc3RhdGljIGxvbmcgdmhvc3RfdmRwYV9zZXRfY29uZmlnX2NhbGwoc3RydWN0IHZob3N0X3Zk
cGEgKnYsIHUzMiBfX3VzZXIgKmFyZ3ApCj4gK3sKPiArCXN0cnVjdCB2ZHBhX2NhbGxiYWNrIGNi
Owo+ICsJdmhvc3RfY29uZmlnX2ZpbGUgZmlsZTsKPiArCXN0cnVjdCBldmVudGZkX2N0eCAqY3R4
Owo+ICsKPiArCWNiLmNhbGxiYWNrID0gdmhvc3RfdmRwYV9jb25maWdfY2I7Cj4gKwljYi5wcml2
YXRlID0gdi0+dmRwYTsKPiArCWlmIChjb3B5X2Zyb21fdXNlcigmZmlsZSwgYXJncCwgc2l6ZW9m
KGZpbGUpKSkKPiArCQlyZXR1cm4gIC1FRkFVTFQ7Cj4gKwo+ICsJaWYgKGZpbGUuZmQgPT0gLTEp
IHsKPiArCQl2aG9zdF92ZHBhX2NvbmZpZ19wdXQodik7Cj4gKwkJdi0+Y29uZmlnX2N0eCA9IE5V
TEw7Cj4gKwkJcmV0dXJuIFBUUl9FUlIodi0+Y29uZmlnX2N0eCk7Cj4gKwl9Cj4gKwo+ICsJY3R4
ID0gZXZlbnRmZF9jdHhfZmRnZXQoZmlsZS5mZCk7CgoKWW91IG1heSBzaW1wbHkgZGlkIGN0eCA9
IGYuZmQgPT0gLTEgPyBOVUxMIDogZXZlbnRmZF9jdHhfZmRnZXQoZi5mZCk7CgpUaGVuIHRoZXJl
J3Mgbm8gbmVlZCBmb3IgdGhlIHNwZWNpYWxpemVkIGFjdGlvbiBmb3IgLTEgYWJvdmUuCgoKPiAr
CXN3YXAoY3R4LCB2LT5jb25maWdfY3R4KTsKPiArCj4gKwlpZiAoIUlTX0VSUl9PUl9OVUxMKGN0
eCkpCj4gKwkJZXZlbnRmZF9jdHhfcHV0KGN0eCk7Cj4gKwo+ICsJaWYgKElTX0VSUih2LT5jb25m
aWdfY3R4KSkKPiArCQlyZXR1cm4gUFRSX0VSUih2LT5jb25maWdfY3R4KTsKPiArCj4gKwl2LT52
ZHBhLT5jb25maWctPnNldF9jb25maWdfY2Iodi0+dmRwYSwgJmNiKTsKPiArCj4gKwlyZXR1cm4g
MDsKPiArfQo+ICAgc3RhdGljIGxvbmcgdmhvc3RfdmRwYV92cmluZ19pb2N0bChzdHJ1Y3Qgdmhv
c3RfdmRwYSAqdiwgdW5zaWduZWQgaW50IGNtZCwKPiAgIAkJCQkgICB2b2lkIF9fdXNlciAqYXJn
cCkKPiAgIHsKPiBAQCAtMzk4LDYgKzQ0Nyw5IEBAIHN0YXRpYyBsb25nIHZob3N0X3ZkcGFfdW5s
b2NrZWRfaW9jdGwoc3RydWN0IGZpbGUgKmZpbGVwLAo+ICAgCWNhc2UgVkhPU1RfU0VUX0xPR19G
RDoKPiAgIAkJciA9IC1FTk9JT0NUTENNRDsKPiAgIAkJYnJlYWs7Cj4gKwljYXNlIFZIT1NUX1ZE
UEFfU0VUX0NPTkZJR19DQUxMOgo+ICsJCXIgPSB2aG9zdF92ZHBhX3NldF9jb25maWdfY2FsbCh2
LCBhcmdwKTsKPiArCQlicmVhazsKPiAgIAlkZWZhdWx0Ogo+ICAgCQlyID0gdmhvc3RfZGV2X2lv
Y3RsKCZ2LT52ZGV2LCBjbWQsIGFyZ3ApOwo+ICAgCQlpZiAociA9PSAtRU5PSU9DVExDTUQpCj4g
QEAgLTczNCw2ICs3ODYsNyBAQCBzdGF0aWMgaW50IHZob3N0X3ZkcGFfcmVsZWFzZShzdHJ1Y3Qg
aW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAqZmlsZXApCj4gICAJdmhvc3RfZGV2X3N0b3AoJnYt
PnZkZXYpOwo+ICAgCXZob3N0X3ZkcGFfaW90bGJfZnJlZSh2KTsKPiAgIAl2aG9zdF92ZHBhX2Zy
ZWVfZG9tYWluKHYpOwo+ICsJdmhvc3RfdmRwYV9jb25maWdfcHV0KHYpOwo+ICAgCXZob3N0X2Rl
dl9jbGVhbnVwKCZ2LT52ZGV2KTsKPiAgIAlrZnJlZSh2LT52ZGV2LnZxcyk7Cj4gICAJbXV0ZXhf
dW5sb2NrKCZkLT5tdXRleCk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9z
dC5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0LmgKPiBpbmRleCA5ZmU3MmU0Li5jNDc0YTM1
IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4gKysrIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L3Zob3N0LmgKPiBAQCAtMTQwLDQgKzE0MCw2IEBACj4gICAvKiBHZXQgdGhl
IG1heCByaW5nIHNpemUuICovCj4gICAjZGVmaW5lIFZIT1NUX1ZEUEFfR0VUX1ZSSU5HX05VTQlf
SU9SKFZIT1NUX1ZJUlRJTywgMHg3NiwgX191MTYpCj4gICAKPiArLyogU2V0IGV2ZW50IGZkIGZv
ciBjb25maWcgaW50ZXJydXB0Ki8KPiArI2RlZmluZSBWSE9TVF9WRFBBX1NFVF9DT05GSUdfQ0FM
TAlfSU9XKFZIT1NUX1ZJUlRJTywgMHg3Nywgdmhvc3RfY29uZmlnX2ZpbGUpCj4gICAjZW5kaWYK
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaAo+IGluZGV4IDY2OTQ1N2MuLjY3NTlhZWZiIDEwMDY0
NAo+IC0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdF90eXBlcy5oCj4gKysrIGIvaW5jbHVk
ZS91YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmgKPiBAQCAtMjcsNiArMjcsOCBAQCBzdHJ1Y3Qgdmhv
c3RfdnJpbmdfZmlsZSB7Cj4gICAKPiAgIH07Cj4gICAKPiArdHlwZWRlZiBzdHJ1Y3Qgdmhvc3Rf
dnJpbmdfZmlsZSB2aG9zdF9jb25maWdfZmlsZTsKPiArCgoKSSB3b25kZXIgbWF5YmUgdGhpcyBp
cyB0aGUgYmVzdCBhcHByb2FjaC4gTWF5YmUgaXQncyBiZXR0ZXIgdG8gdXNlIAp2aG9zdF92cmlu
Z19maWxlIG9yIGp1c3QgdXNlIGEgaW50IChidXQgbmVlZCBkb2N1bWVudCB0aGUgLTEgYWN0aW9u
KS4KClRoYW5rcwoKCj4gICBzdHJ1Y3Qgdmhvc3RfdnJpbmdfYWRkciB7Cj4gICAJdW5zaWduZWQg
aW50IGluZGV4Owo+ICAgCS8qIE9wdGlvbiBmbGFncy4gKi8KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
