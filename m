Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DBA228B29
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 73F11884DD;
	Tue, 21 Jul 2020 21:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U+dYISCIoDTn; Tue, 21 Jul 2020 21:26:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 75B2888731;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DEF1C016F;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ABF8C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 45D8D86B96
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eF0_Q8o4Efno
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A352E86B7E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 6D833305D4F9; Wed, 22 Jul 2020 00:09:29 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4E657304FA15;
 Wed, 22 Jul 2020 00:09:29 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 65/84] KVM: introspection: restore the state of CR3
 interception on unhook
Date: Wed, 22 Jul 2020 00:09:03 +0300
Message-Id: <20200721210922.7646-66-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGNvbW1p
dCBhbHNvIGVuc3VyZXMgdGhhdCB0aGUgaW50cm9zcGVjdGlvbiB0b29sIGFuZCB0aGUgdXNlcnNw
YWNlCmRvIG5vdCBkaXNhYmxlIGVhY2ggb3RoZXIgdGhlIENSMy13cml0ZSBWTS1leGl0LgoKU2ln
bmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaCB8ICA0ICsrCiBhcmNoL3g4Ni9rdm0va3Zt
aS5jICAgICAgICAgICAgICB8IDY0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiBh
cmNoL3g4Ni9rdm0vc3ZtL3N2bS5jICAgICAgICAgICB8ICA1ICsrKwogYXJjaC94ODYva3ZtL3Zt
eC92bXguYyAgICAgICAgICAgfCAgNSArKysKIDQgZmlsZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1pX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCmluZGV4IDFhZmY5
MWVmODQ3NS4uNDQ1ODBmNzdlMzRlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1pX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaApAQCAtMTYs
NiArMTYsNyBAQCBzdHJ1Y3Qga3ZtaV9pbnRlcmNlcHRpb24gewogCWJvb2wgY2xlYW51cDsKIAli
b29sIHJlc3RvcmVfaW50ZXJjZXB0aW9uOwogCXN0cnVjdCBrdm1pX21vbml0b3JfaW50ZXJjZXB0
aW9uIGJyZWFrcG9pbnQ7CisJc3RydWN0IGt2bWlfbW9uaXRvcl9pbnRlcmNlcHRpb24gY3IzdzsK
IH07CiAKIHN0cnVjdCBrdm1fdmNwdV9hcmNoX2ludHJvc3BlY3Rpb24gewpAQCAtMzEsNiArMzIs
NyBAQCBib29sIGt2bWlfbW9uaXRvcl9icF9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCB1MzIgZGJnKTsKIGJvb2wga3ZtaV9jcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVu
c2lnbmVkIGludCBjciwKIAkJICAgdW5zaWduZWQgbG9uZyBvbGRfdmFsdWUsIHVuc2lnbmVkIGxv
bmcgKm5ld192YWx1ZSk7CiBib29sIGt2bWlfY3IzX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7Citib29sIGt2bWlfbW9uaXRvcl9jcjN3X2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIGJvb2wgZW5hYmxlKTsKIAogI2Vsc2UgLyogQ09ORklHX0tWTV9JTlRST1NQRUNU
SU9OICovCiAKQEAgLTQxLDYgKzQzLDggQEAgc3RhdGljIGlubGluZSBib29sIGt2bWlfY3JfZXZl
bnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgY3IsCiAJCQkJIHVuc2lnbmVk
IGxvbmcgKm5ld192YWx1ZSkKIAkJCXsgcmV0dXJuIHRydWU7IH0KIHN0YXRpYyBpbmxpbmUgYm9v
bCBrdm1pX2NyM19pbnRlcmNlcHRlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHsgcmV0dXJuIGZh
bHNlOyB9CitzdGF0aWMgaW5saW5lIGJvb2wga3ZtaV9tb25pdG9yX2NyM3dfaW50ZXJjZXB0KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwKKwkJCQkJCWJvb2wgZW5hYmxlKSB7IHJldHVybiBmYWxzZTsg
fQogCiAjZW5kaWYgLyogQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OICovCiAKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2t2bS9rdm1pLmMgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCmluZGV4IGU3MmIyZWY1
YjI4YS4uZTM0MGEyYzM1MDBmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0va3ZtaS5jCisrKyBi
L2FyY2gveDg2L2t2bS9rdm1pLmMKQEAgLTMwOCw2ICszMDgsNTkgQEAgc3RhdGljIHZvaWQga3Zt
aV9hcmNoX2Rpc2FibGVfYnBfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAl2Y3B1
LT5hcmNoLmt2bWktPmJyZWFrcG9pbnQua3ZtX2ludGVyY2VwdGVkID0gZmFsc2U7CiB9CiAKK3N0
YXRpYyBib29sIG1vbml0b3JfY3Izd19mY3Rfa3ZtaShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJv
b2wgZW5hYmxlKQoreworCXZjcHUtPmFyY2gua3ZtaS0+Y3Izdy5rdm1pX2ludGVyY2VwdGVkID0g
ZW5hYmxlOworCisJaWYgKGVuYWJsZSkKKwkJdmNwdS0+YXJjaC5rdm1pLT5jcjN3Lmt2bV9pbnRl
cmNlcHRlZCA9CisJCQlrdm1feDg2X29wcy5jcjNfd3JpdGVfaW50ZXJjZXB0ZWQodmNwdSk7CisJ
ZWxzZSBpZiAodmNwdS0+YXJjaC5rdm1pLT5jcjN3Lmt2bV9pbnRlcmNlcHRlZCkKKwkJcmV0dXJu
IHRydWU7CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKK3N0YXRpYyBib29sIG1vbml0b3JfY3Izd19m
Y3Rfa3ZtKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpCit7CisJaWYgKCF2Y3B1
LT5hcmNoLmt2bWktPmNyM3cua3ZtaV9pbnRlcmNlcHRlZCkKKwkJcmV0dXJuIGZhbHNlOworCisJ
dmNwdS0+YXJjaC5rdm1pLT5jcjN3Lmt2bV9pbnRlcmNlcHRlZCA9IGVuYWJsZTsKKworCWlmICgh
ZW5hYmxlKQorCQlyZXR1cm4gdHJ1ZTsKKworCXJldHVybiBmYWxzZTsKK30KKworLyoKKyAqIFJl
dHVybnMgdHJ1ZSBpZiBvbmUgc2lkZSAoa3ZtIG9yIGt2bWkpIHRyaWVzIHRvIGRpc2FibGUgdGhl
IENSMyB3cml0ZQorICogaW50ZXJjZXB0aW9uIHdoaWxlIHRoZSBvdGhlciBzaWRlIGlzIHN0aWxs
IHRyYWNraW5nIGl0LgorICovCitib29sIGt2bWlfbW9uaXRvcl9jcjN3X2ludGVyY2VwdChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5hYmxlKQoreworCXN0cnVjdCBrdm1pX2ludGVyY2Vw
dGlvbiAqYXJjaF92Y3B1aSA9IFJFQURfT05DRSh2Y3B1LT5hcmNoLmt2bWkpOworCisJcmV0dXJu
IChhcmNoX3ZjcHVpICYmIGFyY2hfdmNwdWktPmNyM3cubW9uaXRvcl9mY3QodmNwdSwgZW5hYmxl
KSk7Cit9CitFWFBPUlRfU1lNQk9MKGt2bWlfbW9uaXRvcl9jcjN3X2ludGVyY2VwdCk7CisKK3N0
YXRpYyB2b2lkIGt2bWlfY29udHJvbF9jcjN3X2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUsIGJvb2wgZW5hYmxlKQoreworCXZjcHUtPmFyY2gua3ZtaS0+Y3Izdy5tb25pdG9yX2ZjdCA9
IG1vbml0b3JfY3Izd19mY3Rfa3ZtaTsKKwlrdm1feDg2X29wcy5jb250cm9sX2NyM19pbnRlcmNl
cHQodmNwdSwgQ1JfVFlQRV9XLCBlbmFibGUpOworCXZjcHUtPmFyY2gua3ZtaS0+Y3Izdy5tb25p
dG9yX2ZjdCA9IG1vbml0b3JfY3Izd19mY3Rfa3ZtOworfQorCitzdGF0aWMgdm9pZCBrdm1pX2Fy
Y2hfZGlzYWJsZV9jcjN3X2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJa3Zt
aV9jb250cm9sX2NyM3dfaW50ZXJjZXB0KHZjcHUsIGZhbHNlKTsKKworCXZjcHUtPmFyY2gua3Zt
aS0+Y3Izdy5rdm1pX2ludGVyY2VwdGVkID0gZmFsc2U7CisJdmNwdS0+YXJjaC5rdm1pLT5jcjN3
Lmt2bV9pbnRlcmNlcHRlZCA9IGZhbHNlOworfQorCiBpbnQga3ZtaV9hcmNoX2NtZF9jb250cm9s
X2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJICAgIHVuc2lnbmVkIGludCBl
dmVudF9pZCwgYm9vbCBlbmFibGUpCiB7CkBAIC0zNDcsNiArNDAwLDcgQEAgdm9pZCBrdm1pX2Fy
Y2hfYnJlYWtwb2ludF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBndmEsIHU4IGlu
c25fbGVuKQogc3RhdGljIHZvaWQga3ZtaV9hcmNoX3Jlc3RvcmVfaW50ZXJjZXB0aW9uKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSkKIHsKIAlrdm1pX2FyY2hfZGlzYWJsZV9icF9pbnRlcmNlcHQodmNw
dSk7CisJa3ZtaV9hcmNoX2Rpc2FibGVfY3Izd19pbnRlcmNlcHQodmNwdSk7CiB9CiAKIGJvb2wg
a3ZtaV9hcmNoX2NsZWFuX3VwX2ludGVyY2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCkBA
IC0zNzEsOCArNDI1LDEzIEBAIGJvb2wga3ZtaV9hcmNoX3ZjcHVfYWxsb2NfaW50ZXJjZXB0aW9u
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJYXJjaF92Y3B1aS0+
YnJlYWtwb2ludC5tb25pdG9yX2ZjdCA9IG1vbml0b3JfYnBfZmN0X2t2bTsKKwlhcmNoX3ZjcHVp
LT5jcjN3Lm1vbml0b3JfZmN0ID0gbW9uaXRvcl9jcjN3X2ZjdF9rdm07CiAKLQkvKiBwYWlyIHdp
dGgga3ZtaV9tb25pdG9yX2JwX2ludGVyY2VwdCgpICovCisJLyoKKwkgKiBwYWlyZWQgd2l0aDoK
KwkgKiAgLSBrdm1pX21vbml0b3JfYnBfaW50ZXJjZXB0KCkKKwkgKiAgLSBrdm1pX21vbml0b3Jf
Y3Izd19pbnRlcmNlcHQoKQorCSAqLwogCXNtcF93bWIoKTsKIAlXUklURV9PTkNFKHZjcHUtPmFy
Y2gua3ZtaSwgYXJjaF92Y3B1aSk7CiAKQEAgLTQxMyw4ICs0NzIsNyBAQCBpbnQga3ZtaV9hcmNo
X2NtZF92Y3B1X2NvbnRyb2xfY3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCWNhc2UgMDoKIAkJ
YnJlYWs7CiAJY2FzZSAzOgotCQlrdm1feDg2X29wcy5jb250cm9sX2NyM19pbnRlcmNlcHQodmNw
dSwgQ1JfVFlQRV9XLAotCQkJCQkJICByZXEtPmVuYWJsZSA9PSAxKTsKKwkJa3ZtaV9jb250cm9s
X2NyM3dfaW50ZXJjZXB0KHZjcHUsIHJlcS0+ZW5hYmxlID09IDEpOwogCQlicmVhazsKIAljYXNl
IDQ6CiAJCWJyZWFrOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYyBiL2FyY2gv
eDg2L2t2bS9zdm0vc3ZtLmMKaW5kZXggNDdjNTBlMmYwZjg2Li5iYzg4NmNlZGY0NWMgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0u
YwpAQCAtMTY2OCw2ICsxNjY4LDExIEBAIHN0YXRpYyB2b2lkIHN2bV9jb250cm9sX2NyM19pbnRl
cmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgdHlwZSwKIHsKIAlzdHJ1Y3QgdmNwdV9z
dm0gKnN2bSA9IHRvX3N2bSh2Y3B1KTsKIAorI2lmZGVmIENPTkZJR19LVk1fSU5UUk9TUEVDVElP
TgorCWlmICgodHlwZSAmIENSX1RZUEVfVykgJiYga3ZtaV9tb25pdG9yX2NyM3dfaW50ZXJjZXB0
KHZjcHUsIGVuYWJsZSkpCisJCXR5cGUgJj0gfkNSX1RZUEVfVzsKKyNlbmRpZiAvKiBDT05GSUdf
S1ZNX0lOVFJPU1BFQ1RJT04gKi8KKwogCWlmICh0eXBlICYgQ1JfVFlQRV9SKQogCQllbmFibGUg
PyBzZXRfY3JfaW50ZXJjZXB0KHN2bSwgSU5URVJDRVBUX0NSM19SRUFEKSA6CiAJCQkgY2xyX2Ny
X2ludGVyY2VwdChzdm0sIElOVEVSQ0VQVF9DUjNfUkVBRCk7CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCA1ZDA4NzY0MjBk
ZDkuLjY5YWExMTU3YTBmMCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysg
Yi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC0zMDExLDYgKzMwMTEsMTEgQEAgc3RhdGljIHZv
aWQgdm14X2NvbnRyb2xfY3IzX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCB0
eXBlLAogCXN0cnVjdCB2Y3B1X3ZteCAqdm14ID0gdG9fdm14KHZjcHUpOwogCXUzMiBjcjNfZXhl
Y19jb250cm9sID0gMDsKIAorI2lmZGVmIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTgorCWlmICgo
dHlwZSAmIENSX1RZUEVfVykgJiYga3ZtaV9tb25pdG9yX2NyM3dfaW50ZXJjZXB0KHZjcHUsIGVu
YWJsZSkpCisJCXR5cGUgJj0gfkNSX1RZUEVfVzsKKyNlbmRpZiAvKiBDT05GSUdfS1ZNX0lOVFJP
U1BFQ1RJT04gKi8KKwogCWlmICh0eXBlICYgQ1JfVFlQRV9SKQogCQljcjNfZXhlY19jb250cm9s
IHw9IENQVV9CQVNFRF9DUjNfU1RPUkVfRVhJVElORzsKIAlpZiAodHlwZSAmIENSX1RZUEVfVykK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6
YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24u
b3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3Zp
cnR1YWxpemF0aW9u
