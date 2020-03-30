Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CD651197881
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7AD80869E2;
	Mon, 30 Mar 2020 10:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9OQkK99h87Li; Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C07EE86A11;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE27CC07FF;
	Mon, 30 Mar 2020 10:13:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5878FC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 430E4869B7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VRs26cdatvL6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB420869C8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E85DB3074899; Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id CC1FE305B7A1;
 Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 27/81] KVM: x86: add .control_singlestep()
Date: Mon, 30 Mar 2020 13:12:14 +0300
Message-Id: <20200330101308.21702-28-alazar@bitdefender.com>
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
aW9uIGlzIG5lZWRlZCBmb3IgS1ZNSV9WQ1BVX0NPTlRST0xfU0lOR0xFU1RFUAphbmQgS1ZNSV9F
VkVOVF9TSU5HTEVTVEVQLgoKU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBi
aXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJp
dGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgIDEg
KwogYXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICB8IDExICsrKysrKysrKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRl
eCAyZTk5M2IyNDBiNjYuLjViOGU0NGU0OTRiMSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVk
ZS9hc20va3ZtX2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBA
IC0xMjkyLDYgKzEyOTIsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCXU2NCAoKmZhdWx0X2ds
YSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAlib29sICgqc3B0X2ZhdWx0KShzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpOwogCWJvb2wgKCpncHRfdHJhbnNsYXRpb25fZmF1bHQpKHN0cnVjdCBrdm1f
dmNwdSAqdmNwdSk7CisJdm9pZCAoKmNvbnRyb2xfc2luZ2xlc3RlcCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBib29sIGVuYWJsZSk7CiB9OwogCiBzdHJ1Y3Qga3ZtX2FyY2hfYXN5bmNfcGYgewpk
aWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14
LmMKaW5kZXggNTQyMmMzNWEzMjE2Li4xMzQ2MmVmMmNlOWUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L2t2bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzkyOCw2ICs3
OTI4LDE2IEBAIHN0YXRpYyBib29sIHZteF9ncHRfdHJhbnNsYXRpb25fZmF1bHQoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQogCXJldHVybiB0cnVlOwogfQogCitzdGF0aWMgdm9pZCB2bXhfY29udHJv
bF9zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpCit7CisJaWYg
KGVuYWJsZSkKKwkJZXhlY19jb250cm9sc19zZXRiaXQodG9fdm14KHZjcHUpLAorCQkJICAgICAg
Q1BVX0JBU0VEX01PTklUT1JfVFJBUF9GTEFHKTsKKwllbHNlCisJCWV4ZWNfY29udHJvbHNfY2xl
YXJiaXQodG9fdm14KHZjcHUpLAorCQkJCUNQVV9CQVNFRF9NT05JVE9SX1RSQVBfRkxBRyk7Cit9
CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9vcHMgX19yb19hZnRlcl9pbml0
ID0gewogCS5jcHVfaGFzX2t2bV9zdXBwb3J0ID0gY3B1X2hhc19rdm1fc3VwcG9ydCwKIAkuZGlz
YWJsZWRfYnlfYmlvcyA9IHZteF9kaXNhYmxlZF9ieV9iaW9zLApAQCAtODA5Miw2ICs4MTAyLDcg
QEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX3JvX2FmdGVyX2luaXQg
PSB7CiAJLmZhdWx0X2dsYSA9IHZteF9mYXVsdF9nbGEsCiAJLnNwdF9mYXVsdCA9IHZteF9zcHRf
ZmF1bHQsCiAJLmdwdF90cmFuc2xhdGlvbl9mYXVsdCA9IHZteF9ncHRfdHJhbnNsYXRpb25fZmF1
bHQsCisJLmNvbnRyb2xfc2luZ2xlc3RlcCA9IHZteF9jb250cm9sX3NpbmdsZXN0ZXAsCiB9Owog
CiBzdGF0aWMgdm9pZCB2bXhfY2xlYW51cF9sMWRfZmx1c2godm9pZCkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
