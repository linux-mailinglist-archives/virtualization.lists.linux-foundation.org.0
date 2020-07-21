Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C16B6228A9B
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 64B3A882B5;
	Tue, 21 Jul 2020 21:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KHPZbTshz2Eq; Tue, 21 Jul 2020 21:16:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C9DB8796C;
	Tue, 21 Jul 2020 21:16:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 71ACBC088E;
	Tue, 21 Jul 2020 21:16:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7B18C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BC16E227B1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E7PdyMHiyRkS
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id 4F56922785
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 C100D305D7F7; Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 9729D304FA12;
 Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 13/84] KVM: svm: add support for descriptor-table exits
Date: Wed, 22 Jul 2020 00:08:11 +0300
Message-Id: <20200721210922.7646-14-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <ncitu@bitdefender.com>,
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+CgpUaGlzIGZ1bmN0
aW9uIGlzIG5lZWRlZCBmb3IgdGhlIEtWTUlfRVZFTlRfREVTQ1JJUFRPUiBldmVudC4KClNpZ25l
ZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQt
b2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJj
aC94ODYva3ZtL3N2bS9zdm0uYyB8IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jIGIv
YXJjaC94ODYva3ZtL3N2bS9zdm0uYwppbmRleCBmNGQ4ODJjYTAwNjAuLmI1NDBhZjA0YjM4NCAx
MDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3Zt
L3N2bS5jCkBAIC0yMjIwLDYgKzIyMjAsMTMgQEAgc3RhdGljIGludCByc21faW50ZXJjZXB0aW9u
KHN0cnVjdCB2Y3B1X3N2bSAqc3ZtKQogCXJldHVybiBrdm1fZW11bGF0ZV9pbnN0cnVjdGlvbl9m
cm9tX2J1ZmZlcigmc3ZtLT52Y3B1LCByc21faW5zX2J5dGVzLCAyKTsKIH0KIAorc3RhdGljIGlu
dCBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24oc3RydWN0IHZjcHVfc3ZtICpzdm0pCit7
CisJc3RydWN0IGt2bV92Y3B1ICp2Y3B1ID0gJnN2bS0+dmNwdTsKKworCXJldHVybiBrdm1fZW11
bGF0ZV9pbnN0cnVjdGlvbih2Y3B1LCAwKTsKK30KKwogc3RhdGljIGludCByZHBtY19pbnRlcmNl
cHRpb24oc3RydWN0IHZjcHVfc3ZtICpzdm0pCiB7CiAJaW50IGVycjsKQEAgLTI4MTUsNiArMjgy
MiwxNCBAQCBzdGF0aWMgaW50ICgqY29uc3Qgc3ZtX2V4aXRfaGFuZGxlcnNbXSkoc3RydWN0IHZj
cHVfc3ZtICpzdm0pID0gewogCVtTVk1fRVhJVF9SU01dICAgICAgICAgICAgICAgICAgICAgICAg
ICA9IHJzbV9pbnRlcmNlcHRpb24sCiAJW1NWTV9FWElUX0FWSUNfSU5DT01QTEVURV9JUEldCQk9
IGF2aWNfaW5jb21wbGV0ZV9pcGlfaW50ZXJjZXB0aW9uLAogCVtTVk1fRVhJVF9BVklDX1VOQUND
RUxFUkFURURfQUNDRVNTXQk9IGF2aWNfdW5hY2NlbGVyYXRlZF9hY2Nlc3NfaW50ZXJjZXB0aW9u
LAorCVtTVk1fRVhJVF9JRFRSX1JFQURdCQkJPSBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRp
b24sCisJW1NWTV9FWElUX0dEVFJfUkVBRF0JCQk9IGRlc2NyaXB0b3JfYWNjZXNzX2ludGVyY2Vw
dGlvbiwKKwlbU1ZNX0VYSVRfTERUUl9SRUFEXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJj
ZXB0aW9uLAorCVtTVk1fRVhJVF9UUl9SRUFEXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJj
ZXB0aW9uLAorCVtTVk1fRVhJVF9JRFRSX1dSSVRFXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50
ZXJjZXB0aW9uLAorCVtTVk1fRVhJVF9HRFRSX1dSSVRFXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3Nf
aW50ZXJjZXB0aW9uLAorCVtTVk1fRVhJVF9MRFRSX1dSSVRFXQkJCT0gZGVzY3JpcHRvcl9hY2Nl
c3NfaW50ZXJjZXB0aW9uLAorCVtTVk1fRVhJVF9UUl9XUklURV0JCQk9IGRlc2NyaXB0b3JfYWNj
ZXNzX2ludGVyY2VwdGlvbiwKIH07CiAKIHN0YXRpYyB2b2lkIGR1bXBfdm1jYihzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
