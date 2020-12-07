Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F109B2D1ADD
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:46:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C90E87960;
	Mon,  7 Dec 2020 20:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NH2eGSuFn1q; Mon,  7 Dec 2020 20:46:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC52C87B55;
	Mon,  7 Dec 2020 20:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2E57C013B;
	Mon,  7 Dec 2020 20:46:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27B8DC0FA7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0610487899
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0O5SfvhFeVFt
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 62CED878A4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:18 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 ED062305D511; Mon,  7 Dec 2020 22:46:15 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id CB2883072785;
 Mon,  7 Dec 2020 22:46:15 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 25/81] KVM: x86: export kvm_vcpu_ioctl_x86_get_xsave()
Date: Mon,  7 Dec 2020 22:45:26 +0200
Message-Id: <20201207204622.15258-26-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
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
eDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAzICsrKwogYXJjaC94ODYva3ZtL3g4Ni5jICAg
ICAgICAgICAgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggN2RjMWViYWM4ZDkxLi5l
YzBlMmE3NzY0YWQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgK
KysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTUxNCw2ICsxNTE0LDkg
QEAgdW5zaWduZWQgbG9uZyBrdm1fZ2V0X3JmbGFncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwog
dm9pZCBrdm1fc2V0X3JmbGFncyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcg
cmZsYWdzKTsKIGJvb2wga3ZtX3JkcG1jKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiAKK3ZvaWQg
a3ZtX3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJ
ICBzdHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSk7CisKIGJvb2wga3ZtX2luamVjdF9wZW5k
aW5nX2V4Y2VwdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogdm9pZCBrdm1fcXVldWVfZXhj
ZXB0aW9uKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdW5zaWduZWQgbnIpOwogdm9pZCBrdm1fcXVl
dWVfZXhjZXB0aW9uX2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBuciwgdTMyIGVy
cm9yX2NvZGUpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94ODYva3Zt
L3g4Ni5jCmluZGV4IDc0MTUwNWY0MDViMS4uNGZhZGQxYWIyMGFlIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC00NDk3LDggKzQ0OTcs
OCBAQCBzdGF0aWMgdm9pZCBsb2FkX3hzYXZlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTggKnNy
YykKIAl9CiB9CiAKLXN0YXRpYyB2b2lkIGt2bV92Y3B1X2lvY3RsX3g4Nl9nZXRfeHNhdmUoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAotCQkJCQkgc3RydWN0IGt2bV94c2F2ZSAqZ3Vlc3RfeHNhdmUp
Cit2b2lkIGt2bV92Y3B1X2lvY3RsX3g4Nl9nZXRfeHNhdmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAorCQkJCSAgc3RydWN0IGt2bV94c2F2ZSAqZ3Vlc3RfeHNhdmUpCiB7CiAJaWYgKGJvb3RfY3B1
X2hhcyhYODZfRkVBVFVSRV9YU0FWRSkpIHsKIAkJbWVtc2V0KGd1ZXN0X3hzYXZlLCAwLCBzaXpl
b2Yoc3RydWN0IGt2bV94c2F2ZSkpOwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
