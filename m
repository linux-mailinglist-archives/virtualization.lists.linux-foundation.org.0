Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1798820D
	for <lists.virtualization@lfdr.de>; Fri,  9 Aug 2019 20:11:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2FC26E23;
	Fri,  9 Aug 2019 18:10:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5943FDD2
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:09:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
	(mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 81F85829
	for <virtualization@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 18:09:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
	by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
	DC82D305D345; Fri,  9 Aug 2019 19:01:15 +0300 (EEST)
Received: from localhost.localdomain (unknown [89.136.169.210])
	by smtp.bitdefender.com (Postfix) with ESMTPSA id 7EF77305B7A1;
	Fri,  9 Aug 2019 19:01:14 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v6 44/92] kvm: introspection: extend the internal database
	of tracked pages with write_bitmap info
Date: Fri,  9 Aug 2019 18:59:59 +0300
Message-Id: <20190809160047.8319-45-alazar@bitdefender.com>
In-Reply-To: <20190809160047.8319-1-alazar@bitdefender.com>
References: <20190809160047.8319-1-alazar@bitdefender.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Weijiang Yang <weijiang.yang@intel.com>, Yu C <yu.c.zhang@intel.com>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?UTF-8?q?Samuel=20Laur=C3=A9n?= <samuel.lauren@iki.fi>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	virtualization@lists.linux-foundation.org,
	=?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
	linux-mm@kvack.org, Patrick Colp <patrick.colp@oracle.com>,
	Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Zhang@mail.linuxfoundation.org,
	=?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

