Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD4B2C3CF6
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:52:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F0923874FA;
	Wed, 25 Nov 2020 09:52:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kdn+1TrHBXcJ; Wed, 25 Nov 2020 09:52:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 890ED874EB;
	Wed, 25 Nov 2020 09:52:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6575DC163C;
	Wed, 25 Nov 2020 09:52:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0589C163C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CEB0E86DBD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MXOrVQcKLeGV
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B7E3386DAC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 DBC36305D50C; Wed, 25 Nov 2020 11:35:46 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id C102D3072784;
 Wed, 25 Nov 2020 11:35:46 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 26/81] KVM: x86: export kvm_vcpu_ioctl_x86_set_xsave()
Date: Wed, 25 Nov 2020 11:35:05 +0200
Message-Id: <20201125093600.2766-27-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

VGhpcyBmdW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZDUFVfU0VUX1hTQVZFIGNvbW1h
bmQuCgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5j
b20+Ci0tLQogYXJjaC94ODYva3ZtL3g4Ni5jICAgICAgIHwgNCArKy0tCiBpbmNsdWRlL2xpbnV4
L2t2bV9ob3N0LmggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9r
dm0veDg2LmMKaW5kZXggNGZhZGQxYWIyMGFlLi5mNDg2MDNjOGU0NGQgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTQ1MTQsOCArNDUx
NCw4IEBAIHZvaWQga3ZtX3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsCiAKICNkZWZpbmUgWFNBVkVfTVhDU1JfT0ZGU0VUIDI0CiAKLXN0YXRpYyBpbnQga3Zt
X3ZjcHVfaW9jdGxfeDg2X3NldF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCi0JCQkJCXN0
cnVjdCBrdm1feHNhdmUgKmd1ZXN0X3hzYXZlKQoraW50IGt2bV92Y3B1X2lvY3RsX3g4Nl9zZXRf
eHNhdmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSBzdHJ1Y3Qga3ZtX3hzYXZlICpndWVz
dF94c2F2ZSkKIHsKIAl1NjQgeHN0YXRlX2J2ID0KIAkJKih1NjQgKikmZ3Vlc3RfeHNhdmUtPnJl
Z2lvbltYU0FWRV9IRFJfT0ZGU0VUIC8gc2l6ZW9mKHUzMildOwpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDZlZWM3
NWY3N2Q3ZS4uZGIwNGRhYjIzMDEzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0
LmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oCkBAIC05MjMsNiArOTIzLDggQEAgaW50
IGt2bV9hcmNoX3ZjcHVfc2V0X2d1ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJ
CQkgIHN0cnVjdCBrdm1fZ3Vlc3RfZGVidWcgKmRiZyk7CiB2b2lkIGt2bV92Y3B1X2lvY3RsX3g4
Nl9nZXRfeHNhdmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAgc3RydWN0IGt2bV94c2F2
ZSAqZ3Vlc3RfeHNhdmUpOworaW50IGt2bV92Y3B1X2lvY3RsX3g4Nl9zZXRfeHNhdmUoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSBzdHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSk7CiAK
IGludCBrdm1fYXJjaF9pbml0KHZvaWQgKm9wYXF1ZSk7CiB2b2lkIGt2bV9hcmNoX2V4aXQodm9p
ZCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
