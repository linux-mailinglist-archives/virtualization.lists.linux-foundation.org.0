Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AE12C3CFA
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:52:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7113786E01;
	Wed, 25 Nov 2020 09:52:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZkDnk2HqcLwW; Wed, 25 Nov 2020 09:52:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D8AE786E17;
	Wed, 25 Nov 2020 09:52:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE594C0052;
	Wed, 25 Nov 2020 09:52:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03A33C1DA5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E714B874BE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WfUK5HzKS7oF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E53DD874AF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 4EA3A305D501; Wed, 25 Nov 2020 11:35:45 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 2F2AB3072785;
 Wed, 25 Nov 2020 11:35:45 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 15/81] KVM: x86: add kvm_x86_ops.msr_write_intercepted()
Date: Wed, 25 Nov 2020 11:34:54 +0200
Message-Id: <20201125093600.2766-16-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KClRoaXMgZnVuY3Rp
b24gd2lsbCBiZSB1c2VkIHRvIGNoZWNrIGlmIHRoZSB3cml0ZSBhY2Nlc3MgZm9yIGEgc3BlY2lm
aWMKTVNSIGlzIGFscmVhZHkgaW50ZXJjZXB0ZWQuIFRoZSBpbmZvcm1hdGlvbiB3aWxsIGJlIHVz
ZWQgdG8gcmVzdG9yZSB0aGUKaW50ZXJjZXB0aW9uIHN0YXR1cyB3aGVuIHRoZSBpbnRyb3NwZWN0
aW9uIHRvb2wgaXMgbm8gbG9uZ2VyIGludGVyZXN0ZWQKaW4gdGhhdCBNU1IuCgpTaWduZWQtb2Zm
LWJ5OiBOaWN1yJlvciBDw67Im3UgPG5pY3UuY2l0dUBpY2xvdWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDEgKwogYXJjaC94ODYva3ZtL3N2bS9zdm0uYyAgICAg
ICAgICB8IDEgKwogYXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICB8IDEgKwogMyBmaWxl
cyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRl
L2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAw
ZTkxNDRlMjNjZTYuLjUyMzYwMDhkMjMxZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0x
MTEyLDYgKzExMTIsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCXZvaWQgKCp1cGRhdGVfZXhj
ZXB0aW9uX2JpdG1hcCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAlpbnQgKCpnZXRfbXNyKShz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3JfZGF0YSAqbXNyKTsKIAlpbnQgKCpzZXRf
bXNyKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3JfZGF0YSAqbXNyKTsKKwlib29s
ICgqbXNyX3dyaXRlX2ludGVyY2VwdGVkKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUzMiBtc3Ip
OwogCXU2NCAoKmdldF9zZWdtZW50X2Jhc2UpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgaW50IHNl
Zyk7CiAJdm9pZCAoKmdldF9zZWdtZW50KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkgICAg
c3RydWN0IGt2bV9zZWdtZW50ICp2YXIsIGludCBzZWcpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYv
a3ZtL3N2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKaW5kZXggODZmMGRjZjlmZWNk
Li40NDc4OTQyZjEwYTUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKKysrIGIv
YXJjaC94ODYva3ZtL3N2bS9zdm0uYwpAQCAtNDMwNCw2ICs0MzA0LDcgQEAgc3RhdGljIHN0cnVj
dCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX2luaXRkYXRhID0gewogCS5nZXRfbXNyX2ZlYXR1
cmUgPSBzdm1fZ2V0X21zcl9mZWF0dXJlLAogCS5nZXRfbXNyID0gc3ZtX2dldF9tc3IsCiAJLnNl
dF9tc3IgPSBzdm1fc2V0X21zciwKKwkubXNyX3dyaXRlX2ludGVyY2VwdGVkID0gbXNyX3dyaXRl
X2ludGVyY2VwdGVkLAogCS5nZXRfc2VnbWVudF9iYXNlID0gc3ZtX2dldF9zZWdtZW50X2Jhc2Us
CiAJLmdldF9zZWdtZW50ID0gc3ZtX2dldF9zZWdtZW50LAogCS5zZXRfc2VnbWVudCA9IHN2bV9z
ZXRfc2VnbWVudCwKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCmluZGV4IDViZDZhNGFkZDI3ZS4uZDQ4MzNkM2JmOTY2IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
QEAgLTc2NTgsNiArNzY1OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9v
cHMgX19pbml0ZGF0YSA9IHsKIAkuZ2V0X21zcl9mZWF0dXJlID0gdm14X2dldF9tc3JfZmVhdHVy
ZSwKIAkuZ2V0X21zciA9IHZteF9nZXRfbXNyLAogCS5zZXRfbXNyID0gdm14X3NldF9tc3IsCisJ
Lm1zcl93cml0ZV9pbnRlcmNlcHRlZCA9IG1zcl93cml0ZV9pbnRlcmNlcHRlZCwKIAkuZ2V0X3Nl
Z21lbnRfYmFzZSA9IHZteF9nZXRfc2VnbWVudF9iYXNlLAogCS5nZXRfc2VnbWVudCA9IHZteF9n
ZXRfc2VnbWVudCwKIAkuc2V0X3NlZ21lbnQgPSB2bXhfc2V0X3NlZ21lbnQsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxp
bmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczov
L2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlv
bg==
