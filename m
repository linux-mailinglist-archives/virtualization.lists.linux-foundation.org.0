Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F392C3C57
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:42:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00DEF87473;
	Wed, 25 Nov 2020 09:42:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cf-sToW5NmhS; Wed, 25 Nov 2020 09:42:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1140D87472;
	Wed, 25 Nov 2020 09:42:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 013F1C0052;
	Wed, 25 Nov 2020 09:42:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FC72C163C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5F47F275A5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id buOJ6YFoY3gr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id B4B2E2741E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 36FBC305D506; Wed, 25 Nov 2020 11:35:46 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 172643072785;
 Wed, 25 Nov 2020 11:35:46 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 21/81] KVM: x86: add kvm_x86_ops.control_singlestep()
Date: Wed, 25 Nov 2020 11:35:00 +0200
Message-Id: <20201125093600.2766-22-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
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

RnJvbTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KClRoaXMgZnVuY3Rp
b24gaXMgbmVlZGVkIGZvciBLVk1JX1ZDUFVfQ09OVFJPTF9TSU5HTEVTVEVQLgoKU2lnbmVkLW9m
Zi1ieTogTmljdciZb3IgQ8OuyJt1IDxuaWN1LmNpdHVAaWNsb3VkLmNvbT4KU2lnbmVkLW9mZi1i
eTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2
L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAgMSArCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAg
ICAgICAgIHwgMTEgKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4
Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDQ1YzcyYWYwNWZhMi4uYzJkYTVjMjRlODI1
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTEzMDUsNiArMTMwNSw3IEBAIHN0cnVjdCBr
dm1feDg2X29wcyB7CiAJdm9pZCAoKm1zcl9maWx0ZXJfY2hhbmdlZCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1KTsKIAogCXU2NCAoKmZhdWx0X2dsYSkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKKwl2
b2lkICgqY29udHJvbF9zaW5nbGVzdGVwKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGJvb2wgZW5h
YmxlKTsKIH07CiAKIHN0cnVjdCBrdm1feDg2X25lc3RlZF9vcHMgewpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggNDFlYTFl
ZTlkNDE5Li4xYzhmYmQ2MjA5Y2UgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
KysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzY0OCw2ICs3NjQ4LDE2IEBAIHN0YXRp
YyB1NjQgdm14X2ZhdWx0X2dsYShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJcmV0dXJuIH4wdWxs
OwogfQogCitzdGF0aWMgdm9pZCB2bXhfY29udHJvbF9zaW5nbGVzdGVwKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSwgYm9vbCBlbmFibGUpCit7CisJaWYgKGVuYWJsZSkKKwkJZXhlY19jb250cm9sc19z
ZXRiaXQodG9fdm14KHZjcHUpLAorCQkJICAgICAgQ1BVX0JBU0VEX01PTklUT1JfVFJBUF9GTEFH
KTsKKwllbHNlCisJCWV4ZWNfY29udHJvbHNfY2xlYXJiaXQodG9fdm14KHZjcHUpLAorCQkJCUNQ
VV9CQVNFRF9NT05JVE9SX1RSQVBfRkxBRyk7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9v
cHMgdm14X3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsKIAkuaGFyZHdhcmVfdW5zZXR1cCA9IGhhcmR3
YXJlX3Vuc2V0dXAsCiAKQEAgLTc3ODgsNiArNzc5OCw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4
Nl9vcHMgdm14X3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsKIAkuY3B1X2RpcnR5X2xvZ19zaXplID0g
dm14X2NwdV9kaXJ0eV9sb2dfc2l6ZSwKIAogCS5mYXVsdF9nbGEgPSB2bXhfZmF1bHRfZ2xhLAor
CS5jb250cm9sX3NpbmdsZXN0ZXAgPSB2bXhfY29udHJvbF9zaW5nbGVzdGVwLAogfTsKIAogc3Rh
dGljIF9faW5pdCBpbnQgaGFyZHdhcmVfc2V0dXAodm9pZCkKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZp
cnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGlu
dXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
