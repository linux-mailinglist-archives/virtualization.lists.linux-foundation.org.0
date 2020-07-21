Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B7321228B20
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5F162882E4;
	Tue, 21 Jul 2020 21:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QSIp4VFd5f6; Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A19C888272;
	Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7141FC016F;
	Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 19A0FC08A2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0326387E8B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KWEOhqzsYS9x
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AD0A887A56
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 94CF8305D7F3; Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 66114308C48F;
 Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 12/84] KVM: x86: add .desc_ctrl_supported()
Date: Wed, 22 Jul 2020 00:08:10 +0300
Message-Id: <20200721210922.7646-13-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

V2hlbiB0aGUgaW50cm9zcGVjdGlvbiB0b29sIHRyaWVzIHRvIGVuYWJsZSB0aGUgS1ZNSV9FVkVO
VF9ERVNDUklQVE9SCmV2ZW50LCB0aGlzIGZ1bmN0aW9uIGlzIHVzZWQgdG8gY2hlY2sgaWYgaXQg
aXMgc3VwcG9ydGVkLgoKU2lnbmVkLW9mZi1ieTogQWRhbGJlcnQgTGF6xINyIDxhbGF6YXJAYml0
ZGVmZW5kZXIuY29tPgotLS0KIGFyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggfCAxICsK
IGFyY2gveDg2L2t2bS9zdm0vc3ZtLmMgICAgICAgICAgfCA2ICsrKysrKwogYXJjaC94ODYva3Zt
L3ZteC9jYXBhYmlsaXRpZXMuaCB8IDcgKysrKysrLQogYXJjaC94ODYva3ZtL3ZteC92bXguYyAg
ICAgICAgICB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggYWM0NWFhY2M5ZmMwLi5iM2NhNjRh
NzBiYjUgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTEyMyw2ICsxMTIzLDcgQEAgc3Ry
dWN0IGt2bV94ODZfb3BzIHsKIAl2b2lkICgqc2V0X2lkdCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LCBzdHJ1Y3QgZGVzY19wdHIgKmR0KTsKIAl2b2lkICgqZ2V0X2dkdCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3QgZGVzY19wdHIgKmR0KTsKIAl2b2lkICgqc2V0X2dkdCkoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1LCBzdHJ1Y3QgZGVzY19wdHIgKmR0KTsKKwlib29sICgqZGVzY19jdHJsX3N1
cHBvcnRlZCkodm9pZCk7CiAJdm9pZCAoKnN5bmNfZGlydHlfZGVidWdfcmVncykoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KTsKIAl2b2lkICgqc2V0X2RyNykoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1
bnNpZ25lZCBsb25nIHZhbHVlKTsKIAl2b2lkICgqY2FjaGVfcmVnKShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUsIGVudW0ga3ZtX3JlZyByZWcpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS9z
dm0uYyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKaW5kZXggN2E0ZWM2ZmJmZmI5Li5mNGQ4ODJj
YTAwNjAgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYv
a3ZtL3N2bS9zdm0uYwpAQCAtMTUyMyw2ICsxNTIzLDExIEBAIHN0YXRpYyB2b2lkIHN2bV9zZXRf
Z2R0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGRlc2NfcHRyICpkdCkKIAltYXJrX2Rp
cnR5KHN2bS0+dm1jYiwgVk1DQl9EVCk7CiB9CiAKK3N0YXRpYyBib29sIHN2bV9kZXNjX2N0cmxf
c3VwcG9ydGVkKHZvaWQpCit7CisJcmV0dXJuIHRydWU7Cit9CisKIHN0YXRpYyB2b2lkIHVwZGF0
ZV9jcjBfaW50ZXJjZXB0KHN0cnVjdCB2Y3B1X3N2bSAqc3ZtKQogewogCXVsb25nIGdjcjAgPSBz
dm0tPnZjcHUuYXJjaC5jcjA7CkBAIC00MDM1LDYgKzQwNDAsNyBAQCBzdGF0aWMgc3RydWN0IGt2
bV94ODZfb3BzIHN2bV94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLnNldF9pZHQgPSBzdm1fc2V0
X2lkdCwKIAkuZ2V0X2dkdCA9IHN2bV9nZXRfZ2R0LAogCS5zZXRfZ2R0ID0gc3ZtX3NldF9nZHQs
CisJLmRlc2NfY3RybF9zdXBwb3J0ZWQgPSBzdm1fZGVzY19jdHJsX3N1cHBvcnRlZCwKIAkuc2V0
X2RyNyA9IHN2bV9zZXRfZHI3LAogCS5zeW5jX2RpcnR5X2RlYnVnX3JlZ3MgPSBzdm1fc3luY19k
aXJ0eV9kZWJ1Z19yZWdzLAogCS5jYWNoZV9yZWcgPSBzdm1fY2FjaGVfcmVnLApkaWZmIC0tZ2l0
IGEvYXJjaC94ODYva3ZtL3ZteC9jYXBhYmlsaXRpZXMuaCBiL2FyY2gveDg2L2t2bS92bXgvY2Fw
YWJpbGl0aWVzLmgKaW5kZXggNGJiZDhiNDQ4ZDIyLi5lN2Q3ZmNiN2UxN2YgMTAwNjQ0Ci0tLSBh
L2FyY2gveDg2L2t2bS92bXgvY2FwYWJpbGl0aWVzLmgKKysrIGIvYXJjaC94ODYva3ZtL3ZteC9j
YXBhYmlsaXRpZXMuaApAQCAtMTQyLDEyICsxNDIsMTcgQEAgc3RhdGljIGlubGluZSBib29sIGNw
dV9oYXNfdm14X2VwdCh2b2lkKQogCQlTRUNPTkRBUllfRVhFQ19FTkFCTEVfRVBUOwogfQogCi1z
dGF0aWMgaW5saW5lIGJvb2wgdm14X3VtaXBfZW11bGF0ZWQodm9pZCkKK3N0YXRpYyBpbmxpbmUg
Ym9vbCB2bXhfZGVzY19jdHJsX3N1cHBvcnRlZCh2b2lkKQogewogCXJldHVybiB2bWNzX2NvbmZp
Zy5jcHVfYmFzZWRfMm5kX2V4ZWNfY3RybCAmCiAJCVNFQ09OREFSWV9FWEVDX0RFU0M7CiB9CiAK
K3N0YXRpYyBpbmxpbmUgYm9vbCB2bXhfdW1pcF9lbXVsYXRlZCh2b2lkKQoreworCXJldHVybiB2
bXhfZGVzY19jdHJsX3N1cHBvcnRlZCgpOworfQorCiBzdGF0aWMgaW5saW5lIGJvb2wgY3B1X2hh
c192bXhfcmR0c2NwKHZvaWQpCiB7CiAJcmV0dXJuIHZtY3NfY29uZmlnLmNwdV9iYXNlZF8ybmRf
ZXhlY19jdHJsICYKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCmluZGV4IDYxZWI2NGNmMjVjNy4uZWNkNGM1MGJmMWEyIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
QEAgLTc5MDMsNiArNzkwMyw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14X3g4Nl9v
cHMgX19pbml0ZGF0YSA9IHsKIAkuc2V0X2lkdCA9IHZteF9zZXRfaWR0LAogCS5nZXRfZ2R0ID0g
dm14X2dldF9nZHQsCiAJLnNldF9nZHQgPSB2bXhfc2V0X2dkdCwKKwkuZGVzY19jdHJsX3N1cHBv
cnRlZCA9IHZteF9kZXNjX2N0cmxfc3VwcG9ydGVkLAogCS5zZXRfZHI3ID0gdm14X3NldF9kcjcs
CiAJLnN5bmNfZGlydHlfZGVidWdfcmVncyA9IHZteF9zeW5jX2RpcnR5X2RlYnVnX3JlZ3MsCiAJ
LmNhY2hlX3JlZyA9IHZteF9jYWNoZV9yZWcsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXph
dGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRh
dGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
