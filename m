Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA89229C89
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9125F88751;
	Wed, 22 Jul 2020 16:01:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3AElp+nAES+N; Wed, 22 Jul 2020 16:01:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4525D887F6;
	Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2385DC004C;
	Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17C8AC004E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1535088169
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wshZQuLq1sCA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 909628815C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 9FCF5305D76B; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 95FE8305FFA7;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 20/34] KVM: x86: vmx: add support for virtualization
 exceptions
Date: Wed, 22 Jul 2020 19:01:07 +0300
Message-Id: <20200722160121.9601-21-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marian Rotariu <marian.c.rotariu@gmail.com>,
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

RnJvbTogTWFyaWFuIFJvdGFyaXUgPG1hcmlhbi5jLnJvdGFyaXVAZ21haWwuY29tPgoKT25seSB0
aGUgaGFyZHdhcmUgc3VwcG9ydCBjaGVjayBmdW5jdGlvbiBhbmQgdGhlICNWRSBpbmZvIHBhZ2Ug
bWFuYWdlbWVudAphcmUgaW50cm9kdWNlZC4KClNpZ25lZC1vZmYtYnk6IE1hcmlhbiBSb3Rhcml1
IDxtYXJpYW4uYy5yb3Rhcml1QGdtYWlsLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiDImHRlZmFuIMiY
aWNsZXJ1IDxzc2ljbGVydUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IMiYdGVmYW4g
yJhpY2xlcnUgPHNzaWNsZXJ1QGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJl
cnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggfCAgMSArCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaCAgICAgIHwg
IDMgKysrCiBhcmNoL3g4Ni9rdm0vdm14L2NhcGFiaWxpdGllcy5oIHwgIDUgKysrKysKIGFyY2gv
eDg2L2t2bS92bXgvdm14LmMgICAgICAgICAgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5oICAgICAgICAgIHwgMTIgKysrKysrKysrKysr
CiBhcmNoL3g4Ni9rdm0veDg2LmMgICAgICAgICAgICAgIHwgIDMgKysrCiA2IGZpbGVzIGNoYW5n
ZWQsIDU1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCAwODZiNmUy
YTIzMTQuLmE5ZjIyNWY5ZGQxMiAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xNDM1LDYg
KzE0MzUsNyBAQCBleHRlcm4gdTY0ICBrdm1fZGVmYXVsdF90c2Nfc2NhbGluZ19yYXRpbzsKIAog
ZXh0ZXJuIHU2NCBrdm1fbWNlX2NhcF9zdXBwb3J0ZWQ7CiBleHRlcm4gYm9vbCBrdm1fZXB0cF9z
d2l0Y2hpbmdfc3VwcG9ydGVkOworZXh0ZXJuIGJvb2wga3ZtX3ZlX3N1cHBvcnRlZDsKIAogLyoK
ICAqIEVNVUxUWVBFX05PX0RFQ09ERSAtIFNldCB3aGVuIHJlLWVtdWxhdGluZyBhbiBpbnN0cnVj
dGlvbiAoYWZ0ZXIgY29tcGxldGluZwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20v
dm14LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaAppbmRleCAwNDQ4N2ViMzhiNWMuLjE3
NzUwMGU5ZTY4YyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20vdm14LmgKKysrIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20vdm14LmgKQEAgLTY3LDYgKzY3LDcgQEAKICNkZWZpbmUgU0VD
T05EQVJZX0VYRUNfRU5DTFNfRVhJVElORwkJVk1DU19DT05UUk9MX0JJVChFTkNMU19FWElUSU5H
KQogI2RlZmluZSBTRUNPTkRBUllfRVhFQ19SRFNFRURfRVhJVElORwkJVk1DU19DT05UUk9MX0JJ
VChSRFNFRURfRVhJVElORykKICNkZWZpbmUgU0VDT05EQVJZX0VYRUNfRU5BQkxFX1BNTCAgICAg
ICAgICAgICAgIFZNQ1NfQ09OVFJPTF9CSVQoUEFHRV9NT0RfTE9HR0lORykKKyNkZWZpbmUgU0VD
T05EQVJZX0VYRUNfRVBUX1ZFCQkgICAgICAgIFZNQ1NfQ09OVFJPTF9CSVQoRVBUX1ZJT0xBVElP
Tl9WRSkKICNkZWZpbmUgU0VDT05EQVJZX0VYRUNfUFRfQ09OQ0VBTF9WTVgJCVZNQ1NfQ09OVFJP
TF9CSVQoUFRfQ09OQ0VBTF9WTVgpCiAjZGVmaW5lIFNFQ09OREFSWV9FWEVDX1hTQVZFUwkJCVZN
Q1NfQ09OVFJPTF9CSVQoWFNBVkVTKQogI2RlZmluZSBTRUNPTkRBUllfRVhFQ19NT0RFX0JBU0VE
X0VQVF9FWEVDCVZNQ1NfQ09OVFJPTF9CSVQoTU9ERV9CQVNFRF9FUFRfRVhFQykKQEAgLTIxMyw2
ICsyMTQsOCBAQCBlbnVtIHZtY3NfZmllbGQgewogCVZNUkVBRF9CSVRNQVBfSElHSCAgICAgICAg
ICAgICAgPSAweDAwMDAyMDI3LAogCVZNV1JJVEVfQklUTUFQICAgICAgICAgICAgICAgICAgPSAw
eDAwMDAyMDI4LAogCVZNV1JJVEVfQklUTUFQX0hJR0ggICAgICAgICAgICAgPSAweDAwMDAyMDI5
LAorCVZFX0lORk9fQUREUkVTUwkJCT0gMHgwMDAwMjAyQSwKKwlWRV9JTkZPX0FERFJFU1NfSElH
SAkJPSAweDAwMDAyMDJCLAogCVhTU19FWElUX0JJVE1BUCAgICAgICAgICAgICAgICAgPSAweDAw
MDAyMDJDLAogCVhTU19FWElUX0JJVE1BUF9ISUdIICAgICAgICAgICAgPSAweDAwMDAyMDJELAog
CUVOQ0xTX0VYSVRJTkdfQklUTUFQCQk9IDB4MDAwMDIwMkUsCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9rdm0vdm14L2NhcGFiaWxpdGllcy5oIGIvYXJjaC94ODYva3ZtL3ZteC9jYXBhYmlsaXRpZXMu
aAppbmRleCA5Mjc4MWUyYzUyM2UuLmJjNWJiYzQxY2E5MiAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
a3ZtL3ZteC9jYXBhYmlsaXRpZXMuaAorKysgYi9hcmNoL3g4Ni9rdm0vdm14L2NhcGFiaWxpdGll
cy5oCkBAIC0yNTcsNiArMjU3LDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBjcHVfaGFzX3ZteF9w
bWwodm9pZCkKIAlyZXR1cm4gdm1jc19jb25maWcuY3B1X2Jhc2VkXzJuZF9leGVjX2N0cmwgJiBT
RUNPTkRBUllfRVhFQ19FTkFCTEVfUE1MOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wgY3B1X2hh
c192bXhfdmUodm9pZCkKK3sKKwlyZXR1cm4gdm1jc19jb25maWcuY3B1X2Jhc2VkXzJuZF9leGVj
X2N0cmwgJiBTRUNPTkRBUllfRVhFQ19FUFRfVkU7Cit9CisKIHN0YXRpYyBpbmxpbmUgYm9vbCB2
bXhfeHNhdmVzX3N1cHBvcnRlZCh2b2lkKQogewogCXJldHVybiB2bWNzX2NvbmZpZy5jcHVfYmFz
ZWRfMm5kX2V4ZWNfY3RybCAmCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIv
YXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBjYmM5NDNkMjE3ZTMuLjFjMWRkYTE0ZDE4ZCAx
MDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14
L3ZteC5jCkBAIC0yNDYzLDYgKzI0NjMsNyBAQCBzdGF0aWMgX19pbml0IGludCBzZXR1cF92bWNz
X2NvbmZpZyhzdHJ1Y3Qgdm1jc19jb25maWcgKnZtY3NfY29uZiwKIAkJCVNFQ09OREFSWV9FWEVD
X1JEU0VFRF9FWElUSU5HIHwKIAkJCVNFQ09OREFSWV9FWEVDX1JEUkFORF9FWElUSU5HIHwKIAkJ
CVNFQ09OREFSWV9FWEVDX0VOQUJMRV9QTUwgfAorCQkJU0VDT05EQVJZX0VYRUNfRVBUX1ZFIHwK
IAkJCVNFQ09OREFSWV9FWEVDX1RTQ19TQ0FMSU5HIHwKIAkJCVNFQ09OREFSWV9FWEVDX0VOQUJM
RV9VU1JfV0FJVF9QQVVTRSB8CiAJCQlTRUNPTkRBUllfRVhFQ19QVF9VU0VfR1BBIHwKQEAgLTQy
NDcsNiArNDI0OCwxMiBAQCBzdGF0aWMgdm9pZCB2bXhfY29tcHV0ZV9zZWNvbmRhcnlfZXhlY19j
b250cm9sKHN0cnVjdCB2Y3B1X3ZteCAqdm14KQogCSovCiAJZXhlY19jb250cm9sICY9IH5TRUNP
TkRBUllfRVhFQ19TSEFET1dfVk1DUzsKIAorCS8qICNWRSBtdXN0IGJlIGRpc2FibGVkIGJ5IGRl
ZmF1bHQuCisJICogT25jZSBlbmFibGVkLCBhbGwgRVBUIHZpb2xhdGlvbnMgb24gcGFnZXMgbWlz
c2luZyB0aGUgU1ZFIGJpdAorCSAqIHdpbGwgYmUgZGVsaXZlcmVkIHRvIHRoZSBndWVzdC4KKwkg
Ki8KKwlleGVjX2NvbnRyb2wgJj0gflNFQ09OREFSWV9FWEVDX0VQVF9WRTsKKwogCWlmICghZW5h
YmxlX3BtbCkKIAkJZXhlY19jb250cm9sICY9IH5TRUNPTkRBUllfRVhFQ19FTkFCTEVfUE1MOwog
CkBAIC02MDE5LDYgKzYwMjYsMjggQEAgc3RhdGljIHZvaWQgZHVtcF9lcHRwX2xpc3Qodm9pZCkK
IAkJcHJfZXJyKCIlZDogJTAxNmxseFxuIiwgaSwgKihlcHRwX2xpc3QgKyBpKSk7CiB9CiAKK3N0
YXRpYyB2b2lkIGR1bXBfdmVfaW5mbyh2b2lkKQoreworCXBoeXNfYWRkcl90IHZlX2luZm9fcGh5
czsKKwlzdHJ1Y3QgdmNwdV92ZV9pbmZvICp2ZV9pbmZvID0gTlVMTDsKKworCWlmICghY3B1X2hh
c192bXhfdmUoKSkKKwkJcmV0dXJuOworCisJdmVfaW5mb19waHlzID0gKHBoeXNfYWRkcl90KXZt
Y3NfcmVhZDY0KFZFX0lORk9fQUREUkVTUyk7CisJaWYgKCF2ZV9pbmZvX3BoeXMpCisJCXJldHVy
bjsKKworCXZlX2luZm8gPSAoc3RydWN0IHZjcHVfdmVfaW5mbyAqKXBoeXNfdG9fdmlydCh2ZV9p
bmZvX3BoeXMpOworCisJcHJfZXJyKCIqKiogVmlydHVhbGl6YXRpb24gRXhjZXB0aW9uIEluZm8g
KioqXG4iKTsKKwlwcl9lcnIoIkV4aXRSZWFzb246ICV4XG4iLCB2ZV9pbmZvLT5leGl0X3JlYXNv
bik7CisJcHJfZXJyKCJFeGl0UXVhbGlmaWNhdGlvbjogJWxseFxuIiwgdmVfaW5mby0+ZXhpdF9x
dWFsaWZpY2F0aW9uKTsKKwlwcl9lcnIoIkdWQTogJWxseFxuIiwgdmVfaW5mby0+Z3ZhKTsKKwlw
cl9lcnIoIkdQQTogJWxseFxuIiwgdmVfaW5mby0+Z3BhKTsKKwlwcl9lcnIoIkVQVFBJbmRleDog
JXhcbiIsIHZlX2luZm8tPmVwdHBfaW5kZXgpOworfQorCiB2b2lkIGR1bXBfdm1jcyh2b2lkKQog
ewogCXUzMiB2bWVudHJ5X2N0bCwgdm1leGl0X2N0bDsKQEAgLTYxNjksNiArNjE5OCw3IEBAIHZv
aWQgZHVtcF92bWNzKHZvaWQpCiAJCSAgICAgICB2bWNzX3JlYWQxNihWSVJUVUFMX1BST0NFU1NP
Ul9JRCkpOwogCiAJZHVtcF9lcHRwX2xpc3QoKTsKKwlkdW1wX3ZlX2luZm8oKTsKIH0KIAogc3Rh
dGljIHVuc2lnbmVkIGludCB1cGRhdGVfZXB0X3ZpZXcoc3RydWN0IHZjcHVfdm14ICp2bXgpCkBA
IC04MzQwLDYgKzgzNzAsNyBAQCBzdGF0aWMgX19pbml0IGludCBoYXJkd2FyZV9zZXR1cCh2b2lk
KQogCQllbmFibGVfZXB0ID0gMDsKIAogCWt2bV9lcHRwX3N3aXRjaGluZ19zdXBwb3J0ZWQgPSBj
cHVfaGFzX3ZteF9lcHRwX3N3aXRjaGluZygpOworCWt2bV92ZV9zdXBwb3J0ZWQgPSBjcHVfaGFz
X3ZteF92ZSgpOwogCiAJaWYgKCFjcHVfaGFzX3ZteF9lcHRfYWRfYml0cygpIHx8ICFlbmFibGVf
ZXB0KQogCQllbmFibGVfZXB0X2FkX2JpdHMgPSAwOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3Zt
L3ZteC92bXguaCBiL2FyY2gveDg2L2t2bS92bXgvdm14LmgKaW5kZXggMzhkNTBmYzczNTdiLi40
OWY2NGJlNGJiZWYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmgKKysrIGIvYXJj
aC94ODYva3ZtL3ZteC92bXguaApAQCAtMjQsNiArMjQsMTggQEAgZXh0ZXJuIGNvbnN0IHUzMiB2
bXhfbXNyX2luZGV4W107CiAKICNkZWZpbmUgTlJfTE9BRFNUT1JFX01TUlMgOAogCitzdHJ1Y3Qg
dmNwdV92ZV9pbmZvIHsKKwl1MzIgZXhpdF9yZWFzb247CisJdTMyIHVudXNlZDsKKwl1NjQgZXhp
dF9xdWFsaWZpY2F0aW9uOworCXU2NCBndmE7CisJdTY0IGdwYTsKKwl1MTYgZXB0cF9pbmRleDsK
KworCXUxNiBvZmZzZXQxOworCXUzMiBvZmZzZXQyOworfTsKKwogc3RydWN0IHZteF9tc3JzIHsK
IAl1bnNpZ25lZCBpbnQJCW5yOwogCXN0cnVjdCB2bXhfbXNyX2VudHJ5CXZhbFtOUl9MT0FEU1RP
UkVfTVNSU107CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0veDg2LmMgYi9hcmNoL3g4Ni9rdm0v
eDg2LmMKaW5kZXggNzhhYWNhYzgzOWJiLi45YWE2NDZhNjU5NjcgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2t2bS94ODYuYworKysgYi9hcmNoL3g4Ni9rdm0veDg2LmMKQEAgLTE2NCw2ICsxNjQsOSBA
QCBtb2R1bGVfcGFyYW0ocGlfaW5qZWN0X3RpbWVyLCBiaW50LCBTX0lSVUdPIHwgU19JV1VTUik7
CiBib29sIF9fcmVhZF9tb3N0bHkga3ZtX2VwdHBfc3dpdGNoaW5nX3N1cHBvcnRlZDsKIEVYUE9S
VF9TWU1CT0xfR1BMKGt2bV9lcHRwX3N3aXRjaGluZ19zdXBwb3J0ZWQpOwogCitib29sIF9fcmVh
ZF9tb3N0bHkga3ZtX3ZlX3N1cHBvcnRlZDsKK0VYUE9SVF9TWU1CT0xfR1BMKGt2bV92ZV9zdXBw
b3J0ZWQpOworCiAjZGVmaW5lIEtWTV9OUl9TSEFSRURfTVNSUyAxNgogCiBzdHJ1Y3Qga3ZtX3No
YXJlZF9tc3JzX2dsb2JhbCB7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0
cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcv
bWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
