Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F922D1B69
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:57:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E48FE87BAE;
	Mon,  7 Dec 2020 20:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGPx4q2G2-HT; Mon,  7 Dec 2020 20:57:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EFBB87A85;
	Mon,  7 Dec 2020 20:57:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02DECC013B;
	Mon,  7 Dec 2020 20:57:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 285FCC0FA7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 149998786E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xX24JeDkevrR
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:57:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8856C8716A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:58 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4BB76305D46A; Mon,  7 Dec 2020 22:46:19 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 25B483072785;
 Mon,  7 Dec 2020 22:46:19 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 43/81] KVM: introspection: add vCPU related data
Date: Mon,  7 Dec 2020 22:45:44 +0200
Message-Id: <20201207204622.15258-44-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
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
X2hvc3QuaCAgICAgICAgfCAgNiArKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyAg
ICB8IDUxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB2aXJ0L2t2bS9rdm1fbWFp
bi5jICAgICAgICAgICAgICB8ICAyICsrCiA1IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCmluZGV4IDM4YzM5ODI2MjkxMy4uMzYwYTU3ZGQ5
MDE5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaAorKysgYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaApAQCAtMiw2ICsyLDkgQEAKICNpZm5kZWYg
X0FTTV9YODZfS1ZNSV9IT1NUX0gKICNkZWZpbmUgX0FTTV9YODZfS1ZNSV9IT1NUX0gKIAorc3Ry
dWN0IGt2bV92Y3B1X2FyY2hfaW50cm9zcGVjdGlvbiB7Cit9OworCiBzdHJ1Y3Qga3ZtX2FyY2hf
aW50cm9zcGVjdGlvbiB7CiB9OwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmggYi9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggZjMxMTBlMDkyYWQwLi45NDQxMDA4
YjE4YmUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRl
L2xpbnV4L2t2bV9ob3N0LmgKQEAgLTMyMSw2ICszMjEsNyBAQCBzdHJ1Y3Qga3ZtX3ZjcHUgewog
CWJvb2wgcmVhZHk7CiAJc3RydWN0IGt2bV92Y3B1X2FyY2ggYXJjaDsKIAlzdHJ1Y3Qga3ZtX2Rp
cnR5X3JpbmcgZGlydHlfcmluZzsKKwlzdHJ1Y3Qga3ZtX3ZjcHVfaW50cm9zcGVjdGlvbiAqa3Zt
aTsKIH07CiAKIHN0YXRpYyBpbmxpbmUgaW50IGt2bV92Y3B1X2V4aXRpbmdfZ3Vlc3RfbW9kZShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9z
dC5oIGIvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAppbmRleCBhNTkzMDdkYWM2YmYuLjliMDAw
OGM2NjMyMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAorKysgYi9pbmNs
dWRlL2xpbnV4L2t2bWlfaG9zdC5oCkBAIC02LDYgKzYsMTAgQEAKIAogI2luY2x1ZGUgPGFzbS9r
dm1pX2hvc3QuaD4KIAorc3RydWN0IGt2bV92Y3B1X2ludHJvc3BlY3Rpb24geworCXN0cnVjdCBr
dm1fdmNwdV9hcmNoX2ludHJvc3BlY3Rpb24gYXJjaDsKK307CisKIHN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbiB7CiAJc3RydWN0IGt2bV9hcmNoX2ludHJvc3BlY3Rpb24gYXJjaDsKIAlzdHJ1Y3Qg
a3ZtICprdm07CkBAIC0yOCw2ICszMiw3IEBAIGludCBrdm1pX2luaXQodm9pZCk7CiB2b2lkIGt2
bWlfdW5pbml0KHZvaWQpOwogdm9pZCBrdm1pX2NyZWF0ZV92bShzdHJ1Y3Qga3ZtICprdm0pOwog
dm9pZCBrdm1pX2Rlc3Ryb3lfdm0oc3RydWN0IGt2bSAqa3ZtKTsKK3ZvaWQga3ZtaV92Y3B1X3Vu
aW5pdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiBpbnQga3ZtaV9pb2N0bF9ob29rKHN0cnVj
dCBrdm0gKmt2bSwKIAkJICAgIGNvbnN0IHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbl9ob29rICpo
b29rKTsKQEAgLTQ1LDYgKzUwLDcgQEAgc3RhdGljIGlubGluZSBpbnQga3ZtaV9pbml0KHZvaWQp
IHsgcmV0dXJuIDA7IH0KIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX3VuaW5pdCh2b2lkKSB7IH0K
IHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX2NyZWF0ZV92bShzdHJ1Y3Qga3ZtICprdm0pIHsgfQog
c3RhdGljIGlubGluZSB2b2lkIGt2bWlfZGVzdHJveV92bShzdHJ1Y3Qga3ZtICprdm0pIHsgfQor
c3RhdGljIGlubGluZSB2b2lkIGt2bWlfdmNwdV91bmluaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KSB7IH0KIAogI2VuZGlmIC8qIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTiAqLwogCmRpZmYgLS1n
aXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rp
b24va3ZtaS5jCmluZGV4IGM5OWMyN2MyNDllYS4uNWJjY2MzZmI5ZmYyIDEwMDY0NAotLS0gYS92
aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9u
L2t2bWkuYwpAQCAtMTE4LDggKzExOCw0MSBAQCB2b2lkIGt2bWlfdW5pbml0KHZvaWQpCiAJa3Zt
aV9jYWNoZV9kZXN0cm95KCk7CiB9CiAKK3N0YXRpYyBib29sIGt2bWlfYWxsb2NfdmNwdWkoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCBrdm1fdmNwdV9pbnRyb3NwZWN0aW9uICp2
Y3B1aTsKKworCXZjcHVpID0ga3phbGxvYyhzaXplb2YoKnZjcHVpKSwgR0ZQX0tFUk5FTCk7CisJ
aWYgKCF2Y3B1aSkKKwkJcmV0dXJuIGZhbHNlOworCisJdmNwdS0+a3ZtaSA9IHZjcHVpOworCisJ
cmV0dXJuIHRydWU7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9jcmVhdGVfdmNwdWkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQoreworCWlmICgha3ZtaV9hbGxvY192Y3B1aSh2Y3B1KSkKKwkJcmV0dXJu
IC1FTk9NRU07CisKKwlyZXR1cm4gMDsKK30KKworc3RhdGljIHZvaWQga3ZtaV9mcmVlX3ZjcHVp
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlrZnJlZSh2Y3B1LT5rdm1pKTsKKwl2Y3B1LT5r
dm1pID0gTlVMTDsKK30KKwogc3RhdGljIHZvaWQga3ZtaV9mcmVlKHN0cnVjdCBrdm0gKmt2bSkK
IHsKKwlzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7CisJaW50IGk7CisKKwlrdm1fZm9yX2VhY2hfdmNw
dShpLCB2Y3B1LCBrdm0pCisJCWt2bWlfZnJlZV92Y3B1aSh2Y3B1KTsKKwogCWJpdG1hcF9mcmVl
KGt2bS0+a3ZtaS0+Y21kX2FsbG93X21hc2spOwogCWJpdG1hcF9mcmVlKGt2bS0+a3ZtaS0+ZXZl
bnRfYWxsb3dfbWFzayk7CiAJYml0bWFwX2ZyZWUoa3ZtLT5rdm1pLT52bV9ldmVudF9lbmFibGVf
bWFzayk7CkBAIC0xMjgsMTAgKzE2MSwxOSBAQCBzdGF0aWMgdm9pZCBrdm1pX2ZyZWUoc3RydWN0
IGt2bSAqa3ZtKQogCWt2bS0+a3ZtaSA9IE5VTEw7CiB9CiAKK3ZvaWQga3ZtaV92Y3B1X3VuaW5p
dChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJbXV0ZXhfbG9jaygmdmNwdS0+a3ZtLT5rdm1p
X2xvY2spOworCWt2bWlfZnJlZV92Y3B1aSh2Y3B1KTsKKwltdXRleF91bmxvY2soJnZjcHUtPmt2
bS0+a3ZtaV9sb2NrKTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqCiBr
dm1pX2FsbG9jKHN0cnVjdCBrdm0gKmt2bSwgY29uc3Qgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9u
X2hvb2sgKmhvb2spCiB7CiAJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pOworCXN0cnVj
dCBrdm1fdmNwdSAqdmNwdTsKKwlpbnQgaTsKIAogCWt2bWkgPSBremFsbG9jKHNpemVvZigqa3Zt
aSksIEdGUF9LRVJORUwpOwogCWlmICgha3ZtaSkKQEAgLTE1Nyw2ICsxOTksMTUgQEAga3ZtaV9h
bGxvYyhzdHJ1Y3Qga3ZtICprdm0sIGNvbnN0IHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbl9ob29r
ICpob29rKQogCiAJYXRvbWljX3NldCgma3ZtaS0+ZXZfc2VxLCAwKTsKIAorCWt2bV9mb3JfZWFj
aF92Y3B1KGksIHZjcHUsIGt2bSkgeworCQlpbnQgZXJyID0ga3ZtaV9jcmVhdGVfdmNwdWkodmNw
dSk7CisKKwkJaWYgKGVycikgeworCQkJa3ZtaV9mcmVlKGt2bSk7CisJCQlyZXR1cm4gTlVMTDsK
KwkJfQorCX0KKwogCWt2bWktPmt2bSA9IGt2bTsKIAogCXJldHVybiBrdm1pOwpkaWZmIC0tZ2l0
IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggMGFmNjRj
MTJhMmE5Li43ODNlZWM3MmJjNzMgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysr
IGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAtNDIxLDYgKzQyMSw3IEBAIHN0YXRpYyB2b2lkIGt2
bV92Y3B1X2luaXQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtICprdm0sIHVuc2ln
bmVkIGlkKQogCiB2b2lkIGt2bV92Y3B1X2Rlc3Ryb3koc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQog
eworCWt2bWlfdmNwdV91bmluaXQodmNwdSk7CiAJa3ZtX2RpcnR5X3JpbmdfZnJlZSgmdmNwdS0+
ZGlydHlfcmluZyk7CiAJa3ZtX2FyY2hfdmNwdV9kZXN0cm95KHZjcHUpOwogCkBAIC0zMjUzLDYg
KzMyNTQsNyBAQCBzdGF0aWMgaW50IGt2bV92bV9pb2N0bF9jcmVhdGVfdmNwdShzdHJ1Y3Qga3Zt
ICprdm0sIHUzMiBpZCkKIAogdW5sb2NrX3ZjcHVfZGVzdHJveToKIAltdXRleF91bmxvY2soJmt2
bS0+bG9jayk7CisJa3ZtaV92Y3B1X3VuaW5pdCh2Y3B1KTsKIAlrdm1fZGlydHlfcmluZ19mcmVl
KCZ2Y3B1LT5kaXJ0eV9yaW5nKTsKIGFyY2hfdmNwdV9kZXN0cm95OgogCWt2bV9hcmNoX3ZjcHVf
ZGVzdHJveSh2Y3B1KTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
