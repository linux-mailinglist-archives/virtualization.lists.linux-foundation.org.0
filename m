Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD8228A7C
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D211022798;
	Tue, 21 Jul 2020 21:15:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zt3bZubc+Q9e; Tue, 21 Jul 2020 21:15:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CD561226DB;
	Tue, 21 Jul 2020 21:15:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B46DFC016F;
	Tue, 21 Jul 2020 21:15:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D670C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 356DC87E08
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hx+u7DkLiEYv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:53 +0000 (UTC)
X-Greylist: delayed 00:06:32 by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DFC5587DF9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:52 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 ED364305D770; Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id CE62B304FA15;
 Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 26/84] KVM: x86: add .control_singlestep()
Date: Wed, 22 Jul 2020 00:08:24 +0300
Message-Id: <20200721210922.7646-27-alazar@bitdefender.com>
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
aW9uIGlzIG5lZWRlZCBmb3IgS1ZNSV9WQ1BVX0NPTlRST0xfU0lOR0xFU1RFUC4KClNpZ25lZC1v
ZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2Zm
LWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94
ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAxICsKIGFyY2gveDg2L2t2bS92bXgvdm14LmMg
ICAgICAgICAgfCAxMSArKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggYTkwNWUxNGU0Yzc1Li40ODdkMWZhNmU3
NmQgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJj
aC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTI5NCw2ICsxMjk0LDcgQEAgc3RydWN0
IGt2bV94ODZfb3BzIHsKIAl1NjQgKCpmYXVsdF9nbGEpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSk7
CiAJYm9vbCAoKnNwdF9mYXVsdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAlib29sICgqZ3B0
X3RyYW5zbGF0aW9uX2ZhdWx0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworCXZvaWQgKCpjb250
cm9sX3NpbmdsZXN0ZXApKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpOwogfTsK
IAogc3RydWN0IGt2bV94ODZfbmVzdGVkX29wcyB7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0v
dm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBhMDQzZTNlN2QwOWEuLjRl
ZjRmM2MxYjc4YSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNo
L3g4Ni9rdm0vdm14L3ZteC5jCkBAIC03OTIzLDYgKzc5MjMsMTYgQEAgc3RhdGljIGJvb2wgdm14
X2dwdF90cmFuc2xhdGlvbl9mYXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCiAJcmV0dXJuIHRy
dWU7CiB9CiAKK3N0YXRpYyB2b2lkIHZteF9jb250cm9sX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1LCBib29sIGVuYWJsZSkKK3sKKwlpZiAoZW5hYmxlKQorCQlleGVjX2NvbnRyb2xz
X3NldGJpdCh0b192bXgodmNwdSksCisJCQkgICAgICBDUFVfQkFTRURfTU9OSVRPUl9UUkFQX0ZM
QUcpOworCWVsc2UKKwkJZXhlY19jb250cm9sc19jbGVhcmJpdCh0b192bXgodmNwdSksCisJCQkJ
Q1BVX0JBU0VEX01PTklUT1JfVFJBUF9GTEFHKTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1feDg2
X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5oYXJkd2FyZV91bnNldHVwID0gaGFy
ZHdhcmVfdW5zZXR1cCwKIApAQCAtODA2Myw2ICs4MDczLDcgQEAgc3RhdGljIHN0cnVjdCBrdm1f
eDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5mYXVsdF9nbGEgPSB2bXhfZmF1
bHRfZ2xhLAogCS5zcHRfZmF1bHQgPSB2bXhfc3B0X2ZhdWx0LAogCS5ncHRfdHJhbnNsYXRpb25f
ZmF1bHQgPSB2bXhfZ3B0X3RyYW5zbGF0aW9uX2ZhdWx0LAorCS5jb250cm9sX3NpbmdsZXN0ZXAg
PSB2bXhfY29udHJvbF9zaW5nbGVzdGVwLAogfTsKIAogc3RhdGljIF9faW5pdCBpbnQgaGFyZHdh
cmVfc2V0dXAodm9pZCkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
