Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 023DE229CA3
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3D7EA887D5;
	Wed, 22 Jul 2020 16:02:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tke3jCtPccfh; Wed, 22 Jul 2020 16:02:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E35B788889;
	Wed, 22 Jul 2020 16:01:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2595C004C;
	Wed, 22 Jul 2020 16:01:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9726C004E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 864EB884DA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hveen1NJHVUQ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 95D0387A0A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 03FBB305D7D1; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E967F3072787;
 Wed, 22 Jul 2020 19:01:31 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 03/34] KVM: x86: add kvm_get_ept_view()
Date: Wed, 22 Jul 2020 19:00:50 +0300
Message-Id: <20200722160121.9601-4-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBm
dW5jdGlvbiByZXR1cm5zIHRoZSBFUFQgdmlldyBvZiB0aGUgY3VycmVudCB2Q1BVCm9yIDAgaWYg
dGhlIGhhcmR3YXJlIHN1cHBvcnQgaXMgbWlzc2luZy4KClNpZ25lZC1vZmYtYnk6IMiYdGVmYW4g
yJhpY2xlcnUgPHNzaWNsZXJ1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJl
cnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggfCAgMyArKysKIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAgICAgICAg
fCAgOCArKysrKysrKwogYXJjaC94ODYva3ZtL3ZteC92bXguaCAgICAgICAgICB8ICAzICsrKwog
YXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICB8IDEwICsrKysrKysrKysKIDQgZmlsZXMg
Y2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDVl
YjI2MTM1ZTgxYi4uMGFjYzIxMDg3Y2FmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTEz
MDIsNiArMTMwMiw3IEBAIHN0cnVjdCBrdm1feDg2X29wcyB7CiAJdm9pZCAoKmNvbnRyb2xfc2lu
Z2xlc3RlcCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGVuYWJsZSk7CiAJYm9vbCAoKmdl
dF92bWZ1bmNfc3RhdHVzKSh2b2lkKTsKIAlib29sICgqZ2V0X2VwdHBfc3dpdGNoaW5nX3N0YXR1
cykodm9pZCk7CisJdTE2ICgqZ2V0X2VwdF92aWV3KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwog
fTsKIAogc3RydWN0IGt2bV94ODZfbmVzdGVkX29wcyB7CkBAIC0xNzczLDQgKzE3NzQsNiBAQCBz
dGF0aWMgaW5saW5lIGludCBrdm1fY3B1X2dldF9hcGljaWQoaW50IG1wc19jcHUpCiAjZGVmaW5l
IEdFVF9TTVNUQVRFKHR5cGUsIGJ1Ziwgb2Zmc2V0KQkJXAogCSgqKHR5cGUgKikoKGJ1ZikgKyAo
b2Zmc2V0KSAtIDB4N2UwMCkpCiAKK3UxNiBrdm1fZ2V0X2VwdF92aWV3KHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7CisKICNlbmRpZiAvKiBfQVNNX1g4Nl9LVk1fSE9TVF9IICovCmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBj
Y2JmNTYxYjBmYzQuLjAyNTZjM2E5M2M4NyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92
bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC04MDAyLDYgKzgwMDIsMTMgQEAg
c3RhdGljIGJvb2wgdm14X2dldF9lcHRwX3N3aXRjaGluZ19zdGF0dXModm9pZCkKIAlyZXR1cm4g
a3ZtX2VwdHBfc3dpdGNoaW5nX3N1cHBvcnRlZDsKIH0KIAorc3RhdGljIHUxNiB2bXhfZ2V0X2Vw
dF92aWV3KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwljb25zdCBzdHJ1Y3QgdmNwdV92bXgg
KnZteCA9IHRvX3ZteCh2Y3B1KTsKKworCXJldHVybiB2bXgtPnZpZXc7Cit9CisKIHN0YXRpYyBz
dHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsKIAkuaGFyZHdhcmVf
dW5zZXR1cCA9IGhhcmR3YXJlX3Vuc2V0dXAsCiAKQEAgLTgxNDUsNiArODE1Miw3IEBAIHN0YXRp
YyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsKIAkuY29udHJv
bF9zaW5nbGVzdGVwID0gdm14X2NvbnRyb2xfc2luZ2xlc3RlcCwKIAkuZ2V0X3ZtZnVuY19zdGF0
dXMgPSB2bXhfZ2V0X3ZtZnVuY19zdGF0dXMsCiAJLmdldF9lcHRwX3N3aXRjaGluZ19zdGF0dXMg
PSB2bXhfZ2V0X2VwdHBfc3dpdGNoaW5nX3N0YXR1cywKKwkuZ2V0X2VwdF92aWV3ID0gdm14X2dl
dF9lcHRfdmlldywKIH07CiAKIHN0YXRpYyBfX2luaXQgaW50IGhhcmR3YXJlX3NldHVwKHZvaWQp
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5oIGIvYXJjaC94ODYva3ZtL3ZteC92
bXguaAppbmRleCBhYTBjN2ZmZDU4OGIuLjE0ZjBiOTEwMmQ1OCAxMDA2NDQKLS0tIGEvYXJjaC94
ODYva3ZtL3ZteC92bXguaAorKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5oCkBAIC0yOTYsNiAr
Mjk2LDkgQEAgc3RydWN0IHZjcHVfdm14IHsKIAl1NjQgZXB0X3BvaW50ZXI7CiAKIAlzdHJ1Y3Qg
cHRfZGVzYyBwdF9kZXNjOworCisJLyogVGhlIHZpZXcgdGhpcyB2Y3B1IG9wZXJhdGVzIG9uLiAq
LworCXUxNiB2aWV3OwogfTsKIAogZW51bSBlcHRfcG9pbnRlcnNfc3RhdHVzIHsKZGlmZiAtLWdp
dCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCBiMTZiMDE4
Yzc0Y2MuLjJlMmM1NmEzN2JkYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5jCisrKyBi
L2FyY2gveDg2L2t2bS94ODYuYwpAQCAtMTA4NjksNiArMTA4NjksMTYgQEAgdTY0IGt2bV9zcGVj
X2N0cmxfdmFsaWRfYml0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiB9CiBFWFBPUlRfU1lNQk9M
X0dQTChrdm1fc3BlY19jdHJsX3ZhbGlkX2JpdHMpOwogCit1MTYga3ZtX2dldF9lcHRfdmlldyhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJaWYgKCFrdm1feDg2X29wcy5nZXRfZXB0X3ZpZXcp
CisJCXJldHVybiAwOworCisJcmV0dXJuIGt2bV94ODZfb3BzLmdldF9lcHRfdmlldyh2Y3B1KTsK
K30KK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV9nZXRfZXB0X3ZpZXcpOworCisKIEVYUE9SVF9UUkFD
RVBPSU5UX1NZTUJPTF9HUEwoa3ZtX2V4aXQpOwogRVhQT1JUX1RSQUNFUE9JTlRfU1lNQk9MX0dQ
TChrdm1fZmFzdF9tbWlvKTsKIEVYUE9SVF9UUkFDRVBPSU5UX1NZTUJPTF9HUEwoa3ZtX2lual92
aXJxKTsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
