Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE42C3C4D
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:42:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DFE9A869FE;
	Wed, 25 Nov 2020 09:42:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmaHdnHmPUef; Wed, 25 Nov 2020 09:42:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3499C86A1D;
	Wed, 25 Nov 2020 09:42:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C062C0052;
	Wed, 25 Nov 2020 09:42:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93C44C1DA0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 755F587405
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x1O6ArZWuPp3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B142887433
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:53 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E5B17305D3E7; Wed, 25 Nov 2020 11:35:54 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id BCDB03072784;
 Wed, 25 Nov 2020 11:35:54 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 74/81] KVM: introspection: add KVMI_VM_SET_PAGE_ACCESS
Date: Wed, 25 Nov 2020 11:35:53 +0200
Message-Id: <20201125093600.2766-75-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBjb21tYW5k
IHNldHMgdGhlIHNwdGUgYWNjZXNzIGJpdHMgKHJ3eCkgZm9yIGFuIGFycmF5IG9mIGd1ZXN0CnBo
eXNpY2FsIGFkZHJlc3NlcyAodGhyb3VnaCB0aGUgcGFnZSB0cmFja2luZyBzdWJzeXN0ZW0pLgoK
VGhlc2UgR1BBcywgd2l0aCB0aGUgcmVxdWVzdGVkIGFjY2VzcyBiaXRzLCBhcmUgYWxzbyBrZXB0
IGluIGEgcmFkaXgKdHJlZSBpbiBvcmRlciB0byBmaWx0ZXIgb3V0IHRoZSAjUEYgZXZlbnRzIHdo
aWNoIGFyZSBvZiBubyBpbnRlcmVzdCB0bwp0aGUgaW50cm9zcGVjdGlvbiB0b29sIGFuZCB0byBy
ZWFwcGx5IHRoZSBzZXR0aW5ncyB3aGVuIGEgbWVtb3J5IHNsb3QKaXMgbW92ZWQuCgpTaWduZWQt
b2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+CkNvLWRldmVsb3Bl
ZC1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogRG9jdW1l
bnRhdGlvbi92aXJ0L2t2bS9rdm1pLnJzdCAgICAgICAgICAgICAgIHwgIDU5ICsrKysrKysrKwog
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAgICAgICAgIHwgICAyICsKIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oICAgICAgICAgICAgICB8ICAgNyArKwogYXJj
aC94ODYva3ZtL2t2bWkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDQwICsrKysrKwog
aW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaCAgICAgICAgICAgICAgICAgICAgIHwgICAzICsKIGlu
Y2x1ZGUvdWFwaS9saW51eC9rdm1pLmggICAgICAgICAgICAgICAgICAgICB8ICAyMCArKysKIC4u
Li90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jICB8ICA1MCArKysrKysr
KwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICAgICAgICAgICAgICAgIHwgMTE5ICsr
KysrKysrKysrKysrKysrLQogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAgICAg
ICAgICAgIHwgIDEwICsrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgICAgICAg
ICAgICAgfCAgNTkgKysrKysrKysrCiAxMCBmaWxlcyBjaGFuZ2VkLCAzNjggaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3Zt
aS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IDM0NjZkYjcyZTVl
OC4uMTU0MGY3NWM0NDYyIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWku
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTk2NSw2ICs5NjUs
NjUgQEAgdG8gY29udHJvbCBldmVudHMgZm9yIGFueSBvdGhlciByZWdpc3RlciB3aWxsIGZhaWwg
d2l0aCAtS1ZNX0VJTlZBTDo6CiAqIC1LVk1fRVBFUk0gIC0gdGhlIGludGVyY2VwdGlvbiBvZiB0
aGUgc2VsZWN0ZWQgTVNSIGlzIGRpc2FsbG93ZWQKICAgICAgICAgICAgICAgICBmcm9tIHVzZXJz
cGFjZSAoS1ZNX1g4Nl9TRVRfTVNSX0ZJTFRFUikKIAorMjMuIEtWTUlfVk1fU0VUX1BBR0VfQUND
RVNTCistLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KKworOkFyY2hpdGVjdHVyZXM6IHg4Ngor
OlZlcnNpb25zOiA+PSAxCis6UGFyYW1ldGVyczoKKworOjoKKworCXN0cnVjdCBrdm1pX3ZtX3Nl
dF9wYWdlX2FjY2VzcyB7CisJCV9fdTE2IGNvdW50OworCQlfX3UxNiBwYWRkaW5nMTsKKwkJX191
MzIgcGFkZGluZzI7CisJCXN0cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5IGVudHJpZXNbMF07
CisJfTsKKword2hlcmU6OgorCisJc3RydWN0IGt2bWlfcGFnZV9hY2Nlc3NfZW50cnkgeworCQlf
X3U2NCBncGE7CisJCV9fdTggYWNjZXNzOworCQlfX3U4IHBhZGRpbmdbN107CisJfTsKKworCis6
UmV0dXJuczoKKworOjoKKworCXN0cnVjdCBrdm1pX2Vycm9yX2NvZGUKKworU2V0cyB0aGUgYWNj
ZXNzIGJpdHMgKHJ3eCkgZm9yIGFuIGFycmF5IG9mIGBgY291bnRgYCBndWVzdCBwaHlzaWNhbAor
YWRkcmVzc2VzIChgYGdwYWBgKS4KKworVGhlIHZhbGlkIGFjY2VzcyBiaXRzIGFyZTo6CisKKwlL
Vk1JX1BBR0VfQUNDRVNTX1IKKwlLVk1JX1BBR0VfQUNDRVNTX1cKKwlLVk1JX1BBR0VfQUNDRVNT
X1gKKworCitUaGUgY29tbWFuZCB3aWxsIGZhaWwgd2l0aCAtS1ZNX0VJTlZBTCBpZiBhbnkgb2Yg
dGhlIHNwZWNpZmllZCBjb21iaW5hdGlvbgorb2YgYWNjZXNzIGJpdHMgaXMgbm90IHN1cHBvcnRl
ZCBvciB0aGUgYWRkcmVzcyAoYGBncGFgYCkgaXMgbm90IHZhbGlkCisodmlzaWJsZSkuCisKK1Ro
ZSBjb21tYW5kIHdpbGwgdHJ5IHRvIGFwcGx5IGFsbCBjaGFuZ2VzIGFuZCByZXR1cm4gdGhlIGZp
cnN0IGVycm9yIGlmCitzb21lIGZhaWxlZC4gVGhlIGludHJvc3BlY3Rpb24gdG9vbCBzaG91bGQg
aGFuZGxlIHRoZSByb2xsYmFjay4KKworSW4gb3JkZXIgdG8gJ2ZvcmdldCcgYW4gYWRkcmVzcywg
YWxsIHRocmVlIGJpdHMgKCdyd3gnKSBtdXN0IGJlIHNldC4KKworOkVycm9yczoKKworKiAtS1ZN
X0VJTlZBTCAtIHRoZSBzcGVjaWZpZWQgYWNjZXNzIGJpdHMgY29tYmluYXRpb24gaXMgaW52YWxp
ZAorKiAtS1ZNX0VJTlZBTCAtIHRoZSBhZGRyZXNzIGlzIG5vdCB2YWxpZAorKiAtS1ZNX0VJTlZB
TCAtIHRoZSBwYWRkaW5nIGlzIG5vdCB6ZXJvCisqIC1LVk1fRUlOVkFMIC0gdGhlIG1lc3NhZ2Ug
c2l6ZSBpcyBpbnZhbGlkCisqIC1LVk1fRUFHQUlOIC0gdGhlIHNlbGVjdGVkIHZDUFUgY2FuJ3Qg
YmUgaW50cm9zcGVjdGVkIHlldAorKiAtS1ZNX0VOT01FTSAtIHRoZXJlIGlzIG5vdCBlbm91Z2gg
bWVtb3J5IHRvIGFkZCB0aGUgcGFnZSB0cmFja2luZyBzdHJ1Y3R1cmVzCisKIEV2ZW50cwogPT09
PT09CiAKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IGQ0ZTJmZTQ5MzQxOS4uMjc0MDY0NjJh
YTA1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTQ1LDYgKzQ1LDggQEAKICNkZWZpbmUg
S1ZNX1BSSVZBVEVfTUVNX1NMT1RTIDMKICNkZWZpbmUgS1ZNX01FTV9TTE9UU19OVU0gKEtWTV9V
U0VSX01FTV9TTE9UUyArIEtWTV9QUklWQVRFX01FTV9TTE9UUykKIAorI2luY2x1ZGUgPGFzbS9r
dm1pX2hvc3QuaD4KKwogI2RlZmluZSBLVk1fSEFMVF9QT0xMX05TX0RFRkFVTFQgMjAwMDAwCiAK
ICNkZWZpbmUgS1ZNX0lSUUNISVBfTlVNX1BJTlMgIEtWTV9JT0FQSUNfTlVNX1BJTlMKZGlmZiAt
LWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oIGIvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtaV9ob3N0LmgKaW5kZXggODgyMmYwMzEwMTU2Li40MjAzNThjNGE5YWUgMTAwNjQ0
Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCisrKyBiL2FyY2gveDg2L2lu
Y2x1ZGUvYXNtL2t2bWlfaG9zdC5oCkBAIC0yLDYgKzIsNyBAQAogI2lmbmRlZiBfQVNNX1g4Nl9L
Vk1JX0hPU1RfSAogI2RlZmluZSBfQVNNX1g4Nl9LVk1JX0hPU1RfSAogCisjaW5jbHVkZSA8YXNt
L2t2bV9wYWdlX3RyYWNrLmg+CiAjaW5jbHVkZSA8YXNtL2t2bWkuaD4KIAogc3RydWN0IG1zcl9k
YXRhOwpAQCAtNTQsNiArNTUsMTIgQEAgc3RydWN0IGt2bV92Y3B1X2FyY2hfaW50cm9zcGVjdGlv
biB7CiBzdHJ1Y3Qga3ZtX2FyY2hfaW50cm9zcGVjdGlvbiB7CiB9OwogCisjZGVmaW5lIFNMT1RT
X1NJWkUgQklUU19UT19MT05HUyhLVk1fTUVNX1NMT1RTX05VTSkKKworc3RydWN0IGt2bWlfYXJj
aF9tZW1fYWNjZXNzIHsKKwl1bnNpZ25lZCBsb25nIGFjdGl2ZVtLVk1fUEFHRV9UUkFDS19NQVhd
W1NMT1RTX1NJWkVdOworfTsKKwogI2lmZGVmIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTgogCiBi
b29sIGt2bWlfbW9uaXRvcl9icF9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIg
ZGJnKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9rdm1pLmMgYi9hcmNoL3g4Ni9rdm0va3Zt
aS5jCmluZGV4IGUzMjVkYWQ4OGRiYi4uYWNkNDc1NmUwZDc4IDEwMDY0NAotLS0gYS9hcmNoL3g4
Ni9rdm0va3ZtaS5jCisrKyBiL2FyY2gveDg2L2t2bS9rdm1pLmMKQEAgLTkxOSwzICs5MTksNDMg
QEAgYm9vbCBrdm1pX21zcl9ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBtc3Jf
ZGF0YSAqbXNyKQogCiAJcmV0dXJuIHJldDsKIH0KKworc3RhdGljIGNvbnN0IHN0cnVjdCB7CisJ
dW5zaWduZWQgaW50IGFsbG93X2JpdDsKKwllbnVtIGt2bV9wYWdlX3RyYWNrX21vZGUgdHJhY2tf
bW9kZTsKK30gdHJhY2tfbW9kZXNbXSA9IHsKKwl7IEtWTUlfUEFHRV9BQ0NFU1NfUiwgS1ZNX1BB
R0VfVFJBQ0tfUFJFUkVBRCB9LAorCXsgS1ZNSV9QQUdFX0FDQ0VTU19XLCBLVk1fUEFHRV9UUkFD
S19QUkVXUklURSB9LAorCXsgS1ZNSV9QQUdFX0FDQ0VTU19YLCBLVk1fUEFHRV9UUkFDS19QUkVF
WEVDIH0sCit9OworCit2b2lkIGt2bWlfYXJjaF91cGRhdGVfcGFnZV90cmFja2luZyhzdHJ1Y3Qg
a3ZtICprdm0sCisJCQkJICAgIHN0cnVjdCBrdm1fbWVtb3J5X3Nsb3QgKnNsb3QsCisJCQkJICAg
IHN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKm0pCit7CisJc3RydWN0IGt2bWlfYXJjaF9tZW1fYWNj
ZXNzICphcmNoID0gJm0tPmFyY2g7CisJaW50IGk7CisKKwlpZiAoIXNsb3QpIHsKKwkJc2xvdCA9
IGdmbl90b19tZW1zbG90KGt2bSwgbS0+Z2ZuKTsKKwkJaWYgKCFzbG90KQorCQkJcmV0dXJuOwor
CX0KKworCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHRyYWNrX21vZGVzKTsgaSsrKSB7CisJ
CXVuc2lnbmVkIGludCBhbGxvd19iaXQgPSB0cmFja19tb2Rlc1tpXS5hbGxvd19iaXQ7CisJCWVu
dW0ga3ZtX3BhZ2VfdHJhY2tfbW9kZSBtb2RlID0gdHJhY2tfbW9kZXNbaV0udHJhY2tfbW9kZTsK
KwkJYm9vbCBzbG90X3RyYWNrZWQgPSB0ZXN0X2JpdChzbG90LT5pZCwgYXJjaC0+YWN0aXZlW21v
ZGVdKTsKKworCQlpZiAobS0+YWNjZXNzICYgYWxsb3dfYml0KSB7CisJCQlpZiAoc2xvdF90cmFj
a2VkKSB7CisJCQkJa3ZtX3Nsb3RfcGFnZV90cmFja19yZW1vdmVfcGFnZShrdm0sIHNsb3QsCisJ
CQkJCQkJCW0tPmdmbiwgbW9kZSk7CisJCQkJY2xlYXJfYml0KHNsb3QtPmlkLCBhcmNoLT5hY3Rp
dmVbbW9kZV0pOworCQkJfQorCQl9IGVsc2UgaWYgKCFzbG90X3RyYWNrZWQpIHsKKwkJCWt2bV9z
bG90X3BhZ2VfdHJhY2tfYWRkX3BhZ2Uoa3ZtLCBzbG90LCBtLT5nZm4sIG1vZGUpOworCQkJc2V0
X2JpdChzbG90LT5pZCwgYXJjaC0+YWN0aXZlW21vZGVdKTsKKwkJfQorCX0KK30KZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggYi9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5o
CmluZGV4IDdhNzM2MDMwNjgxMi4uMTRhYzA3NWEzZWE5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L2t2bWlfaG9zdC5oCisrKyBiL2luY2x1ZGUvbGludXgva3ZtaV9ob3N0LmgKQEAgLTUyLDYg
KzUyLDkgQEAgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uIHsKIAlhdG9taWNfdCBldl9zZXE7CiAK
IAlib29sIHJlc3RvcmVfb25fdW5ob29rOworCisJc3RydWN0IHJhZGl4X3RyZWVfcm9vdCBhY2Nl
c3NfdHJlZTsKKwlyd2xvY2tfdCBhY2Nlc3NfdHJlZV9sb2NrOwogfTsKIAogaW50IGt2bWlfdmVy
c2lvbih2b2lkKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9rdm1pLmggYi9pbmNs
dWRlL3VhcGkvbGludXgva3ZtaS5oCmluZGV4IGM4ZTdmNDUxNjM3OS4uNDJjOGU2MzQyZmNmIDEw
MDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCisrKyBiL2luY2x1ZGUvdWFwaS9s
aW51eC9rdm1pLmgKQEAgLTMwLDYgKzMwLDcgQEAgZW51bSB7CiAJS1ZNSV9WTV9QQVVTRV9WQ1BV
ICAgICAgPSBLVk1JX1ZNX01FU1NBR0VfSUQoOCksCiAJS1ZNSV9WTV9DT05UUk9MX0NMRUFOVVAg
PSBLVk1JX1ZNX01FU1NBR0VfSUQoOSksCiAJS1ZNSV9WTV9HRVRfTUFYX0dGTiAgICAgPSBLVk1J
X1ZNX01FU1NBR0VfSUQoMTApLAorCUtWTUlfVk1fU0VUX1BBR0VfQUNDRVNTID0gS1ZNSV9WTV9N
RVNTQUdFX0lEKDExKSwKIAogCUtWTUlfTkVYVF9WTV9NRVNTQUdFCiB9OwpAQCAtODEsNiArODIs
MTIgQEAgZW51bSB7CiAJS1ZNSV9FVkVOVF9BQ1RJT05fQ1JBU0ggICAgPSAyLAogfTsKIAorZW51
bSB7CisJS1ZNSV9QQUdFX0FDQ0VTU19SID0gMSA8PCAwLAorCUtWTUlfUEFHRV9BQ0NFU1NfVyA9
IDEgPDwgMSwKKwlLVk1JX1BBR0VfQUNDRVNTX1ggPSAxIDw8IDIsCit9OworCiBzdHJ1Y3Qga3Zt
aV9tc2dfaGRyIHsKIAlfX3UxNiBpZDsKIAlfX3UxNiBzaXplOwpAQCAtMTkwLDQgKzE5NywxNyBA
QCBzdHJ1Y3Qga3ZtaV92bV9nZXRfbWF4X2dmbl9yZXBseSB7CiAJX191NjQgZ2ZuOwogfTsKIAor
c3RydWN0IGt2bWlfcGFnZV9hY2Nlc3NfZW50cnkgeworCV9fdTY0IGdwYTsKKwlfX3U4IGFjY2Vz
czsKKwlfX3U4IHBhZGRpbmdbN107Cit9OworCitzdHJ1Y3Qga3ZtaV92bV9zZXRfcGFnZV9hY2Nl
c3MgeworCV9fdTE2IGNvdW50OworCV9fdTE2IHBhZGRpbmcxOworCV9fdTMyIHBhZGRpbmcyOwor
CXN0cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5IGVudHJpZXNbMF07Cit9OworCiAjZW5kaWYg
LyogX1VBUElfX0xJTlVYX0tWTUlfSCAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS94ODZfNjQva3ZtaV90ZXN0LmMKaW5kZXggMmUwN2IyMmJjOGMwLi5jOWQ2ZWU1N2Q1MDYgMTAw
NjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMK
KysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYwpAQCAt
MTY4OSw2ICsxNjg5LDU1IEBAIHN0YXRpYyB2b2lkIHRlc3RfY21kX3ZjcHVfY29udHJvbF9tc3Io
c3RydWN0IGt2bV92bSAqdm0pCiAJdGVzdF9pbnZhbGlkX2NvbnRyb2xfbXNyKHZtLCBtc3IpOwog
fQogCitzdGF0aWMgaW50IGNtZF9zZXRfcGFnZV9hY2Nlc3MoX191MTYgY291bnQsIF9fdTY0ICpn
cGEsIF9fdTggKmFjY2VzcykKK3sKKwlzdHJ1Y3Qga3ZtaV9wYWdlX2FjY2Vzc19lbnRyeSAqZW50
cnksICplbmQ7CisJc3RydWN0IGt2bWlfdm1fc2V0X3BhZ2VfYWNjZXNzICpjbWQ7CisJc3RydWN0
IGt2bWlfbXNnX2hkciAqcmVxOworCXNpemVfdCByZXFfc2l6ZTsKKwlpbnQgcjsKKworCXJlcV9z
aXplID0gc2l6ZW9mKCpyZXEpICsgc2l6ZW9mKCpjbWQpICsgY291bnQgKiBzaXplb2YoKmVudHJ5
KTsKKwlyZXEgPSBjYWxsb2MoMSwgcmVxX3NpemUpOworCisJY21kID0gKHN0cnVjdCBrdm1pX3Zt
X3NldF9wYWdlX2FjY2VzcyAqKShyZXEgKyAxKTsKKwljbWQtPmNvdW50ID0gY291bnQ7CisKKwll
bnRyeSA9IGNtZC0+ZW50cmllczsKKwllbmQgPSBjbWQtPmVudHJpZXMgKyBjb3VudDsKKwlmb3Ig
KDsgZW50cnkgPCBlbmQ7IGVudHJ5KyspIHsKKwkJZW50cnktPmdwYSA9ICpncGErKzsKKwkJZW50
cnktPmFjY2VzcyA9ICphY2Nlc3MrKzsKKwl9CisKKwlyID0gZG9fY29tbWFuZChLVk1JX1ZNX1NF
VF9QQUdFX0FDQ0VTUywgcmVxLCByZXFfc2l6ZSwgTlVMTCwgMCk7CisKKwlmcmVlKHJlcSk7CisJ
cmV0dXJuIHI7Cit9CisKK3N0YXRpYyB2b2lkIHNldF9wYWdlX2FjY2VzcyhfX3U2NCBncGEsIF9f
dTggYWNjZXNzKQoreworCWludCByOworCisJciA9IGNtZF9zZXRfcGFnZV9hY2Nlc3MoMSwgJmdw
YSwgJmFjY2Vzcyk7CisJVEVTVF9BU1NFUlQociA9PSAwLAorCQkiS1ZNSV9WTV9TRVRfUEFHRV9B
Q0NFU1MgZmFpbGVkLCBncGEgMHglbGx4LCBhY2Nlc3MgMHgleCwgZXJyb3IgJWQgKCVzKVxuIiwK
KwkJZ3BhLCBhY2Nlc3MsIC1yLCBrdm1fc3RyZXJyb3IoLXIpKTsKK30KKworc3RhdGljIHZvaWQg
dGVzdF9jbWRfdm1fc2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBrdm1fdm0gKnZtKQoreworCV9fdTgg
ZnVsbF9hY2Nlc3MgPSBLVk1JX1BBR0VfQUNDRVNTX1IgfCBLVk1JX1BBR0VfQUNDRVNTX1cgfAor
CQkJICAgS1ZNSV9QQUdFX0FDQ0VTU19YOworCV9fdTggbm9fYWNjZXNzID0gMDsKKwlfX3U2NCBn
cGEgPSAwOworCisJc2V0X3BhZ2VfYWNjZXNzKGdwYSwgbm9fYWNjZXNzKTsKKworCXNldF9wYWdl
X2FjY2VzcyhncGEsIGZ1bGxfYWNjZXNzKTsKK30KKwogc3RhdGljIHZvaWQgdGVzdF9pbnRyb3Nw
ZWN0aW9uKHN0cnVjdCBrdm1fdm0gKnZtKQogewogCXNyYW5kb20odGltZSgwKSk7CkBAIC0xNzIx
LDYgKzE3NzAsNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludHJvc3BlY3Rpb24oc3RydWN0IGt2bV92
bSAqdm0pCiAJdGVzdF9jbWRfdmNwdV9nZXRfbXRycl90eXBlKHZtKTsKIAl0ZXN0X2V2ZW50X2Rl
c2NyaXB0b3Iodm0pOwogCXRlc3RfY21kX3ZjcHVfY29udHJvbF9tc3Iodm0pOworCXRlc3RfY21k
X3ZtX3NldF9wYWdlX2FjY2Vzcyh2bSk7CiAKIAl1bmhvb2tfaW50cm9zcGVjdGlvbih2bSk7CiB9
CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYyBiL3ZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaS5jCmluZGV4IGIzNjZiYTY4MjBkNi4uMDc5YjM1NTU0MGI0IDEwMDY0
NAotLS0gYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWkuYworKysgYi92aXJ0L2t2bS9pbnRy
b3NwZWN0aW9uL2t2bWkuYwpAQCAtMjYsNiArMjYsMTEgQEAgc3RhdGljIERFQ0xBUkVfQklUTUFQ
KEt2bWlfa25vd25fdmNwdV9ldmVudHMsIEtWTUlfTlVNX0VWRU5UUyk7CiAKIHN0YXRpYyBzdHJ1
Y3Qga21lbV9jYWNoZSAqbXNnX2NhY2hlOwogc3RhdGljIHN0cnVjdCBrbWVtX2NhY2hlICpqb2Jf
Y2FjaGU7CitzdGF0aWMgc3RydWN0IGttZW1fY2FjaGUgKnJhZGl4X2NhY2hlOworCitzdGF0aWMg
Y29uc3QgdTggZnVsbF9hY2Nlc3MgID0JS1ZNSV9QQUdFX0FDQ0VTU19SIHwKKwkJCQlLVk1JX1BB
R0VfQUNDRVNTX1cgfAorCQkJCUtWTUlfUEFHRV9BQ0NFU1NfWDsKIAogdm9pZCAqa3ZtaV9tc2df
YWxsb2Modm9pZCkKIHsKQEAgLTQ0LDYgKzQ5LDggQEAgc3RhdGljIHZvaWQga3ZtaV9jYWNoZV9k
ZXN0cm95KHZvaWQpCiAJbXNnX2NhY2hlID0gTlVMTDsKIAlrbWVtX2NhY2hlX2Rlc3Ryb3koam9i
X2NhY2hlKTsKIAlqb2JfY2FjaGUgPSBOVUxMOworCWttZW1fY2FjaGVfZGVzdHJveShyYWRpeF9j
YWNoZSk7CisJcmFkaXhfY2FjaGUgPSBOVUxMOwogfQogCiBzdGF0aWMgaW50IGt2bWlfY2FjaGVf
Y3JlYXRlKHZvaWQpCkBAIC01Myw4ICs2MCwxMSBAQCBzdGF0aWMgaW50IGt2bWlfY2FjaGVfY3Jl
YXRlKHZvaWQpCiAJam9iX2NhY2hlID0ga21lbV9jYWNoZV9jcmVhdGUoImt2bWlfam9iIiwKIAkJ
CQkgICAgICBzaXplb2Yoc3RydWN0IGt2bWlfam9iKSwKIAkJCQkgICAgICAwLCBTTEFCX0FDQ09V
TlQsIE5VTEwpOworCXJhZGl4X2NhY2hlID0ga21lbV9jYWNoZV9jcmVhdGUoImt2bWlfcmFkaXhf
dHJlZSIsCisJCQkJCXNpemVvZihzdHJ1Y3Qga3ZtaV9tZW1fYWNjZXNzKSwKKwkJCQkJMCwgU0xB
Ql9BQ0NPVU5ULCBOVUxMKTsKIAotCWlmICghbXNnX2NhY2hlIHx8ICFqb2JfY2FjaGUpIHsKKwlp
ZiAoIW1zZ19jYWNoZSB8fCAham9iX2NhY2hlIHx8ICFyYWRpeF9jYWNoZSkgewogCQlrdm1pX2Nh
Y2hlX2Rlc3Ryb3koKTsKIAogCQlyZXR1cm4gLTE7CkBAIC0yNDUsMTIgKzI1NSwzOCBAQCBzdGF0
aWMgdm9pZCBrdm1pX2ZyZWVfdmNwdWkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHJlc3Rv
cmVfaW50ZXJjZXB0aW9uKQogCWt2bWlfbWFrZV9yZXF1ZXN0KHZjcHUsIGZhbHNlKTsKIH0KIAor
c3RhdGljIHZvaWQga3ZtaV9jbGVhcl9tZW1fYWNjZXNzKHN0cnVjdCBrdm0gKmt2bSkKK3sKKwlz
dHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWkgPSBLVk1JKGt2bSk7CisJc3RydWN0IHJhZGl4
X3RyZWVfaXRlciBpdGVyOworCXZvaWQgKipzbG90OworCWludCBpZHg7CisKKwlpZHggPSBzcmN1
X3JlYWRfbG9jaygma3ZtLT5zcmN1KTsKKwlzcGluX2xvY2soJmt2bS0+bW11X2xvY2spOworCisJ
cmFkaXhfdHJlZV9mb3JfZWFjaF9zbG90KHNsb3QsICZrdm1pLT5hY2Nlc3NfdHJlZSwgJml0ZXIs
IDApIHsKKwkJc3RydWN0IGt2bWlfbWVtX2FjY2VzcyAqbSA9ICpzbG90OworCisJCW0tPmFjY2Vz
cyA9IGZ1bGxfYWNjZXNzOworCQlrdm1pX2FyY2hfdXBkYXRlX3BhZ2VfdHJhY2tpbmcoa3ZtLCBO
VUxMLCBtKTsKKworCQlyYWRpeF90cmVlX2l0ZXJfZGVsZXRlKCZrdm1pLT5hY2Nlc3NfdHJlZSwg
Jml0ZXIsIHNsb3QpOworCQlrbWVtX2NhY2hlX2ZyZWUocmFkaXhfY2FjaGUsIG0pOworCX0KKwor
CXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKKwlzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNy
Y3UsIGlkeCk7Cit9CisKIHN0YXRpYyB2b2lkIGt2bWlfZnJlZShzdHJ1Y3Qga3ZtICprdm0pCiB7
CiAJYm9vbCByZXN0b3JlX2ludGVyY2VwdGlvbiA9IEtWTUkoa3ZtKS0+cmVzdG9yZV9vbl91bmhv
b2s7CiAJc3RydWN0IGt2bV92Y3B1ICp2Y3B1OwogCWludCBpOwogCisJa3ZtaV9jbGVhcl9tZW1f
YWNjZXNzKGt2bSk7CisKIAlrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1LCBrdm0pCiAJCWt2bWlf
ZnJlZV92Y3B1aSh2Y3B1LCByZXN0b3JlX2ludGVyY2VwdGlvbik7CiAKQEAgLTMwNSw2ICszNDEs
MTAgQEAga3ZtaV9hbGxvYyhzdHJ1Y3Qga3ZtICprdm0sIGNvbnN0IHN0cnVjdCBrdm1faW50cm9z
cGVjdGlvbl9ob29rICpob29rKQogCiAJYXRvbWljX3NldCgma3ZtaS0+ZXZfc2VxLCAwKTsKIAor
CUlOSVRfUkFESVhfVFJFRSgma3ZtaS0+YWNjZXNzX3RyZWUsCisJCQlHRlBfS0VSTkVMICYgfl9f
R0ZQX0RJUkVDVF9SRUNMQUlNKTsKKwlyd2xvY2tfaW5pdCgma3ZtaS0+YWNjZXNzX3RyZWVfbG9j
ayk7CisKIAlrdm1fZm9yX2VhY2hfdmNwdShpLCB2Y3B1LCBrdm0pIHsKIAkJaW50IGVyciA9IGt2
bWlfY3JlYXRlX3ZjcHVpKHZjcHUpOwogCkBAIC05MzcsMyArOTc3LDgwIEBAIGJvb2wga3ZtaV9i
cmVha3BvaW50X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IGd2YSwgdTggaW5zbl9s
ZW4pCiAJcmV0dXJuIHJldDsKIH0KIEVYUE9SVF9TWU1CT0woa3ZtaV9icmVha3BvaW50X2V2ZW50
KTsKKworc3RhdGljIHN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKgorX19rdm1pX2dldF9nZm5fYWNj
ZXNzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgY29uc3QgZ2ZuX3QgZ2ZuKQorewor
CXJldHVybiByYWRpeF90cmVlX2xvb2t1cCgma3ZtaS0+YWNjZXNzX3RyZWUsIGdmbik7Cit9CisK
K3N0YXRpYyB2b2lkIGt2bWlfdXBkYXRlX21lbV9hY2Nlc3Moc3RydWN0IGt2bSAqa3ZtLCBzdHJ1
Y3Qga3ZtaV9tZW1fYWNjZXNzICptKQoreworCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3Zt
aSA9IEtWTUkoa3ZtKTsKKworCWt2bWlfYXJjaF91cGRhdGVfcGFnZV90cmFja2luZyhrdm0sIE5V
TEwsIG0pOworCisJaWYgKG0tPmFjY2VzcyA9PSBmdWxsX2FjY2VzcykgeworCQlyYWRpeF90cmVl
X2RlbGV0ZSgma3ZtaS0+YWNjZXNzX3RyZWUsIG0tPmdmbik7CisJCWttZW1fY2FjaGVfZnJlZShy
YWRpeF9jYWNoZSwgbSk7CisJfQorfQorCitzdGF0aWMgdm9pZCBrdm1pX2luc2VydF9tZW1fYWNj
ZXNzKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bWlfbWVtX2FjY2VzcyAqbSkKK3sKKwlzdHJ1
Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWkgPSBLVk1JKGt2bSk7CisKKwlyYWRpeF90cmVlX2lu
c2VydCgma3ZtaS0+YWNjZXNzX3RyZWUsIG0tPmdmbiwgbSk7CisJa3ZtaV9hcmNoX3VwZGF0ZV9w
YWdlX3RyYWNraW5nKGt2bSwgTlVMTCwgbSk7Cit9CisKK3N0YXRpYyB2b2lkIGt2bWlfc2V0X21l
bV9hY2Nlc3Moc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qga3ZtaV9tZW1fYWNjZXNzICptLAorCQkJ
CWJvb2wgKnVzZWQpCit7CisJc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pID0gS1ZNSShr
dm0pOworCXN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKmZvdW5kOworCWludCBpZHg7CisKKwlpZHgg
PSBzcmN1X3JlYWRfbG9jaygma3ZtLT5zcmN1KTsKKwlzcGluX2xvY2soJmt2bS0+bW11X2xvY2sp
OworCXdyaXRlX2xvY2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCisJZm91bmQgPSBfX2t2
bWlfZ2V0X2dmbl9hY2Nlc3Moa3ZtaSwgbS0+Z2ZuKTsKKwlpZiAoZm91bmQpIHsKKwkJZm91bmQt
PmFjY2VzcyA9IG0tPmFjY2VzczsKKwkJa3ZtaV91cGRhdGVfbWVtX2FjY2Vzcyhrdm0sIGZvdW5k
KTsKKwl9IGVsc2UgaWYgKG0tPmFjY2VzcyAhPSBmdWxsX2FjY2VzcykgeworCQlrdm1pX2luc2Vy
dF9tZW1fYWNjZXNzKGt2bSwgbSk7CisJCSp1c2VkID0gdHJ1ZTsKKwl9CisKKwl3cml0ZV91bmxv
Y2soJmt2bWktPmFjY2Vzc190cmVlX2xvY2spOworCXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2Nr
KTsKKwlzcmN1X3JlYWRfdW5sb2NrKCZrdm0tPnNyY3UsIGlkeCk7Cit9CisKK2ludCBrdm1pX3Nl
dF9nZm5fYWNjZXNzKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLCB1OCBhY2Nlc3MpCit7CisJ
c3RydWN0IGt2bWlfbWVtX2FjY2VzcyAqbTsKKwlib29sIHVzZWQgPSBmYWxzZTsKKwlpbnQgZXJy
ID0gMDsKKworCW0gPSBrbWVtX2NhY2hlX3phbGxvYyhyYWRpeF9jYWNoZSwgR0ZQX0tFUk5FTCk7
CisJaWYgKCFtKQorCQlyZXR1cm4gLUtWTV9FTk9NRU07CisKKwltLT5nZm4gPSBnZm47CisJbS0+
YWNjZXNzID0gYWNjZXNzOworCisJaWYgKHJhZGl4X3RyZWVfcHJlbG9hZChHRlBfS0VSTkVMKSkK
KwkJZXJyID0gLUtWTV9FTk9NRU07CisJZWxzZQorCQlrdm1pX3NldF9tZW1fYWNjZXNzKGt2bSwg
bSwgJnVzZWQpOworCisJcmFkaXhfdHJlZV9wcmVsb2FkX2VuZCgpOworCisJaWYgKCF1c2VkKQor
CQlrbWVtX2NhY2hlX2ZyZWUocmFkaXhfY2FjaGUsIG0pOworCisJcmV0dXJuIGVycjsKK30KZGlm
ZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCBiL3ZpcnQva3ZtL2lu
dHJvc3BlY3Rpb24va3ZtaV9pbnQuaAppbmRleCAwYTdhODI4NWI5ODEuLjQxNzIwYjE5NDQ1OCAx
MDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCisrKyBiL3ZpcnQv
a3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaApAQCAtMjYsNiArMjYsMTIgQEAgdHlwZWRlZiBp
bnQgKCprdm1pX3ZjcHVfbXNnX2pvYl9mY3QpKGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfbXNnX2pv
YiAqam9iLAogCQkJCSAgICAgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNnLAogCQkJCSAg
ICAgY29uc3Qgdm9pZCAqcmVxKTsKIAorc3RydWN0IGt2bWlfbWVtX2FjY2VzcyB7CisJZ2ZuX3Qg
Z2ZuOworCXU4IGFjY2VzczsKKwlzdHJ1Y3Qga3ZtaV9hcmNoX21lbV9hY2Nlc3MgYXJjaDsKK307
CisKIHN0YXRpYyBpbmxpbmUgYm9vbCBpc192Y3B1X2V2ZW50X2VuYWJsZWQoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1MTYgZXZlbnRfaWQpCiB7CiAJcmV0dXJuIHRlc3RfYml0KGV2ZW50X2lkLCBW
Q1BVSSh2Y3B1KS0+ZXZfZW5hYmxlX21hc2spOwpAQCAtODYsNiArOTIsNyBAQCBpbnQga3ZtaV9j
bWRfcmVhZF9waHlzaWNhbChzdHJ1Y3Qga3ZtICprdm0sIHU2NCBncGEsIHNpemVfdCBzaXplLAog
aW50IGt2bWlfY21kX3dyaXRlX3BoeXNpY2FsKHN0cnVjdCBrdm0gKmt2bSwgdTY0IGdwYSwgc2l6
ZV90IHNpemUsCiAJCQkgICAgY29uc3Qgdm9pZCAqYnVmKTsKIGludCBrdm1pX2NtZF92Y3B1X3Bh
dXNlKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCB3YWl0KTsKK2ludCBrdm1pX3NldF9nZm5f
YWNjZXNzKHN0cnVjdCBrdm0gKmt2bSwgZ2ZuX3QgZ2ZuLCB1OCBhY2Nlc3MpOwogCiAvKiBhcmNo
ICovCiB2b2lkIGt2bWlfYXJjaF9pbml0X3ZjcHVfZXZlbnRzX21hc2sodW5zaWduZWQgbG9uZyAq
c3VwcG9ydGVkKTsKQEAgLTEwNCw1ICsxMTEsOCBAQCB2b2lkIGt2bWlfYXJjaF9icmVha3BvaW50
X2V2ZW50KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IGd2YSwgdTggaW5zbl9sZW4pOwogaW50
IGt2bWlfYXJjaF9jbWRfY29udHJvbF9pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAog
CQkJCSAgICB1bnNpZ25lZCBpbnQgZXZlbnRfaWQsIGJvb2wgZW5hYmxlKTsKIHZvaWQga3ZtaV9h
cmNoX3NlbmRfcGVuZGluZ19ldmVudChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwordm9pZCBrdm1p
X2FyY2hfdXBkYXRlX3BhZ2VfdHJhY2tpbmcoc3RydWN0IGt2bSAqa3ZtLAorCQkJCSAgICBzdHJ1
Y3Qga3ZtX21lbW9yeV9zbG90ICpzbG90LAorCQkJCSAgICBzdHJ1Y3Qga3ZtaV9tZW1fYWNjZXNz
ICptKTsKIAogI2VuZGlmCmRpZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlf
bXNnLmMgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKaW5kZXggNDJkMDY2ZTky
YmEyLi5hM2Q2ZDNkZjMwNzggMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3Zt
aV9tc2cuYworKysgYi92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKQEAgLTMwMiw2
ICszMDIsNjQgQEAgc3RhdGljIGludCBoYW5kbGVfdm1fZ2V0X21heF9nZm4oc3RydWN0IGt2bV9p
bnRyb3NwZWN0aW9uICprdm1pLAogCXJldHVybiBrdm1pX21zZ192bV9yZXBseShrdm1pLCBtc2cs
IDAsICZycGwsIHNpemVvZihycGwpKTsKIH0KIAorc3RhdGljIGJvb2wga3ZtaV9pc192aXNpYmxl
X2dmbihzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbikKK3sKKwlib29sIHZpc2libGU7CisJaW50
IGlkeDsKKworCWlkeCA9IHNyY3VfcmVhZF9sb2NrKCZrdm0tPnNyY3UpOworCXZpc2libGUgPSBr
dm1faXNfdmlzaWJsZV9nZm4oa3ZtLCBnZm4pOworCXNyY3VfcmVhZF91bmxvY2soJmt2bS0+c3Jj
dSwgaWR4KTsKKworCXJldHVybiB2aXNpYmxlOworfQorCitzdGF0aWMgaW50IHNldF9wYWdlX2Fj
Y2Vzc19lbnRyeShzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWksCisJCQkJIGNvbnN0IHN0
cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5ICplbnRyeSkKK3sKKwl1OCB1bmtub3duX2JpdHMg
PSB+KEtWTUlfUEFHRV9BQ0NFU1NfUiB8IEtWTUlfUEFHRV9BQ0NFU1NfVyB8CisJCQkgICAgS1ZN
SV9QQUdFX0FDQ0VTU19YKTsKKwlnZm5fdCBnZm4gPSBncGFfdG9fZ2ZuKGVudHJ5LT5ncGEpOwor
CXN0cnVjdCBrdm0gKmt2bSA9IGt2bWktPmt2bTsKKworCWlmICgoZW50cnktPmFjY2VzcyAmIHVu
a25vd25fYml0cykgfHwKKwkgICAgIG5vbl96ZXJvX3BhZGRpbmcoZW50cnktPnBhZGRpbmcsIEFS
UkFZX1NJWkUoZW50cnktPnBhZGRpbmcpKSkKKwkJcmV0dXJuIC1LVk1fRUlOVkFMOworCisJaWYg
KCFrdm1pX2lzX3Zpc2libGVfZ2ZuKGt2bSwgZ2ZuKSkKKwkJcmV0dXJuIC1LVk1fRUlOVkFMOwor
CisJcmV0dXJuIGt2bWlfc2V0X2dmbl9hY2Nlc3Moa3ZtLCBnZm4sIGVudHJ5LT5hY2Nlc3MpOwor
fQorCitzdGF0aWMgaW50IGhhbmRsZV92bV9zZXRfcGFnZV9hY2Nlc3Moc3RydWN0IGt2bV9pbnRy
b3NwZWN0aW9uICprdm1pLAorCQkJCSAgICAgY29uc3Qgc3RydWN0IGt2bWlfbXNnX2hkciAqbXNn
LAorCQkJCSAgICAgY29uc3Qgdm9pZCAqX3JlcSkKK3sKKwljb25zdCBzdHJ1Y3Qga3ZtaV92bV9z
ZXRfcGFnZV9hY2Nlc3MgKnJlcSA9IF9yZXE7CisJY29uc3Qgc3RydWN0IGt2bWlfcGFnZV9hY2Nl
c3NfZW50cnkgKmVudHJ5OworCXNpemVfdCBuID0gcmVxLT5jb3VudDsKKwlpbnQgZWMgPSAwOwor
CisJaWYgKHN0cnVjdF9zaXplKHJlcSwgZW50cmllcywgbikgPiBtc2ctPnNpemUpCisJCXJldHVy
biAtRUlOVkFMOworCisJaWYgKHJlcS0+cGFkZGluZzEgfHwgcmVxLT5wYWRkaW5nMikgeworCQll
YyA9IC1LVk1fRUlOVkFMOworCQlnb3RvIHJlcGx5OworCX0KKworCWZvciAoZW50cnkgPSByZXEt
PmVudHJpZXM7IG47IG4tLSwgZW50cnkrKykgeworCQlpbnQgZXJyID0gc2V0X3BhZ2VfYWNjZXNz
X2VudHJ5KGt2bWksIGVudHJ5KTsKKworCQlpZiAoZXJyICYmICFlYykKKwkJCWVjID0gZXJyOwor
CX0KKworcmVwbHk6CisJcmV0dXJuIGt2bWlfbXNnX3ZtX3JlcGx5KGt2bWksIG1zZywgZWMsIE5V
TEwsIDApOworfQorCiAvKgogICogVGhlc2UgY29tbWFuZHMgYXJlIGV4ZWN1dGVkIGJ5IHRoZSBy
ZWNlaXZpbmcgdGhyZWFkLgogICovCkBAIC0zMTUsNiArMzczLDcgQEAgc3RhdGljIGt2bWlfdm1f
bXNnX2ZjdCBjb25zdCBtc2dfdm1bXSA9IHsKIAlbS1ZNSV9WTV9HRVRfTUFYX0dGTl0gICAgID0g
aGFuZGxlX3ZtX2dldF9tYXhfZ2ZuLAogCVtLVk1JX1ZNX1BBVVNFX1ZDUFVdICAgICAgPSBoYW5k
bGVfdm1fcGF1c2VfdmNwdSwKIAlbS1ZNSV9WTV9SRUFEX1BIWVNJQ0FMXSAgID0gaGFuZGxlX3Zt
X3JlYWRfcGh5c2ljYWwsCisJW0tWTUlfVk1fU0VUX1BBR0VfQUNDRVNTXSA9IGhhbmRsZV92bV9z
ZXRfcGFnZV9hY2Nlc3MsCiAJW0tWTUlfVk1fV1JJVEVfUEhZU0lDQUxdICA9IGhhbmRsZV92bV93
cml0ZV9waHlzaWNhbCwKIH07CiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
