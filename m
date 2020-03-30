Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ED428197874
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:12:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8FFD786972;
	Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AsfPPgLIMX2y; Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 32550869D9;
	Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1722DC1AE8;
	Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 309BCC1AE8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1610187B9B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-pjvQitrduu
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4EF0487C16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 3F8A630747C2; Mon, 30 Mar 2020 13:12:49 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id E4CC6305B7A1;
 Mon, 30 Mar 2020 13:12:48 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 05/81] KVM: add kvm_get_max_gfn()
Date: Mon, 30 Mar 2020 13:11:52 +0300
Message-Id: <20200330101308.21702-6-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBm
dW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZNX0dFVF9NQVhfR0ZOIGNvbW1hbmQuCgpT
aWduZWQtb2ZmLWJ5OiDImHRlZmFuIMiYaWNsZXJ1IDxzc2ljbGVydUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4K
LS0tCiBpbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmggfCAgMSArCiB2aXJ0L2t2bS9rdm1fbWFpbi5j
ICAgICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9rdm1faG9zdC5oIGIvaW5j
bHVkZS9saW51eC9rdm1faG9zdC5oCmluZGV4IDY4OTBmMGE4NWRiYS4uNjY4MDU5MmYyZGUxIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bV9ob3N0LmgKKysrIGIvaW5jbHVkZS9saW51eC9r
dm1faG9zdC5oCkBAIC03NjUsNiArNzY1LDcgQEAgc3RydWN0IGt2bV9tZW1vcnlfc2xvdCAqZ2Zu
X3RvX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOwogYm9vbCBrdm1faXNfdmlz
aWJsZV9nZm4oc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOwogdW5zaWduZWQgbG9uZyBrdm1f
aG9zdF9wYWdlX3NpemUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4pOwogdm9pZCBt
YXJrX3BhZ2VfZGlydHkoc3RydWN0IGt2bSAqa3ZtLCBnZm5fdCBnZm4pOworZ2ZuX3Qga3ZtX2dl
dF9tYXhfZ2ZuKHN0cnVjdCBrdm0gKmt2bSk7CiAKIHN0cnVjdCBrdm1fbWVtc2xvdHMgKmt2bV92
Y3B1X21lbXNsb3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiBzdHJ1Y3Qga3ZtX21lbW9yeV9z
bG90ICprdm1fdmNwdV9nZm5fdG9fbWVtc2xvdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGdmbl90
IGdmbik7CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21h
aW4uYwppbmRleCA0YzY5Y2U1YWE3OWMuLmE2ZWIzZjhlYTYyZiAxMDA2NDQKLS0tIGEvdmlydC9r
dm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0xMTc1LDYgKzExNzUs
MjkgQEAgc3RhdGljIGludCBrdm1fdm1faW9jdGxfc2V0X21lbW9yeV9yZWdpb24oc3RydWN0IGt2
bSAqa3ZtLAogCXJldHVybiBrdm1fc2V0X21lbW9yeV9yZWdpb24oa3ZtLCBtZW0pOwogfQogCitn
Zm5fdCBrdm1fZ2V0X21heF9nZm4oc3RydWN0IGt2bSAqa3ZtKQoreworCXN0cnVjdCBrdm1fbWVt
b3J5X3Nsb3QgKm1lbXNsb3Q7CisJc3RydWN0IGt2bV9tZW1zbG90cyAqc2xvdHM7CisJZ2ZuX3Qg
bWF4X2dmbiA9IDA7CisJaW50IGksIGlkeDsKKworCWlkeCA9IHNyY3VfcmVhZF9sb2NrKCZrdm0t
PnNyY3UpOworCXNwaW5fbG9jaygma3ZtLT5tbXVfbG9jayk7CisKKwlmb3IgKGkgPSAwOyBpIDwg
S1ZNX0FERFJFU1NfU1BBQ0VfTlVNOyBpKyspIHsKKwkJc2xvdHMgPSBfX2t2bV9tZW1zbG90cyhr
dm0sIGkpOworCQlrdm1fZm9yX2VhY2hfbWVtc2xvdChtZW1zbG90LCBzbG90cykKKwkJCW1heF9n
Zm4gPSBtYXgobWF4X2dmbiwgbWVtc2xvdC0+YmFzZV9nZm4KKwkJCQkJCSsgbWVtc2xvdC0+bnBh
Z2VzKTsKKwl9CisKKwlzcGluX3VubG9jaygma3ZtLT5tbXVfbG9jayk7CisJc3JjdV9yZWFkX3Vu
bG9jaygma3ZtLT5zcmN1LCBpZHgpOworCisJcmV0dXJuIG1heF9nZm47Cit9CisKIGludCBrdm1f
Z2V0X2RpcnR5X2xvZyhzdHJ1Y3Qga3ZtICprdm0sCiAJCQlzdHJ1Y3Qga3ZtX2RpcnR5X2xvZyAq
bG9nLCBpbnQgKmlzX2RpcnR5KQogewpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
