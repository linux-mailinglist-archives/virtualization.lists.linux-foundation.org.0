Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BA8229C6F
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2F07288638;
	Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2aAzn-ybRHf; Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 740A8884DA;
	Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 562A2C004E;
	Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D17EC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 49AA786BCC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5BHcfAmK8yv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A47CC86B10
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 3A0B5305D7F7; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 325E43011F3C;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 11/34] KVM: x86: mmu: allow zapping shadow pages for
 specific EPT views
Date: Wed, 22 Jul 2020 19:00:58 +0300
Message-Id: <20200722160121.9601-12-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKQWRkIGEg
dmlldyBtYXNrIGZvciBrdm1fbW11X3phcF9hbGwoKSBpbiBvcmRlciB0byBhbGxvdyB6YXBwaW5n
CnNoYWRvdyBwYWdlcyBmb3Igc3BlY2lmaWMgRVBUIHZpZXdzLiBUaGlzIGlzIHJlcXVpcmVkIHdo
ZW4gYW4KaW50cm9zcGVjdGVkIFZNIGlzIHVuaG9va2VkLiBJbiB0aGF0IGNhc2UsIHNoYWRvdyBw
YWdlcyB0aGF0CmJlbG9uZyB0byBub24tZGVmYXVsdCB2aWV3cyB3aWxsIGJlIHphcHBlZC4KClNp
Z25lZC1vZmYtYnk6IMiYdGVmYW4gyJhpY2xlcnUgPHNzaWNsZXJ1QGJpdGRlZmVuZGVyLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgot
LS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAyICstCiBhcmNoL3g4Ni9rdm0v
bW11L21tdS5jICAgICAgICAgIHwgNCArKystCiBhcmNoL3g4Ni9rdm0veDg2LmMgICAgICAgICAg
ICAgIHwgNCArKystCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJj
aC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAyZmJiMjZiNTRjZjEuLjUxOWI4MjEw
YjhlZiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMzkyLDcgKzEzOTIsNyBAQCB2b2lk
IGt2bV9tbXVfc2xvdF9zZXRfZGlydHkoc3RydWN0IGt2bSAqa3ZtLAogdm9pZCBrdm1fbW11X2Ns
ZWFyX2RpcnR5X3B0X21hc2tlZChzdHJ1Y3Qga3ZtICprdm0sCiAJCQkJICAgc3RydWN0IGt2bV9t
ZW1vcnlfc2xvdCAqc2xvdCwKIAkJCQkgICBnZm5fdCBnZm5fb2Zmc2V0LCB1bnNpZ25lZCBsb25n
IG1hc2spOwotdm9pZCBrdm1fbW11X3phcF9hbGwoc3RydWN0IGt2bSAqa3ZtKTsKK3ZvaWQga3Zt
X21tdV96YXBfYWxsKHN0cnVjdCBrdm0gKmt2bSwgdTE2IHZpZXdfbWFzayk7CiB2b2lkIGt2bV9t
bXVfaW52YWxpZGF0ZV9tbWlvX3NwdGVzKHN0cnVjdCBrdm0gKmt2bSwgdTY0IGdlbik7CiB1bnNp
Z25lZCBsb25nIGt2bV9tbXVfY2FsY3VsYXRlX2RlZmF1bHRfbW11X3BhZ2VzKHN0cnVjdCBrdm0g
Kmt2bSk7CiB2b2lkIGt2bV9tbXVfY2hhbmdlX21tdV9wYWdlcyhzdHJ1Y3Qga3ZtICprdm0sIHVu
c2lnbmVkIGxvbmcga3ZtX25yX21tdV9wYWdlcyk7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0v
bW11L21tdS5jIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwppbmRleCBjY2ExMjk4MmI3OTUuLjIy
YzgzMTkyYmJhMSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYworKysgYi9hcmNo
L3g4Ni9rdm0vbW11L21tdS5jCkBAIC02MTY2LDcgKzYxNjYsNyBAQCB2b2lkIGt2bV9tbXVfc2xv
dF9zZXRfZGlydHkoc3RydWN0IGt2bSAqa3ZtLAogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX21t
dV9zbG90X3NldF9kaXJ0eSk7CiAKLXZvaWQga3ZtX21tdV96YXBfYWxsKHN0cnVjdCBrdm0gKmt2
bSkKK3ZvaWQga3ZtX21tdV96YXBfYWxsKHN0cnVjdCBrdm0gKmt2bSwgdTE2IHZpZXdfbWFzaykK
IHsKIAlzdHJ1Y3Qga3ZtX21tdV9wYWdlICpzcCwgKm5vZGU7CiAJTElTVF9IRUFEKGludmFsaWRf
bGlzdCk7CkBAIC02MTc1LDYgKzYxNzUsOCBAQCB2b2lkIGt2bV9tbXVfemFwX2FsbChzdHJ1Y3Qg
a3ZtICprdm0pCiAJc3Bpbl9sb2NrKCZrdm0tPm1tdV9sb2NrKTsKIHJlc3RhcnQ6CiAJbGlzdF9m
b3JfZWFjaF9lbnRyeV9zYWZlKHNwLCBub2RlLCAma3ZtLT5hcmNoLmFjdGl2ZV9tbXVfcGFnZXMs
IGxpbmspIHsKKwkJaWYgKCF0ZXN0X2JpdChzcC0+dmlldywgKHVuc2lnbmVkIGxvbmcgKikmdmll
d19tYXNrKSkKKwkJCWNvbnRpbnVlOwogCQlpZiAoc3AtPnJvbGUuaW52YWxpZCAmJiBzcC0+cm9v
dF9jb3VudCkKIAkJCWNvbnRpbnVlOwogCQlpZiAoX19rdm1fbW11X3ByZXBhcmVfemFwX3BhZ2Uo
a3ZtLCBzcCwgJmludmFsaWRfbGlzdCwgJmlnbikpCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0v
eDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5kZXggMmUyYzU2YTM3YmRiLi43OGFhY2FjODM5
YmIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2
LmMKQEAgLTEwNDA2LDcgKzEwNDA2LDkgQEAgdm9pZCBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3Jl
Z2lvbihzdHJ1Y3Qga3ZtICprdm0sCiAKIHZvaWQga3ZtX2FyY2hfZmx1c2hfc2hhZG93X2FsbChz
dHJ1Y3Qga3ZtICprdm0pCiB7Ci0Ja3ZtX21tdV96YXBfYWxsKGt2bSk7CisJdTE2IGVwdF92aWV3
c190b19rZWVwID0gMDsKKworCWt2bV9tbXVfemFwX2FsbChrdm0sIH5lcHRfdmlld3NfdG9fa2Vl
cCk7CiB9CiAKIHZvaWQga3ZtX2FyY2hfZmx1c2hfc2hhZG93X21lbXNsb3Qoc3RydWN0IGt2bSAq
a3ZtLApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0
dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRh
dGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGlu
Zm8vdmlydHVhbGl6YXRpb24=
