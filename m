Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE762D1B6F
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:57:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 72F998747D;
	Mon,  7 Dec 2020 20:57:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-Xai8iWrTyO; Mon,  7 Dec 2020 20:57:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B8A20876A3;
	Mon,  7 Dec 2020 20:57:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A26A1C163C;
	Mon,  7 Dec 2020 20:57:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A183C163C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7418787A8A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AGBLxBUZc+v9
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EF77A87A69
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:56:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 D821C305D487; Mon,  7 Dec 2020 22:46:25 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B19083072785;
 Mon,  7 Dec 2020 22:46:25 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 77/81] KVM: introspection: add KVMI_VCPU_CONTROL_SINGLESTEP
Date: Mon,  7 Dec 2020 22:46:18 +0200
Message-Id: <20201207204622.15258-78-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KClRoZSBuZXh0IGNv
bW1pdCB0aGF0IGFkZHMgdGhlIEtWTUlfVkNQVV9FVkVOVF9TSU5HTEVTVEVQIGV2ZW50IHdpbGwg
bWFrZQp0aGlzIGNvbW1hbmQgbW9yZSB1c2VmdWwuCgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBD
w67Im3UgPG5pY3UuY2l0dUBpY2xvdWQuY29tPgpDby1kZXZlbG9wZWQtYnk6IEFkYWxiZXJ0IExh
esSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6
xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3VtZW50YXRpb24vdmlydC9rdm0v
a3ZtaS5yc3QgICAgICAgICAgICAgICB8IDMzICsrKysrKysrKysrCiBhcmNoL3g4Ni9rdm0va3Zt
aS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAxNCArKysrLQogYXJjaC94ODYva3ZtL2t2
bWlfbXNnLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNTYgKysrKysrKysrKysrKysrLS0tLQog
YXJjaC94ODYva3ZtL3g4Ni5jICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTIgKysrLQog
aW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaCAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrCiBp
bmNsdWRlL3VhcGkvbGludXgva3ZtaS5oICAgICAgICAgICAgICAgICAgICAgfCAzMCArKysrKyst
LS0tCiAuLi4vdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyAgfCAzOSAr
KysrKysrKysrKysrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyAgICAgICAgICAgICAg
ICAgfCAyMiArKysrKysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAgICAg
ICAgICAgIHwgIDIgKwogOSBmaWxlcyBjaGFuZ2VkLCAxODcgaW5zZXJ0aW9ucygrKSwgMjggZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCBi
L0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKaW5kZXggYTNjNDhjYmQ4YzcyLi43YjVj
MmM5MmU0N2EgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKKysr
IGIvRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdApAQCAtNzkxLDYgKzc5MSw3IEBAIGV4
Y2VwdGlvbi4KICogLUtWTV9FSU5WQUwgLSB0aGUgc2VsZWN0ZWQgdkNQVSBpcyBpbnZhbGlkCiAq
IC1LVk1fRUlOVkFMIC0gdGhlIHBhZGRpbmcgaXMgbm90IHplcm8KICogLUtWTV9FQUdBSU4gLSB0
aGUgc2VsZWN0ZWQgdkNQVSBjYW4ndCBiZSBpbnRyb3NwZWN0ZWQgeWV0CisqIC1LVk1fRUJVU1kg
LSB0aGUgdkNQVSBpcyBzd2l0Y2hlZCBpbiBzaW5nbGVzdGVwIG1vZGUgKCpLVk1JX1ZDUFVfQ09O
VFJPTF9TSU5HTEVTVEVQKikKICogLUtWTV9FQlVTWSAtIGFub3RoZXIgKktWTUlfVkNQVV9JTkpF
Q1RfRVhDRVBUSU9OKi0qS1ZNSV9WQ1BVX0VWRU5UX1RSQVAqCiAgICAgICAgICAgICAgICBwYWly
IGlzIGluIHByb2dyZXNzCiAKQEAgLTEwMzYsNiArMTAzNywzOCBAQCBJbiBvcmRlciB0byAnZm9y
Z2V0JyBhbiBhZGRyZXNzLCBhbGwgdGhyZWUgYml0cyAoJ3J3eCcpIG11c3QgYmUgc2V0LgogKiAt
S1ZNX0VBR0FJTiAtIHRoZSBzZWxlY3RlZCB2Q1BVIGNhbid0IGJlIGludHJvc3BlY3RlZCB5ZXQK
ICogLUtWTV9FTk9NRU0gLSB0aGVyZSBpcyBub3QgZW5vdWdoIG1lbW9yeSB0byBhZGQgdGhlIHBh
Z2UgdHJhY2tpbmcgc3RydWN0dXJlcwogCisyNC4gS1ZNSV9WQ1BVX0NPTlRST0xfU0lOR0xFU1RF
UAorLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4
NiAodm14KQorOlZlcnNpb25zOiA+PSAxCis6UGFyYW1ldGVyczoKKworOjoKKworCXN0cnVjdCBr
dm1pX3ZjcHVfaGRyOworCXN0cnVjdCBrdm1pX3ZjcHVfY29udHJvbF9zaW5nbGVzdGVwIHsKKwkJ
X191OCBlbmFibGU7CisJCV9fdTggcGFkZGluZ1s3XTsKKwl9OworCis6UmV0dXJuczoKKworOjoK
KworCXN0cnVjdCBrdm1pX2Vycm9yX2NvZGU7CisKK0VuYWJsZXMvZGlzYWJsZXMgc2luZ2xlc3Rl
cCBmb3IgdGhlIHNlbGVjdGVkIHZDUFUuCisKK1RoZSBpbnRyb3NwZWN0aW9uIHRvb2wgc2hvdWxk
IHVzZSAqS1ZNSV9HRVRfVkVSU0lPTiosIHRvIGNoZWNrCitpZiB0aGUgaGFyZHdhcmUgc3VwcG9y
dHMgc2luZ2xlc3RlcCAoc2VlICoqS1ZNSV9HRVRfVkVSU0lPTioqKS4KKworOkVycm9yczoKKwor
KiAtS1ZNX0VPUE5PVFNVUFAgLSB0aGUgaGFyZHdhcmUgZG9lc24ndCBzdXBwb3J0IHNpbmdsZXN0
ZXAKKyogLUtWTV9FSU5WQUwgLSB0aGUgcGFkZGluZyBpcyBub3QgemVybworKiAtS1ZNX0VBR0FJ
TiAtIHRoZSBzZWxlY3RlZCB2Q1BVIGNhbid0IGJlIGludHJvc3BlY3RlZCB5ZXQKKwogRXZlbnRz
CiA9PT09PT0KIApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL2t2bWkuYyBiL2FyY2gveDg2L2t2
bS9rdm1pLmMKaW5kZXggZTAzMDI4ODNhZWM1Li4zMWEyZGUyNGRlMjkgMTAwNjQ0Ci0tLSBhL2Fy
Y2gveDg2L2t2bS9rdm1pLmMKKysrIGIvYXJjaC94ODYva3ZtL2t2bWkuYwpAQCAtNzc2LDcgKzc3
Niw5IEBAIHZvaWQga3ZtaV9lbnRlcl9ndWVzdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJaWYg
KGt2bWkpIHsKIAkJdmNwdWkgPSBWQ1BVSSh2Y3B1KTsKIAotCQlpZiAodmNwdWktPmFyY2guZXhj
ZXB0aW9uLnBlbmRpbmcpCisJCWlmICh2Y3B1aS0+c2luZ2xlc3RlcC5sb29wKQorCQkJa3ZtaV9h
cmNoX3N0YXJ0X3NpbmdsZXN0ZXAodmNwdSk7CisJCWVsc2UgaWYgKHZjcHVpLT5hcmNoLmV4Y2Vw
dGlvbi5wZW5kaW5nKQogCQkJa3ZtaV9pbmplY3RfcGVuZGluZ19leGNlcHRpb24odmNwdSk7CiAK
IAkJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKQEAgLTEwODYsMyArMTA4OCwxMyBAQCB2b2lkIGt2bWlf
YXJjaF9mZWF0dXJlcyhzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyAqZmVhdCkKIHsKIAlmZWF0LT5zaW5n
bGVzdGVwID0gISFrdm1feDg2X29wcy5jb250cm9sX3NpbmdsZXN0ZXA7CiB9CisKK3ZvaWQga3Zt
aV9hcmNoX3N0YXJ0X3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCWt2bV94
ODZfb3BzLmNvbnRyb2xfc2luZ2xlc3RlcCh2Y3B1LCB0cnVlKTsKK30KKwordm9pZCBrdm1pX2Fy
Y2hfc3RvcF9zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlrdm1feDg2X29w
cy5jb250cm9sX3NpbmdsZXN0ZXAodmNwdSwgZmFsc2UpOworfQpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva3ZtL2t2bWlfbXNnLmMgYi9hcmNoL3g4Ni9rdm0va3ZtaV9tc2cuYwppbmRleCA2ZDQ1YjFj
NDkxODQuLjkzMzJjNTU4YzJhYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL2t2bWlfbXNnLmMK
KysrIGIvYXJjaC94ODYva3ZtL2t2bWlfbXNnLmMKQEAgLTE2Niw3ICsxNjYsOCBAQCBzdGF0aWMg
aW50IGhhbmRsZV92Y3B1X2luamVjdF9leGNlcHRpb24oY29uc3Qgc3RydWN0IGt2bWlfdmNwdV9t
c2dfam9iICpqb2IsCiAJZWxzZSBpZiAocmVxLT5wYWRkaW5nMSB8fCByZXEtPnBhZGRpbmcyKQog
CQllYyA9IC1LVk1fRUlOVkFMOwogCWVsc2UgaWYgKFZDUFVJKHZjcHUpLT5hcmNoLmV4Y2VwdGlv
bi5wZW5kaW5nIHx8Ci0JCQlWQ1BVSSh2Y3B1KS0+YXJjaC5leGNlcHRpb24uc2VuZF9ldmVudCkK
KwkJCVZDUFVJKHZjcHUpLT5hcmNoLmV4Y2VwdGlvbi5zZW5kX2V2ZW50IHx8CisJCQlWQ1BVSSh2
Y3B1KS0+c2luZ2xlc3RlcC5sb29wKQogCQllYyA9IC1LVk1fRUJVU1k7CiAJZWxzZQogCQllYyA9
IGt2bWlfYXJjaF9jbWRfdmNwdV9pbmplY3RfZXhjZXB0aW9uKHZjcHUsIHJlcSk7CkBAIC0yNzUs
MTggKzI3Niw0OSBAQCBzdGF0aWMgaW50IGhhbmRsZV92Y3B1X2NvbnRyb2xfbXNyKGNvbnN0IHN0
cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYiAqam9iLAogCXJldHVybiBrdm1pX21zZ192Y3B1X3JlcGx5
KGpvYiwgbXNnLCBlYywgTlVMTCwgMCk7CiB9CiAKK3N0YXRpYyBpbnQgaGFuZGxlX3ZjcHVfY29u
dHJvbF9zaW5nbGVzdGVwKGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfbXNnX2pvYiAqam9iLAorCQkJ
CQkgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywKKwkJCQkJICBjb25zdCB2b2lkICpf
cmVxKQoreworCWNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfY29udHJvbF9zaW5nbGVzdGVwICpyZXEg
PSBfcmVxOworCXN0cnVjdCBrdm1fdmNwdSAqdmNwdSA9IGpvYi0+dmNwdTsKKwlpbnQgZWMgPSAw
OworCisJaWYgKG5vbl96ZXJvX3BhZGRpbmcocmVxLT5wYWRkaW5nLCBBUlJBWV9TSVpFKHJlcS0+
cGFkZGluZykpIHx8CisJICAgIHJlcS0+ZW5hYmxlID4gMSkgeworCQllYyA9IC1LVk1fRUlOVkFM
OworCQlnb3RvIHJlcGx5OworCX0KKworCWlmICgha3ZtX3g4Nl9vcHMuY29udHJvbF9zaW5nbGVz
dGVwKSB7CisJCWVjID0gLUtWTV9FT1BOT1RTVVBQOworCQlnb3RvIHJlcGx5OworCX0KKworCWlm
IChyZXEtPmVuYWJsZSkKKwkJa3ZtaV9hcmNoX3N0YXJ0X3NpbmdsZXN0ZXAodmNwdSk7CisJZWxz
ZQorCQlrdm1pX2FyY2hfc3RvcF9zaW5nbGVzdGVwKHZjcHUpOworCisJVkNQVUkodmNwdSktPnNp
bmdsZXN0ZXAubG9vcCA9ICEhcmVxLT5lbmFibGU7CisKK3JlcGx5OgorCXJldHVybiBrdm1pX21z
Z192Y3B1X3JlcGx5KGpvYiwgbXNnLCBlYywgTlVMTCwgMCk7Cit9CisKIHN0YXRpYyBrdm1pX3Zj
cHVfbXNnX2pvYl9mY3QgY29uc3QgbXNnX3ZjcHVbXSA9IHsKLQlbS1ZNSV9WQ1BVX0NPTlRST0xf
Q1JdICAgICAgID0gaGFuZGxlX3ZjcHVfY29udHJvbF9jciwKLQlbS1ZNSV9WQ1BVX0NPTlRST0xf
TVNSXSAgICAgID0gaGFuZGxlX3ZjcHVfY29udHJvbF9tc3IsCi0JW0tWTUlfVkNQVV9HRVRfQ1BV
SURdICAgICAgICA9IGhhbmRsZV92Y3B1X2dldF9jcHVpZCwKLQlbS1ZNSV9WQ1BVX0dFVF9JTkZP
XSAgICAgICAgID0gaGFuZGxlX3ZjcHVfZ2V0X2luZm8sCi0JW0tWTUlfVkNQVV9HRVRfTVRSUl9U
WVBFXSAgICA9IGhhbmRsZV92Y3B1X2dldF9tdHJyX3R5cGUsCi0JW0tWTUlfVkNQVV9HRVRfUkVH
SVNURVJTXSAgICA9IGhhbmRsZV92Y3B1X2dldF9yZWdpc3RlcnMsCi0JW0tWTUlfVkNQVV9HRVRf
WENSXSAgICAgICAgICA9IGhhbmRsZV92Y3B1X2dldF94Y3IsCi0JW0tWTUlfVkNQVV9HRVRfWFNB
VkVdICAgICAgICA9IGhhbmRsZV92Y3B1X2dldF94c2F2ZSwKLQlbS1ZNSV9WQ1BVX0lOSkVDVF9F
WENFUFRJT05dID0gaGFuZGxlX3ZjcHVfaW5qZWN0X2V4Y2VwdGlvbiwKLQlbS1ZNSV9WQ1BVX1NF
VF9SRUdJU1RFUlNdICAgID0gaGFuZGxlX3ZjcHVfc2V0X3JlZ2lzdGVycywKLQlbS1ZNSV9WQ1BV
X1NFVF9YU0FWRV0gICAgICAgID0gaGFuZGxlX3ZjcHVfc2V0X3hzYXZlLAorCVtLVk1JX1ZDUFVf
Q09OVFJPTF9DUl0gICAgICAgICA9IGhhbmRsZV92Y3B1X2NvbnRyb2xfY3IsCisJW0tWTUlfVkNQ
VV9DT05UUk9MX01TUl0gICAgICAgID0gaGFuZGxlX3ZjcHVfY29udHJvbF9tc3IsCisJW0tWTUlf
VkNQVV9DT05UUk9MX1NJTkdMRVNURVBdID0gaGFuZGxlX3ZjcHVfY29udHJvbF9zaW5nbGVzdGVw
LAorCVtLVk1JX1ZDUFVfR0VUX0NQVUlEXSAgICAgICAgICA9IGhhbmRsZV92Y3B1X2dldF9jcHVp
ZCwKKwlbS1ZNSV9WQ1BVX0dFVF9JTkZPXSAgICAgICAgICAgPSBoYW5kbGVfdmNwdV9nZXRfaW5m
bywKKwlbS1ZNSV9WQ1BVX0dFVF9NVFJSX1RZUEVdICAgICAgPSBoYW5kbGVfdmNwdV9nZXRfbXRy
cl90eXBlLAorCVtLVk1JX1ZDUFVfR0VUX1JFR0lTVEVSU10gICAgICA9IGhhbmRsZV92Y3B1X2dl
dF9yZWdpc3RlcnMsCisJW0tWTUlfVkNQVV9HRVRfWENSXSAgICAgICAgICAgID0gaGFuZGxlX3Zj
cHVfZ2V0X3hjciwKKwlbS1ZNSV9WQ1BVX0dFVF9YU0FWRV0gICAgICAgICAgPSBoYW5kbGVfdmNw
dV9nZXRfeHNhdmUsCisJW0tWTUlfVkNQVV9JTkpFQ1RfRVhDRVBUSU9OXSAgID0gaGFuZGxlX3Zj
cHVfaW5qZWN0X2V4Y2VwdGlvbiwKKwlbS1ZNSV9WQ1BVX1NFVF9SRUdJU1RFUlNdICAgICAgPSBo
YW5kbGVfdmNwdV9zZXRfcmVnaXN0ZXJzLAorCVtLVk1JX1ZDUFVfU0VUX1hTQVZFXSAgICAgICAg
ICA9IGhhbmRsZV92Y3B1X3NldF94c2F2ZSwKIH07CiAKIGt2bWlfdmNwdV9tc2dfam9iX2ZjdCBr
dm1pX2FyY2hfdmNwdV9tc2dfaGFuZGxlcih1MTYgaWQpCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
dm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0veDg2LmMKaW5kZXggMzgxZTNkZmJhNTM1Li5kM2YxNDVm
OWUxOTYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMKQEAgLTg5NTQsOSArODk1NCwxNSBAQCBzdGF0aWMgaW50IHZjcHVfZW50ZXJfZ3Vlc3Qo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQkJZ290byBvdXQ7CiAJCX0KIAotCQlpbmplY3RfcGVu
ZGluZ19ldmVudCh2Y3B1LCAmcmVxX2ltbWVkaWF0ZV9leGl0KTsKLQkJaWYgKHJlcV9pbnRfd2lu
KQotCQkJa3ZtX3g4Nl9vcHMuZW5hYmxlX2lycV93aW5kb3codmNwdSk7CisJCWlmICgha3ZtaV92
Y3B1X3J1bm5pbmdfc2luZ2xlc3RlcCh2Y3B1KSkgeworCQkJLyoKKwkJCSAqIFdlIGNhbm5vdCBp
bmplY3QgZXZlbnRzIGR1cmluZyBzaW5nbGUtc3RlcHBpbmcuCisJCQkgKiBUcnkgYWdhaW4gbGF0
ZXIuCisJCQkgKi8KKwkJCWluamVjdF9wZW5kaW5nX2V2ZW50KHZjcHUsICZyZXFfaW1tZWRpYXRl
X2V4aXQpOworCQkJaWYgKHJlcV9pbnRfd2luKQorCQkJCWt2bV94ODZfb3BzLmVuYWJsZV9pcnFf
d2luZG93KHZjcHUpOworCQl9CiAKIAkJaWYgKGt2bV9sYXBpY19lbmFibGVkKHZjcHUpKSB7CiAJ
CQl1cGRhdGVfY3I4X2ludGVyY2VwdCh2Y3B1KTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
a3ZtaV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oCmluZGV4IDE0YWMwNzVhM2Vh
OS4uZTIxMDNhYjlkMGQ1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oCisr
KyBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKQEAgLTMzLDYgKzMzLDEwIEBAIHN0cnVjdCBr
dm1fdmNwdV9pbnRyb3NwZWN0aW9uIHsKIAlib29sIHdhaXRpbmdfZm9yX3JlcGx5OwogCiAJdW5z
aWduZWQgbG9uZyAqZXZfZW5hYmxlX21hc2s7CisKKwlzdHJ1Y3QgeworCQlib29sIGxvb3A7CisJ
fSBzaW5nbGVzdGVwOwogfTsKIAogc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uIHsKQEAgLTc2LDYg
KzgwLDcgQEAgaW50IGt2bWlfaW9jdGxfcHJldW5ob29rKHN0cnVjdCBrdm0gKmt2bSk7CiB2b2lk
IGt2bWlfaGFuZGxlX3JlcXVlc3RzKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiBib29sIGt2bWlf
aHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7CiBib29sIGt2bWlfYnJlYWtw
b2ludF9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBndmEsIHU4IGluc25fbGVuKTsK
K2Jvb2wga3ZtaV92Y3B1X3J1bm5pbmdfc2luZ2xlc3RlcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUp
OwogCiAjZWxzZQogCkBAIC05MCw2ICs5NSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBrdm1pX2hh
bmRsZV9yZXF1ZXN0cyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpIHsgfQogc3RhdGljIGlubGluZSBi
b29sIGt2bWlfaHlwZXJjYWxsX2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkgeyByZXR1cm4g
ZmFsc2U7IH0KIHN0YXRpYyBpbmxpbmUgYm9vbCBrdm1pX2JyZWFrcG9pbnRfZXZlbnQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1NjQgZ3ZhLAogCQkJCQkgdTggaW5zbl9sZW4pIHsgcmV0dXJuIHRy
dWU7IH0KK3N0YXRpYyBpbmxpbmUgYm9vbCBrdm1pX3ZjcHVfcnVubmluZ19zaW5nbGVzdGVwKHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKKwkJCXsgcmV0dXJuIGZhbHNlOyB9CiAKICNlbmRpZiAvKiBD
T05GSUdfS1ZNX0lOVFJPU1BFQ1RJT04gKi8KIApkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xp
bnV4L2t2bWkuaCBiL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKaW5kZXggNDM2MzFlZDJiMDZj
Li45MTEyNjYwN2I3ZWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmgKKysr
IGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaApAQCAtMzgsMTggKzM4LDE5IEBAIGVudW0gewog
ZW51bSB7CiAJS1ZNSV9WQ1BVX0VWRU5UID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoMCksCiAKLQlL
Vk1JX1ZDUFVfR0VUX0lORk8gICAgICAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDEpLAotCUtW
TUlfVkNQVV9DT05UUk9MX0VWRU5UUyAgID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoMiksCi0JS1ZN
SV9WQ1BVX0dFVF9SRUdJU1RFUlMgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCgzKSwKLQlLVk1J
X1ZDUFVfU0VUX1JFR0lTVEVSUyAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDQpLAotCUtWTUlf
VkNQVV9HRVRfQ1BVSUQgICAgICAgID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoNSksCi0JS1ZNSV9W
Q1BVX0NPTlRST0xfQ1IgICAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCg2KSwKLQlLVk1JX1ZD
UFVfSU5KRUNUX0VYQ0VQVElPTiA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDcpLAotCUtWTUlfVkNQ
VV9HRVRfWENSICAgICAgICAgID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoOCksCi0JS1ZNSV9WQ1BV
X0dFVF9YU0FWRSAgICAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCg5KSwKLQlLVk1JX1ZDUFVf
U0VUX1hTQVZFICAgICAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDEwKSwKLQlLVk1JX1ZDUFVf
R0VUX01UUlJfVFlQRSAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDExKSwKLQlLVk1JX1ZDUFVf
Q09OVFJPTF9NU1IgICAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDEyKSwKKwlLVk1JX1ZDUFVf
R0VUX0lORk8gICAgICAgICAgID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoMSksCisJS1ZNSV9WQ1BV
X0NPTlRST0xfRVZFTlRTICAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDIpLAorCUtWTUlfVkNQ
VV9HRVRfUkVHSVNURVJTICAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCgzKSwKKwlLVk1JX1ZD
UFVfU0VUX1JFR0lTVEVSUyAgICAgID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoNCksCisJS1ZNSV9W
Q1BVX0dFVF9DUFVJRCAgICAgICAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDUpLAorCUtWTUlf
VkNQVV9DT05UUk9MX0NSICAgICAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCg2KSwKKwlLVk1J
X1ZDUFVfSU5KRUNUX0VYQ0VQVElPTiAgID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoNyksCisJS1ZN
SV9WQ1BVX0dFVF9YQ1IgICAgICAgICAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDgpLAorCUtW
TUlfVkNQVV9HRVRfWFNBVkUgICAgICAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCg5KSwKKwlL
Vk1JX1ZDUFVfU0VUX1hTQVZFICAgICAgICAgID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQoMTApLAor
CUtWTUlfVkNQVV9HRVRfTVRSUl9UWVBFICAgICAgPSBLVk1JX1ZDUFVfTUVTU0FHRV9JRCgxMSks
CisJS1ZNSV9WQ1BVX0NPTlRST0xfTVNSICAgICAgICA9IEtWTUlfVkNQVV9NRVNTQUdFX0lEKDEy
KSwKKwlLVk1JX1ZDUFVfQ09OVFJPTF9TSU5HTEVTVEVQID0gS1ZNSV9WQ1BVX01FU1NBR0VfSUQo
MTMpLAogCiAJS1ZNSV9ORVhUX1ZDUFVfTUVTU0FHRQogfTsKQEAgLTIyMSw0ICsyMjIsOSBAQCBz
dHJ1Y3Qga3ZtaV92Y3B1X2V2ZW50X3BmIHsKIAlfX3UzMiBwYWRkaW5nMzsKIH07CiAKK3N0cnVj
dCBrdm1pX3ZjcHVfY29udHJvbF9zaW5nbGVzdGVwIHsKKwlfX3U4IGVuYWJsZTsKKwlfX3U4IHBh
ZGRpbmdbN107Cit9OworCiAjZW5kaWYgLyogX1VBUElfX0xJTlVYX0tWTUlfSCAqLwpkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggOTk4NGIw
MjQ3YWU5Li5kOTU5MjE2YWFjOWQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3Rz
L2t2bS94ODZfNjQva3ZtaV90ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L3g4Nl82NC9rdm1pX3Rlc3QuYwpAQCAtMTgxOSw2ICsxODE5LDQ0IEBAIHN0YXRpYyB2b2lkIHRl
c3RfZXZlbnRfcGYoc3RydWN0IGt2bV92bSAqdm0pCiAJdGVzdF9wZih2bSwgY2JrX3Rlc3RfZXZl
bnRfcGYpOwogfQogCitzdGF0aWMgdm9pZCBjbWRfdmNwdV9zaW5nbGVzdGVwKHN0cnVjdCBrdm1f
dm0gKnZtLCBfX3U4IGVuYWJsZSwKKwkJCQlpbnQgZXhwZWN0ZWRfZXJyKQoreworCXN0cnVjdCB7
CisJCXN0cnVjdCBrdm1pX21zZ19oZHIgaGRyOworCQlzdHJ1Y3Qga3ZtaV92Y3B1X2hkciB2Y3B1
X2hkcjsKKwkJc3RydWN0IGt2bWlfdmNwdV9jb250cm9sX3NpbmdsZXN0ZXAgY21kOworCX0gcmVx
ID0ge307CisKKwlyZXEuY21kLmVuYWJsZSA9IGVuYWJsZTsKKworCXRlc3RfdmNwdTBfY29tbWFu
ZCh2bSwgS1ZNSV9WQ1BVX0NPTlRST0xfU0lOR0xFU1RFUCwKKwkJCSAgICZyZXEuaGRyLCBzaXpl
b2YocmVxKSwgTlVMTCwgMCwgZXhwZWN0ZWRfZXJyKTsKK30KKworc3RhdGljIHZvaWQgdGVzdF9z
dXBwb3J0ZWRfc2luZ2xlc3RlcChzdHJ1Y3Qga3ZtX3ZtICp2bSkKK3sKKwlfX3U4IGRpc2FibGUg
PSAwLCBlbmFibGUgPSAxLCBlbmFibGVfaW52YWwgPSAyOworCisJY21kX3ZjcHVfc2luZ2xlc3Rl
cCh2bSwgZW5hYmxlLCAwKTsKKwljbWRfdmNwdV9zaW5nbGVzdGVwKHZtLCBkaXNhYmxlLCAwKTsK
KworCWNtZF92Y3B1X3NpbmdsZXN0ZXAodm0sIGVuYWJsZV9pbnZhbCwgLUtWTV9FSU5WQUwpOwor
fQorCitzdGF0aWMgdm9pZCB0ZXN0X3Vuc3VwcG9ydGVkX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92
bSAqdm0pCit7CisJY21kX3ZjcHVfc2luZ2xlc3RlcCh2bSwgMSwgLUtWTV9FT1BOT1RTVVBQKTsK
K30KKworc3RhdGljIHZvaWQgdGVzdF9jbWRfdmNwdV9jb250cm9sX3NpbmdsZXN0ZXAoc3RydWN0
IGt2bV92bSAqdm0pCit7CisJaWYgKGZlYXR1cmVzLnNpbmdsZXN0ZXApCisJCXRlc3Rfc3VwcG9y
dGVkX3NpbmdsZXN0ZXAodm0pOworCWVsc2UKKwkJdGVzdF91bnN1cHBvcnRlZF9zaW5nbGVzdGVw
KHZtKTsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9pbnRyb3NwZWN0aW9uKHN0cnVjdCBrdm1fdm0g
KnZtKQogewogCXNyYW5kb20odGltZSgwKSk7CkBAIC0xODUzLDYgKzE4OTEsNyBAQCBzdGF0aWMg
dm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiAJdGVzdF9jbWRfdmNw
dV9jb250cm9sX21zcih2bSk7CiAJdGVzdF9jbWRfdm1fc2V0X3BhZ2VfYWNjZXNzKHZtKTsKIAl0
ZXN0X2V2ZW50X3BmKHZtKTsKKwl0ZXN0X2NtZF92Y3B1X2NvbnRyb2xfc2luZ2xlc3RlcCh2bSk7
CiAKIAl1bmhvb2tfaW50cm9zcGVjdGlvbih2bSk7CiB9CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWkuYyBiL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4
IDg0MTc3OTE0MzYwOS4uMzhkM2NkZTQ3NzQwIDEwMDY0NAotLS0gYS92aXJ0L2t2bS9pbnRyb3Nw
ZWN0aW9uL2t2bWkuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYwpAQCAtNDM2
LDYgKzQzNiwxMSBAQCBzdGF0aWMgdm9pZCBrdm1pX2pvYl9yZWxlYXNlX3ZjcHUoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCB2b2lkICpjdHgpCiAKIAlhdG9taWNfc2V0KCZ2Y3B1aS0+cGF1c2VfcmVx
dWVzdHMsIDApOwogCXZjcHVpLT53YWl0aW5nX2Zvcl9yZXBseSA9IGZhbHNlOworCisJaWYgKHZj
cHVpLT5zaW5nbGVzdGVwLmxvb3ApIHsKKwkJa3ZtaV9hcmNoX3N0b3Bfc2luZ2xlc3RlcCh2Y3B1
KTsKKwkJdmNwdWktPnNpbmdsZXN0ZXAubG9vcCA9IGZhbHNlOworCX0KIH0KIAogc3RhdGljIHZv
aWQga3ZtaV9yZWxlYXNlX3ZjcHVzKHN0cnVjdCBrdm0gKmt2bSkKQEAgLTExNzEsMyArMTE3Niwy
MCBAQCB2b2lkIGt2bWlfcmVtb3ZlX21lbXNsb3Qoc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3Zt
X21lbW9yeV9zbG90ICpzbG90KQogCXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKIAlzcmN1
X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIGlkeCk7CiB9CisKK2Jvb2wga3ZtaV92Y3B1X3J1bm5p
bmdfc2luZ2xlc3RlcChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJc3RydWN0IGt2bV9pbnRy
b3NwZWN0aW9uICprdm1pOworCWJvb2wgcmV0OworCisJa3ZtaSA9IGt2bWlfZ2V0KHZjcHUtPmt2
bSk7CisJaWYgKCFrdm1pKQorCQlyZXR1cm4gZmFsc2U7CisKKwlyZXQgPSBWQ1BVSSh2Y3B1KS0+
c2luZ2xlc3RlcC5sb29wOworCisJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKKworCXJldHVybiByZXQ7
Cit9CitFWFBPUlRfU1lNQk9MKGt2bWlfdmNwdV9ydW5uaW5nX3NpbmdsZXN0ZXApOwpkaWZmIC0t
Z2l0IGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oIGIvdmlydC9rdm0vaW50cm9z
cGVjdGlvbi9rdm1pX2ludC5oCmluZGV4IGE1MWU3ZTRlZDUxMS4uNDgxNWZhNjFiMTM2IDEwMDY0
NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfaW50LmgKKysrIGIvdmlydC9rdm0v
aW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCkBAIC0xMjIsNSArMTIyLDcgQEAgdm9pZCBrdm1pX2Fy
Y2hfdXBkYXRlX3BhZ2VfdHJhY2tpbmcoc3RydWN0IGt2bSAqa3ZtLAogdm9pZCBrdm1pX2FyY2hf
aG9vayhzdHJ1Y3Qga3ZtICprdm0pOwogdm9pZCBrdm1pX2FyY2hfdW5ob29rKHN0cnVjdCBrdm0g
Kmt2bSk7CiB2b2lkIGt2bWlfYXJjaF9mZWF0dXJlcyhzdHJ1Y3Qga3ZtaV9mZWF0dXJlcyAqZmVh
dCk7Cit2b2lkIGt2bWlfYXJjaF9zdGFydF9zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7Cit2b2lkIGt2bWlfYXJjaF9zdG9wX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKIAogI2VuZGlmCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
