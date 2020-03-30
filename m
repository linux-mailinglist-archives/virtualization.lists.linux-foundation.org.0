Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5A119788D
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2ED9923120;
	Mon, 30 Mar 2020 10:13:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4AhY+Yf54Lx; Mon, 30 Mar 2020 10:12:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B2525230F3;
	Mon, 30 Mar 2020 10:12:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA614C1AE8;
	Mon, 30 Mar 2020 10:12:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A361C1AE8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2482923077
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SsfRc4+iDVuZ
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id A0B622305A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 CF17C30747CD; Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id A0B17305B7A2;
 Mon, 30 Mar 2020 13:12:50 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 14/81] KVM: svm: add support for descriptor-table exits
Date: Mon, 30 Mar 2020 13:12:01 +0300
Message-Id: <20200330101308.21702-15-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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
aC94ODYva3ZtL3N2bS5jIHwgMTUgKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0uYyBiL2FyY2gveDg2
L2t2bS9zdm0uYwppbmRleCBmOTE4NWYwYjBjMmIuLmZkMjE0Mzk0NzViNSAxMDA2NDQKLS0tIGEv
YXJjaC94ODYva3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0uYwpAQCAtNDc5Miw2ICs0
NzkyLDEzIEBAIHN0YXRpYyBpbnQgYXZpY191bmFjY2VsZXJhdGVkX2FjY2Vzc19pbnRlcmNlcHRp
b24oc3RydWN0IHZjcHVfc3ZtICpzdm0pCiAJcmV0dXJuIHJldDsKIH0KIAorc3RhdGljIGludCBk
ZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24oc3RydWN0IHZjcHVfc3ZtICpzdm0pCit7CisJ
c3RydWN0IGt2bV92Y3B1ICp2Y3B1ID0gJnN2bS0+dmNwdTsKKworCXJldHVybiBrdm1fZW11bGF0
ZV9pbnN0cnVjdGlvbih2Y3B1LCAwKTsKK30KKwogc3RhdGljIGludCAoKmNvbnN0IHN2bV9leGl0
X2hhbmRsZXJzW10pKHN0cnVjdCB2Y3B1X3N2bSAqc3ZtKSA9IHsKIAlbU1ZNX0VYSVRfUkVBRF9D
UjBdCQkJPSBjcl9pbnRlcmNlcHRpb24sCiAJW1NWTV9FWElUX1JFQURfQ1IzXQkJCT0gY3JfaW50
ZXJjZXB0aW9uLApAQCAtNDg1OCw2ICs0ODY1LDE0IEBAIHN0YXRpYyBpbnQgKCpjb25zdCBzdm1f
ZXhpdF9oYW5kbGVyc1tdKShzdHJ1Y3QgdmNwdV9zdm0gKnN2bSkgPSB7CiAJW1NWTV9FWElUX1JT
TV0gICAgICAgICAgICAgICAgICAgICAgICAgID0gcnNtX2ludGVyY2VwdGlvbiwKIAlbU1ZNX0VY
SVRfQVZJQ19JTkNPTVBMRVRFX0lQSV0JCT0gYXZpY19pbmNvbXBsZXRlX2lwaV9pbnRlcmNlcHRp
b24sCiAJW1NWTV9FWElUX0FWSUNfVU5BQ0NFTEVSQVRFRF9BQ0NFU1NdCT0gYXZpY191bmFjY2Vs
ZXJhdGVkX2FjY2Vzc19pbnRlcmNlcHRpb24sCisJW1NWTV9FWElUX0lEVFJfUkVBRF0JCQk9IGRl
c2NyaXB0b3JfYWNjZXNzX2ludGVyY2VwdGlvbiwKKwlbU1ZNX0VYSVRfR0RUUl9SRUFEXQkJCT0g
ZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0aW9uLAorCVtTVk1fRVhJVF9MRFRSX1JFQURdCQkJ
PSBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24sCisJW1NWTV9FWElUX1RSX1JFQURdCQkJ
PSBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24sCisJW1NWTV9FWElUX0lEVFJfV1JJVEVd
CQkJPSBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24sCisJW1NWTV9FWElUX0dEVFJfV1JJ
VEVdCQkJPSBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24sCisJW1NWTV9FWElUX0xEVFJf
V1JJVEVdCQkJPSBkZXNjcmlwdG9yX2FjY2Vzc19pbnRlcmNlcHRpb24sCisJW1NWTV9FWElUX1RS
X1dSSVRFXQkJCT0gZGVzY3JpcHRvcl9hY2Nlc3NfaW50ZXJjZXB0aW9uLAogfTsKIAogc3RhdGlj
IHZvaWQgZHVtcF92bWNiKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
