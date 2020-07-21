Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E5E228B3F
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 299468825E;
	Tue, 21 Jul 2020 21:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 795lPb5Ijbgp; Tue, 21 Jul 2020 21:26:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EC19488336;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C99A7C016F;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12132C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EBC5786B7E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kD-lQoQTCc_V
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E4E0B86B9A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:56 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 AA1FD305D76D; Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 88F53304FA12;
 Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 24/84] KVM: x86: add .spt_fault()
Date: Wed, 22 Jul 2020 00:08:22 +0300
Message-Id: <20200721210922.7646-25-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX0VWRU5UX1BGIGV2ZW50LCB0byBhdm9pZCBzZW5kaW5n
CnN1Y2ggZXZlbnRzIHRvIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgaWYgbm90IGNhdXNlZCBieSBh
IFNQVCBwYWdlIGZhdWx0LgoKVGhlIGNvZGUgcGF0aCBpczogZW11bGF0b3IgLT4ge3JlYWQsd3Jp
dGUsZmV0Y2h9IGNhbGxiYWNrcyAtPiBwYWdlIHRyYWNraW5nCi0+IHBhZ2UgdHJhY2tpbmcgY2Fs
bGJhY2tzIC0+IEtWTUlfRVZFTlRfUEYuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1k
b250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxh
emFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
IHwgMSArCiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jICAgICAgICAgIHwgOSArKysrKysrKysKIGFy
Y2gveDg2L2t2bS92bXgvdm14LmMgICAgICAgICAgfCA4ICsrKysrKysrCiAzIGZpbGVzIGNoYW5n
ZWQsIDE4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCBjY2YyODA0
ZjQ2YjkuLmZiNDExOTliMzNmYyAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMjkyLDYg
KzEyOTIsNyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCXZvaWQgKCptaWdyYXRlX3RpbWVycyko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KTsKIAogCXU2NCAoKmZhdWx0X2dsYSkoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKKwlib29sICgqc3B0X2ZhdWx0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwog
fTsKIAogc3RydWN0IGt2bV94ODZfbmVzdGVkX29wcyB7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9r
dm0vc3ZtL3N2bS5jIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0uYwppbmRleCA4NmI2NzBmZjMzZGQu
LjdlY2ZhMTBkY2U1ZCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYworKysgYi9h
cmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCkBAIC00MDg5LDYgKzQwODksMTQgQEAgc3RhdGljIHU2NCBz
dm1fZmF1bHRfZ2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gc3ZtLT52Y3B1LmFy
Y2guY3IyID8gc3ZtLT52Y3B1LmFyY2guY3IyIDogfjB1bGw7CiB9CiAKK3N0YXRpYyBib29sIHN2
bV9zcHRfZmF1bHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCB2Y3B1X3N2bSAq
c3ZtID0gdG9fc3ZtKHZjcHUpOworCXN0cnVjdCB2bWNiICp2bWNiID0gZ2V0X2hvc3Rfdm1jYihz
dm0pOworCisJcmV0dXJuICh2bWNiLT5jb250cm9sLmV4aXRfY29kZSA9PSBTVk1fRVhJVF9OUEYp
OworfQorCiBzdGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9faW5pdGRhdGEg
PSB7CiAJLmhhcmR3YXJlX3Vuc2V0dXAgPSBzdm1faGFyZHdhcmVfdGVhcmRvd24sCiAJLmhhcmR3
YXJlX2VuYWJsZSA9IHN2bV9oYXJkd2FyZV9lbmFibGUsCkBAIC00MjE3LDYgKzQyMjUsNyBAQCBz
dGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHN2bV94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmFw
aWNfaW5pdF9zaWduYWxfYmxvY2tlZCA9IHN2bV9hcGljX2luaXRfc2lnbmFsX2Jsb2NrZWQsCiAK
IAkuZmF1bHRfZ2xhID0gc3ZtX2ZhdWx0X2dsYSwKKwkuc3B0X2ZhdWx0ID0gc3ZtX3NwdF9mYXVs
dCwKIH07CiAKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyBzdm1faW5pdF9vcHMgX19p
bml0ZGF0YSA9IHsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCmluZGV4IGEwNGM0NmNkZTViMy4uMTdiODgzNDVkZmI1IDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
QEAgLTc5MDksNiArNzkwOSwxMyBAQCBzdGF0aWMgdTY0IHZteF9mYXVsdF9nbGEoc3RydWN0IGt2
bV92Y3B1ICp2Y3B1KQogCXJldHVybiB+MHVsbDsKIH0KIAorc3RhdGljIGJvb2wgdm14X3NwdF9m
YXVsdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpCit7CisJY29uc3Qgc3RydWN0IHZjcHVfdm14ICp2
bXggPSB0b192bXgodmNwdSk7CisKKwlyZXR1cm4gKHZteC0+ZXhpdF9yZWFzb24gPT0gRVhJVF9S
RUFTT05fRVBUX1ZJT0xBVElPTik7Cit9CisKIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgdm14
X3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsKIAkuaGFyZHdhcmVfdW5zZXR1cCA9IGhhcmR3YXJlX3Vu
c2V0dXAsCiAKQEAgLTgwNDcsNiArODA1NCw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMg
dm14X3g4Nl9vcHMgX19pbml0ZGF0YSA9IHsKIAkubWlncmF0ZV90aW1lcnMgPSB2bXhfbWlncmF0
ZV90aW1lcnMsCiAKIAkuZmF1bHRfZ2xhID0gdm14X2ZhdWx0X2dsYSwKKwkuc3B0X2ZhdWx0ID0g
dm14X3NwdF9mYXVsdCwKIH07CiAKIHN0YXRpYyBfX2luaXQgaW50IGhhcmR3YXJlX3NldHVwKHZv
aWQpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1
YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0
aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5m
by92aXJ0dWFsaXphdGlvbg==
