Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81A155E40
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 19:36:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 80068226D4;
	Fri,  7 Feb 2020 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ijq8kwKtj6o; Fri,  7 Feb 2020 18:36:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABEFD2270C;
	Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C259C013E;
	Fri,  7 Feb 2020 18:36:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48C2FC1D81
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3EBB286DDE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9qdDYvo9g7v
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1CC10868C6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 18:35:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 ADC38305D3D9; Fri,  7 Feb 2020 20:16:39 +0200 (EET)
Received: from host.bbu.bitdefender.biz (unknown [195.210.4.22])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id A14643052077;
 Fri,  7 Feb 2020 20:16:39 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v7 22/78] KVM: x86: add .fault_gla()
Date: Fri,  7 Feb 2020 20:15:40 +0200
Message-Id: <20200207181636.1065-23-alazar@bitdefender.com>
In-Reply-To: <20200207181636.1065-1-alazar@bitdefender.com>
References: <20200207181636.1065-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIGt2bWlfdXBkYXRlX2FkX2ZsYWdzKCkKYW5kIGt2bV9wYWdlX3RyYWNr
X2VtdWxhdGlvbl9mYWlsdXJlKCkuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250
dUBiaXRkZWZlbmRlci5jb20+CkNvLWRldmVsb3BlZC1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0
dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVA
Yml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBi
aXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDIg
KysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3ZteC5oICAgICAgfCAyICsrCiBhcmNoL3g4Ni9rdm0v
c3ZtLmMgICAgICAgICAgICAgIHwgOSArKysrKysrKysKIGFyY2gveDg2L2t2bS92bXgvdm14LmMg
ICAgICAgICAgfCA5ICsrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggOWYxMmQ0MDE5OGI1Li42MDk0ODg0ZDMwMTUg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94
ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTI1Myw2ICsxMjUzLDggQEAgc3RydWN0IGt2
bV94ODZfb3BzIHsKIAogCWJvb2wgKCphcGljX2luaXRfc2lnbmFsX2Jsb2NrZWQpKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSk7CiAJaW50ICgqZW5hYmxlX2RpcmVjdF90bGJmbHVzaCkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKKworCXU2NCAoKmZhdWx0X2dsYSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKIH07CiAKIHN0cnVjdCBrdm1fYXJjaF9hc3luY19wZiB7CmRpZmYgLS1naXQgYS9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS92bXguaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3ZteC5oCmluZGV4IDE4
MzU3NjdhYTMzNS4uZWRiMWFmYzA2MGQ2IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS92bXguaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaApAQCAtNTI0LDYgKzUyNCw3
IEBAIHN0cnVjdCB2bXhfbXNyX2VudHJ5IHsKICNkZWZpbmUgRVBUX1ZJT0xBVElPTl9SRUFEQUJM
RV9CSVQJMwogI2RlZmluZSBFUFRfVklPTEFUSU9OX1dSSVRBQkxFX0JJVAk0CiAjZGVmaW5lIEVQ
VF9WSU9MQVRJT05fRVhFQ1VUQUJMRV9CSVQJNQorI2RlZmluZSBFUFRfVklPTEFUSU9OX0dMQV9W
QUxJRF9CSVQJNwogI2RlZmluZSBFUFRfVklPTEFUSU9OX0dWQV9UUkFOU0xBVEVEX0JJVCA4CiAj
ZGVmaW5lIEVQVF9WSU9MQVRJT05fQUNDX1JFQUQJCSgxIDw8IEVQVF9WSU9MQVRJT05fQUNDX1JF
QURfQklUKQogI2RlZmluZSBFUFRfVklPTEFUSU9OX0FDQ19XUklURQkJKDEgPDwgRVBUX1ZJT0xB
VElPTl9BQ0NfV1JJVEVfQklUKQpAQCAtNTMxLDYgKzUzMiw3IEBAIHN0cnVjdCB2bXhfbXNyX2Vu
dHJ5IHsKICNkZWZpbmUgRVBUX1ZJT0xBVElPTl9SRUFEQUJMRQkJKDEgPDwgRVBUX1ZJT0xBVElP
Tl9SRUFEQUJMRV9CSVQpCiAjZGVmaW5lIEVQVF9WSU9MQVRJT05fV1JJVEFCTEUJCSgxIDw8IEVQ
VF9WSU9MQVRJT05fV1JJVEFCTEVfQklUKQogI2RlZmluZSBFUFRfVklPTEFUSU9OX0VYRUNVVEFC
TEUJKDEgPDwgRVBUX1ZJT0xBVElPTl9FWEVDVVRBQkxFX0JJVCkKKyNkZWZpbmUgRVBUX1ZJT0xB
VElPTl9HTEFfVkFMSUQJCSgxIDw8IEVQVF9WSU9MQVRJT05fR0xBX1ZBTElEX0JJVCkKICNkZWZp
bmUgRVBUX1ZJT0xBVElPTl9HVkFfVFJBTlNMQVRFRAkoMSA8PCBFUFRfVklPTEFUSU9OX0dWQV9U
UkFOU0xBVEVEX0JJVCkKIAogLyoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0uYyBiL2Fy
Y2gveDg2L2t2bS9zdm0uYwppbmRleCBjM2I3ZjU5MzI5OWYuLmFiOTU3NjQ0NGU2YiAxMDA2NDQK
LS0tIGEvYXJjaC94ODYva3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0uYwpAQCAtNzM1
MSw2ICs3MzUxLDEzIEBAIHN0YXRpYyB2b2lkIHN2bV9jb250cm9sX21zcl9pbnRlcmNlcHQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBpbnQgbXNyLAogCXNldF9tc3JfaW50ZXJjZXB0
aW9uKHZjcHUsIG1zcnBtLCBtc3IsIHR5cGUsICFlbmFibGUpOwogfQogCitzdGF0aWMgdTY0IHN2
bV9mYXVsdF9nbGEoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCWNvbnN0IHN0cnVjdCB2Y3B1
X3N2bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCisJcmV0dXJuIHN2bS0+dmNwdS5hcmNoLmNyMiA/
IHN2bS0+dmNwdS5hcmNoLmNyMiA6IH4wdWxsOworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94ODZf
b3BzIHN2bV94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkuY3B1X2hhc19rdm1fc3VwcG9y
dCA9IGhhc19zdm0sCiAJLmRpc2FibGVkX2J5X2Jpb3MgPSBpc19kaXNhYmxlZCwKQEAgLTc0OTUs
NiArNzUwMiw4IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9vcHMgX19yb19h
ZnRlcl9pbml0ID0gewogCS5uZWVkX2VtdWxhdGlvbl9vbl9wYWdlX2ZhdWx0ID0gc3ZtX25lZWRf
ZW11bGF0aW9uX29uX3BhZ2VfZmF1bHQsCiAKIAkuYXBpY19pbml0X3NpZ25hbF9ibG9ja2VkID0g
c3ZtX2FwaWNfaW5pdF9zaWduYWxfYmxvY2tlZCwKKworCS5mYXVsdF9nbGEgPSBzdm1fZmF1bHRf
Z2xhLAogfTsKIAogc3RhdGljIGludCBfX2luaXQgc3ZtX2luaXQodm9pZCkKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IDdh
OTZhOTExZTVmMi4uZjFkZjU3MjVkMDZmIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTc4MTYsNiArNzgxNiwxMyBAQCBz
dGF0aWMgdm9pZCB2bXhfY29udHJvbF9tc3JfaW50ZXJjZXB0KHN0cnVjdCBrdm1fdmNwdSAqdmNw
dSwgdW5zaWduZWQgaW50IG1zciwKIAl2bXhfc2V0X2ludGVyY2VwdF9mb3JfbXNyKHZjcHUsIG1z
cl9iaXRtYXAsIG1zciwgdHlwZSwgZW5hYmxlKTsKIH0KIAorc3RhdGljIHU2NCB2bXhfZmF1bHRf
Z2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAodmNwdS0+YXJjaC5leGl0X3F1YWxp
ZmljYXRpb24gJiBFUFRfVklPTEFUSU9OX0dMQV9WQUxJRCkKKwkJcmV0dXJuIHZtY3NfcmVhZGwo
R1VFU1RfTElORUFSX0FERFJFU1MpOworCXJldHVybiB+MHVsbDsKK30KKwogc3RhdGljIHN0cnVj
dCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQgPSB7CiAJLmNwdV9oYXNf
a3ZtX3N1cHBvcnQgPSBjcHVfaGFzX2t2bV9zdXBwb3J0LAogCS5kaXNhYmxlZF9ieV9iaW9zID0g
dm14X2Rpc2FibGVkX2J5X2Jpb3MsCkBAIC03OTczLDYgKzc5ODAsOCBAQCBzdGF0aWMgc3RydWN0
IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9fcm9fYWZ0ZXJfaW5pdCA9IHsKIAkubmVzdGVkX2dl
dF9ldm1jc192ZXJzaW9uID0gTlVMTCwKIAkubmVlZF9lbXVsYXRpb25fb25fcGFnZV9mYXVsdCA9
IHZteF9uZWVkX2VtdWxhdGlvbl9vbl9wYWdlX2ZhdWx0LAogCS5hcGljX2luaXRfc2lnbmFsX2Js
b2NrZWQgPSB2bXhfYXBpY19pbml0X3NpZ25hbF9ibG9ja2VkLAorCisJLmZhdWx0X2dsYSA9IHZt
eF9mYXVsdF9nbGEsCiB9OwogCiBzdGF0aWMgdm9pZCB2bXhfY2xlYW51cF9sMWRfZmx1c2godm9p
ZCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
