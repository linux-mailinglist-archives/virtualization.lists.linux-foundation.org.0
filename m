Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C75155DF0
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:26:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 785D0869BE;
	Fri,  7 Feb 2020 18:26:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EM_I6Kb8k7UU; Fri,  7 Feb 2020 18:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A563486933;
	Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78749C1D88;
	Fri,  7 Feb 2020 18:25:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A7C9C1D87
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3C5748692F
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufRIGEyqQrP5
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A2D45868EF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:25:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 002BA305D3E0; Fri,  7 Feb 2020 20:16:40 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id DDB66305206C;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 29/78] KVM: x86: export kvm_vcpu_ioctl_x86_get_xsave()
Date: Fri,  7 Feb 2020 20:15:47 +0200
Message-Id: <20200207181636.1065-30-alazar@bitdefender.com>
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
aW9uIGlzIG5lZWRlZCBmb3IgdGhlIEtWTUlfVkNQVV9HRVRfWFNBVkUgY29tbWFuZC4KClNpZ25l
ZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJj
aC94ODYva3ZtL3g4Ni5jICAgICAgIHwgNCArKy0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0Lmgg
fCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5k
ZXggNjRiNGI2ZGRlMzQ3Li40NTY1ZjNjY2UyMDEgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94
ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTM5ODEsOCArMzk4MSw4IEBAIHN0YXRp
YyB2b2lkIGxvYWRfeHNhdmUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1OCAqc3JjKQogCX0KIH0K
IAotc3RhdGljIHZvaWQga3ZtX3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsCi0JCQkJCSBzdHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSkKK3ZvaWQga3Zt
X3ZjcHVfaW9jdGxfeDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJICBz
dHJ1Y3Qga3ZtX3hzYXZlICpndWVzdF94c2F2ZSkKIHsKIAlpZiAoYm9vdF9jcHVfaGFzKFg4Nl9G
RUFUVVJFX1hTQVZFKSkgewogCQltZW1zZXQoZ3Vlc3RfeHNhdmUsIDAsIHNpemVvZihzdHJ1Y3Qg
a3ZtX3hzYXZlKSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggYi9pbmNs
dWRlL2xpbnV4L2t2bV9ob3N0LmgKaW5kZXggNjI1ZjU2N2Y2MTIwLi5kM2JjNDM1MTM0NGYgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgva3ZtX2hvc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2t2
bV9ob3N0LmgKQEAgLTg3Miw2ICs4NzIsOCBAQCBpbnQga3ZtX2FyY2hfdmNwdV9pb2N0bF9zZXRf
Z3Vlc3RfZGVidWcoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogaW50IGt2bV9hcmNoX3ZjcHVfc2V0
X2d1ZXN0X2RlYnVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIAkJCQkgc3RydWN0IGt2bV9ndWVz
dF9kZWJ1ZyAqZGJnKTsKIGludCBrdm1fYXJjaF92Y3B1X2lvY3RsX3J1bihzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUsIHN0cnVjdCBrdm1fcnVuICprdm1fcnVuKTsKK3ZvaWQga3ZtX3ZjcHVfaW9jdGxf
eDg2X2dldF94c2F2ZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCisJCQkJICBzdHJ1Y3Qga3ZtX3hz
YXZlICpndWVzdF94c2F2ZSk7CiAKIGludCBrdm1fYXJjaF9pbml0KHZvaWQgKm9wYXF1ZSk7CiB2
b2lkIGt2bV9hcmNoX2V4aXQodm9pZCk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
