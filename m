Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5153D229CA2
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id CB892887D8;
	Wed, 22 Jul 2020 16:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sEcnCIj-FMe1; Wed, 22 Jul 2020 16:02:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C7EAA88783;
	Wed, 22 Jul 2020 16:01:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4C58C004E;
	Wed, 22 Jul 2020 16:01:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B2994C0050
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 98C56227A0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpacmPThkpPZ
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id E39F620794
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 47D28305D67A; Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3C8C2305FFA3;
 Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 33/34] KVM: introspection: mask out non-rwx flags when
 reading/writing from/to the internal database
Date: Wed, 22 Jul 2020 19:01:20 +0300
Message-Id: <20200722160121.9601-34-alazar@bitdefender.com>
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

VGhpcyBpcyBuZWVkZWQgYmVjYXVzZSB0aGUgS1ZNSV9WTV9TRVRfUEFHRV9TVkUgY29tbWFuZCB3
ZSB3aWxsIHVzZQp0aGUgc2FtZSBkYXRhYmFzZSB0byBrZWVwIHRoZSBzdXBwcmVzcyAjVkUgYml0
IHJlcXVlc3RlZCBieSB0aGUKaW50cm9zcGVjdGlvbiB0b29sLgoKU2lnbmVkLW9mZi1ieTogQWRh
bGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIHZpcnQva3ZtL2ludHJv
c3BlY3Rpb24va3ZtaS5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyBiL3ZpcnQva3ZtL2ludHJvc3Bl
Y3Rpb24va3ZtaS5jCmluZGV4IGYzYmRlZjNjNTRlNi4uNmJhZTI5ODFjZGE3IDEwMDY0NAotLS0g
YS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0
aW9uL2t2bWkuYwpAQCAtMjMsOSArMjMsMTIgQEAgc3RhdGljIHN0cnVjdCBrbWVtX2NhY2hlICpt
c2dfY2FjaGU7CiBzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUgKmpvYl9jYWNoZTsKIHN0YXRpYyBz
dHJ1Y3Qga21lbV9jYWNoZSAqcmFkaXhfY2FjaGU7CiAKLXN0YXRpYyBjb25zdCB1OCBmdWxsX2Fj
Y2VzcyAgPQlLVk1JX1BBR0VfQUNDRVNTX1IgfAotCQkJCUtWTUlfUEFHRV9BQ0NFU1NfVyB8Ci0J
CQkJS1ZNSV9QQUdFX0FDQ0VTU19YOworc3RhdGljIGNvbnN0IHU4IHJ3eF9hY2Nlc3MgPSBLVk1J
X1BBR0VfQUNDRVNTX1IgfAorCQkJICAgICBLVk1JX1BBR0VfQUNDRVNTX1cgfAorCQkJICAgICBL
Vk1JX1BBR0VfQUNDRVNTX1g7CitzdGF0aWMgY29uc3QgdTggZnVsbF9hY2Nlc3MgPSBLVk1JX1BB
R0VfQUNDRVNTX1IgfAorCQkJICAgICBLVk1JX1BBR0VfQUNDRVNTX1cgfAorCQkJICAgICBLVk1J
X1BBR0VfQUNDRVNTX1g7CiAKIHZvaWQgKmt2bWlfbXNnX2FsbG9jKHZvaWQpCiB7CkBAIC0xMTAw
LDcgKzExMDMsNyBAQCBzdGF0aWMgdm9pZCBrdm1pX2luc2VydF9tZW1fYWNjZXNzKHN0cnVjdCBr
dm0gKmt2bSwgc3RydWN0IGt2bWlfbWVtX2FjY2VzcyAqbSwKIH0KIAogc3RhdGljIHZvaWQga3Zt
aV9zZXRfbWVtX2FjY2VzcyhzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBrdm1pX21lbV9hY2Nlc3Mg
Km0sCi0JCQkJdTE2IHZpZXcsIGJvb2wgKnVzZWQpCisJCQkJdTggbWFzaywgdTE2IHZpZXcsIGJv
b2wgKnVzZWQpCiB7CiAJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pID0gS1ZNSShrdm0p
OwogCXN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKmZvdW5kOwpAQCAtMTExMiwxMSArMTExNSwxNCBA
QCBzdGF0aWMgdm9pZCBrdm1pX3NldF9tZW1fYWNjZXNzKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0
IGt2bWlfbWVtX2FjY2VzcyAqbSwKIAogCWZvdW5kID0gX19rdm1pX2dldF9nZm5fYWNjZXNzKGt2
bWksIG0tPmdmbiwgdmlldyk7CiAJaWYgKGZvdW5kKSB7Ci0JCWZvdW5kLT5hY2Nlc3MgPSBtLT5h
Y2Nlc3M7CisJCWZvdW5kLT5hY2Nlc3MgPSAobS0+YWNjZXNzICYgbWFzaykgfCAoZm91bmQtPmFj
Y2VzcyAmIH5tYXNrKTsKIAkJa3ZtaV91cGRhdGVfbWVtX2FjY2Vzcyhrdm0sIGZvdW5kLCB2aWV3
KTsKLQl9IGVsc2UgaWYgKG0tPmFjY2VzcyAhPSBmdWxsX2FjY2VzcykgewotCQlrdm1pX2luc2Vy
dF9tZW1fYWNjZXNzKGt2bSwgbSwgdmlldyk7Ci0JCSp1c2VkID0gdHJ1ZTsKKwl9IGVsc2Ugewor
CQltLT5hY2Nlc3MgfD0gZnVsbF9hY2Nlc3MgJiB+bWFzazsKKwkJaWYgKG0tPmFjY2VzcyAhPSBm
dWxsX2FjY2VzcykgeworCQkJa3ZtaV9pbnNlcnRfbWVtX2FjY2Vzcyhrdm0sIG0sIHZpZXcpOwor
CQkJKnVzZWQgPSB0cnVlOworCQl9CiAJfQogCiAJd3JpdGVfdW5sb2NrKCZrdm1pLT5hY2Nlc3Nf
dHJlZV9sb2NrKTsKQEAgLTExNDEsNyArMTE0Nyw3IEBAIHN0YXRpYyBpbnQga3ZtaV9zZXRfZ2Zu
X2FjY2VzcyhzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgdTggYWNjZXNzLAogCWlmIChyYWRp
eF90cmVlX3ByZWxvYWQoR0ZQX0tFUk5FTCkpCiAJCWVyciA9IC1LVk1fRU5PTUVNOwogCWVsc2UK
LQkJa3ZtaV9zZXRfbWVtX2FjY2Vzcyhrdm0sIG0sIHZpZXcsICZ1c2VkKTsKKwkJa3ZtaV9zZXRf
bWVtX2FjY2Vzcyhrdm0sIG0sIHJ3eF9hY2Nlc3MsIHZpZXcsICZ1c2VkKTsKIAogCXJhZGl4X3Ry
ZWVfcHJlbG9hZF9lbmQoKTsKIApAQCAtMTIxNiwxNCArMTIyMiwyMiBAQCBzdGF0aWMgaW50IGt2
bWlfZ2V0X2dmbl9hY2Nlc3Moc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLCBjb25zdCBn
Zm5fdCBnZm4sCiAJCQkgICAgICAgdTggKmFjY2VzcywgdTE2IHZpZXcpCiB7CiAJc3RydWN0IGt2
bWlfbWVtX2FjY2VzcyAqbTsKKwl1OCBhbGxvd2VkID0gcnd4X2FjY2VzczsKKwlib29sIHJlc3Ry
aWN0ZWQ7CiAKIAlyZWFkX2xvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOwogCW0gPSBfX2t2
bWlfZ2V0X2dmbl9hY2Nlc3Moa3ZtaSwgZ2ZuLCB2aWV3KTsKIAlpZiAobSkKLQkJKmFjY2VzcyA9
IG0tPmFjY2VzczsKKwkJYWxsb3dlZCA9IG0tPmFjY2VzczsKIAlyZWFkX3VubG9jaygma3ZtaS0+
YWNjZXNzX3RyZWVfbG9jayk7CiAKLQlyZXR1cm4gbSA/IDAgOiAtMTsKKwlyZXN0cmljdGVkID0g
KGFsbG93ZWQgJiByd3hfYWNjZXNzKSAhPSByd3hfYWNjZXNzOworCisJaWYgKCFyZXN0cmljdGVk
KQorCQlyZXR1cm4gLTE7CisKKwkqYWNjZXNzID0gYWxsb3dlZDsKKwlyZXR1cm4gMDsKIH0KIAog
Ym9vbCBrdm1pX3Jlc3RyaWN0ZWRfcGFnZV9hY2Nlc3Moc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9u
ICprdm1pLCBncGFfdCBncGEsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
