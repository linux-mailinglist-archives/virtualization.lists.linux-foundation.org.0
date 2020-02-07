Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC17155E48
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 58A0586A02;
	Fri,  7 Feb 2020 18:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vBhelrM82YAg; Fri,  7 Feb 2020 18:36:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 97AFB86A40;
	Fri,  7 Feb 2020 18:36:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 813A3C1D81;
	Fri,  7 Feb 2020 18:36:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0603C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 88A0422739
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H20sqFXQvHyU
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:36:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 94B5922624
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 BD006305D48D; Fri,  7 Feb 2020 20:16:38 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 81CBE3052068;
 Fri,  7 Feb 2020 20:16:38 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 05/78] KVM: add kvm_get_max_gfn()
Date: Fri,  7 Feb 2020 20:15:23 +0200
Message-Id: <20200207181636.1065-6-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBm
dW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZNX0dFVF9NQVhfR0ZOIGNvbW1hbmQuCgpT
aWduZWQtb2ZmLWJ5OiDImHRlZmFuIMiYaWNsZXJ1IDxzc2ljbGVydUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4K
LS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMSArCiB2aXJ0L2t2bS9rdm1fbWFpbi5j
ICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDJmYjI3NjY1NWNjMi4uZTgyNmU4NzRiOTk4IDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9r
dm1faG9zdC5oCkBAIC03NjksNiArNzY5LDcgQEAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqZ2Zu
X3RvX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOwogYm9vbCBrdm1faXNfdmlz
aWJsZV9nZm4oc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOwogdW5zaWduZWQgbG9uZyBrdm1f
aG9zdF9wYWdlX3NpemUoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOwogdm9pZCBtYXJrX3Bh
Z2VfZGlydHkoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOworZ2ZuX3Qga3ZtX2dldF9tYXhf
Z2ZuKHN0cnVjdCBrdm0gKmt2bSk7CiAKIHN0cnVjdCBrdm1fbWVtc2xvdHMgKmt2bV92Y3B1X21l
bXNsb3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpr
dm1fdmNwdV9nZm5fdG9fbWVtc2xvdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90IGdmbik7
CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwpp
bmRleCBhYjY2ZDVhMDg1ODEuLjIwZmZjODZmZDhkMSAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3Zt
X21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0xMTc4LDYgKzExNzgsMjkgQEAg
c3RhdGljIGludCBrdm1fdm1faW9jdGxfc2V0X21lbW9yeV9yZWdpb24oc3RydWN0IGt2bSAqa3Zt
LAogCXJldHVybiBrdm1fc2V0X21lbW9yeV9yZWdpb24oa3ZtLCBtZW0pOwogfQogCitnZm5fdCBr
dm1fZ2V0X21heF9nZm4oc3RydWN0IGt2bSAqa3ZtKQoreworCXN0cnVjdCBrdm1fbWVtb3J5X3Ns
b3QgKm1lbXNsb3Q7CisJc3RydWN0IGt2bV9tZW1zbG90cyAqc2xvdHM7CisJZ2ZuX3QgbWF4X2dm
biA9IDA7CisJaW50IGksIGlkeDsKKworCWlkeCA9IHNyY3VfcmVhZF9sb2NrKCZrdm0tPnNyY3Up
OworCXNwaW5fbG9jaygma3ZtLT5tbXVfbG9jayk7CisKKwlmb3IgKGkgPSAwOyBpIDwgS1ZNX0FE
RFJFU1NfU1BBQ0VfTlVNOyBpKyspIHsKKwkJc2xvdHMgPSBfX2t2bV9tZW1zbG90cyhrdm0sIGkp
OworCQlrdm1fZm9yX2VhY2hfbWVtc2xvdChtZW1zbG90LCBzbG90cykKKwkJCW1heF9nZm4gPSBt
YXgobWF4X2dmbiwgbWVtc2xvdC0+YmFzZV9nZm4KKwkJCQkJCSsgbWVtc2xvdC0+bnBhZ2VzKTsK
Kwl9CisKKwlzcGluX3VubG9jaygma3ZtLT5tbXVfbG9jayk7CisJc3JjdV9yZWFkX3VubG9jaygm
a3ZtLT5zcmN1LCBpZHgpOworCisJcmV0dXJuIG1heF9nZm47Cit9CisKIGludCBrdm1fZ2V0X2Rp
cnR5X2xvZyhzdHJ1Y3Qga3ZtICprdm0sCiAJCQlzdHJ1Y3Qga3ZtX2RpcnR5X2xvZyAqbG9nLCBp
bnQgKmlzX2RpcnR5KQogewpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
