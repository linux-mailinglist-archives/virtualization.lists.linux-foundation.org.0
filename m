Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4E1978CB
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:20:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F23288846B;
	Mon, 30 Mar 2020 10:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XuUsP6bHg8dK; Mon, 30 Mar 2020 10:20:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9692888494;
	Mon, 30 Mar 2020 10:20:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BA6CC07FF;
	Mon, 30 Mar 2020 10:20:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2F995C1D91
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2CD8886A24
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fWu8R1w0cRat
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6372C86A14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:19:50 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 51D75305D3D0; Mon, 30 Mar 2020 13:13:01 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 27775305B7A0;
 Mon, 30 Mar 2020 13:13:01 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 74/81] KVM: introspection: add KVMI_VM_SET_PAGE_ACCESS
Date: Mon, 30 Mar 2020 13:13:01 +0300
Message-Id: <20200330101308.21702-75-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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
aWNoIGFyZSBvZiBubyBpbnRlcmVzdCB0bwp0aGUgaW50cm9zcGVjdGlvbiB0b29sLgoKU2lnbmVk
LW9mZi1ieTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgpDby1kZXZlbG9w
ZWQtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QgICAgICAgICAgICAgICB8ICA1OSArKysrKysrKwog
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCAgICAgICAgICAgICAgIHwgICAyICsKIGFy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oICAgICAgICAgICAgICB8ICAgOCArKwogYXJj
aC94ODYva3ZtL2t2bWkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDczICsrKysrKysr
KysKIGluY2x1ZGUvbGludXgva3ZtaV9ob3N0LmggICAgICAgICAgICAgICAgICAgICB8ICAgMyAr
CiBpbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oICAgICAgICAgICAgICAgICAgICAgfCAgMjMgKysr
CiAuLi4vdGVzdGluZy9zZWxmdGVzdHMva3ZtL3g4Nl82NC9rdm1pX3Rlc3QuYyAgfCAgNTMgKysr
KysrKwogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pLmMgICAgICAgICAgICAgICAgIHwgMTM1
ICsrKysrKysrKysrKysrKysrLQogdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oICAg
ICAgICAgICAgIHwgIDE0ICsrCiB2aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgICAg
ICAgICAgICAgfCAgMzEgKystLQogMTAgZmlsZXMgY2hhbmdlZCwgMzkxIGluc2VydGlvbnMoKyks
IDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3Zt
aS5yc3QgYi9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWkucnN0CmluZGV4IDNiOWRiOTQzYTU0
OS4uZmU2YzcxZjg0ZGQ3IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3ZpcnQva3ZtL2t2bWku
cnN0CisrKyBiL0RvY3VtZW50YXRpb24vdmlydC9rdm0va3ZtaS5yc3QKQEAgLTg4Myw2ICs4ODMs
NjUgQEAgdG8gY29udHJvbCBldmVudHMgZm9yIGFueSBvdGhlciByZWdpc3RlciB3aWxsIGZhaWwg
d2l0aCAtS1ZNX0VJTlZBTDo6CiAqIC1LVk1fRUlOVkFMIC0gdGhlIHBhZGRpbmcgaXMgbm90IHpl
cm8KICogLUtWTV9FQUdBSU4gLSB0aGUgc2VsZWN0ZWQgdkNQVSBjYW4ndCBiZSBpbnRyb3NwZWN0
ZWQgeWV0CiAKKzIwLiBLVk1JX1ZNX1NFVF9QQUdFX0FDQ0VTUworLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCisKKzpBcmNoaXRlY3R1cmVzOiBhbGwKKzpWZXJzaW9uczogPj0gMQorOlBhcmFt
ZXRlcnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV92bV9zZXRfcGFnZV9hY2Nlc3MgeworCQlfX3Ux
NiBjb3VudDsKKwkJX191MTYgcGFkZGluZzE7CisJCV9fdTMyIHBhZGRpbmcyOworCQlzdHJ1Y3Qg
a3ZtaV9wYWdlX2FjY2Vzc19lbnRyeSBlbnRyaWVzWzBdOworCX07CisKK3doZXJlOjoKKworCXN0
cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5IHsKKwkJX191NjQgZ3BhOworCQlfX3U4IGFjY2Vz
czsKKwkJX191OCBwYWRkaW5nMTsKKwkJX191MTYgcGFkZGluZzI7CisJCV9fdTMyIHBhZGRpbmcz
OworCX07CisKKworOlJldHVybnM6CisKKzo6CisKKwlzdHJ1Y3Qga3ZtaV9lcnJvcl9jb2RlCisK
K1NldHMgdGhlIHNwdGUgYWNjZXNzIGJpdHMgKHJ3eCkgZm9yIGFuIGFycmF5IG9mIGBgY291bnRg
YCBndWVzdCBwaHlzaWNhbAorYWRkcmVzc2VzLgorCitUaGUgdmFsaWQgYWNjZXNzIGJpdHMgYXJl
OjoKKworCUtWTUlfUEFHRV9BQ0NFU1NfUgorCUtWTUlfUEFHRV9BQ0NFU1NfVworCUtWTUlfUEFH
RV9BQ0NFU1NfWAorCisKK1RoZSBjb21tYW5kIHdpbGwgZmFpbCB3aXRoIC1LVk1fRUlOVkFMIGlm
IGFueSBvZiB0aGUgc3BlY2lmaWVkIGNvbWJpbmF0aW9uCitvZiBhY2Nlc3MgYml0cyBpcyBub3Qg
c3VwcG9ydGVkLgorCitUaGUgY29tbWFuZCB3aWxsIHRyeSB0byBhcHBseSBhbGwgY2hhbmdlcyBh
bmQgcmV0dXJuIHRoZSBmaXJzdCBlcnJvciBpZgorc29tZSBmYWlsZWQuIFRoZSBpbnRyb3NwZWN0
aW9uIHRvb2wgc2hvdWxkIGhhbmRsZSB0aGUgcm9sbGJhY2suCisKK0luIG9yZGVyIHRvICdmb3Jn
ZXQnIGFuIGFkZHJlc3MsIGFsbCB0aHJlZSBiaXRzICgncnd4JykgbXVzdCBiZSBzZXQuCisKKzpF
cnJvcnM6CisKKyogLUtWTV9FSU5WQUwgLSB0aGUgc3BlY2lmaWVkIGFjY2VzcyBiaXRzIGNvbWJp
bmF0aW9uIGlzIGludmFsaWQKKyogLUtWTV9FSU5WQUwgLSB0aGUgcGFkZGluZyBpcyBub3QgemVy
bworKiAtS1ZNX0VJTlZBTCAtIHRoZSBtZXNzYWdlIHNpemUgaXMgaW52YWxpZAorKiAtS1ZNX0VB
R0FJTiAtIHRoZSBzZWxlY3RlZCB2Q1BVIGNhbid0IGJlIGludHJvc3BlY3RlZCB5ZXQKKyogLUtW
TV9FTk9NRU0gLSB0aGVyZSBpcyBub3QgZW5vdWdoIG1lbW9yeSB0byBhZGQgdGhlIHBhZ2UgdHJh
Y2tpbmcgc3RydWN0dXJlcworCiBFdmVudHMKID09PT09PQogCmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAppbmRleCA1ZjNiNmYyMDcxOGYuLjA4ZjgyZTdkNDYyYiAxMDA2NDQKLS0tIGEvYXJjaC94ODYv
aW5jbHVkZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oCkBAIC00NSw2ICs0NSw4IEBACiAjZGVmaW5lIEtWTV9QUklWQVRFX01FTV9TTE9UUyAzCiAj
ZGVmaW5lIEtWTV9NRU1fU0xPVFNfTlVNIChLVk1fVVNFUl9NRU1fU0xPVFMgKyBLVk1fUFJJVkFU
RV9NRU1fU0xPVFMpCiAKKyNpbmNsdWRlIDxhc20va3ZtaV9ob3N0Lmg+CisKICNkZWZpbmUgS1ZN
X0hBTFRfUE9MTF9OU19ERUZBVUxUIDIwMDAwMAogCiAjZGVmaW5lIEtWTV9JUlFDSElQX05VTV9Q
SU5TICBLVk1fSU9BUElDX05VTV9QSU5TCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1pX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bWlfaG9zdC5oCmluZGV4IGU2
YmIyZDZmMTlkMC4uNDQ2ZjZjM2RkZjRlIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1pX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1pX2hvc3QuaApAQCAt
Miw2ICsyLDggQEAKICNpZm5kZWYgX0FTTV9YODZfS1ZNSV9IT1NUX0gKICNkZWZpbmUgX0FTTV9Y
ODZfS1ZNSV9IT1NUX0gKIAorI2luY2x1ZGUgPGFzbS9rdm1fcGFnZV90cmFjay5oPgorCiBzdHJ1
Y3QgbXNyX2RhdGE7CiAKICNkZWZpbmUgS1ZNSV9OVU1fQ1IgNQpAQCAtMzksNiArNDEsMTIgQEAg
c3RydWN0IGt2bV92Y3B1X2FyY2hfaW50cm9zcGVjdGlvbiB7CiBzdHJ1Y3Qga3ZtX2FyY2hfaW50
cm9zcGVjdGlvbiB7CiB9OwogCisjZGVmaW5lIFNMT1RTX1NJWkUgQklUU19UT19MT05HUyhLVk1f
TUVNX1NMT1RTX05VTSkKKworc3RydWN0IGt2bWlfYXJjaF9tZW1fYWNjZXNzIHsKKwl1bnNpZ25l
ZCBsb25nIGFjdGl2ZVtLVk1fUEFHRV9UUkFDS19NQVhdW1NMT1RTX1NJWkVdOworfTsKKwogI2lm
ZGVmIENPTkZJR19LVk1fSU5UUk9TUEVDVElPTgogCiBib29sIGt2bWlfbW9uaXRvcl9icF9pbnRl
cmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgZGJnKTsKZGlmZiAtLWdpdCBhL2FyY2gv
eDg2L2t2bS9rdm1pLmMgYi9hcmNoL3g4Ni9rdm0va3ZtaS5jCmluZGV4IGNjYjExZTU1M2JkZS4u
MzI4NzgzZDllMzQxIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0va3ZtaS5jCisrKyBiL2FyY2gv
eDg2L2t2bS9rdm1pLmMKQEAgLTExMDUsMyArMTEwNSw3NiBAQCBib29sIGt2bWlfbXNyX2V2ZW50
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IG1zcl9kYXRhICptc3IpCiAKIAlyZXR1cm4g
cmV0OwogfQorCitzdGF0aWMgY29uc3Qgc3RydWN0IHsKKwl1bnNpZ25lZCBpbnQgYWxsb3dfYml0
OworCWVudW0ga3ZtX3BhZ2VfdHJhY2tfbW9kZSB0cmFja19tb2RlOworfSB0cmFja19tb2Rlc1td
ID0geworCXsgS1ZNSV9QQUdFX0FDQ0VTU19SLCBLVk1fUEFHRV9UUkFDS19QUkVSRUFEIH0sCisJ
eyBLVk1JX1BBR0VfQUNDRVNTX1csIEtWTV9QQUdFX1RSQUNLX1BSRVdSSVRFIH0sCisJeyBLVk1J
X1BBR0VfQUNDRVNTX1gsIEtWTV9QQUdFX1RSQUNLX1BSRUVYRUMgfSwKK307CisKK3ZvaWQga3Zt
aV9hcmNoX3VwZGF0ZV9wYWdlX3RyYWNraW5nKHN0cnVjdCBrdm0gKmt2bSwKKwkJCQkgICAgc3Ry
dWN0IGt2bV9tZW1vcnlfc2xvdCAqc2xvdCwKKwkJCQkgICAgc3RydWN0IGt2bWlfbWVtX2FjY2Vz
cyAqbSkKK3sKKwlzdHJ1Y3Qga3ZtaV9hcmNoX21lbV9hY2Nlc3MgKmFyY2ggPSAmbS0+YXJjaDsK
KwlpbnQgaTsKKworCWlmICghc2xvdCkgeworCQlzbG90ID0gZ2ZuX3RvX21lbXNsb3Qoa3ZtLCBt
LT5nZm4pOworCQlpZiAoIXNsb3QpCisJCQlyZXR1cm47CisJfQorCisJZm9yIChpID0gMDsgaSA8
IEFSUkFZX1NJWkUodHJhY2tfbW9kZXMpOyBpKyspIHsKKwkJdW5zaWduZWQgaW50IGFsbG93X2Jp
dCA9IHRyYWNrX21vZGVzW2ldLmFsbG93X2JpdDsKKwkJZW51bSBrdm1fcGFnZV90cmFja19tb2Rl
IG1vZGUgPSB0cmFja19tb2Rlc1tpXS50cmFja19tb2RlOworCQlib29sIHNsb3RfdHJhY2tlZCA9
IHRlc3RfYml0KHNsb3QtPmlkLCBhcmNoLT5hY3RpdmVbbW9kZV0pOworCisJCWlmIChtLT5hY2Nl
c3MgJiBhbGxvd19iaXQpIHsKKwkJCWlmIChzbG90X3RyYWNrZWQpIHsKKwkJCQlrdm1fc2xvdF9w
YWdlX3RyYWNrX3JlbW92ZV9wYWdlKGt2bSwgc2xvdCwKKwkJCQkJCQkJbS0+Z2ZuLCBtb2RlKTsK
KwkJCQljbGVhcl9iaXQoc2xvdC0+aWQsIGFyY2gtPmFjdGl2ZVttb2RlXSk7CisJCQl9CisJCX0g
ZWxzZSBpZiAoIXNsb3RfdHJhY2tlZCkgeworCQkJa3ZtX3Nsb3RfcGFnZV90cmFja19hZGRfcGFn
ZShrdm0sIHNsb3QsIG0tPmdmbiwgbW9kZSk7CisJCQlzZXRfYml0KHNsb3QtPmlkLCBhcmNoLT5h
Y3RpdmVbbW9kZV0pOworCQl9CisJfQorfQorCitpbnQga3ZtaV9hcmNoX2NtZF9zZXRfcGFnZV9h
Y2Nlc3Moc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLAorCQkJCSAgY29uc3Qgc3RydWN0
IGt2bWlfbXNnX2hkciAqbXNnLAorCQkJCSAgY29uc3Qgc3RydWN0IGt2bWlfdm1fc2V0X3BhZ2Vf
YWNjZXNzICpyZXEpCit7CisJY29uc3Qgc3RydWN0IGt2bWlfcGFnZV9hY2Nlc3NfZW50cnkgKmVu
dHJ5ID0gcmVxLT5lbnRyaWVzOworCWNvbnN0IHN0cnVjdCBrdm1pX3BhZ2VfYWNjZXNzX2VudHJ5
ICplbmQgPSByZXEtPmVudHJpZXMgKyByZXEtPmNvdW50OworCXU4IHVua25vd25fYml0cyA9IH4o
S1ZNSV9QQUdFX0FDQ0VTU19SIHwgS1ZNSV9QQUdFX0FDQ0VTU19XCisJCQkgICAgfCBLVk1JX1BB
R0VfQUNDRVNTX1gpOworCWludCBlYyA9IDA7CisKKwlpZiAocmVxLT5wYWRkaW5nMSB8fCByZXEt
PnBhZGRpbmcyKQorCQlyZXR1cm4gLUtWTV9FSU5WQUw7CisKKwlpZiAobXNnLT5zaXplICE9IHN0
cnVjdF9zaXplKHJlcSwgZW50cmllcywgcmVxLT5jb3VudCkpCisJCXJldHVybiAtS1ZNX0VJTlZB
TDsKKworCWZvciAoOyBlbnRyeSA8IGVuZDsgZW50cnkrKykgeworCQlpbnQgcjsKKworCQlpZiAo
KGVudHJ5LT5hY2Nlc3MgJiB1bmtub3duX2JpdHMpIHx8IGVudHJ5LT5wYWRkaW5nMQorCQkJCXx8
IGVudHJ5LT5wYWRkaW5nMiB8fCBlbnRyeS0+cGFkZGluZzMpCisJCQlyID0gLUtWTV9FSU5WQUw7
CisJCWVsc2UKKwkJCXIgPSBrdm1pX2NtZF9zZXRfcGFnZV9hY2Nlc3Moa3ZtaSwgZW50cnktPmdw
YSwKKwkJCQkJCSAgICAgIGVudHJ5LT5hY2Nlc3MpOworCQlpZiAociAmJiAhZWMpCisJCQllYyA9
IHI7CisJfQorCisJcmV0dXJuIGVjOworfQorCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2t2
bWlfaG9zdC5oIGIvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAppbmRleCBlNjRmMmJiZDAzM2Eu
LmM5ZGQyZDU3MDMzYiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9rdm1pX2hvc3QuaAorKysg
Yi9pbmNsdWRlL2xpbnV4L2t2bWlfaG9zdC5oCkBAIC02Nyw2ICs2Nyw5IEBAIHN0cnVjdCBrdm1f
aW50cm9zcGVjdGlvbiB7CiAJREVDTEFSRV9CSVRNQVAodm1fZXZlbnRfZW5hYmxlX21hc2ssIEtW
TUlfTlVNX0VWRU5UUyk7CiAKIAlhdG9taWNfdCBldl9zZXE7CisKKwlzdHJ1Y3QgcmFkaXhfdHJl
ZV9yb290IGFjY2Vzc190cmVlOworCXJ3bG9ja190IGFjY2Vzc190cmVlX2xvY2s7CiB9OwogCiAj
aWZkZWYgQ09ORklHX0tWTV9JTlRST1NQRUNUSU9OCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkv
bGludXgva3ZtaS5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAppbmRleCAwNGU2OTcxZWEw
YWYuLmRhMGNlM2U0MWNkZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2t2bWkuaAor
KysgYi9pbmNsdWRlL3VhcGkvbGludXgva3ZtaS5oCkBAIC00MCw2ICs0MCw4IEBAIGVudW0gewog
CUtWTUlfVkNQVV9HRVRfTVRSUl9UWVBFID0gMTksCiAJS1ZNSV9WQ1BVX0NPTlRST0xfTVNSICAg
PSAyMCwKIAorCUtWTUlfVk1fU0VUX1BBR0VfQUNDRVNTID0gMjEsCisKIAlLVk1JX05VTV9NRVNT
QUdFUwogfTsKIApAQCAtNjMsNiArNjUsMTIgQEAgZW51bSB7CiAJS1ZNSV9FVkVOVF9BQ1RJT05f
Q1JBU0ggICAgPSAyLAogfTsKIAorZW51bSB7CisJS1ZNSV9QQUdFX0FDQ0VTU19SID0gMSA8PCAw
LAorCUtWTUlfUEFHRV9BQ0NFU1NfVyA9IDEgPDwgMSwKKwlLVk1JX1BBR0VfQUNDRVNTX1ggPSAx
IDw8IDIsCit9OworCiBzdHJ1Y3Qga3ZtaV9tc2dfaGRyIHsKIAlfX3UxNiBpZDsKIAlfX3UxNiBz
aXplOwpAQCAtMTUzLDYgKzE2MSwyMSBAQCBzdHJ1Y3Qga3ZtaV92bV9nZXRfbWF4X2dmbl9yZXBs
eSB7CiAJX191NjQgZ2ZuOwogfTsKIAorc3RydWN0IGt2bWlfcGFnZV9hY2Nlc3NfZW50cnkgewor
CV9fdTY0IGdwYTsKKwlfX3U4IGFjY2VzczsKKwlfX3U4IHBhZGRpbmcxOworCV9fdTE2IHBhZGRp
bmcyOworCV9fdTMyIHBhZGRpbmczOworfTsKKworc3RydWN0IGt2bWlfdm1fc2V0X3BhZ2VfYWNj
ZXNzIHsKKwlfX3UxNiBjb3VudDsKKwlfX3UxNiBwYWRkaW5nMTsKKwlfX3UzMiBwYWRkaW5nMjsK
KwlzdHJ1Y3Qga3ZtaV9wYWdlX2FjY2Vzc19lbnRyeSBlbnRyaWVzWzBdOworfTsKKwogc3RydWN0
IGt2bWlfZXZlbnQgewogCV9fdTE2IHNpemU7CiAJX191MTYgdmNwdTsKZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQva3ZtaV90ZXN0LmMgYi90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0veDg2XzY0L2t2bWlfdGVzdC5jCmluZGV4IDk1NWVmNTVlMTM0Ni4u
YzJhYjI4ZjY0MjdmIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0veDg2
XzY0L2t2bWlfdGVzdC5jCisrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS94ODZfNjQv
a3ZtaV90ZXN0LmMKQEAgLTE1MzgsNiArMTUzOCw1OCBAQCBzdGF0aWMgdm9pZCB0ZXN0X2NtZF92
Y3B1X2NvbnRyb2xfbXNyKHN0cnVjdCBrdm1fdm0gKnZtKQogCQltc3IsIG1zcl9kYXRhLCBldi5t
c3Iub2xkX3ZhbHVlKTsKIH0KIAorc3RhdGljIGludCBjbWRfc2V0X3BhZ2VfYWNjZXNzKF9fdTE2
IGNvdW50LCBfX3U2NCAqZ3BhLCBfX3U4ICphY2Nlc3MpCit7CisJc3RydWN0IGt2bWlfcGFnZV9h
Y2Nlc3NfZW50cnkgKmVudHJ5LCAqZW5kOworCXN0cnVjdCBrdm1pX3ZtX3NldF9wYWdlX2FjY2Vz
cyAqY21kOworCXN0cnVjdCBrdm1pX21zZ19oZHIgKnJlcTsKKwlzaXplX3QgcmVxX3NpemU7CisJ
aW50IHI7CisKKwlyZXFfc2l6ZSA9IHNpemVvZigqcmVxKSArIHNpemVvZigqY21kKSArIGNvdW50
ICogc2l6ZW9mKCplbnRyeSk7CisKKwlyZXEgPSBjYWxsb2MoMSwgcmVxX3NpemUpOworCisJVEVT
VF9BU1NFUlQocmVxLCAiSW5zdWZmaWNpZW50IE1lbW9yeVxuIik7CisKKwljbWQgPSAoc3RydWN0
IGt2bWlfdm1fc2V0X3BhZ2VfYWNjZXNzICopKHJlcSArIDEpOworCWNtZC0+Y291bnQgPSBjb3Vu
dDsKKworCWVudHJ5ID0gY21kLT5lbnRyaWVzOworCWVuZCA9IGNtZC0+ZW50cmllcyArIGNvdW50
OworCWZvciAoOyBlbnRyeSA8IGVuZDsgZW50cnkrKykgeworCQllbnRyeS0+Z3BhID0gKmdwYSsr
OworCQllbnRyeS0+YWNjZXNzID0gKmFjY2VzcysrOworCX0KKworCXIgPSBkb19jb21tYW5kKEtW
TUlfVk1fU0VUX1BBR0VfQUNDRVNTLCByZXEsIHJlcV9zaXplLCBOVUxMLCAwKTsKKworCWZyZWUo
cmVxKTsKKwlyZXR1cm4gcjsKK30KKworc3RhdGljIHZvaWQgc2V0X3BhZ2VfYWNjZXNzKF9fdTY0
IGdwYSwgX191OCBhY2Nlc3MpCit7CisJaW50IHI7CisKKwlyID0gY21kX3NldF9wYWdlX2FjY2Vz
cygxLCAmZ3BhLCAmYWNjZXNzKTsKKwlURVNUX0FTU0VSVChyID09IDAsCisJCSJLVk1JX1ZNX1NF
VF9QQUdFX0FDQ0VTUyBmYWlsZWQsIGdwYSAweCVsbHgsIGFjY2VzcyAweCV4LCBlcnJvciAlZCAo
JXMpXG4iLAorCQlncGEsIGFjY2VzcywgLXIsIGt2bV9zdHJlcnJvcigtcikpOworfQorCitzdGF0
aWMgdm9pZCB0ZXN0X2NtZF92bV9zZXRfcGFnZV9hY2Nlc3Moc3RydWN0IGt2bV92bSAqdm0pCit7
CisJX191OCBmdWxsX2FjY2VzcyA9IEtWTUlfUEFHRV9BQ0NFU1NfUiB8IEtWTUlfUEFHRV9BQ0NF
U1NfVworCQkJfCBLVk1JX1BBR0VfQUNDRVNTX1g7CisJX191OCBub19hY2Nlc3MgPSAwOworCV9f
dTY0IGdwYSA9IDA7CisKKwlzZXRfcGFnZV9hY2Nlc3MoZ3BhLCBub19hY2Nlc3MpOworCisJc2V0
X3BhZ2VfYWNjZXNzKGdwYSwgZnVsbF9hY2Nlc3MpOworfQorCiBzdGF0aWMgdm9pZCB0ZXN0X2lu
dHJvc3BlY3Rpb24oc3RydWN0IGt2bV92bSAqdm0pCiB7CiAJc3JhbmRvbSh0aW1lKDApKTsKQEAg
LTE1NjgsNiArMTYyMCw3IEBAIHN0YXRpYyB2b2lkIHRlc3RfaW50cm9zcGVjdGlvbihzdHJ1Y3Qg
a3ZtX3ZtICp2bSkKIAl0ZXN0X2NtZF92Y3B1X2dldF9tdHJyX3R5cGUodm0pOwogCXRlc3RfZXZl
bnRfZGVzY3JpcHRvcih2bSk7CiAJdGVzdF9jbWRfdmNwdV9jb250cm9sX21zcih2bSk7CisJdGVz
dF9jbWRfdm1fc2V0X3BhZ2VfYWNjZXNzKHZtKTsKIAogCXVuaG9va19pbnRyb3NwZWN0aW9uKHZt
KTsKIH0KZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jIGIvdmlydC9r
dm0vaW50cm9zcGVjdGlvbi9rdm1pLmMKaW5kZXggYTg1OGFiYTE2NzJkLi4yNjI5ZDNkMWY2OGMg
MTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaS5jCisrKyBiL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaS5jCkBAIC0yMCw2ICsyMCwxMSBAQCBERUNMQVJFX0JJVE1BUChL
dm1pX2tub3duX3ZjcHVfZXZlbnRzLCBLVk1JX05VTV9FVkVOVFMpOwogCiBzdGF0aWMgc3RydWN0
IGttZW1fY2FjaGUgKm1zZ19jYWNoZTsKIHN0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqam9iX2Nh
Y2hlOworc3RhdGljIHN0cnVjdCBrbWVtX2NhY2hlICpyYWRpeF9jYWNoZTsKKworc3RhdGljIGNv
bnN0IHU4IGZ1bGxfYWNjZXNzICA9CUtWTUlfUEFHRV9BQ0NFU1NfUiB8CisJCQkJS1ZNSV9QQUdF
X0FDQ0VTU19XIHwKKwkJCQlLVk1JX1BBR0VfQUNDRVNTX1g7CiAKIHZvaWQgKmt2bWlfbXNnX2Fs
bG9jKHZvaWQpCiB7CkBAIC00NSw2ICs1MCw4IEBAIHN0YXRpYyB2b2lkIGt2bWlfY2FjaGVfZGVz
dHJveSh2b2lkKQogCW1zZ19jYWNoZSA9IE5VTEw7CiAJa21lbV9jYWNoZV9kZXN0cm95KGpvYl9j
YWNoZSk7CiAJam9iX2NhY2hlID0gTlVMTDsKKwlrbWVtX2NhY2hlX2Rlc3Ryb3kocmFkaXhfY2Fj
aGUpOworCXJhZGl4X2NhY2hlID0gTlVMTDsKIH0KIAogc3RhdGljIGludCBrdm1pX2NhY2hlX2Ny
ZWF0ZSh2b2lkKQpAQCAtNTQsOCArNjEsMTEgQEAgc3RhdGljIGludCBrdm1pX2NhY2hlX2NyZWF0
ZSh2b2lkKQogCWpvYl9jYWNoZSA9IGttZW1fY2FjaGVfY3JlYXRlKCJrdm1pX2pvYiIsCiAJCQkJ
ICAgICAgc2l6ZW9mKHN0cnVjdCBrdm1pX2pvYiksCiAJCQkJICAgICAgMCwgU0xBQl9BQ0NPVU5U
LCBOVUxMKTsKKwlyYWRpeF9jYWNoZSA9IGttZW1fY2FjaGVfY3JlYXRlKCJrdm1pX3JhZGl4X3Ry
ZWUiLAorCQkJCQlzaXplb2Yoc3RydWN0IGt2bWlfbWVtX2FjY2VzcyksCisJCQkJCTAsIFNMQUJf
QUNDT1VOVCwgTlVMTCk7CiAKLQlpZiAoIW1zZ19jYWNoZSB8fCAham9iX2NhY2hlKSB7CisJaWYg
KCFtc2dfY2FjaGUgfHwgIWpvYl9jYWNoZSB8fCAhcmFkaXhfY2FjaGUpIHsKIAkJa3ZtaV9jYWNo
ZV9kZXN0cm95KCk7CiAKIAkJcmV0dXJuIC0xOwpAQCAtMjA5LDExICsyMTksMzcgQEAgc3RhdGlj
IHZvaWQgZnJlZV92Y3B1aShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJa3ZtaV9tYWtlX3JlcXVl
c3QodmNwdSwgZmFsc2UpOwogfQogCitzdGF0aWMgdm9pZCBrdm1pX2NsZWFyX21lbV9hY2Nlc3Mo
c3RydWN0IGt2bSAqa3ZtKQoreworCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSA9IEtW
TUkoa3ZtKTsKKwlzdHJ1Y3QgcmFkaXhfdHJlZV9pdGVyIGl0ZXI7CisJdm9pZCAqKnNsb3Q7CisJ
aW50IGlkeDsKKworCWlkeCA9IHNyY3VfcmVhZF9sb2NrKCZrdm0tPnNyY3UpOworCXNwaW5fbG9j
aygma3ZtLT5tbXVfbG9jayk7CisKKwlyYWRpeF90cmVlX2Zvcl9lYWNoX3Nsb3Qoc2xvdCwgJmt2
bWktPmFjY2Vzc190cmVlLCAmaXRlciwgMCkgeworCQlzdHJ1Y3Qga3ZtaV9tZW1fYWNjZXNzICpt
ID0gKnNsb3Q7CisKKwkJbS0+YWNjZXNzID0gZnVsbF9hY2Nlc3M7CisJCWt2bWlfYXJjaF91cGRh
dGVfcGFnZV90cmFja2luZyhrdm0sIE5VTEwsIG0pOworCisJCXJhZGl4X3RyZWVfaXRlcl9kZWxl
dGUoJmt2bWktPmFjY2Vzc190cmVlLCAmaXRlciwgc2xvdCk7CisJCWttZW1fY2FjaGVfZnJlZShy
YWRpeF9jYWNoZSwgbSk7CisJfQorCisJc3Bpbl91bmxvY2soJmt2bS0+bW11X2xvY2spOworCXNy
Y3VfcmVhZF91bmxvY2soJmt2bS0+c3JjdSwgaWR4KTsKK30KKwogc3RhdGljIHZvaWQgZnJlZV9r
dm1pKHN0cnVjdCBrdm0gKmt2bSkKIHsKIAlzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7CiAJaW50IGk7
CiAKKwlrdm1pX2NsZWFyX21lbV9hY2Nlc3Moa3ZtKTsKKwogCWt2bV9mb3JfZWFjaF92Y3B1KGks
IHZjcHUsIGt2bSkKIAkJZnJlZV92Y3B1aSh2Y3B1KTsKIApAQCAtMjQ4LDYgKzI4NCwxMCBAQCBh
bGxvY19rdm1pKHN0cnVjdCBrdm0gKmt2bSwgY29uc3Qgc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9u
X2hvb2sgKmhvb2spCiAKIAlhdG9taWNfc2V0KCZrdm1pLT5ldl9zZXEsIDApOwogCisJSU5JVF9S
QURJWF9UUkVFKCZrdm1pLT5hY2Nlc3NfdHJlZSwKKwkJCUdGUF9LRVJORUwgJiB+X19HRlBfRElS
RUNUX1JFQ0xBSU0pOworCXJ3bG9ja19pbml0KCZrdm1pLT5hY2Nlc3NfdHJlZV9sb2NrKTsKKwog
CWt2bV9mb3JfZWFjaF92Y3B1KGksIHZjcHUsIGt2bSkgewogCQlpbnQgZXJyID0gY3JlYXRlX3Zj
cHVpKHZjcHUpOwogCkBAIC05NTksMyArOTk5LDk2IEBAIGJvb2wga3ZtaV9lbnRlcl9ndWVzdChz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJa3ZtaV9wdXQodmNwdS0+a3ZtKTsKIAlyZXR1cm4gcjsK
IH0KKworc3RhdGljIHN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKgorX19rdm1pX2dldF9nZm5fYWNj
ZXNzKHN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwgY29uc3QgZ2ZuX3QgZ2ZuKQorewor
CXJldHVybiByYWRpeF90cmVlX2xvb2t1cCgma3ZtaS0+YWNjZXNzX3RyZWUsIGdmbik7Cit9CisK
K3N0YXRpYyB2b2lkIGt2bWlfdXBkYXRlX21lbV9hY2Nlc3Moc3RydWN0IGt2bSAqa3ZtLCBzdHJ1
Y3Qga3ZtaV9tZW1fYWNjZXNzICptKQoreworCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAqa3Zt
aSA9IEtWTUkoa3ZtKTsKKworCWt2bWlfYXJjaF91cGRhdGVfcGFnZV90cmFja2luZyhrdm0sIE5V
TEwsIG0pOworCisJaWYgKG0tPmFjY2VzcyA9PSBmdWxsX2FjY2VzcykgeworCQlyYWRpeF90cmVl
X2RlbGV0ZSgma3ZtaS0+YWNjZXNzX3RyZWUsIG0tPmdmbik7CisJCWttZW1fY2FjaGVfZnJlZShy
YWRpeF9jYWNoZSwgbSk7CisJfQorfQorCitzdGF0aWMgYm9vbCBrdm1pX2luc2VydF9tZW1fYWNj
ZXNzKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bWlfbWVtX2FjY2VzcyAqbSkKK3sKKwlzdHJ1
Y3Qga3ZtX2ludHJvc3BlY3Rpb24gKmt2bWkgPSBLVk1JKGt2bSk7CisKKwlpZiAoIWt2bV9pc192
aXNpYmxlX2dmbihrdm0sIG0tPmdmbikpCisJCXJldHVybiBmYWxzZTsKKworCWlmIChtLT5hY2Nl
c3MgPT0gZnVsbF9hY2Nlc3MpCisJCXJldHVybiBmYWxzZTsKKworCXJhZGl4X3RyZWVfaW5zZXJ0
KCZrdm1pLT5hY2Nlc3NfdHJlZSwgbS0+Z2ZuLCBtKTsKKwlrdm1pX2FyY2hfdXBkYXRlX3BhZ2Vf
dHJhY2tpbmcoa3ZtLCBOVUxMLCBtKTsKKworCXJldHVybiB0cnVlOworfQorCitzdGF0aWMgdm9p
ZCBrdm1pX3NldF9tZW1fYWNjZXNzKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bWlfbWVtX2Fj
Y2VzcyAqbSwKKwkJCQlib29sICpkb25lKQoreworCXN0cnVjdCBrdm1faW50cm9zcGVjdGlvbiAq
a3ZtaSA9IEtWTUkoa3ZtKTsKKwlzdHJ1Y3Qga3ZtaV9tZW1fYWNjZXNzICpmb3VuZDsKKwlpbnQg
aWR4OworCisJaWR4ID0gc3JjdV9yZWFkX2xvY2soJmt2bS0+c3JjdSk7CisJc3Bpbl9sb2NrKCZr
dm0tPm1tdV9sb2NrKTsKKwl3cml0ZV9sb2NrKCZrdm1pLT5hY2Nlc3NfdHJlZV9sb2NrKTsKKwor
CWZvdW5kID0gX19rdm1pX2dldF9nZm5fYWNjZXNzKGt2bWksIG0tPmdmbik7CisJaWYgKGZvdW5k
KSB7CisJCWZvdW5kLT5hY2Nlc3MgPSBtLT5hY2Nlc3M7CisJCWt2bWlfdXBkYXRlX21lbV9hY2Nl
c3Moa3ZtLCBmb3VuZCk7CisJfSBlbHNlIHsKKwkJaWYgKGt2bWlfaW5zZXJ0X21lbV9hY2Nlc3Mo
a3ZtLCBtKSkKKwkJCSpkb25lID0gdHJ1ZTsKKwl9CisKKwl3cml0ZV91bmxvY2soJmt2bWktPmFj
Y2Vzc190cmVlX2xvY2spOworCXNwaW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKKwlzcmN1X3Jl
YWRfdW5sb2NrKCZrdm0tPnNyY3UsIGlkeCk7Cit9CisKK3N0YXRpYyBpbnQga3ZtaV9zZXRfZ2Zu
X2FjY2VzcyhzdHJ1Y3Qga3ZtICprdm0sIGdmbl90IGdmbiwgdTggYWNjZXNzKQoreworCXN0cnVj
dCBrdm1pX21lbV9hY2Nlc3MgKm07CisJYm9vbCBkb25lID0gZmFsc2U7CisJaW50IGVyciA9IDA7
CisKKwltID0ga21lbV9jYWNoZV96YWxsb2MocmFkaXhfY2FjaGUsIEdGUF9LRVJORUwpOworCWlm
ICghbSkKKwkJcmV0dXJuIC1LVk1fRU5PTUVNOworCisJbS0+Z2ZuID0gZ2ZuOworCW0tPmFjY2Vz
cyA9IGFjY2VzczsKKworCWlmIChyYWRpeF90cmVlX3ByZWxvYWQoR0ZQX0tFUk5FTCkpCisJCWVy
ciA9IC1LVk1fRU5PTUVNOworCWVsc2UKKwkJa3ZtaV9zZXRfbWVtX2FjY2Vzcyhrdm0sIG0sICZk
b25lKTsKKworCXJhZGl4X3RyZWVfcHJlbG9hZF9lbmQoKTsKKworCWlmICghZG9uZSkKKwkJa21l
bV9jYWNoZV9mcmVlKHJhZGl4X2NhY2hlLCBtKTsKKworCXJldHVybiBlcnI7Cit9CisKK2ludCBr
dm1pX2NtZF9zZXRfcGFnZV9hY2Nlc3Moc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9uICprdm1pLCB1
NjQgZ3BhLCB1OCBhY2Nlc3MpCit7CisJZ2ZuX3QgZ2ZuID0gZ3BhX3RvX2dmbihncGEpOworCisJ
cmV0dXJuIGt2bWlfc2V0X2dmbl9hY2Nlc3Moa3ZtaS0+a3ZtLCBnZm4sIGFjY2Vzcyk7Cit9CisK
ZGlmZiAtLWdpdCBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaCBiL3ZpcnQva3Zt
L2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaAppbmRleCBiYTRiZGZhZWYyMGQuLjIzN2JiMDgzY2Yw
MSAxMDA2NDQKLS0tIGEvdmlydC9rdm0vaW50cm9zcGVjdGlvbi9rdm1pX2ludC5oCisrKyBiL3Zp
cnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9pbnQuaApAQCAtMjMsNiArMjMsMTIgQEAgZXh0ZXJu
IERFQ0xBUkVfQklUTUFQKEt2bWlfa25vd25fdmNwdV9ldmVudHMsIEtWTUlfTlVNX0VWRU5UUyk7
CiAjZGVmaW5lIEtWTUkoa3ZtKSAoKGt2bSktPmt2bWkpCiAjZGVmaW5lIFZDUFVJKHZjcHUpICgo
dmNwdSktPmt2bWkpCiAKK3N0cnVjdCBrdm1pX21lbV9hY2Nlc3MgeworCWdmbl90IGdmbjsKKwl1
OCBhY2Nlc3M7CisJc3RydWN0IGt2bWlfYXJjaF9tZW1fYWNjZXNzIGFyY2g7Cit9OworCiBzdGF0
aWMgaW5saW5lIGJvb2wgaXNfZXZlbnRfZW5hYmxlZChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGlu
dCBldmVudCkKIHsKIAlyZXR1cm4gdGVzdF9iaXQoZXZlbnQsIFZDUFVJKHZjcHUpLT5ldl9lbmFi
bGVfbWFzayk7CkBAIC03Miw2ICs3OCw4IEBAIGludCBrdm1pX2NtZF93cml0ZV9waHlzaWNhbChz
dHJ1Y3Qga3ZtICprdm0sIHU2NCBncGEsIHNpemVfdCBzaXplLAogaW50IGt2bWlfY21kX3ZjcHVf
cGF1c2Uoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIHdhaXQpOwogaW50IGt2bWlfY21kX3Zj
cHVfc2V0X3JlZ2lzdGVycyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsCiAJCQkJY29uc3Qgc3RydWN0
IGt2bV9yZWdzICpyZWdzKTsKK2ludCBrdm1pX2NtZF9zZXRfcGFnZV9hY2Nlc3Moc3RydWN0IGt2
bV9pbnRyb3NwZWN0aW9uICprdm1pLCB1NjQgZ3BhLAorCQkJICAgICB1OCBhY2Nlc3MpOwogCiAv
KiBhcmNoICovCiBib29sIGt2bWlfYXJjaF92Y3B1X2FsbG9jKHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSk7CkBAIC0xMDksNSArMTE3LDExIEBAIGludCBrdm1pX2FyY2hfY21kX3ZjcHVfZ2V0X3hzYXZl
KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKIGludCBrdm1pX2FyY2hfY21kX3ZjcHVfZ2V0X210cnJf
dHlwZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHU2NCBncGEsIHU4ICp0eXBlKTsKIGludCBrdm1p
X2FyY2hfY21kX3ZjcHVfY29udHJvbF9tc3Ioc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJCSAg
IGNvbnN0IHN0cnVjdCBrdm1pX3ZjcHVfY29udHJvbF9tc3IgKnJlcSk7Cit2b2lkIGt2bWlfYXJj
aF91cGRhdGVfcGFnZV90cmFja2luZyhzdHJ1Y3Qga3ZtICprdm0sCisJCQkJICAgIHN0cnVjdCBr
dm1fbWVtb3J5X3Nsb3QgKnNsb3QsCisJCQkJICAgIHN0cnVjdCBrdm1pX21lbV9hY2Nlc3MgKm0p
OworaW50IGt2bWlfYXJjaF9jbWRfc2V0X3BhZ2VfYWNjZXNzKHN0cnVjdCBrdm1faW50cm9zcGVj
dGlvbiAqa3ZtaSwKKwkJCQkgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19oZHIgKm1zZywKKwkJCQkg
IGNvbnN0IHN0cnVjdCBrdm1pX3ZtX3NldF9wYWdlX2FjY2VzcyAqcmVxKTsKIAogI2VuZGlmCmRp
ZmYgLS1naXQgYS92aXJ0L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMgYi92aXJ0L2t2bS9p
bnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKaW5kZXggMTkxYjYwYzI5MGVlLi45NzNlZDlkOTJiZmIg
MTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2ludHJvc3BlY3Rpb24va3ZtaV9tc2cuYworKysgYi92aXJ0
L2t2bS9pbnRyb3NwZWN0aW9uL2t2bWlfbXNnLmMKQEAgLTI4LDYgKzI4LDcgQEAgc3RhdGljIGNv
bnN0IGNoYXIgKmNvbnN0IG1zZ19JRHNbXSA9IHsKIAlbS1ZNSV9WTV9HRVRfSU5GT10gICAgICAg
ICAgID0gIktWTUlfVk1fR0VUX0lORk8iLAogCVtLVk1JX1ZNX0dFVF9NQVhfR0ZOXSAgICAgICAg
PSAiS1ZNSV9WTV9HRVRfTUFYX0dGTiIsCiAJW0tWTUlfVk1fUkVBRF9QSFlTSUNBTF0gICAgICA9
ICJLVk1JX1ZNX1JFQURfUEhZU0lDQUwiLAorCVtLVk1JX1ZNX1NFVF9QQUdFX0FDQ0VTU10gICAg
PSAiS1ZNSV9WTV9TRVRfUEFHRV9BQ0NFU1MiLAogCVtLVk1JX1ZNX1dSSVRFX1BIWVNJQ0FMXSAg
ICAgPSAiS1ZNSV9WTV9XUklURV9QSFlTSUNBTCIsCiAJW0tWTUlfVkNQVV9DT05UUk9MX0NSXSAg
ICAgICA9ICJLVk1JX1ZDUFVfQ09OVFJPTF9DUiIsCiAJW0tWTUlfVkNQVV9DT05UUk9MX0VWRU5U
U10gICA9ICJLVk1JX1ZDUFVfQ09OVFJPTF9FVkVOVFMiLApAQCAtMzY0LDIwICszNjUsMzIgQEAg
c3RhdGljIGludCBoYW5kbGVfdm1fZ2V0X21heF9nZm4oc3RydWN0IGt2bV9pbnRyb3NwZWN0aW9u
ICprdm1pLAogCXJldHVybiBrdm1pX21zZ192bV9yZXBseShrdm1pLCBtc2csIDAsICZycGwsIHNp
emVvZihycGwpKTsKIH0KIAorc3RhdGljIGludCBoYW5kbGVfc2V0X3BhZ2VfYWNjZXNzKHN0cnVj
dCBrdm1faW50cm9zcGVjdGlvbiAqa3ZtaSwKKwkJCQkgIGNvbnN0IHN0cnVjdCBrdm1pX21zZ19o
ZHIgKm1zZywKKwkJCQkgIGNvbnN0IHZvaWQgKnJlcSkKK3sKKwlpbnQgZWM7CisKKwllYyA9IGt2
bWlfYXJjaF9jbWRfc2V0X3BhZ2VfYWNjZXNzKGt2bWksIG1zZywgcmVxKTsKKworCXJldHVybiBr
dm1pX21zZ192bV9yZXBseShrdm1pLCBtc2csIGVjLCBOVUxMLCAwKTsKK30KKwogLyoKICAqIFRo
ZXNlIGNvbW1hbmRzIGFyZSBleGVjdXRlZCBieSB0aGUgcmVjZWl2aW5nIHRocmVhZC93b3JrZXIu
CiAgKi8KIHN0YXRpYyBpbnQoKmNvbnN0IG1zZ192bVtdKShzdHJ1Y3Qga3ZtX2ludHJvc3BlY3Rp
b24gKiwKIAkJCSAgICBjb25zdCBzdHJ1Y3Qga3ZtaV9tc2dfaGRyICosIGNvbnN0IHZvaWQgKikg
PSB7Ci0JW0tWTUlfR0VUX1ZFUlNJT05dICAgICAgID0gaGFuZGxlX2dldF92ZXJzaW9uLAotCVtL
Vk1JX1ZNX0NIRUNLX0NPTU1BTkRdICA9IGhhbmRsZV9jaGVja19jb21tYW5kLAotCVtLVk1JX1ZN
X0NIRUNLX0VWRU5UXSAgICA9IGhhbmRsZV9jaGVja19ldmVudCwKLQlbS1ZNSV9WTV9DT05UUk9M
X0VWRU5UU10gPSBoYW5kbGVfdm1fY29udHJvbF9ldmVudHMsCi0JW0tWTUlfVk1fR0VUX0lORk9d
ICAgICAgID0gaGFuZGxlX2dldF9pbmZvLAotCVtLVk1JX1ZNX0dFVF9NQVhfR0ZOXSAgICA9IGhh
bmRsZV92bV9nZXRfbWF4X2dmbiwKLQlbS1ZNSV9WTV9SRUFEX1BIWVNJQ0FMXSAgPSBoYW5kbGVf
cmVhZF9waHlzaWNhbCwKLQlbS1ZNSV9WTV9XUklURV9QSFlTSUNBTF0gPSBoYW5kbGVfd3JpdGVf
cGh5c2ljYWwsCi0JW0tWTUlfVkNQVV9QQVVTRV0gICAgICAgID0gaGFuZGxlX3BhdXNlX3ZjcHUs
CisJW0tWTUlfR0VUX1ZFUlNJT05dICAgICAgICA9IGhhbmRsZV9nZXRfdmVyc2lvbiwKKwlbS1ZN
SV9WTV9DSEVDS19DT01NQU5EXSAgID0gaGFuZGxlX2NoZWNrX2NvbW1hbmQsCisJW0tWTUlfVk1f
Q0hFQ0tfRVZFTlRdICAgICA9IGhhbmRsZV9jaGVja19ldmVudCwKKwlbS1ZNSV9WTV9DT05UUk9M
X0VWRU5UU10gID0gaGFuZGxlX3ZtX2NvbnRyb2xfZXZlbnRzLAorCVtLVk1JX1ZNX0dFVF9JTkZP
XSAgICAgICAgPSBoYW5kbGVfZ2V0X2luZm8sCisJW0tWTUlfVk1fR0VUX01BWF9HRk5dICAgICA9
IGhhbmRsZV92bV9nZXRfbWF4X2dmbiwKKwlbS1ZNSV9WTV9SRUFEX1BIWVNJQ0FMXSAgID0gaGFu
ZGxlX3JlYWRfcGh5c2ljYWwsCisJW0tWTUlfVk1fU0VUX1BBR0VfQUNDRVNTXSA9IGhhbmRsZV9z
ZXRfcGFnZV9hY2Nlc3MsCisJW0tWTUlfVk1fV1JJVEVfUEhZU0lDQUxdICA9IGhhbmRsZV93cml0
ZV9waHlzaWNhbCwKKwlbS1ZNSV9WQ1BVX1BBVVNFXSAgICAgICAgID0gaGFuZGxlX3BhdXNlX3Zj
cHUsCiB9OwogCiBzdGF0aWMgYm9vbCBpc192bV9jb21tYW5kKHUxNiBpZCkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
