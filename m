Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D464155E07
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2ACEA8693C;
	Fri,  7 Feb 2020 18:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F74BOYIvdEJs; Fri,  7 Feb 2020 18:26:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C45D686A97;
	Fri,  7 Feb 2020 18:26:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE881C013E;
	Fri,  7 Feb 2020 18:26:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB29CC1D88
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DEB7B87FB5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3p6Gz9hny-R
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EC9EB87F92
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 3D0B0305D3CF; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 30963305206F;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 12/78] KVM: x86: add .cr3_write_intercepted()
Date: Fri,  7 Feb 2020 20:15:30 +0200
Message-Id: <20200207181636.1065-13-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIHdpbGwgYmUgdXNlZCB0byBhbGxvdyB0aGUgaW50cm9zcGVjdGlvbiB0b29sIHRvIGRpc2Fi
bGUgdGhlCkNSMy13cml0ZSBpbnRlcmNlcHRpb24gd2hlbiBpdCBpcyBubyBsb25nZXIgaW50ZXJl
c3RlZCBpbiB0aGVzZSBldmVudHMsCmJ1dCBvbmx5IGlmIG5vdGhpbmcgZGVwZW5kcyBvbiB0aGVz
ZSBWTS1leGl0cy4KClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVm
ZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZl
bmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDEgKwogYXJj
aC94ODYva3ZtL3N2bS5jICAgICAgICAgICAgICB8IDggKysrKysrKysKIGFyY2gveDg2L2t2bS92
bXgvdm14LmMgICAgICAgICAgfCA4ICsrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCA5MDMyYzk5NmViZGIuLmQyZmUw
OGY0NDA4NCAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysg
Yi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMDcwLDYgKzEwNzAsNyBAQCBz
dHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCWludCAoKnNldF9jcjQpKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgbG9uZyBjcjQpOwogCXZvaWQgKCpjb250cm9sX2NyM19pbnRlcmNlcHQpKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IHR5cGUsCiAJCQkJICAgICAgYm9vbCBlbmFibGUpOwor
CWJvb2wgKCpjcjNfd3JpdGVfaW50ZXJjZXB0ZWQpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAJ
dm9pZCAoKnNldF9lZmVyKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBlZmVyKTsKIAl2b2lk
ICgqZ2V0X2lkdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgZGVzY19wdHIgKmR0KTsK
IAl2b2lkICgqc2V0X2lkdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgZGVzY19wdHIg
KmR0KTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9zdm0u
YwppbmRleCBiNjA4MWFmZWM5MjYuLjU1NGFkN2M1N2EwZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
a3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0uYwpAQCAtNzI1Niw2ICs3MjU2LDEzIEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCBzdm1fYnBfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1KQogCXJldHVybiBnZXRfZXhjZXB0aW9uX2ludGVyY2VwdChzdm0sIEJQX1ZFQ1RPUik7CiB9
CiAKK3N0YXRpYyBpbmxpbmUgYm9vbCBzdm1fY3IzX3dyaXRlX2ludGVyY2VwdGVkKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3QgdmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2Y3B1KTsK
KworCXJldHVybiBpc19jcl9pbnRlcmNlcHQoc3ZtLCBJTlRFUkNFUFRfQ1IzX1dSSVRFKTsKK30K
Kwogc3RhdGljIHZvaWQgc3ZtX2NvbnRyb2xfY3IzX2ludGVyY2VwdChzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIGludCB0eXBlLAogCQkJCSAgICAgIGJvb2wgZW5hYmxlKQogewpAQCAtNzMxMSw2ICs3
MzE4LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX3JvX2FmdGVy
X2luaXQgPSB7CiAJLnNldF9jcjMgPSBzdm1fc2V0X2NyMywKIAkuc2V0X2NyNCA9IHN2bV9zZXRf
Y3I0LAogCS5jb250cm9sX2NyM19pbnRlcmNlcHQgPSBzdm1fY29udHJvbF9jcjNfaW50ZXJjZXB0
LAorCS5jcjNfd3JpdGVfaW50ZXJjZXB0ZWQgPSBzdm1fY3IzX3dyaXRlX2ludGVyY2VwdGVkLAog
CS5zZXRfZWZlciA9IHN2bV9zZXRfZWZlciwKIAkuZ2V0X2lkdCA9IHN2bV9nZXRfaWR0LAogCS5z
ZXRfaWR0ID0gc3ZtX3NldF9pZHQsCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5j
IGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCA0YjZlZGI2OGU5ZTAuLjdjZmQyNTgwMGQ4
OSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0v
dm14L3ZteC5jCkBAIC03Nzc2LDYgKzc3NzYsMTMgQEAgc3RhdGljIGJvb2wgdm14X2JwX2ludGVy
Y2VwdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gKHZtY3NfcmVhZDMyKEVYQ0VQ
VElPTl9CSVRNQVApICYgKDF1IDw8IEJQX1ZFQ1RPUikpOwogfQogCitzdGF0aWMgYm9vbCB2bXhf
Y3IzX3dyaXRlX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlzdHJ1Y3Qg
dmNwdV92bXggKnZteCA9IHRvX3ZteCh2Y3B1KTsKKworCXJldHVybiAhIShleGVjX2NvbnRyb2xz
X2dldCh2bXgpICYgQ1BVX0JBU0VEX0NSM19MT0FEX0VYSVRJTkcpOworfQorCiBzdGF0aWMgc3Ry
dWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuY3B1X2hh
c19rdm1fc3VwcG9ydCA9IGNwdV9oYXNfa3ZtX3N1cHBvcnQsCiAJLmRpc2FibGVkX2J5X2Jpb3Mg
PSB2bXhfZGlzYWJsZWRfYnlfYmlvcywKQEAgLTc4MTUsNiArNzgyMiw3IEBAIHN0YXRpYyBzdHJ1
Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMgX19yb19hZnRlcl9pbml0ID0gewogCS5zZXRfY3Iz
ID0gdm14X3NldF9jcjMsCiAJLnNldF9jcjQgPSB2bXhfc2V0X2NyNCwKIAkuY29udHJvbF9jcjNf
aW50ZXJjZXB0ID0gdm14X2NvbnRyb2xfY3IzX2ludGVyY2VwdCwKKwkuY3IzX3dyaXRlX2ludGVy
Y2VwdGVkID0gdm14X2NyM193cml0ZV9pbnRlcmNlcHRlZCwKIAkuc2V0X2VmZXIgPSB2bXhfc2V0
X2VmZXIsCiAJLmdldF9pZHQgPSB2bXhfZ2V0X2lkdCwKIAkuc2V0X2lkdCA9IHZteF9zZXRfaWR0
LApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
