Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B9321228AA8
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 27E6D2273B;
	Tue, 21 Jul 2020 21:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c0rx99cpGrdk; Tue, 21 Jul 2020 21:16:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 490A2227B1;
	Tue, 21 Jul 2020 21:16:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30935C016F;
	Tue, 21 Jul 2020 21:16:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9AF2C088E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A2BED87F60
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HXLAA7f5oHgZ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 133D588226
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 599EF30412EA; Wed, 22 Jul 2020 00:09:24 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3AE38304FA14;
 Wed, 22 Jul 2020 00:09:24 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 36/84] KVM: x86: disable gpa_available optimization for
 fetch and page-walk SPT violations
Date: Wed, 22 Jul 2020 00:08:34 +0300
Message-Id: <20200721210922.7646-37-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Mircea=20C=C3=AErjaliu?= <mcirjaliu@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
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

RnJvbTogTWlyY2VhIEPDrnJqYWxpdSA8bWNpcmphbGl1QGJpdGRlZmVuZGVyLmNvbT4KClRoaXMg
Y2hhbmdlIGlzIG5lZWRlZCBiZWNhdXNlIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgY2FuIHdyaXRl
LXByb3RlY3QKZ3Vlc3QgcGFnZSB0YWJsZXMgb3IgZXhlYy1wcm90ZWN0IGhlYXAvc3RhY2sgcGFn
ZXMuCgpTaWduZWQtb2ZmLWJ5OiBNaXJjZWEgQ8OucmphbGl1IDxtY2lyamFsaXVAYml0ZGVmZW5k
ZXIuY29tPgpDby1kZXZlbG9wZWQtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVu
ZGVyLmNvbT4KU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5k
ZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCA1ICsrKysrCiBh
cmNoL3g4Ni9rdm0vbW11L21tdS5jICAgICAgICAgIHwgOCArKysrKysrKwogYXJjaC94ODYva3Zt
L3g4Ni5jICAgICAgICAgICAgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2
bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IGI2YTE3MDRl
MGY4OS4uOGExMTlmYjdjNjIzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1f
aG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTE0MzYsNiAr
MTQzNiwxMCBAQCBleHRlcm4gdTY0IGt2bV9tY2VfY2FwX3N1cHBvcnRlZDsKICAqCQkJICAgICBy
ZXRyeSBuYXRpdmUgZXhlY3V0aW9uIHVuZGVyIGNlcnRhaW4gY29uZGl0aW9ucywKICAqCQkJICAg
ICBDYW4gb25seSBiZSBzZXQgaW4gY29uanVuY3Rpb24gd2l0aCBFTVVMVFlQRV9QRi4KICAqCisg
KiBFTVVMVFlQRV9HUEFfQVZBSUxBQkxFX1BGIC0gU2V0IHdoZW4gdGhlIGVtdWxhdG9yIGNhbiBh
dm9pZCBhIHBhZ2Ugd2FsaworICogICAgICAgICAgICAgICAgICAgICAgICAgICB0byBnZXQgdGhl
IEdQQS4KKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgQ2FuIG9ubHkgYmUgc2V0IGluIGNv
bmp1bmN0aW9uIHdpdGggRU1VTFRZUEVfUEYuCisgKgogICogRU1VTFRZUEVfVFJBUF9VRF9GT1JD
RUQgLSBTZXQgd2hlbiBlbXVsYXRpbmcgYW4gaW50ZXJjZXB0ZWQgI1VEIHRoYXQgd2FzCiAgKgkJ
CSAgICAgdHJpZ2dlcmVkIGJ5IEtWTSdzIG1hZ2ljICJmb3JjZSBlbXVsYXRpb24iIHByZWZpeCwK
ICAqCQkJICAgICB3aGljaCBpcyBvcHQgaW4gdmlhIG1vZHVsZSBwYXJhbSAob2ZmIGJ5IGRlZmF1
bHQpLgpAQCAtMTQ1OCw2ICsxNDYyLDcgQEAgZXh0ZXJuIHU2NCBrdm1fbWNlX2NhcF9zdXBwb3J0
ZWQ7CiAjZGVmaW5lIEVNVUxUWVBFX1RSQVBfVURfRk9SQ0VECSAgICAoMSA8PCA0KQogI2RlZmlu
ZSBFTVVMVFlQRV9WTVdBUkVfR1AJICAgICgxIDw8IDUpCiAjZGVmaW5lIEVNVUxUWVBFX1BGCQkg
ICAgKDEgPDwgNikKKyNkZWZpbmUgRU1VTFRZUEVfR1BBX0FWQUlMQUJMRV9QRiAgICgxIDw8IDcp
CiAKIGludCBrdm1fZW11bGF0ZV9pbnN0cnVjdGlvbihzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGlu
dCBlbXVsYXRpb25fdHlwZSk7CiBpbnQga3ZtX2VtdWxhdGVfaW5zdHJ1Y3Rpb25fZnJvbV9idWZm
ZXIoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LApkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9t
bXUuYyBiL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKaW5kZXggZGE1NzMyMWUwY2VjLi40ZGY1Yjcy
OWUyYzUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKKysrIGIvYXJjaC94ODYv
a3ZtL21tdS9tbXUuYwpAQCAtNTU2Niw2ICs1NTY2LDE0IEBAIGludCBrdm1fbW11X3BhZ2VfZmF1
bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBncGFfdCBjcjJfb3JfZ3BhLCB1NjQgZXJyb3JfY29k
ZSwKIAkgKi8KIAlpZiAoIW1taW9faW5mb19pbl9jYWNoZSh2Y3B1LCBjcjJfb3JfZ3BhLCBkaXJl
Y3QpICYmICFpc19ndWVzdF9tb2RlKHZjcHUpKQogCQllbXVsYXRpb25fdHlwZSB8PSBFTVVMVFlQ
RV9BTExPV19SRVRSWV9QRjsKKworCS8qCisJICogV2l0aCBzaGFkb3cgcGFnZSB0YWJsZXMsIGZh
dWx0X2FkZHJlc3MgY29udGFpbnMgYSBHVkEgb3IgbkdQQS4KKwkgKiBPbiBhIGZldGNoIGZhdWx0
LCBmYXVsdF9hZGRyZXNzIGNvbnRhaW5zIHRoZSBpbnN0cnVjdGlvbiBwb2ludGVyLgorCSAqLwor
CWlmIChkaXJlY3QgJiYgbGlrZWx5KCEoZXJyb3JfY29kZSAmIFBGRVJSX0ZFVENIX01BU0spKSAm
JgorCSAgICAoZXJyb3JfY29kZSAmIFBGRVJSX0dVRVNUX0ZJTkFMX01BU0spKQorCQllbXVsYXRp
b25fdHlwZSB8PSBFTVVMVFlQRV9HUEFfQVZBSUxBQkxFX1BGOwogZW11bGF0ZToKIAkvKgogCSAq
IE9uIEFNRCBwbGF0Zm9ybXMsIHVuZGVyIGNlcnRhaW4gY29uZGl0aW9ucyBpbnNuX2xlbiBtYXkg
YmUgemVybyBvbiAjTlBGLgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3g4Ni5jIGIvYXJjaC94
ODYva3ZtL3g4Ni5jCmluZGV4IDc2NjhjYTViOGE3YS4uZmZjZjA5ZTliZjc4IDEwMDY0NAotLS0g
YS9hcmNoL3g4Ni9rdm0veDg2LmMKKysrIGIvYXJjaC94ODYva3ZtL3g4Ni5jCkBAIC02OTg3LDcg
KzY5ODcsNyBAQCBpbnQgeDg2X2VtdWxhdGVfaW5zdHJ1Y3Rpb24oc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBncGFfdCBjcjJfb3JfZ3BhLAogCQljdHh0LT5leGNlcHRpb24uYWRkcmVzcyA9IGNyMl9v
cl9ncGE7CiAKIAkJLyogV2l0aCBzaGFkb3cgcGFnZSB0YWJsZXMsIGNyMiBjb250YWlucyBhIEdW
QSBvciBuR1BBLiAqLwotCQlpZiAodmNwdS0+YXJjaC5tbXUtPmRpcmVjdF9tYXApIHsKKwkJaWYg
KGVtdWxhdGlvbl90eXBlICYgRU1VTFRZUEVfR1BBX0FWQUlMQUJMRV9QRikgewogCQkJY3R4dC0+
Z3BhX2F2YWlsYWJsZSA9IHRydWU7CiAJCQljdHh0LT5ncGFfdmFsID0gY3IyX29yX2dwYTsKIAkJ
fQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
