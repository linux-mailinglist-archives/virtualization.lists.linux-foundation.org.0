Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DACD3228B38
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:26:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8CA83882F2;
	Tue, 21 Jul 2020 21:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aU78YkIGP4Oz; Tue, 21 Jul 2020 21:26:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 240AE88303;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0AB6FC016F;
	Tue, 21 Jul 2020 21:26:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32E69C088E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 18577227EC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H7iJklrxOLeQ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id EBDDB2273B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:25:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2E479305D763; Wed, 22 Jul 2020 00:09:21 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 0FDFC304FA12;
 Wed, 22 Jul 2020 00:09:21 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 16/84] KVM: x86: export .msr_write_intercepted()
Date: Wed, 22 Jul 2020 00:08:14 +0300
Message-Id: <20200721210922.7646-17-alazar@bitdefender.com>
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
aW9uIHdpbGwgYmUgdXNlZCB0byBjaGVjayBpZiB0aGUgYWNjZXNzIGZvciBhIHNwZWNpZmljIE1T
UiBpcwphbHJlYWR5IGludGVyY2VwdGVkLgoKU2lnbmVkLW9mZi1ieTogTmljdciZb3IgQ8OuyJt1
IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8
YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oIHwgMSArCiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jICAgICAgICAgIHwgMSArCiBhcmNoL3g4
Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDJlZDFlNTYyMWNjZi4uNmJlODMy
YmE5Yzk3IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBi
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTExMDYsNiArMTEwNiw3IEBAIHN0
cnVjdCBrdm1feDg2X29wcyB7CiAJdm9pZCAoKnVwZGF0ZV9icF9pbnRlcmNlcHQpKHN0cnVjdCBr
dm1fdmNwdSAqdmNwdSk7CiAJaW50ICgqZ2V0X21zcikoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBz
dHJ1Y3QgbXNyX2RhdGEgKm1zcik7CiAJaW50ICgqc2V0X21zcikoc3RydWN0IGt2bV92Y3B1ICp2
Y3B1LCBzdHJ1Y3QgbXNyX2RhdGEgKm1zcik7CisJYm9vbCAoKm1zcl93cml0ZV9pbnRlcmNlcHRl
ZCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1MzIgbXNyKTsKIAl1NjQgKCpnZXRfc2VnbWVudF9i
YXNlKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIGludCBzZWcpOwogCXZvaWQgKCpnZXRfc2VnbWVu
dCkoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCQkJICAgIHN0cnVjdCBrdm1fc2VnbWVudCAqdmFy
LCBpbnQgc2VnKTsKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMgYi9hcmNoL3g4
Ni9rdm0vc3ZtL3N2bS5jCmluZGV4IGNjNTVjNTcxZmU4Ni4uNGU1YjA3NjA2ODkxIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMK
QEAgLTQwODAsNiArNDA4MCw3IEBAIHN0YXRpYyBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgc3ZtX3g4Nl9v
cHMgX19pbml0ZGF0YSA9IHsKIAkuZ2V0X21zcl9mZWF0dXJlID0gc3ZtX2dldF9tc3JfZmVhdHVy
ZSwKIAkuZ2V0X21zciA9IHN2bV9nZXRfbXNyLAogCS5zZXRfbXNyID0gc3ZtX3NldF9tc3IsCisJ
Lm1zcl93cml0ZV9pbnRlcmNlcHRlZCA9IG1zcl93cml0ZV9pbnRlcmNlcHRlZCwKIAkuZ2V0X3Nl
Z21lbnRfYmFzZSA9IHN2bV9nZXRfc2VnbWVudF9iYXNlLAogCS5nZXRfc2VnbWVudCA9IHN2bV9n
ZXRfc2VnbWVudCwKIAkuc2V0X3NlZ21lbnQgPSBzdm1fc2V0X3NlZ21lbnQsCmRpZmYgLS1naXQg
YS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCAz
YjU3NzgwMDNiNTguLmNmMDdkYjEyOTY3MCAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92
bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC03OTA2LDYgKzc5MDYsNyBAQCBz
dGF0aWMgc3RydWN0IGt2bV94ODZfb3BzIHZteF94ODZfb3BzIF9faW5pdGRhdGEgPSB7CiAJLmdl
dF9tc3JfZmVhdHVyZSA9IHZteF9nZXRfbXNyX2ZlYXR1cmUsCiAJLmdldF9tc3IgPSB2bXhfZ2V0
X21zciwKIAkuc2V0X21zciA9IHZteF9zZXRfbXNyLAorCS5tc3Jfd3JpdGVfaW50ZXJjZXB0ZWQg
PSBtc3Jfd3JpdGVfaW50ZXJjZXB0ZWQsCiAJLmdldF9zZWdtZW50X2Jhc2UgPSB2bXhfZ2V0X3Nl
Z21lbnRfYmFzZSwKIAkuZ2V0X3NlZ21lbnQgPSB2bXhfZ2V0X3NlZ21lbnQsCiAJLnNldF9zZWdt
ZW50ID0gdm14X3NldF9zZWdtZW50LApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24u
b3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
