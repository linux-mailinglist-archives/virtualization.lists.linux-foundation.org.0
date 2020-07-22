Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E2229C71
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C000B86BCC;
	Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BgkljPG30bYL; Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 67BDC86C2F;
	Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4DA65C004E;
	Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D50BBC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C157A20794
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXF44EYvD8h8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 95E68203DE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 1F9E8305D7EB; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 0E6963072798;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 07/34] KVM: x86: mmu: increase mmu_memory_cache size
Date: Wed, 22 Jul 2020 19:00:54 +0300
Message-Id: <20200722160121.9601-8-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKV2UgdXNl
L2FsbG9jYXRlIG1vcmUgcm9vdF9ocGEncyBldmVyeSB0aW1lIG1tdV9hbGxvY19yb290cygpCmlz
IGNhbGxlZC4KClNpZ25lZC1vZmYtYnk6IMiYdGVmYW4gyJhpY2xlcnUgPHNzaWNsZXJ1QGJpdGRl
ZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVm
ZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgfCA2ICsrKystLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rdm0vbW11L21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwppbmRleCA1NTM0
MjVhYjM1MTguLjcwNDYxYzdlZjU4YyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9tbXUu
YworKysgYi9hcmNoL3g4Ni9rdm0vbW11L21tdS5jCkBAIC0xMTE5LDExICsxMTE5LDEzIEBAIHN0
YXRpYyBpbnQgbW11X3RvcHVwX21lbW9yeV9jYWNoZXMoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQog
CQkJCSAgIHB0ZV9saXN0X2Rlc2NfY2FjaGUsIDggKyBQVEVfUFJFRkVUQ0hfTlVNKTsKIAlpZiAo
cikKIAkJZ290byBvdXQ7Ci0JciA9IG1tdV90b3B1cF9tZW1vcnlfY2FjaGVfcGFnZSgmdmNwdS0+
YXJjaC5tbXVfcGFnZV9jYWNoZSwgOCk7CisJciA9IG1tdV90b3B1cF9tZW1vcnlfY2FjaGVfcGFn
ZSgmdmNwdS0+YXJjaC5tbXVfcGFnZV9jYWNoZSwKKwkJCQkJOCAqIEtWTV9NQVhfRVBUX1ZJRVdT
KTsKIAlpZiAocikKIAkJZ290byBvdXQ7CiAJciA9IG1tdV90b3B1cF9tZW1vcnlfY2FjaGUoJnZj
cHUtPmFyY2gubW11X3BhZ2VfaGVhZGVyX2NhY2hlLAotCQkJCSAgIG1tdV9wYWdlX2hlYWRlcl9j
YWNoZSwgNCk7CisJCQkJICAgbW11X3BhZ2VfaGVhZGVyX2NhY2hlLAorCQkJCSAgIDQgKiBLVk1f
TUFYX0VQVF9WSUVXUyk7CiBvdXQ6CiAJcmV0dXJuIHI7CiB9Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
