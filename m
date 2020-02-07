Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A25CE155E3F
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3669486E9E;
	Fri,  7 Feb 2020 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3K-rkmDJu3iV; Fri,  7 Feb 2020 18:36:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5DD868704C;
	Fri,  7 Feb 2020 18:36:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C082C1D81;
	Fri,  7 Feb 2020 18:36:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08660C1D85
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0546B86E71
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-ANke3vmuUx
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 45DA486E32
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B241F305D34C; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 97DC53052078;
 Fri,  7 Feb 2020 20:16:40 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 46/78] KVM: introspection: add vCPU related data
Date: Fri,  7 Feb 2020 20:16:04 +0200
Message-Id: <20200207181636.1065-47-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

RnJvbTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJpdGRlZmVuZGVyLmNvbT4KCkFkZCBh
biBpbnRyb3NwZWN0aW9uIHN0cnVjdHVyZSB0byBhbGwgdkNQVXMgd2hlbiB0aGUgVk0gaXMgaG9v
a2VkLgoKU2lnbmVkLW9mZi1ieTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJpdGRlZmVu
ZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5k
ZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oIHwgIDMgKysKIGlu
Y2x1ZGUvbGludXgva3ZtX2hvc3QuaCAgICAgICAgIHwgIDEgKwogaW5jbHVkZS9saW51eC9rdm1p
X2hvc3QuaCAgICAgICAgfCAgNyArKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMg
ICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogdmlydC9rdm0va3ZtX21h
aW4uYyAgICAgICAgICAgICAgfCAgMSArCiA1IGZpbGVzIGNoYW5nZWQsIDYxIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCmluZGV4IDM4YzM5ODI2MjkxMy4uMzYwYTU3ZGQ5
MDE5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaAorKysgYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaApAQCAtMiw2ICsyLDkgQEAKICNpZm5kZWYg
X0FTTV9YODZfS1ZNSV9IT1NUX0gKICNkZWZpbmUgX0FTTV9YODZfS1ZNSV9IT1NUX0gKIAorc3Ry
dWN0IGt2bV92Y3B1X2FyY2hfaW50cm9zcGVjdGlvbiB7Cit9OworCiBzdHJ1Y3Qga3ZtX2FyY2hf
aW50cm9zcGVjdGlvbiB7CiB9OwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggMDEwNGNiMmM4ZWUwLi41MmU5ODcy
MGQwZjYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2t2bV9ob3N0LmgKQEAgLTMyMyw2ICszMjMsNyBAQCBzdHJ1Y3Qga3ZtX3ZjcHUgewog
CWJvb2wgcmVhZHk7CiAJc3RydWN0IGt2bV92Y3B1X2FyY2ggYXJjaDsKIAlzdHJ1Y3QgZGVudHJ5
ICpkZWJ1Z2ZzX2RlbnRyeTsKKwlzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAqa3ZtaTsK
IH07CiAKIHN0YXRpYyBpbmxpbmUgaW50IGt2bV92Y3B1X2V4aXRpbmdfZ3Vlc3RfbW9kZShzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5o
IGIvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAppbmRleCA0MWIyMmFmNzcxZmIuLmNhMmRiODA0
M2E1MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2t2bWlfaG9zdC5oCkBAIC01LDExICs1LDE2IEBACiAjaW5jbHVkZSA8dWFwaS9saW51
eC9rdm1pLmg+CiAKIHN0cnVjdCBrdm07CitzdHJ1Y3Qga3ZtX3ZjcHU7CiAKICNpbmNsdWRlIDxh
c20va3ZtaV9ob3N0Lmg+CiAKICNkZWZpbmUgS1ZNSV9OVU1fQ09NTUFORFMgS1ZNSV9OVU1fTUVT
U0FHRVMKIAorc3RydWN0IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24geworCXN0cnVjdCBrdm1fdmNw
dV9hcmNoX2ludHJvc3BlY3Rpb24gYXJjaDsKK307CisKIHN0cnVjdCBrdm1faW50cm9zcGVjdGlv
biB7CiAJc3RydWN0IGt2bV9hcmNoX2ludHJvc3BlY3Rpb24gYXJjaDsKIAlzdHJ1Y3Qga3ZtICpr
dm07CkBAIC0zMyw2ICszOCw3IEBAIGludCBrdm1pX2luaXQodm9pZCk7CiB2b2lkIGt2bWlfdW5p
bml0KHZvaWQpOwogdm9pZCBrdm1pX2NyZWF0ZV92bShzdHJ1Y3Qga3ZtICprdm0pOwogdm9pZCBr
dm1pX2Rlc3Ryb3lfdm0oc3RydWN0IGt2bSAqa3ZtKTsKK3ZvaWQga3ZtaV92Y3B1X3VuaW5pdChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiBpbnQga3ZtaV9pb2N0bF9ob29rKHN0cnVjdCBrdm0g
Kmt2bSwgdm9pZCBfX3VzZXIgKmFyZ3ApOwogaW50IGt2bWlfaW9jdGxfdW5ob29rKHN0cnVjdCBr
dm0gKmt2bSk7CkBAIC00Niw2ICs1Miw3IEBAIHN0YXRpYyBpbmxpbmUgaW50IGt2bWlfaW5pdCh2
b2lkKSB7IHJldHVybiAwOyB9CiBzdGF0aWMgaW5saW5lIHZvaWQga3ZtaV91bmluaXQodm9pZCkg
eyB9CiBzdGF0aWMgaW5saW5lIHZvaWQga3ZtaV9jcmVhdGVfdm0oc3RydWN0IGt2bSAqa3ZtKSB7
IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX2Rlc3Ryb3lfdm0oc3RydWN0IGt2bSAqa3ZtKSB7
IH0KK3N0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX3ZjcHVfdW5pbml0KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSkgeyB9CiAKICNlbmRpZiAvKiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8KIApkaWZm
IC0tZ2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgYi92aXJ0L2t2bS9pbnRyb3Nw
ZWN0aW9uL2t2bWkuYwppbmRleCA5ZTRlOGZiMDc4NTkuLjY1NTE3MGZmYjU3NCAxMDA2NDQKLS0t
IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKKysrIGIvdmlydC9rdm0vaW50cm9zcGVj
dGlvbi9rdm1pLmMKQEAgLTU5LDE2ICs1OSw1NiBAQCB2b2lkIGt2bWlfdW5pbml0KHZvaWQpCiAJ
a3ZtaV9jYWNoZV9kZXN0cm95KCk7CiB9CiAKK3N0YXRpYyBib29sIGFsbG9jX3ZjcHVpKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAqdmNw
dWk7CisKKwl2Y3B1aSA9IGt6YWxsb2Moc2l6ZW9mKCp2Y3B1aSksIEdGUF9LRVJORUwpOworCWlm
ICghdmNwdWkpCisJCXJldHVybiBmYWxzZTsKKworCXZjcHUtPmt2bWkgPSB2Y3B1aTsKKworCXJl
dHVybiB0cnVlOworfQorCitzdGF0aWMgaW50IGNyZWF0ZV92Y3B1aShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCit7CisJaWYgKCFhbGxvY192Y3B1aSh2Y3B1KSkKKwkJcmV0dXJuIC1FTk9NRU07CisK
KwlyZXR1cm4gMDsKK30KKworc3RhdGljIHZvaWQgZnJlZV92Y3B1aShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpCit7CisJa2ZyZWUodmNwdS0+a3ZtaSk7CisJdmNwdS0+a3ZtaSA9IE5VTEw7Cit9CisK
IHN0YXRpYyB2b2lkIGZyZWVfa3ZtaShzdHJ1Y3Qga3ZtICprdm0pCiB7CisJc3RydWN0IGt2bV92
Y3B1ICp2Y3B1OworCWludCBpOworCisJa3ZtX2Zvcl9lYWNoX3ZjcHUoaSwgdmNwdSwga3ZtKQor
CQlmcmVlX3ZjcHVpKHZjcHUpOworCiAJa2ZyZWUoa3ZtLT5rdm1pKTsKIAlrdm0tPmt2bWkgPSBO
VUxMOwogfQogCit2b2lkIGt2bWlfdmNwdV91bmluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQor
eworCWZyZWVfdmNwdWkodmNwdSk7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24gKgogYWxsb2Nfa3ZtaShzdHJ1Y3Qga3ZtICprdm0sIGNvbnN0IHN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbl9ob29rICpob29rKQogewogCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaTsK
KwlzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7CisJaW50IGk7CiAKIAlrdm1pID0ga3phbGxvYyhzaXpl
b2YoKmt2bWkpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWt2bWkpCkBAIC04Myw2ICsxMjMsMTUgQEAg
YWxsb2Nfa3ZtaShzdHJ1Y3Qga3ZtICprdm0sIGNvbnN0IHN0cnVjdCBrdm1faW50cm9zcGVjdGlv
bl9ob29rICpob29rKQogCiAJYXRvbWljX3NldCgma3ZtaS0+ZXZfc2VxLCAwKTsKIAorCWt2bV9m
b3JfZWFjaF92Y3B1KGksIHZjcHUsIGt2bSkgeworCQlpbnQgZXJyID0gY3JlYXRlX3ZjcHVpKHZj
cHUpOworCisJCWlmIChlcnIpIHsKKwkJCWZyZWVfa3ZtaShrdm0pOworCQkJcmV0dXJuIE5VTEw7
CisJCX0KKwl9CisKIAlrdm1pLT5rdm0gPSBrdm07CiAKIAlyZXR1cm4ga3ZtaTsKZGlmZiAtLWdp
dCBhL3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDRmODM3
MzVmMmI3NC4uZWY3ZDE0ZWY4ZTg2IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisr
KyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTM3Myw2ICszNzMsNyBAQCB2b2lkIGt2bV92Y3B1
X3VuaW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJICogZGVzY3JpcHRvcnMgYXJlIGFscmVh
ZHkgZ29uZS4KIAkgKi8KIAlwdXRfcGlkKHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQodmNwdS0+
cGlkLCAxKSk7CisJa3ZtaV92Y3B1X3VuaW5pdCh2Y3B1KTsKIAlrdm1fYXJjaF92Y3B1X3VuaW5p
dCh2Y3B1KTsKIAlmcmVlX3BhZ2UoKHVuc2lnbmVkIGxvbmcpdmNwdS0+cnVuKTsKIH0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24g
bWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0
dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxp
emF0aW9u
