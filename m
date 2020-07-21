Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 527B2228A9E
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E9DD887B4D;
	Tue, 21 Jul 2020 21:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MNin8WGDUl9a; Tue, 21 Jul 2020 21:16:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB8DC87E19;
	Tue, 21 Jul 2020 21:16:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2C5AC016F;
	Tue, 21 Jul 2020 21:16:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B71CDC08A6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id AAE6F88299
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eE8iLGAvcjQX
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B9AC688268
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:59 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 63DE6305D7F1; Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 3ACCC308C48E;
 Wed, 22 Jul 2020 00:09:20 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 11/84] KVM: x86: add .cr3_write_intercepted()
Date: Wed, 22 Jul 2020 00:08:09 +0300
Message-Id: <20200721210922.7646-12-alazar@bitdefender.com>
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
aW9uIHdpbGwgYmUgdXNlZCB0byBhbGxvdyB0aGUgaW50cm9zcGVjdGlvbiB0b29sIHRvIGRpc2Fi
bGUgdGhlCkNSMy13cml0ZSBpbnRlcmNlcHRpb24gd2hlbiBpdCBpcyBubyBsb25nZXIgaW50ZXJl
c3RlZCBpbiB0aGVzZSBldmVudHMsCmJ1dCBvbmx5IGlmIG5vdGhpbmcgZWxzZSBkZXBlbmRzIG9u
IHRoZXNlIFZNLWV4aXRzLgoKU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBi
aXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJp
dGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMSAr
CiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jICAgICAgICAgIHwgOCArKysrKysrKwogYXJjaC94ODYv
a3ZtL3ZteC92bXguYyAgICAgICAgICB8IDggKysrKysrKysKIDMgZmlsZXMgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0
LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDg5YzBiZDY1MjlhNS4u
YWM0NWFhY2M5ZmMwIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5o
CisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTExMTcsNiArMTExNyw3
IEBAIHN0cnVjdCBrdm1feDg2X29wcyB7CiAJaW50ICgqc2V0X2NyNCkoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGNyNCk7CiAJdm9pZCAoKmNvbnRyb2xfY3IzX2ludGVyY2Vw
dCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgdHlwZSwKIAkJCQkgICAgICBib29sIGVuYWJs
ZSk7CisJYm9vbCAoKmNyM193cml0ZV9pbnRlcmNlcHRlZCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KTsKIAl2b2lkICgqc2V0X2VmZXIpKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdTY0IGVmZXIpOwog
CXZvaWQgKCpnZXRfaWR0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNjX3B0ciAq
ZHQpOwogCXZvaWQgKCpzZXRfaWR0KShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHN0cnVjdCBkZXNj
X3B0ciAqZHQpOwpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS9zdm0uYyBiL2FyY2gveDg2
L2t2bS9zdm0vc3ZtLmMKaW5kZXggZjE0ZmM5NDA1MzhiLi43YTRlYzZmYmZmYjkgMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS9zdm0uYwpA
QCAtMTYwOSw2ICsxNjA5LDEzIEBAIHN0YXRpYyB2b2lkIHN2bV9jb250cm9sX2NyM19pbnRlcmNl
cHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgdHlwZSwKIAkJCSBjbHJfY3JfaW50ZXJjZXB0
KHN2bSwgSU5URVJDRVBUX0NSM19XUklURSk7CiB9CiAKK3N0YXRpYyBib29sIHN2bV9jcjNfd3Jp
dGVfaW50ZXJjZXB0ZWQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCXN0cnVjdCB2Y3B1X3N2
bSAqc3ZtID0gdG9fc3ZtKHZjcHUpOworCisJcmV0dXJuIGlzX2NyX2ludGVyY2VwdChzdm0sIElO
VEVSQ0VQVF9DUjNfV1JJVEUpOworfQorCiBzdGF0aWMgdm9pZCBzdm1fc2V0X3NlZ21lbnQoc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJICAgIHN0cnVjdCBrdm1fc2VnbWVudCAqdmFyLCBpbnQg
c2VnKQogewpAQCAtNDAyMiw2ICs0MDI5LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBz
dm1feDg2X29wcyBfX2luaXRkYXRhID0gewogCS5zZXRfY3IwID0gc3ZtX3NldF9jcjAsCiAJLnNl
dF9jcjQgPSBzdm1fc2V0X2NyNCwKIAkuY29udHJvbF9jcjNfaW50ZXJjZXB0ID0gc3ZtX2NvbnRy
b2xfY3IzX2ludGVyY2VwdCwKKwkuY3IzX3dyaXRlX2ludGVyY2VwdGVkID0gc3ZtX2NyM193cml0
ZV9pbnRlcmNlcHRlZCwKIAkuc2V0X2VmZXIgPSBzdm1fc2V0X2VmZXIsCiAJLmdldF9pZHQgPSBz
dm1fZ2V0X2lkdCwKIAkuc2V0X2lkdCA9IHN2bV9zZXRfaWR0LApkaWZmIC0tZ2l0IGEvYXJjaC94
ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKaW5kZXggNmI5NjM5NzAz
NTYwLi42MWViNjRjZjI1YzcgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMKKysr
IGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtMzAyMCw2ICszMDIwLDEzIEBAIHN0YXRpYyB2
b2lkIHZteF9jb250cm9sX2NyM19pbnRlcmNlcHQoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQg
dHlwZSwKIAkJZXhlY19jb250cm9sc19jbGVhcmJpdCh2bXgsIGNyM19leGVjX2NvbnRyb2wpOwog
fQogCitzdGF0aWMgYm9vbCB2bXhfY3IzX3dyaXRlX2ludGVyY2VwdGVkKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKK3sKKwlzdHJ1Y3QgdmNwdV92bXggKnZteCA9IHRvX3ZteCh2Y3B1KTsKKworCXJl
dHVybiAhIShleGVjX2NvbnRyb2xzX2dldCh2bXgpICYgQ1BVX0JBU0VEX0NSM19MT0FEX0VYSVRJ
TkcpOworfQorCiBzdGF0aWMgdm9pZCBlcHRfdXBkYXRlX3BhZ2luZ19tb2RlX2NyMCh1bnNpZ25l
ZCBsb25nICpod19jcjAsCiAJCQkJCXVuc2lnbmVkIGxvbmcgY3IwLAogCQkJCQlzdHJ1Y3Qga3Zt
X3ZjcHUgKnZjcHUpCkBAIC03ODkwLDYgKzc4OTcsNyBAQCBzdGF0aWMgc3RydWN0IGt2bV94ODZf
b3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLnNldF9jcjAgPSB2bXhfc2V0X2NyMCwK
IAkuc2V0X2NyNCA9IHZteF9zZXRfY3I0LAogCS5jb250cm9sX2NyM19pbnRlcmNlcHQgPSB2bXhf
Y29udHJvbF9jcjNfaW50ZXJjZXB0LAorCS5jcjNfd3JpdGVfaW50ZXJjZXB0ZWQgPSB2bXhfY3Iz
X3dyaXRlX2ludGVyY2VwdGVkLAogCS5zZXRfZWZlciA9IHZteF9zZXRfZWZlciwKIAkuZ2V0X2lk
dCA9IHZteF9nZXRfaWR0LAogCS5zZXRfaWR0ID0gdm14X3NldF9pZHQsCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
