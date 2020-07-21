Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0FD228B2D
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 796FB86BCC;
	Tue, 21 Jul 2020 21:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvtROS1qYG1c; Tue, 21 Jul 2020 21:26:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F025486BE5;
	Tue, 21 Jul 2020 21:26:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBF50C088E;
	Tue, 21 Jul 2020 21:26:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E918C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 64D3C2276C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ef4UoV7ZjCQw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:26:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id E0C8022797
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 76489305D64F; Wed, 22 Jul 2020 00:09:23 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 5C80A304FA12;
 Wed, 22 Jul 2020 00:09:23 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 30/84] KVM: x86: export kvm_vcpu_ioctl_x86_get_xsave()
Date: Wed, 22 Jul 2020 00:08:28 +0300
Message-Id: <20200721210922.7646-31-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIGlzIG5lZWRlZCBmb3IgdGhlIEtWTUlfVkNQVV9HRVRfWFNBVkUgY29tbWFuZC4KClNpZ25l
ZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJj
aC94ODYva3ZtL3g4Ni5jICAgICAgIHwgNCArKy0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0Lmgg
fCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5k
ZXggNTIxODFlYjEzMWRkLi40ZDViZTQ4YjUyMzkgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94
ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTQyMDcsOCArNDIwNyw4IEBAIHN0YXRp
YyB2b2lkIGxvYWRfeHNhdmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1OCAqc3JjKQogCX0KIH0K
IAotc3RhdGljIHZvaWQga3ZtX3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCi0JCQkJCSBzdHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSkKK3ZvaWQga3Zt
X3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJICBz
dHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSkKIHsKIAlpZiAoYm9vdF9jcHVfaGFzKFg4Nl9G
RUFUVVJFX1hTQVZFKSkgewogCQltZW1zZXQoZ3Vlc3RfeHNhdmUsIDAsIHNpemVvZihzdHJ1Y3Qg
a3ZtX3hzYXZlKSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNs
dWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggMDE2MjhmN2JjYmNkLi5mMTM4ZDU2NDUwYzAgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2
bV9ob3N0LmgKQEAgLTg4Myw2ICs4ODMsOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRf
Z3Vlc3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogaW50IGt2bV9hcmNoX3ZjcHVfaW9j
dGxfcnVuKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiBpbnQga3ZtX2FyY2hfdmNwdV9zZXRfZ3Vl
c3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAgc3RydWN0IGt2bV9ndWVzdF9k
ZWJ1ZyAqZGJnKTsKK3ZvaWQga3ZtX3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUsCisJCQkJICBzdHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSk7CiAKIGlu
dCBrdm1fYXJjaF9pbml0KHZvaWQgKm9wYXF1ZSk7CiB2b2lkIGt2bV9hcmNoX2V4aXQodm9pZCk7
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxp
emF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9u
Lm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92
aXJ0dWFsaXphdGlvbg==
