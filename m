Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 13122229C74
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6045A88731;
	Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f48VpXEUq8u4; Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35CD888739;
	Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13803C004E;
	Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AADB7C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A693E86C11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PypBs8mpK-4N
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E1FF86B08
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:35 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2CC8C305D7F1; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 1B65F3072799;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 08/34] KVM: x86: add .set_ept_view()
Date: Wed, 22 Jul 2020 19:00:55 +0300
Message-Id: <20200722160121.9601-9-alazar@bitdefender.com>
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

RnJvbTogTWFyaWFuIFJvdGFyaXUgPG1hcmlhbi5jLnJvdGFyaXVAZ21haWwuY29tPgoKVGhlIGlu
dHJvc3BlY3Rpb24gdG9vbCB1c2VzIHRoaXMgZnVuY3Rpb24gdG8gY2hlY2sgdGhlIGhhcmR3YXJl
IHN1cHBvcnQKZm9yIEVQVCBzd2l0Y2hpbmcsIHdoaWNoIGNhbiBiZSB1c2VkIGVpdGhlciB0byBz
aW5nbGVzdGVwIHZDUFVzCm9uIGEgdW5wcm90ZWN0ZWQgRVBUIHZpZXcuCgpTaWduZWQtb2ZmLWJ5
OiBNYXJpYW4gUm90YXJpdSA8bWFyaWFuLmMucm90YXJpdUBnbWFpbC5jb20+CkNvLWRldmVsb3Bl
ZC1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiDImHRlZmFuIMiYaWNsZXJ1IDxzc2ljbGVydUBiaXRkZWZlbmRlci5jb20+ClNpZ25l
ZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBh
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDEgKwogYXJjaC94ODYva3ZtL3ZteC92
bXguYyAgICAgICAgICB8IDM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogMiBm
aWxlcyBjaGFuZ2VkLCAzNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKaW5kZXggMTAzNTMwODk0MGZlLi4zMDBmN2ZjNDM5ODcgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9h
c20va3ZtX2hvc3QuaApAQCAtMTMwOSw2ICsxMzA5LDcgQEAgc3RydWN0IGt2bV94ODZfb3BzIHsK
IAlib29sICgqZ2V0X3ZtZnVuY19zdGF0dXMpKHZvaWQpOwogCWJvb2wgKCpnZXRfZXB0cF9zd2l0
Y2hpbmdfc3RhdHVzKSh2b2lkKTsKIAl1MTYgKCpnZXRfZXB0X3ZpZXcpKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSk7CisJaW50ICgqc2V0X2VwdF92aWV3KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUx
NiB2aWV3KTsKIH07CiAKIHN0cnVjdCBrdm1feDg2X25lc3RlZF9vcHMgewpkaWZmIC0tZ2l0IGEv
YXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggMjAy
NGVmNGQ5YTc0Li4wZDM5NDg3Y2U1YzYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14
LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNDM3Myw2ICs0MzczLDI4IEBAIHN0
YXRpYyBpbnQgdm14X2FsbG9jX2VwdHBfbGlzdF9wYWdlKHN0cnVjdCB2Y3B1X3ZteCAqdm14KQog
CXJldHVybiAwOwogfQogCitzdGF0aWMgaW50IHZteF9zZXRfZXB0X3ZpZXcoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCB1MTYgdmlldykKK3sKKwlpZiAodmlldyA+PSBLVk1fTUFYX0VQVF9WSUVXUykK
KwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAodG9fdm14KHZjcHUpLT5lcHRwX2xpc3RfcGcpIHsK
KwkJaW50IHI7CisKKwkJdG9fdm14KHZjcHUpLT52aWV3ID0gdmlldzsKKworCQkvKgorCQkgKiBS
ZWxvYWQgbW11IGFuZCBtYWtlIHN1cmUgdm14X2xvYWRfbW11X3BnZCgpIGlzIGNhbGxlZCBzbyB0
aGF0CisJCSAqIFZNQ1M6OkVQVF9QT0lOVEVSIGlzIHVwZGF0ZWQgYWNjb3JkaW5nbHkKKwkJICov
CisJCWt2bV9tbXVfdW5sb2FkKHZjcHUpOworCQlyID0ga3ZtX21tdV9yZWxvYWQodmNwdSk7CisJ
CVdBUk5fT05fT05DRShyKTsKKwl9CisKKwlyZXR1cm4gMDsKK30KKwogI2RlZmluZSBWTVhfWFNT
X0VYSVRfQklUTUFQIDAKIAogLyoKQEAgLTQ0NjMsOSArNDQ4NSwxNSBAQCBzdGF0aWMgdm9pZCBp
bml0X3ZtY3Moc3RydWN0IHZjcHVfdm14ICp2bXgpCiAJaWYgKGNwdV9oYXNfdm14X2VuY2xzX3Zt
ZXhpdCgpKQogCQl2bWNzX3dyaXRlNjQoRU5DTFNfRVhJVElOR19CSVRNQVAsIC0xdWxsKTsKIAot
CWlmICh2bXgtPmVwdHBfbGlzdF9wZykKKwlpZiAodm14LT5lcHRwX2xpc3RfcGcpIHsKKwkJdTY0
IHZtX2Z1bmN0aW9uX2NvbnRyb2w7CisKIAkJdm1jc193cml0ZTY0KEVQVFBfTElTVF9BRERSRVNT
LAogCQkJCXBhZ2VfdG9fcGh5cyh2bXgtPmVwdHBfbGlzdF9wZykpOworCQl2bV9mdW5jdGlvbl9j
b250cm9sID0gdm1jc19yZWFkNjQoVk1fRlVOQ1RJT05fQ09OVFJPTCk7CisJCXZtX2Z1bmN0aW9u
X2NvbnRyb2wgfD0gVk1YX1ZNRlVOQ19FUFRQX1NXSVRDSElORzsKKwkJdm1jc193cml0ZTY0KFZN
X0ZVTkNUSU9OX0NPTlRST0wsIHZtX2Z1bmN0aW9uX2NvbnRyb2wpOworCX0KIAogCWlmICh2bXhf
cHRfbW9kZV9pc19ob3N0X2d1ZXN0KCkpIHsKIAkJbWVtc2V0KCZ2bXgtPnB0X2Rlc2MsIDAsIHNp
emVvZih2bXgtPnB0X2Rlc2MpKTsKQEAgLTU5NjUsNiArNTk5MywxMCBAQCBzdGF0aWMgdm9pZCBk
dW1wX2VwdHBfbGlzdCh2b2lkKQogCiAJZXB0cF9saXN0ID0gcGh5c190b192aXJ0KGVwdHBfbGlz
dF9waHlzKTsKIAorCXByX2VycigiVk1GdW5jdGlvbkNvbnRyb2w9JTA4eCBWTUZ1bmN0aW9uQ29u
dHJvbEhpZ2g9JTA4eFxuIiwKKwkgICAgICAgdm1jc19yZWFkMzIoVk1fRlVOQ1RJT05fQ09OVFJP
TCksCisJICAgICAgIHZtY3NfcmVhZDMyKFZNX0ZVTkNUSU9OX0NPTlRST0xfSElHSCkpOworCiAJ
cHJfZXJyKCIqKiogRVBUUCBTd2l0Y2hpbmcgKioqXG4iKTsKIAlwcl9lcnIoIkVQVFAgTGlzdCBB
ZGRyZXNzOiAlcCAocGh5cyAlcClcbiIsCiAJCWVwdHBfbGlzdCwgKHZvaWQgKillcHRwX2xpc3Rf
cGh5cyk7CkBAIC04MjUxLDYgKzgyODMsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZt
eF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmdldF92bWZ1bmNfc3RhdHVzID0gdm14X2dldF92
bWZ1bmNfc3RhdHVzLAogCS5nZXRfZXB0cF9zd2l0Y2hpbmdfc3RhdHVzID0gdm14X2dldF9lcHRw
X3N3aXRjaGluZ19zdGF0dXMsCiAJLmdldF9lcHRfdmlldyA9IHZteF9nZXRfZXB0X3ZpZXcsCisJ
LnNldF9lcHRfdmlldyA9IHZteF9zZXRfZXB0X3ZpZXcsCiB9OwogCiBzdGF0aWMgX19pbml0IGlu
dCBoYXJkd2FyZV9zZXR1cCh2b2lkKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
