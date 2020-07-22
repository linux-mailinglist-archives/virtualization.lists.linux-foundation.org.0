Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F0004229C6D
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 133B98823A;
	Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id riFUjr4yPtMa; Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DE85387FC3;
	Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C81A9C004E;
	Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD26BC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A5BA888138
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DW48StY9RqwW
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B0BDC8806F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:33 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 0CB77305D7E6; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id EF29B3072788;
 Wed, 22 Jul 2020 19:01:31 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 04/34] KVM: x86: mmu: reindent to avoid lines longer
 than 80 chars
Date: Wed, 22 Jul 2020 19:00:51 +0300
Message-Id: <20200722160121.9601-5-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
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

U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIGFyY2gveDg2L2t2bS9tbXUvbW11LmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vbW11
L21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwppbmRleCA5Nzc2NmYzNDkxMGQuLmYzYmE0
ZDA0NTJjOSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYworKysgYi9hcmNoL3g4
Ni9rdm0vbW11L21tdS5jCkBAIC0yNTczLDYgKzI1NzMsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV9t
bXVfcGFnZSAqa3ZtX21tdV9nZXRfcGFnZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJYm9vbCBm
bHVzaCA9IGZhbHNlOwogCWludCBjb2xsaXNpb25zID0gMDsKIAlMSVNUX0hFQUQoaW52YWxpZF9s
aXN0KTsKKwl1bnNpZ25lZCBpbnQgcGdfaGFzaDsKIAogCXJvbGUgPSB2Y3B1LT5hcmNoLm1tdS0+
bW11X3JvbGUuYmFzZTsKIAlyb2xlLmxldmVsID0gbGV2ZWw7CkBAIC0yNjIzLDggKzI2MjQsOSBA
QCBzdGF0aWMgc3RydWN0IGt2bV9tbXVfcGFnZSAqa3ZtX21tdV9nZXRfcGFnZShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCiAKIAlzcC0+Z2ZuID0gZ2ZuOwogCXNwLT5yb2xlID0gcm9sZTsKKwlwZ19o
YXNoID0ga3ZtX3BhZ2VfdGFibGVfaGFzaGZuKGdmbik7CiAJaGxpc3RfYWRkX2hlYWQoJnNwLT5o
YXNoX2xpbmssCi0JCSZ2Y3B1LT5rdm0tPmFyY2gubW11X3BhZ2VfaGFzaFtrdm1fcGFnZV90YWJs
ZV9oYXNoZm4oZ2ZuKV0pOworCQkmdmNwdS0+a3ZtLT5hcmNoLm1tdV9wYWdlX2hhc2hbcGdfaGFz
aF0pOwogCWlmICghZGlyZWN0KSB7CiAJCS8qCiAJCSAqIHdlIHNob3VsZCBkbyB3cml0ZSBwcm90
ZWN0aW9uIGJlZm9yZSBzeW5jaW5nIHBhZ2VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
