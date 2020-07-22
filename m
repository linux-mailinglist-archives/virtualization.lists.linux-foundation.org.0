Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1FD229C82
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CE098887AE;
	Wed, 22 Jul 2020 16:01:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6mpP3xpKr0Wk; Wed, 22 Jul 2020 16:01:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1510F887BE;
	Wed, 22 Jul 2020 16:01:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DE2B7C004E;
	Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A901AC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 998C888141
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rjDlYPv8oL3E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9A88288169
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B4A99305D76E; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id AB635305FFAA;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 23/34] KVM: x86: mmu: fix: update present_mask in
 spte_read_protect()
Date: Wed, 22 Jul 2020 19:01:10 +0300
Message-Id: <20200722160121.9601-24-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKc2hhZG93
X3ByZXNlbnRfbWFzayBpcyBub3QgMHVsbCBpZiAjVkUgc3VwcG9ydCBpcyBlbmFibGVkLgpJZiAj
VkUgc3VwcG9ydCBpcyBlbmFibGVkLCBzaGFkb3dfcHJlc2VudF9tYXNrIGlzIHVwZGF0ZWQgaW4K
dm14X2VuYWJsZV90ZHAoKSB3aXRoIFZNWF9FUFRfU1VQUFJFU1NfVkVfQklULgoKU2lnbmVkLW9m
Zi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJj
aC94ODYva3ZtL21tdS9tbXUuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11L21t
dS5jIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwppbmRleCA4MTBlMjJmNDEzMDYuLjI4YWI0YTFi
YTI1YSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYworKysgYi9hcmNoL3g4Ni9r
dm0vbW11L21tdS5jCkBAIC0xNjAxLDcgKzE2MDEsMTMgQEAgc3RhdGljIGJvb2wgc3B0ZV93cml0
ZV9wcm90ZWN0KHU2NCAqc3B0ZXAsIGJvb2wgcHRfcHJvdGVjdCkKIHN0YXRpYyBib29sIHNwdGVf
cmVhZF9wcm90ZWN0KHU2NCAqc3B0ZXApCiB7CiAJdTY0IHNwdGUgPSAqc3B0ZXA7Ci0JYm9vbCBl
eGVjX29ubHlfc3VwcG9ydGVkID0gKHNoYWRvd19wcmVzZW50X21hc2sgPT0gMHVsbCk7CisJYm9v
bCBleGVjX29ubHlfc3VwcG9ydGVkOworCisJaWYgKGt2bV92ZV9zdXBwb3J0ZWQpCisJCWV4ZWNf
b25seV9zdXBwb3J0ZWQgPQorCQkgICAgKHNoYWRvd19wcmVzZW50X21hc2sgPT0gVk1YX0VQVF9T
VVBQUkVTU19WRV9CSVQpOworCWVsc2UKKwkJZXhlY19vbmx5X3N1cHBvcnRlZCA9IChzaGFkb3df
cHJlc2VudF9tYXNrID09IDB1bGwpOwogCiAJcm1hcF9wcmludGsoInJtYXBfcmVhZF9wcm90ZWN0
OiBzcHRlICVwICVsbHhcbiIsIHNwdGVwLCAqc3B0ZXApOwogCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
