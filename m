Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 815A84244BF
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:41:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCD2840AA;
	Wed,  6 Oct 2021 17:41:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 096AtjmUVgOU; Wed,  6 Oct 2021 17:40:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6FFD984094;
	Wed,  6 Oct 2021 17:40:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB82EC002E;
	Wed,  6 Oct 2021 17:40:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F933C0032
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E363983E85
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHkeeE-Eu_2x
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22B2283F6A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:45 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 6C2BB30828BD; Wed,  6 Oct 2021 20:31:24 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 4DC913064495;
 Wed,  6 Oct 2021 20:31:24 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 73/77] KVM: introspection: add KVMI_VCPU_CONTROL_SINGLESTEP
Date: Wed,  6 Oct 2021 20:31:09 +0300
Message-Id: <20211006173113.26445-74-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KClRoZSBuZXh0IGNv
bW1pdCB0aGF0IGFkZHMgdGhlIEtWTUlfVkNQVV9FVkVOVF9TSU5HTEVTVEVQIGV2ZW50IHdpbGwg
bWFrZQp0aGlzIGNvbW1hbmQgbW9yZSB1c2VmdWwuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBD
w67Im3UgPG5pY3UuY2l0dUBpY2xvdWQuY29tPgpDby1kZXZlbG9wZWQtYnk6IEFkYWxiZXJ0IExh
esSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6
xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0v
a3ZtaS5yc3QgICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrCiBhcmNoL3g4Ni9rdm0va3Zt
aS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrLQogYXJjaC94ODYva3ZtL2t2
bWlfbXNnLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNTYgKysrKysrKysrKysrKysrLS0tLQog
YXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTggKysrKy0t
CiBpbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysK
IGluY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgICAgICAgICAgICB8IDMwICsrKysr
Ky0tLS0KIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jICB8IDM5
ICsrKysrKysrKysrKysKIHZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jICAgICAgICAgICAg
ICAgICB8IDIyICsrKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmggICAg
ICAgICAgICAgfCAgMiArCiA5IGZpbGVzIGNoYW5nZWQsIDE5MCBpbnNlcnRpb25zKCspLCAzMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0
IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAppbmRleCA1NGNiM2ZiZTE4NGUuLjdm
NzAzNDVlYmFhYyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CkBAIC03OTEsNiArNzkxLDcgQEAg
ZXhjZXB0aW9uLgogKiAtS1ZNX0VJTlZBTCAtIHRoZSBzZWxlY3RlZCB2Q1BVIGlzIGludmFsaWQK
ICogLUtWTV9FSU5WQUwgLSB0aGUgcGFkZGluZyBpcyBub3QgemVybwogKiAtS1ZNX0VBR0FJTiAt
IHRoZSBzZWxlY3RlZCB2Q1BVIGNhbid0IGJlIGludHJvc3BlY3RlZCB5ZXQKKyogLUtWTV9FQlVT
WSAtIHRoZSB2Q1BVIGlzIHN3aXRjaGVkIGluIHNpbmdsZXN0ZXAgbW9kZSAoKktWTUlfVkNQVV9D
T05UUk9MX1NJTkdMRVNURVAqKQogKiAtS1ZNX0VCVVNZIC0gYW5vdGhlciAqS1ZNSV9WQ1BVX0lO
SkVDVF9FWENFUFRJT04qLSpLVk1JX1ZDUFVfRVZFTlRfVFJBUCoKICAgICAgICAgICAgICAgIHBh
aXIgaXMgaW4gcHJvZ3Jlc3MKIApAQCAtMTAxNyw2ICsxMDE4LDM4IEBAIEluIG9yZGVyIHRvICdm
b3JnZXQnIGFuIGFkZHJlc3MsIGFsbCB0aHJlZSBiaXRzICgncnd4JykgbXVzdCBiZSBzZXQuCiAq
IC1LVk1fRUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3QgYmUgaW50cm9zcGVjdGVkIHll
dAogKiAtS1ZNX0VOT01FTSAtIHRoZXJlIGlzIG5vdCBlbm91Z2ggbWVtb3J5IHRvIGFkZCB0aGUg
cGFnZSB0cmFja2luZyBzdHJ1Y3R1cmVzCiAKKzIzLiBLVk1JX1ZDUFVfQ09OVFJPTF9TSU5HTEVT
VEVQCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQorCis6QXJjaGl0ZWN0dXJlczog
eDg2ICh2bXgpCis6VmVyc2lvbnM6ID49IDEKKzpQYXJhbWV0ZXJzOgorCis6OgorCisJc3RydWN0
IGt2bWlfdmNwdV9oZHI7CisJc3RydWN0IGt2bWlfdmNwdV9jb250cm9sX3NpbmdsZXN0ZXAgewor
CQlfX3U4IGVuYWJsZTsKKwkJX191OCBwYWRkaW5nWzddOworCX07CisKKzpSZXR1cm5zOgorCis6
OgorCisJc3RydWN0IGt2bWlfZXJyb3JfY29kZTsKKworRW5hYmxlcy9kaXNhYmxlcyBzaW5nbGVz
dGVwIGZvciB0aGUgc2VsZWN0ZWQgdkNQVS4KKworVGhlIGludHJvc3BlY3Rpb24gdG9vbCBzaG91
bGQgdXNlICpLVk1JX0dFVF9WRVJTSU9OKiwgdG8gY2hlY2sKK2lmIHRoZSBoYXJkd2FyZSBzdXBw
b3J0cyBzaW5nbGVzdGVwIChzZWUgKipLVk1JX0dFVF9WRVJTSU9OKiopLgorCis6RXJyb3JzOgor
CisqIC1LVk1fRU9QTk9UU1VQUCAtIHRoZSBoYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQgc2luZ2xl
c3RlcAorKiAtS1ZNX0VJTlZBTCAtIHRoZSBwYWRkaW5nIGlzIG5vdCB6ZXJvCisqIC1LVk1fRUFH
QUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3QgYmUgaW50cm9zcGVjdGVkIHlldAorCiBFdmVu
dHMKID09PT09PQogCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaS5jIGIvYXJjaC94ODYv
a3ZtL2t2bWkuYwppbmRleCBlZWU4NzQ4OTBlMjkuLmUyNmEwZWVlMTU5MiAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva3ZtL2t2bWkuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCkBAIC03NzksNyAr
Nzc5LDkgQEAgdm9pZCBrdm1pX2VudGVyX2d1ZXN0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlp
ZiAoa3ZtaSkgewogCQl2Y3B1aSA9IFZDUFVJKHZjcHUpOwogCi0JCWlmICh2Y3B1aS0+YXJjaC5l
eGNlcHRpb24ucGVuZGluZykKKwkJaWYgKHZjcHVpLT5zaW5nbGVzdGVwLmxvb3ApCisJCQlrdm1p
X2FyY2hfc3RhcnRfc2luZ2xlc3RlcCh2Y3B1KTsKKwkJZWxzZSBpZiAodmNwdWktPmFyY2guZXhj
ZXB0aW9uLnBlbmRpbmcpCiAJCQlrdm1pX2luamVjdF9wZW5kaW5nX2V4Y2VwdGlvbih2Y3B1KTsK
IAogCQlrdm1pX3B1dCh2Y3B1LT5rdm0pOwpAQCAtMTA4OSwzICsxMDkxLDEzIEBAIHZvaWQga3Zt
aV9hcmNoX2ZlYXR1cmVzKHN0cnVjdCBrdm1pX2ZlYXR1cmVzICpmZWF0KQogewogCWZlYXQtPnNp
bmdsZXN0ZXAgPSAhIWt2bV94ODZfb3BzLmNvbnRyb2xfc2luZ2xlc3RlcDsKIH0KKwordm9pZCBr
dm1pX2FyY2hfc3RhcnRfc2luZ2xlc3RlcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3Rh
dGljX2NhbGwoa3ZtX3g4Nl9jb250cm9sX3NpbmdsZXN0ZXApKHZjcHUsIHRydWUpOworfQorCit2
b2lkIGt2bWlfYXJjaF9zdG9wX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorewor
CXN0YXRpY19jYWxsKGt2bV94ODZfY29udHJvbF9zaW5nbGVzdGVwKSh2Y3B1LCBmYWxzZSk7Cit9
CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYyBiL2FyY2gveDg2L2t2bS9rdm1p
X21zZy5jCmluZGV4IDk4ZTI5ZTFkMzk2MS4uNmQzOTgwZTE4MjgxIDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0va3ZtaV9tc2cuYworKysgYi9hcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYwpAQCAtMTY2
LDcgKzE2Niw4IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3ZjcHVfaW5qZWN0X2V4Y2VwdGlvbihjb25z
dCBzdHJ1Y3Qga3ZtaV92Y3B1X21zZ19qb2IgKmpvYiwKIAllbHNlIGlmIChyZXEtPnBhZGRpbmcx
IHx8IHJlcS0+cGFkZGluZzIpCiAJCWVjID0gLUtWTV9FSU5WQUw7CiAJZWxzZSBpZiAoVkNQVUko
dmNwdSktPmFyY2guZXhjZXB0aW9uLnBlbmRpbmcgfHwKLQkJCVZDUFVJKHZjcHUpLT5hcmNoLmV4
Y2VwdGlvbi5zZW5kX2V2ZW50KQorCQkJVkNQVUkodmNwdSktPmFyY2guZXhjZXB0aW9uLnNlbmRf
ZXZlbnQgfHwKKwkJCVZDUFVJKHZjcHUpLT5zaW5nbGVzdGVwLmxvb3ApCiAJCWVjID0gLUtWTV9F
QlVTWTsKIAllbHNlCiAJCWVjID0ga3ZtaV9hcmNoX2NtZF92Y3B1X2luamVjdF9leGNlcHRpb24o
dmNwdSwgcmVxKTsKQEAgLTI3NSwxOCArMjc2LDQ5IEBAIHN0YXRpYyBpbnQgaGFuZGxlX3ZjcHVf
Y29udHJvbF9tc3IoY29uc3Qgc3RydWN0IGt2bWlfdmNwdV9tc2dfam9iICpqb2IsCiAJcmV0dXJu
IGt2bWlfbXNnX3ZjcHVfcmVwbHkoam9iLCBtc2csIGVjLCBOVUxMLCAwKTsKIH0KIAorc3RhdGlj
IGludCBoYW5kbGVfdmNwdV9jb250cm9sX3NpbmdsZXN0ZXAoY29uc3Qgc3RydWN0IGt2bWlfdmNw
dV9tc2dfam9iICpqb2IsCisJCQkJCSAgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAor
CQkJCQkgIGNvbnN0IHZvaWQgKl9yZXEpCit7CisJY29uc3Qgc3RydWN0IGt2bWlfdmNwdV9jb250
cm9sX3NpbmdsZXN0ZXAgKnJlcSA9IF9yZXE7CisJc3RydWN0IGt2bV92Y3B1ICp2Y3B1ID0gam9i
LT52Y3B1OworCWludCBlYyA9IDA7CisKKwlpZiAobm9uX3plcm9fcGFkZGluZyhyZXEtPnBhZGRp
bmcsIEFSUkFZX1NJWkUocmVxLT5wYWRkaW5nKSkgfHwKKwkgICAgcmVxLT5lbmFibGUgPiAxKSB7
CisJCWVjID0gLUtWTV9FSU5WQUw7CisJCWdvdG8gcmVwbHk7CisJfQorCisJaWYgKCFrdm1feDg2
X29wcy5jb250cm9sX3NpbmdsZXN0ZXApIHsKKwkJZWMgPSAtS1ZNX0VPUE5PVFNVUFA7CisJCWdv
dG8gcmVwbHk7CisJfQorCisJaWYgKHJlcS0+ZW5hYmxlKQorCQlrdm1pX2FyY2hfc3RhcnRfc2lu
Z2xlc3RlcCh2Y3B1KTsKKwllbHNlCisJCWt2bWlfYXJjaF9zdG9wX3NpbmdsZXN0ZXAodmNwdSk7
CisKKwlWQ1BVSSh2Y3B1KS0+c2luZ2xlc3RlcC5sb29wID0gISFyZXEtPmVuYWJsZTsKKworcmVw
bHk6CisJcmV0dXJuIGt2bWlfbXNnX3ZjcHVfcmVwbHkoam9iLCBtc2csIGVjLCBOVUxMLCAwKTsK
K30KKwogc3RhdGljIGNvbnN0IGt2bWlfdmNwdV9tc2dfam9iX2ZjdCBtc2dfdmNwdVtdID0gewot
CVtLVk1JX1ZDUFVfQ09OVFJPTF9DUl0gICAgICAgPSBoYW5kbGVfdmNwdV9jb250cm9sX2NyLAot
CVtLVk1JX1ZDUFVfQ09OVFJPTF9NU1JdICAgICAgPSBoYW5kbGVfdmNwdV9jb250cm9sX21zciwK
LQlbS1ZNSV9WQ1BVX0dFVF9DUFVJRF0gICAgICAgID0gaGFuZGxlX3ZjcHVfZ2V0X2NwdWlkLAot
CVtLVk1JX1ZDUFVfR0VUX0lORk9dICAgICAgICAgPSBoYW5kbGVfdmNwdV9nZXRfaW5mbywKLQlb
S1ZNSV9WQ1BVX0dFVF9NVFJSX1RZUEVdICAgID0gaGFuZGxlX3ZjcHVfZ2V0X210cnJfdHlwZSwK
LQlbS1ZNSV9WQ1BVX0dFVF9SRUdJU1RFUlNdICAgID0gaGFuZGxlX3ZjcHVfZ2V0X3JlZ2lzdGVy
cywKLQlbS1ZNSV9WQ1BVX0dFVF9YQ1JdICAgICAgICAgID0gaGFuZGxlX3ZjcHVfZ2V0X3hjciwK
LQlbS1ZNSV9WQ1BVX0dFVF9YU0FWRV0gICAgICAgID0gaGFuZGxlX3ZjcHVfZ2V0X3hzYXZlLAot
CVtLVk1JX1ZDUFVfSU5KRUNUX0VYQ0VQVElPTl0gPSBoYW5kbGVfdmNwdV9pbmplY3RfZXhjZXB0
aW9uLAotCVtLVk1JX1ZDUFVfU0VUX1JFR0lTVEVSU10gICAgPSBoYW5kbGVfdmNwdV9zZXRfcmVn
aXN0ZXJzLAotCVtLVk1JX1ZDUFVfU0VUX1hTQVZFXSAgICAgICAgPSBoYW5kbGVfdmNwdV9zZXRf
eHNhdmUsCisJW0tWTUlfVkNQVV9DT05UUk9MX0NSXSAgICAgICAgID0gaGFuZGxlX3ZjcHVfY29u
dHJvbF9jciwKKwlbS1ZNSV9WQ1BVX0NPTlRST0xfTVNSXSAgICAgICAgPSBoYW5kbGVfdmNwdV9j
b250cm9sX21zciwKKwlbS1ZNSV9WQ1BVX0NPTlRST0xfU0lOR0xFU1RFUF0gPSBoYW5kbGVfdmNw
dV9jb250cm9sX3NpbmdsZXN0ZXAsCisJW0tWTUlfVkNQVV9HRVRfQ1BVSURdICAgICAgICAgID0g
aGFuZGxlX3ZjcHVfZ2V0X2NwdWlkLAorCVtLVk1JX1ZDUFVfR0VUX0lORk9dICAgICAgICAgICA9
IGhhbmRsZV92Y3B1X2dldF9pbmZvLAorCVtLVk1JX1ZDUFVfR0VUX01UUlJfVFlQRV0gICAgICA9
IGhhbmRsZV92Y3B1X2dldF9tdHJyX3R5cGUsCisJW0tWTUlfVkNQVV9HRVRfUkVHSVNURVJTXSAg
ICAgID0gaGFuZGxlX3ZjcHVfZ2V0X3JlZ2lzdGVycywKKwlbS1ZNSV9WQ1BVX0dFVF9YQ1JdICAg
ICAgICAgICAgPSBoYW5kbGVfdmNwdV9nZXRfeGNyLAorCVtLVk1JX1ZDUFVfR0VUX1hTQVZFXSAg
ICAgICAgICA9IGhhbmRsZV92Y3B1X2dldF94c2F2ZSwKKwlbS1ZNSV9WQ1BVX0lOSkVDVF9FWENF
UFRJT05dICAgPSBoYW5kbGVfdmNwdV9pbmplY3RfZXhjZXB0aW9uLAorCVtLVk1JX1ZDUFVfU0VU
X1JFR0lTVEVSU10gICAgICA9IGhhbmRsZV92Y3B1X3NldF9yZWdpc3RlcnMsCisJW0tWTUlfVkNQ
VV9TRVRfWFNBVkVdICAgICAgICAgID0gaGFuZGxlX3ZjcHVfc2V0X3hzYXZlLAogfTsKIAoga3Zt
aV92Y3B1X21zZ19qb2JfZmN0IGt2bWlfYXJjaF92Y3B1X21zZ19oYW5kbGVyKHUxNiBpZCkKZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2t2bS94ODYuYyBiL2FyY2gveDg2L2t2bS94ODYuYwppbmRleCAy
MzhmM2RlMTA4OTQuLjlhM2ZhYzliMzBiYSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3g4Ni5j
CisrKyBiL2FyY2gveDg2L2t2bS94ODYuYwpAQCAtOTYxMywxMyArOTYxMywxOSBAQCBzdGF0aWMg
aW50IHZjcHVfZW50ZXJfZ3Vlc3Qoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQkJZ290byBvdXQ7
CiAJCX0KIAotCQlyID0gaW5qZWN0X3BlbmRpbmdfZXZlbnQodmNwdSwgJnJlcV9pbW1lZGlhdGVf
ZXhpdCk7Ci0JCWlmIChyIDwgMCkgewotCQkJciA9IDA7Ci0JCQlnb3RvIG91dDsKKwkJaWYgKCFr
dm1pX3ZjcHVfcnVubmluZ19zaW5nbGVzdGVwKHZjcHUpKSB7CisJCQkvKgorCQkJICogV2UgY2Fu
bm90IGluamVjdCBldmVudHMgZHVyaW5nIHNpbmdsZS1zdGVwcGluZy4KKwkJCSAqIFRyeSBhZ2Fp
biBsYXRlci4KKwkJCSAqLworCQkJciA9IGluamVjdF9wZW5kaW5nX2V2ZW50KHZjcHUsICZyZXFf
aW1tZWRpYXRlX2V4aXQpOworCQkJaWYgKHIgPCAwKSB7CisJCQkJciA9IDA7CisJCQkJZ290byBv
dXQ7CisJCQl9CisJCQlpZiAocmVxX2ludF93aW4pCisJCQkJc3RhdGljX2NhbGwoa3ZtX3g4Nl9l
bmFibGVfaXJxX3dpbmRvdykodmNwdSk7CiAJCX0KLQkJaWYgKHJlcV9pbnRfd2luKQotCQkJc3Rh
dGljX2NhbGwoa3ZtX3g4Nl9lbmFibGVfaXJxX3dpbmRvdykodmNwdSk7CiAKIAkJaWYgKGt2bV9s
YXBpY19lbmFibGVkKHZjcHUpKSB7CiAJCQl1cGRhdGVfY3I4X2ludGVyY2VwdCh2Y3B1KTsKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bWlf
aG9zdC5oCmluZGV4IDE0YWMwNzVhM2VhOS4uZTIxMDNhYjlkMGQ1IDEwMDY0NAotLS0gYS9pbmNs
dWRlL2xpbnV4L2t2bWlfaG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKQEAg
LTMzLDYgKzMzLDEwIEBAIHN0cnVjdCBrdm1fdmNwdV9pbnRyb3NwZWN0aW9uIHsKIAlib29sIHdh
aXRpbmdfZm9yX3JlcGx5OwogCiAJdW5zaWduZWQgbG9uZyAqZXZfZW5hYmxlX21hc2s7CisKKwlz
dHJ1Y3QgeworCQlib29sIGxvb3A7CisJfSBzaW5nbGVzdGVwOwogfTsKIAogc3RydWN0IGt2bV9p
bnRyb3NwZWN0aW9uIHsKQEAgLTc2LDYgKzgwLDcgQEAgaW50IGt2bWlfaW9jdGxfcHJldW5ob29r
KHN0cnVjdCBrdm0gKmt2bSk7CiB2b2lkIGt2bWlfaGFuZGxlX3JlcXVlc3RzKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSk7CiBib29sIGt2bWlfaHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAq
dmNwdSk7CiBib29sIGt2bWlfYnJlYWtwb2ludF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
IHU2NCBndmEsIHU4IGluc25fbGVuKTsKK2Jvb2wga3ZtaV92Y3B1X3J1bm5pbmdfc2luZ2xlc3Rl
cChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAjZWxzZQogCkBAIC05MCw2ICs5NSw4IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBrdm1pX2hhbmRsZV9yZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZj
cHUpIHsgfQogc3RhdGljIGlubGluZSBib29sIGt2bWlfaHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSkgeyByZXR1cm4gZmFsc2U7IH0KIHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1p
X2JyZWFrcG9pbnRfZXZlbnQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1NjQgZ3ZhLAogCQkJCQkg
dTggaW5zbl9sZW4pIHsgcmV0dXJuIHRydWU7IH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBrdm1pX3Zj
cHVfcnVubmluZ19zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKKwkJCXsgcmV0dXJu
IGZhbHNlOyB9CiAKICNlbmRpZiAvKiBDT05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8KIApkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9r
dm1pLmgKaW5kZXggYjU5NDQ2Mzc5NWM2Li4zMWJmMmI2ZjM3NzkgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvdWFwaS9saW51eC9rdm1pLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaApAQCAt
MzcsMTggKzM3LDE5IEBAIGVudW0gewogZW51bSB7CiAJS1ZNSV9WQ1BVX0VWRU5UID0gS1ZNSV9W
Q1BVX01FU1NBR0VfSUQoMCksCiAKLQlLVk1JX1ZDUFVfR0VUX0lORk8gICAgICAgICA9IEtWTUlf
VkNQVV9NRVNTQUdFX0lEKDEpLAotCUtWTUlfVkNQVV9DT05UUk9MX0VWRU5UUyAgID0gS1ZNSV9W
Q1BVX01FU1NBR0VfSUQoMiksCi0JS1ZNSV9WQ1BVX0dFVF9SRUdJU1RFUlMgICAgPSBLVk1JX1ZD
UFVfTUVTU0FHRV9JRCgzKSwKLQlLVk1JX1ZDUFVfU0VUX1JFR0lTVEVSUyAgICA9IEtWTUlfVkNQ
VV9NRVNTQUdFX0lEKDQpLAotCUtWTUlfVkNQVV9HRVRfQ1BVSUQgICAgICAgID0gS1ZNSV9WQ1BV
X01FU1NBR0VfSUQoNSksCi0JS1ZNSV9WQ1BVX0NPTlRST0xfQ1IgICAgICAgPSBLVk1JX1ZDUFVf
TUVTU0FHRV9JRCg2KSwKLQlLVk1JX1ZDUFVfSU5KRUNUX0VYQ0VQVElPTiA9IEtWTUlfVkNQVV9N
RVNTQUdFX0lEKDcpLAotCUtWTUlfVkNQVV9HRVRfWENSICAgICAgICAgID0gS1ZNSV9WQ1BVX01F
U1NBR0VfSUQoOCksCi0JS1ZNSV9WQ1BVX0dFVF9YU0FWRSAgICAgICAgPSBLVk1JX1ZDUFVfTUVT
U0FHRV9JRCg5KSwKLQlLVk1JX1ZDUFVfU0VUX1hTQVZFICAgICAgICA9IEtWTUlfVkNQVV9NRVNT
QUdFX0lEKDEwKSwKLQlLVk1JX1ZDUFVfR0VUX01UUlJfVFlQRSAgICA9IEtWTUlfVkNQVV9NRVNT
QUdFX0lEKDExKSwKLQlLVk1JX1ZDUFVfQ09OVFJPTF9NU1IgICAgICA9IEtWTUlfVkNQVV9NRVNT
QUdFX0lEKDEyKSwKKwlLVk1JX1ZDUFVfR0VUX0lORk8gICAgICAgICAgID0gS1ZNSV9WQ1BVX01F
U1NBR0VfSUQoMSksCisJS1ZNSV9WQ1BVX0NPTlRST0xfRVZFTlRTICAgICA9IEtWTUlfVkNQVV9N
RVNTQUdFX0lEKDIpLAorCUtWTUlfVkNQVV9HRVRfUkVHSVNURVJTICAgICAgPSBLVk1JX1ZDUFVf
TUVTU0FHRV9JRCgzKSwKKwlLVk1JX1ZDUFVfU0VUX1JFR0lTVEVSUyAgICAgID0gS1ZNSV9WQ1BV
X01FU1NBR0VfSUQoNCksCisJS1ZNSV9WQ1BVX0dFVF9DUFVJRCAgICAgICAgICA9IEtWTUlfVkNQ
VV9NRVNTQUdFX0lEKDUpLAorCUtWTUlfVkNQVV9DT05UUk9MX0NSICAgICAgICAgPSBLVk1JX1ZD
UFVfTUVTU0FHRV9JRCg2KSwKKwlLVk1JX1ZDUFVfSU5KRUNUX0VYQ0VQVElPTiAgID0gS1ZNSV9W
Q1BVX01FU1NBR0VfSUQoNyksCisJS1ZNSV9WQ1BVX0dFVF9YQ1IgICAgICAgICAgICA9IEtWTUlf
VkNQVV9NRVNTQUdFX0lEKDgpLAorCUtWTUlfVkNQVV9HRVRfWFNBVkUgICAgICAgICAgPSBLVk1J
X1ZDUFVfTUVTU0FHRV9JRCg5KSwKKwlLVk1JX1ZDUFVfU0VUX1hTQVZFICAgICAgICAgID0gS1ZN
SV9WQ1BVX01FU1NBR0VfSUQoMTApLAorCUtWTUlfVkNQVV9HRVRfTVRSUl9UWVBFICAgICAgPSBL
Vk1JX1ZDUFVfTUVTU0FHRV9JRCgxMSksCisJS1ZNSV9WQ1BVX0NPTlRST0xfTVNSICAgICAgICA9
IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDEyKSwKKwlLVk1JX1ZDUFVfQ09OVFJPTF9TSU5HTEVTVEVQ
ID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoMTMpLAogCiAJS1ZNSV9ORVhUX1ZDUFVfTUVTU0FHRQog
fTsKQEAgLTIxNiw0ICsyMTcsOSBAQCBzdHJ1Y3Qga3ZtaV92Y3B1X2V2ZW50X3BmIHsKIAlfX3Uz
MiBwYWRkaW5nMzsKIH07CiAKK3N0cnVjdCBrdm1pX3ZjcHVfY29udHJvbF9zaW5nbGVzdGVwIHsK
KwlfX3U4IGVuYWJsZTsKKwlfX3U4IHBhZGRpbmdbN107Cit9OworCiAjZW5kaWYgLyogX1VBUElf
X0xJTlVYX0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQv
a3ZtaV90ZXN0LmMKaW5kZXggZjc3MzVlM2VhOWU4Li4xYmQwMTExNWJlMzEgMTAwNjQ0Ci0tLSBh
L3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpAQCAtMTgwOCw2ICsx
ODA4LDQ0IEBAIHN0YXRpYyB2b2lkIHRlc3RfZXZlbnRfcGYoc3RydWN0IGt2bV92bSAqdm0pCiAJ
dGVzdF9wZih2bSwgY2JrX3Rlc3RfZXZlbnRfcGYpOwogfQogCitzdGF0aWMgdm9pZCBjbWRfdmNw
dV9zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdm0gKnZtLCBfX3U4IGVuYWJsZSwKKwkJCQlpbnQgZXhw
ZWN0ZWRfZXJyKQoreworCXN0cnVjdCB7CisJCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCQlz
dHJ1Y3Qga3ZtaV92Y3B1X2hkciB2Y3B1X2hkcjsKKwkJc3RydWN0IGt2bWlfdmNwdV9jb250cm9s
X3NpbmdsZXN0ZXAgY21kOworCX0gcmVxID0ge307CisKKwlyZXEuY21kLmVuYWJsZSA9IGVuYWJs
ZTsKKworCXRlc3RfdmNwdTBfY29tbWFuZCh2bSwgS1ZNSV9WQ1BVX0NPTlRST0xfU0lOR0xFU1RF
UCwKKwkJCSAgICZyZXEuaGRyLCBzaXplb2YocmVxKSwgTlVMTCwgMCwgZXhwZWN0ZWRfZXJyKTsK
K30KKworc3RhdGljIHZvaWQgdGVzdF9zdXBwb3J0ZWRfc2luZ2xlc3RlcChzdHJ1Y3Qga3ZtX3Zt
ICp2bSkKK3sKKwlfX3U4IGRpc2FibGUgPSAwLCBlbmFibGUgPSAxLCBlbmFibGVfaW52YWwgPSAy
OworCisJY21kX3ZjcHVfc2luZ2xlc3RlcCh2bSwgZW5hYmxlLCAwKTsKKwljbWRfdmNwdV9zaW5n
bGVzdGVwKHZtLCBkaXNhYmxlLCAwKTsKKworCWNtZF92Y3B1X3NpbmdsZXN0ZXAodm0sIGVuYWJs
ZV9pbnZhbCwgLUtWTV9FSU5WQUwpOworfQorCitzdGF0aWMgdm9pZCB0ZXN0X3Vuc3VwcG9ydGVk
X3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92bSAqdm0pCit7CisJY21kX3ZjcHVfc2luZ2xlc3RlcCh2
bSwgMSwgLUtWTV9FT1BOT1RTVVBQKTsKK30KKworc3RhdGljIHZvaWQgdGVzdF9jbWRfdmNwdV9j
b250cm9sX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92bSAqdm0pCit7CisJaWYgKGZlYXR1cmVzLnNp
bmdsZXN0ZXApCisJCXRlc3Rfc3VwcG9ydGVkX3NpbmdsZXN0ZXAodm0pOworCWVsc2UKKwkJdGVz
dF91bnN1cHBvcnRlZF9zaW5nbGVzdGVwKHZtKTsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9pbnRy
b3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogewogCXNyYW5kb20odGltZSgwKSk7CkBAIC0x
ODQxLDYgKzE4NzksNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2
bV92bSAqdm0pCiAJdGVzdF9jbWRfdmNwdV9jb250cm9sX21zcih2bSk7CiAJdGVzdF9jbWRfdm1f
c2V0X3BhZ2VfYWNjZXNzKHZtKTsKIAl0ZXN0X2V2ZW50X3BmKHZtKTsKKwl0ZXN0X2NtZF92Y3B1
X2NvbnRyb2xfc2luZ2xlc3RlcCh2bSk7CiAKIAl1bmhvb2tfaW50cm9zcGVjdGlvbih2bSk7CiB9
CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyBiL3ZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4IDRiYzI5MzgyYmE1YS4uYzIwYzcwNTQ3MDY1IDEwMDY0
NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYworKysgYi92aXJ0L2t2bS9pbnRy
b3NwZWN0aW9uL2t2bWkuYwpAQCAtNDM3LDYgKzQzNywxMSBAQCBzdGF0aWMgdm9pZCBrdm1pX2pv
Yl9yZWxlYXNlX3ZjcHUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB2b2lkICpjdHgpCiAKIAlhdG9t
aWNfc2V0KCZ2Y3B1aS0+cGF1c2VfcmVxdWVzdHMsIDApOwogCXZjcHVpLT53YWl0aW5nX2Zvcl9y
ZXBseSA9IGZhbHNlOworCisJaWYgKHZjcHVpLT5zaW5nbGVzdGVwLmxvb3ApIHsKKwkJa3ZtaV9h
cmNoX3N0b3Bfc2luZ2xlc3RlcCh2Y3B1KTsKKwkJdmNwdWktPnNpbmdsZXN0ZXAubG9vcCA9IGZh
bHNlOworCX0KIH0KIAogc3RhdGljIHZvaWQga3ZtaV9yZWxlYXNlX3ZjcHVzKHN0cnVjdCBrdm0g
Kmt2bSkKQEAgLTExNzIsMyArMTE3NywyMCBAQCB2b2lkIGt2bWlfcmVtb3ZlX21lbXNsb3Qoc3Ry
dWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90KQogCUtWTV9NTVVfVU5M
T0NLKGt2bSk7CiAJc3JjdV9yZWFkX3VubG9jaygma3ZtLT5zcmN1LCBpZHgpOwogfQorCitib29s
IGt2bWlfdmNwdV9ydW5uaW5nX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQorewor
CXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaTsKKwlib29sIHJldDsKKworCWt2bWkgPSBr
dm1pX2dldCh2Y3B1LT5rdm0pOworCWlmICgha3ZtaSkKKwkJcmV0dXJuIGZhbHNlOworCisJcmV0
ID0gVkNQVUkodmNwdSktPnNpbmdsZXN0ZXAubG9vcDsKKworCWt2bWlfcHV0KHZjcHUtPmt2bSk7
CisKKwlyZXR1cm4gcmV0OworfQorRVhQT1JUX1NZTUJPTChrdm1pX3ZjcHVfcnVubmluZ19zaW5n
bGVzdGVwKTsKZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCBi
L3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAppbmRleCBhNTFlN2U0ZWQ1MTEuLjQ4
MTVmYTYxYjEzNiAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5o
CisrKyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaApAQCAtMTIyLDUgKzEyMiw3
IEBAIHZvaWQga3ZtaV9hcmNoX3VwZGF0ZV9wYWdlX3RyYWNraW5nKHN0cnVjdCBrdm0gKmt2bSwK
IHZvaWQga3ZtaV9hcmNoX2hvb2soc3RydWN0IGt2bSAqa3ZtKTsKIHZvaWQga3ZtaV9hcmNoX3Vu
aG9vayhzdHJ1Y3Qga3ZtICprdm0pOwogdm9pZCBrdm1pX2FyY2hfZmVhdHVyZXMoc3RydWN0IGt2
bWlfZmVhdHVyZXMgKmZlYXQpOwordm9pZCBrdm1pX2FyY2hfc3RhcnRfc2luZ2xlc3RlcChzdHJ1
Y3Qga3ZtX3ZjcHUgKnZjcHUpOwordm9pZCBrdm1pX2FyY2hfc3RvcF9zaW5nbGVzdGVwKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSk7CiAKICNlbmRpZgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6
YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5k
YXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