VGhpcyB3aWxsIGFsbG93IHVzIHRvIHVzZSB0aGUgc3VicGFnZSBwcm90ZWN0aW9uIGZlYXR1cmUu
CgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+
Ci0tLQogdmlydC9rdm0va3ZtaS5jICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLQogdmlydC9rdm0va3ZtaV9pbnQuaCB8ICAxICsKIDIgZmlsZXMg
Y2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS92
aXJ0L2t2bS9rdm1pLmMgYi92aXJ0L2t2bS9rdm1pLmMKaW5kZXggNGE5YTQ0MzBhNDYwLi5lMThk
ZmZmYTI1YWMgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bWkuYworKysgYi92aXJ0L2t2bS9rdm1p
LmMKQEAgLTMyLDYgKzMyLDcgQEAgc3RhdGljIHZvaWQga3ZtaV90cmFja19mbHVzaF9zbG90KHN0
cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKIHN0YXRpYyBjb25z
dCB1OCBmdWxsX2FjY2VzcyAgPQlLVk1JX1BBR0VfQUNDRVNTX1IgfAogCQkJCUtWTUlfUEFHRV9B
Q0NFU1NfVyB8CiAJCQkJS1ZNSV9QQUdFX0FDQ0VTU19YOworc3RhdGljIGNvbnN0IHUzMiBkZWZh
dWx0X3dyaXRlX2FjY2Vzc19iaXRtYXA7CiAKIHZvaWQgKmt2bWlfbXNnX2FsbG9jKHZvaWQpCiB7
CkBAIC01NywyMyArNTgsMzIgQEAgc3RhdGljIHN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKl9fa3Zt
aV9nZXRfZ2ZuX2FjY2VzcyhzdHJ1Y3Qga3ZtaSAqaWt2bSwKIAlyZXR1cm4gcmFkaXhfdHJlZV9s
b29rdXAoJmlrdm0tPmFjY2Vzc190cmVlLCBnZm4pOwogfQogCisvKgorICogVE9ETzogaW50ZXJj
ZXB0IGFueSBTUFAgY2hhbmdlIG1hZGUgb24gcGFnZXMgcHJlc2VudCBpbiBvdXIgcmFkaXggdHJl
ZS4KKyAqCisgKiBiaXRtYXAgbXVzdCBoYXZlIHRoZSBzYW1lIHZhbHVlIGFzIHRoZSBjb3JyZXNw
b25kaW5nIFNQUFQgZW50cnkuCisgKi8KIHN0YXRpYyBpbnQga3ZtaV9nZXRfZ2ZuX2FjY2Vzcyhz
dHJ1Y3Qga3ZtaSAqaWt2bSwgY29uc3QgZ2ZuX3QgZ2ZuLAotCQkJICAgICAgIHU4ICphY2Nlc3Mp
CisJCQkgICAgICAgdTggKmFjY2VzcywgdTMyICp3cml0ZV9iaXRtYXApCiB7CiAJc3RydWN0IGt2
bWlfbWVtX2FjY2VzcyAqbTsKIAorCSp3cml0ZV9iaXRtYXAgPSBkZWZhdWx0X3dyaXRlX2FjY2Vz
c19iaXRtYXA7CiAJKmFjY2VzcyA9IGZ1bGxfYWNjZXNzOwogCiAJcmVhZF9sb2NrKCZpa3ZtLT5h
Y2Nlc3NfdHJlZV9sb2NrKTsKIAltID0gX19rdm1pX2dldF9nZm5fYWNjZXNzKGlrdm0sIGdmbik7
Ci0JaWYgKG0pCisJaWYgKG0pIHsKIAkJKmFjY2VzcyA9IG0tPmFjY2VzczsKKwkJKndyaXRlX2Jp
dG1hcCA9IG0tPndyaXRlX2JpdG1hcDsKKwl9CiAJcmVhZF91bmxvY2soJmlrdm0tPmFjY2Vzc190
cmVlX2xvY2spOwogCiAJcmV0dXJuIG0gPyAwIDogLTE7CiB9CiAKLXN0YXRpYyBpbnQga3ZtaV9z
ZXRfZ2ZuX2FjY2VzcyhzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgdTggYWNjZXNzKQorc3Rh
dGljIGludCBrdm1pX3NldF9nZm5fYWNjZXNzKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLCB1
OCBhY2Nlc3MsCisJCQkgICAgICAgdTMyIHdyaXRlX2JpdG1hcCkKIHsKIAlzdHJ1Y3Qga3ZtaV9t
ZW1fYWNjZXNzICptOwogCXN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKl9fbTsKQEAgLTg3LDYgKzk3
LDcgQEAgc3RhdGljIGludCBrdm1pX3NldF9nZm5fYWNjZXNzKHN0cnVjdCBrdm0gKmt2bSwgZ2Zu
X3QgZ2ZuLCB1OCBhY2Nlc3MpCiAKIAltLT5nZm4gPSBnZm47CiAJbS0+YWNjZXNzID0gYWNjZXNz
OworCW0tPndyaXRlX2JpdG1hcCA9IHdyaXRlX2JpdG1hcDsKIAogCWlmIChyYWRpeF90cmVlX3By
ZWxvYWQoR0ZQX0tFUk5FTCkpIHsKIAkJZXJyID0gLUtWTV9FTk9NRU07CkBAIC0xMDAsNiArMTEx
LDcgQEAgc3RhdGljIGludCBrdm1pX3NldF9nZm5fYWNjZXNzKHN0cnVjdCBrdm0gKmt2bSwgZ2Zu
X3QgZ2ZuLCB1OCBhY2Nlc3MpCiAJX19tID0gX19rdm1pX2dldF9nZm5fYWNjZXNzKGlrdm0sIGdm
bik7CiAJaWYgKF9fbSkgewogCQlfX20tPmFjY2VzcyA9IGFjY2VzczsKKwkJX19tLT53cml0ZV9i
aXRtYXAgPSB3cml0ZV9iaXRtYXA7CiAJCWt2bWlfYXJjaF91cGRhdGVfcGFnZV90cmFja2luZyhr
dm0sIE5VTEwsIF9fbSk7CiAJCWlmIChhY2Nlc3MgPT0gZnVsbF9hY2Nlc3MpIHsKIAkJCXJhZGl4
X3RyZWVfZGVsZXRlKCZpa3ZtLT5hY2Nlc3NfdHJlZSwgZ2ZuKTsKQEAgLTEyNCwxMiArMTM2LDIy
IEBAIHN0YXRpYyBpbnQga3ZtaV9zZXRfZ2ZuX2FjY2VzcyhzdHJ1Y3Qga3ZtICprdm0sIGdmbl90
IGdmbiwgdTggYWNjZXNzKQogCXJldHVybiBlcnI7CiB9CiAKK3N0YXRpYyBib29sIHNwcF9hY2Nl
c3NfYWxsb3dlZChncGFfdCBncGEsIHVuc2lnbmVkIGxvbmcgYml0bWFwKQoreworCXUzMiBvZmYg
PSAoZ3BhICYgflBBR0VfTUFTSyk7CisJdTMyIHNwcCA9IG9mZiAvIDEyODsKKworCXJldHVybiB0
ZXN0X2JpdChzcHAsICZiaXRtYXApOworfQorCiBzdGF0aWMgYm9vbCBrdm1pX3Jlc3RyaWN0ZWRf
YWNjZXNzKHN0cnVjdCBrdm1pICppa3ZtLCBncGFfdCBncGEsIHU4IGFjY2VzcykKIHsKKwl1MzIg
YWxsb3dlZF9iaXRtYXA7CiAJdTggYWxsb3dlZF9hY2Nlc3M7CiAJaW50IGVycjsKIAotCWVyciA9
IGt2bWlfZ2V0X2dmbl9hY2Nlc3MoaWt2bSwgZ3BhX3RvX2dmbihncGEpLCAmYWxsb3dlZF9hY2Nl
c3MpOworCWVyciA9IGt2bWlfZ2V0X2dmbl9hY2Nlc3MoaWt2bSwgZ3BhX3RvX2dmbihncGEpLCAm
YWxsb3dlZF9hY2Nlc3MsCisJCQkJICAmYWxsb3dlZF9iaXRtYXApOwogCiAJaWYgKGVycikKIAkJ
cmV0dXJuIGZhbHNlOwpAQCAtMTM4LDggKzE2MCwxNCBAQCBzdGF0aWMgYm9vbCBrdm1pX3Jlc3Ry
aWN0ZWRfYWNjZXNzKHN0cnVjdCBrdm1pICppa3ZtLCBncGFfdCBncGEsIHU4IGFjY2VzcykKIAkg
KiBXZSB3YW50IHRvIGJlIG5vdGlmaWVkIG9ubHkgZm9yIHZpb2xhdGlvbnMgaW52b2x2aW5nIGFj
Y2VzcwogCSAqIGJpdHMgdGhhdCB3ZSd2ZSBzcGVjaWZpY2FsbHkgY2xlYXJlZAogCSAqLwotCWlm
ICgofmFsbG93ZWRfYWNjZXNzKSAmIGFjY2VzcykKKwlpZiAoKH5hbGxvd2VkX2FjY2VzcykgJiBh
Y2Nlc3MpIHsKKwkJYm9vbCB3cml0ZV9hY2Nlc3MgPSAoYWNjZXNzICYgS1ZNSV9QQUdFX0FDQ0VT
U19XKTsKKworCQlpZiAod3JpdGVfYWNjZXNzICYmIHNwcF9hY2Nlc3NfYWxsb3dlZChncGEsIGFs
bG93ZWRfYml0bWFwKSkKKwkJCXJldHVybiBmYWxzZTsKKwogCQlyZXR1cm4gdHJ1ZTsKKwl9CiAK
IAlyZXR1cm4gZmFsc2U7CiB9CkBAIC0xMTI2LDggKzExNTQsOSBAQCB2b2lkIGt2bWlfaGFuZGxl
X3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIGludCBrdm1pX2NtZF9nZXRfcGFnZV9h
Y2Nlc3Moc3RydWN0IGt2bWkgKmlrdm0sIHU2NCBncGEsIHU4ICphY2Nlc3MpCiB7CiAJZ2ZuX3Qg
Z2ZuID0gZ3BhX3RvX2dmbihncGEpOworCXUzMiBpZ25vcmVkX3dyaXRlX2JpdG1hcDsKIAotCWt2
bWlfZ2V0X2dmbl9hY2Nlc3MoaWt2bSwgZ2ZuLCBhY2Nlc3MpOworCWt2bWlfZ2V0X2dmbl9hY2Nl
c3MoaWt2bSwgZ2ZuLCBhY2Nlc3MsICZpZ25vcmVkX3dyaXRlX2JpdG1hcCk7CiAKIAlyZXR1cm4g
MDsKIH0KQEAgLTExMzYsMTAgKzExNjUsMTEgQEAgaW50IGt2bWlfY21kX3NldF9wYWdlX2FjY2Vz
cyhzdHJ1Y3Qga3ZtaSAqaWt2bSwgdTY0IGdwYSwgdTggYWNjZXNzKQogewogCWdmbl90IGdmbiA9
IGdwYV90b19nZm4oZ3BhKTsKIAl1OCBpZ25vcmVkX2FjY2VzczsKKwl1MzIgd3JpdGVfYml0bWFw
OwogCi0Ja3ZtaV9nZXRfZ2ZuX2FjY2Vzcyhpa3ZtLCBnZm4sICZpZ25vcmVkX2FjY2Vzcyk7CisJ
a3ZtaV9nZXRfZ2ZuX2FjY2Vzcyhpa3ZtLCBnZm4sICZpZ25vcmVkX2FjY2VzcywgJndyaXRlX2Jp
dG1hcCk7CiAKLQlyZXR1cm4ga3ZtaV9zZXRfZ2ZuX2FjY2Vzcyhpa3ZtLT5rdm0sIGdmbiwgYWNj
ZXNzKTsKKwlyZXR1cm4ga3ZtaV9zZXRfZ2ZuX2FjY2Vzcyhpa3ZtLT5rdm0sIGdmbiwgYWNjZXNz
LCB3cml0ZV9iaXRtYXApOwogfQogCiBpbnQga3ZtaV9jbWRfY29udHJvbF9ldmVudHMoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgZXZlbnRfaWQsCmRpZmYgLS1naXQgYS92aXJ0
L2t2bS9rdm1pX2ludC5oIGIvdmlydC9rdm0va3ZtaV9pbnQuaAppbmRleCAzZjBjN2EwM2I0YTEu
LmQ5YTEwYTNiNzA4MiAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3ZtaV9pbnQuaAorKysgYi92aXJ0
L2t2bS9rdm1pX2ludC5oCkBAIC0xNDEsNiArMTQxLDcgQEAgc3RydWN0IGt2bWkgewogc3RydWN0
IGt2bWlfbWVtX2FjY2VzcyB7CiAJZ2ZuX3QgZ2ZuOwogCXU4IGFjY2VzczsKKwl1MzIgd3JpdGVf
Yml0bWFwOwogCXN0cnVjdCBrdm1pX2FyY2hfbWVtX2FjY2VzcyBhcmNoOwogfTsKIApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBt
YWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0
cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6
YXRpb24=
