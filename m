Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D53C72C3CF8
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:52:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 845EB86B31;
	Wed, 25 Nov 2020 09:52:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ug_d5LEiMWGn; Wed, 25 Nov 2020 09:52:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D55286B10;
	Wed, 25 Nov 2020 09:52:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11EE6C0052;
	Wed, 25 Nov 2020 09:52:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 61AA8C1D9F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4E1BA86DC1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:52:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tRUy8Mcks2hm
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C5CE086DAF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:51:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 BE4DD305D50B; Wed, 25 Nov 2020 11:35:46 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 9F7743072785;
 Wed, 25 Nov 2020 11:35:46 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 25/81] KVM: x86: export kvm_vcpu_ioctl_x86_get_xsave()
Date: Wed, 25 Nov 2020 11:35:04 +0200
Message-Id: <20201125093600.2766-26-alazar@bitdefender.com>
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
b24gaXMgbmVlZGVkIGZvciB0aGUgS1ZNSV9WQ1BVX0dFVF9YU0FWRSBjb21tYW5kLgoKU2lnbmVk
LW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gv
eDg2L2t2bS94ODYuYyAgICAgICB8IDQgKystLQogaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIHwg
MiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3ZtL3g4Ni5jCmluZGV4
IDc0MTUwNWY0MDViMS4uNGZhZGQxYWIyMGFlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0veDg2
LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC00NDk3LDggKzQ0OTcsOCBAQCBzdGF0aWMg
dm9pZCBsb2FkX3hzYXZlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTggKnNyYykKIAl9CiB9CiAK
LXN0YXRpYyB2b2lkIGt2bV92Y3B1X2lvY3RsX3g4Nl9nZXRfeHNhdmUoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LAotCQkJCQkgc3RydWN0IGt2bV94c2F2ZSAqZ3Vlc3RfeHNhdmUpCit2b2lkIGt2bV92
Y3B1X2lvY3RsX3g4Nl9nZXRfeHNhdmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAorCQkJCSAgc3Ry
dWN0IGt2bV94c2F2ZSAqZ3Vlc3RfeHNhdmUpCiB7CiAJaWYgKGJvb3RfY3B1X2hhcyhYODZfRkVB
VFVSRV9YU0FWRSkpIHsKIAkJbWVtc2V0KGd1ZXN0X3hzYXZlLCAwLCBzaXplb2Yoc3RydWN0IGt2
bV94c2F2ZSkpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5jbHVk
ZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDJjNjQwZWE5ZDdiYS4uNmVlYzc1Zjc3ZDdlIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9rdm1f
aG9zdC5oCkBAIC05MjEsNiArOTIxLDggQEAgaW50IGt2bV9hcmNoX3ZjcHVfaW9jdGxfc2V0X2d1
ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIGludCBrdm1fYXJjaF92Y3B1X2lvY3Rs
X3J1bihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogaW50IGt2bV9hcmNoX3ZjcHVfc2V0X2d1ZXN0
X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQkgIHN0cnVjdCBrdm1fZ3Vlc3RfZGVi
dWcgKmRiZyk7Cit2b2lkIGt2bV92Y3B1X2lvY3RsX3g4Nl9nZXRfeHNhdmUoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LAorCQkJCSAgc3RydWN0IGt2bV94c2F2ZSAqZ3Vlc3RfeHNhdmUpOwogCiBpbnQg
a3ZtX2FyY2hfaW5pdCh2b2lkICpvcGFxdWUpOwogdm9pZCBrdm1fYXJjaF9leGl0KHZvaWQpOwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
