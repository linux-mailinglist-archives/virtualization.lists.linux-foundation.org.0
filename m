Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D2A2D1ACF
	for <lists.virtualization@lfdr.de>; Mon,  7 Dec 2020 21:46:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E3089878EC;
	Mon,  7 Dec 2020 20:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbRMrm95IRCl; Mon,  7 Dec 2020 20:46:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 84C2D87911;
	Mon,  7 Dec 2020 20:46:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 65A71C013B;
	Mon,  7 Dec 2020 20:46:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0D71C1834
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA06387985
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qGI0ITwsO3+k
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A67CD879E1
 for <virtualization@lists.linux-foundation.org>;
 Mon,  7 Dec 2020 20:46:17 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 33DDF305D50C; Mon,  7 Dec 2020 22:46:15 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 103A63072784;
 Mon,  7 Dec 2020 22:46:15 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v11 20/81] KVM: x86: add kvm_x86_ops.fault_gla()
Date: Mon,  7 Dec 2020 22:45:21 +0200
Message-Id: <20201207204622.15258-21-alazar@bitdefender.com>
In-Reply-To: <20201207204622.15258-1-alazar@bitdefender.com>
References: <20201207204622.15258-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIGt2bWlfdXBkYXRlX2FkX2ZsYWdzKCkKYW5kIGt2bV9wYWdlX3RyYWNr
X2VtdWxhdGlvbl9mYWlsdXJlKCkuCgprdm1pX3VwZGF0ZV9hZF9mbGFncygpIHVzZXMgdGhlIGV4
aXN0aW5nIGd1ZXN0IHBhZ2UgdGFibGUgd2FsayBjb2RlIHRvCnVwZGF0ZSB0aGUgQS9EIGJpdHMg
YW5kIHJldHVybiB0byBndWVzdCAod2hlbiB0aGUgaW50cm9zcGVjdGlvbiB0b29sCndyaXRlLXBy
b3RlY3RzIHRoZSBndWVzdCBwYWdlIHRhYmxlcykuCgprdm1fcGFnZV90cmFja19lbXVsYXRpb25f
ZmFpbHVyZSgpIGNhbGxzIHRoZSBwYWdlIHRyYWNraW5nIGNvZGUsIHRoYXQKY2FuIHRyaWdnZXIg
YW4gZXZlbnQgZm9yIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgKHdoaWNoIG1pZ2h0IG5lZWQgdGhl
CkdWQSBpbiBhZGRpdGlvbiB0byB0aGUgR1BBKS4KClNpZ25lZC1vZmYtYnk6IE1paGFpIERvbsib
dSA8bWRvbnR1QGJpdGRlZmVuZGVyLmNvbT4KQ28tZGV2ZWxvcGVkLWJ5OiBOaWN1yJlvciBDw67I
m3UgPG5pY3UuY2l0dUBpY2xvdWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaWN1yJlvciBDw67Im3Ug
PG5pY3UuY2l0dUBpY2xvdWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFs
YXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aCB8IDIgKysKIGFyY2gveDg2L2luY2x1ZGUvYXNtL3ZteC5oICAgICAgfCAyICsrCiBhcmNoL3g4
Ni9rdm0vc3ZtL3N2bS5jICAgICAgICAgIHwgOSArKysrKysrKysKIGFyY2gveDg2L2t2bS92bXgv
dm14LmMgICAgICAgICAgfCA5ICsrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2Fy
Y2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKaW5kZXggODYwNDgwMzdkYTIzLi40NWM3MmFm
MDVmYTIgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIv
YXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaApAQCAtMTMwMyw2ICsxMzAzLDggQEAgc3Ry
dWN0IGt2bV94ODZfb3BzIHsKIAogCXZvaWQgKCptaWdyYXRlX3RpbWVycykoc3RydWN0IGt2bV92
Y3B1ICp2Y3B1KTsKIAl2b2lkICgqbXNyX2ZpbHRlcl9jaGFuZ2VkKShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpOworCisJdTY0ICgqZmF1bHRfZ2xhKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogfTsK
IAogc3RydWN0IGt2bV94ODZfbmVzdGVkX29wcyB7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS92bXguaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL3ZteC5oCmluZGV4IDM4Y2E0NDVh
ODQyOS4uNTU0MzMzMjI5MmI1IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXgu
aAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaApAQCAtNTQ0LDYgKzU0NCw3IEBAIGVu
dW0gdm1fZW50cnlfZmFpbHVyZV9jb2RlIHsKICNkZWZpbmUgRVBUX1ZJT0xBVElPTl9SRUFEQUJM
RV9CSVQJMwogI2RlZmluZSBFUFRfVklPTEFUSU9OX1dSSVRBQkxFX0JJVAk0CiAjZGVmaW5lIEVQ
VF9WSU9MQVRJT05fRVhFQ1VUQUJMRV9CSVQJNQorI2RlZmluZSBFUFRfVklPTEFUSU9OX0dMQV9W
QUxJRF9CSVQJNwogI2RlZmluZSBFUFRfVklPTEFUSU9OX0dWQV9UUkFOU0xBVEVEX0JJVCA4CiAj
ZGVmaW5lIEVQVF9WSU9MQVRJT05fQUNDX1JFQUQJCSgxIDw8IEVQVF9WSU9MQVRJT05fQUNDX1JF
QURfQklUKQogI2RlZmluZSBFUFRfVklPTEFUSU9OX0FDQ19XUklURQkJKDEgPDwgRVBUX1ZJT0xB
VElPTl9BQ0NfV1JJVEVfQklUKQpAQCAtNTUxLDYgKzU1Miw3IEBAIGVudW0gdm1fZW50cnlfZmFp
bHVyZV9jb2RlIHsKICNkZWZpbmUgRVBUX1ZJT0xBVElPTl9SRUFEQUJMRQkJKDEgPDwgRVBUX1ZJ
T0xBVElPTl9SRUFEQUJMRV9CSVQpCiAjZGVmaW5lIEVQVF9WSU9MQVRJT05fV1JJVEFCTEUJCSgx
IDw8IEVQVF9WSU9MQVRJT05fV1JJVEFCTEVfQklUKQogI2RlZmluZSBFUFRfVklPTEFUSU9OX0VY
RUNVVEFCTEUJKDEgPDwgRVBUX1ZJT0xBVElPTl9FWEVDVVRBQkxFX0JJVCkKKyNkZWZpbmUgRVBU
X1ZJT0xBVElPTl9HTEFfVkFMSUQJCSgxIDw8IEVQVF9WSU9MQVRJT05fR0xBX1ZBTElEX0JJVCkK
ICNkZWZpbmUgRVBUX1ZJT0xBVElPTl9HVkFfVFJBTlNMQVRFRAkoMSA8PCBFUFRfVklPTEFUSU9O
X0dWQV9UUkFOU0xBVEVEX0JJVCkKIAogLyoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0v
c3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCmluZGV4IDQzYTJlNGVjNjE3OC4uYzY3MzBl
YzM5YzU4IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2
L2t2bS9zdm0vc3ZtLmMKQEAgLTQzMTQsNiArNDMxNCwxMyBAQCBzdGF0aWMgaW50IHN2bV92bV9p
bml0KHN0cnVjdCBrdm0gKmt2bSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHU2NCBzdm1fZmF1
bHRfZ2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwljb25zdCBzdHJ1Y3QgdmNwdV9zdm0g
KnN2bSA9IHRvX3N2bSh2Y3B1KTsKKworCXJldHVybiBzdm0tPnZjcHUuYXJjaC5jcjIgPyBzdm0t
PnZjcHUuYXJjaC5jcjIgOiB+MHVsbDsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBz
dm1feDg2X29wcyBfX2luaXRkYXRhID0gewogCS5oYXJkd2FyZV91bnNldHVwID0gc3ZtX2hhcmR3
YXJlX3RlYXJkb3duLAogCS5oYXJkd2FyZV9lbmFibGUgPSBzdm1faGFyZHdhcmVfZW5hYmxlLApA
QCAtNDQ0Miw2ICs0NDQ5LDggQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29w
cyBfX2luaXRkYXRhID0gewogCS5hcGljX2luaXRfc2lnbmFsX2Jsb2NrZWQgPSBzdm1fYXBpY19p
bml0X3NpZ25hbF9ibG9ja2VkLAogCiAJLm1zcl9maWx0ZXJfY2hhbmdlZCA9IHN2bV9tc3JfZmls
dGVyX2NoYW5nZWQsCisKKwkuZmF1bHRfZ2xhID0gc3ZtX2ZhdWx0X2dsYSwKIH07CiAKIHN0YXRp
YyBzdHJ1Y3Qga3ZtX3g4Nl9pbml0X29wcyBzdm1faW5pdF9vcHMgX19pbml0ZGF0YSA9IHsKZGlm
ZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5j
CmluZGV4IGQ1ZDQyMDMzNzhkMy4uNDFlYTFlZTlkNDE5IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9r
dm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMKQEAgLTc2NDEsNiArNzY0
MSwxMyBAQCBzdGF0aWMgaW50IHZteF9jcHVfZGlydHlfbG9nX3NpemUodm9pZCkKIAlyZXR1cm4g
ZW5hYmxlX3BtbCA/IFBNTF9FTlRJVFlfTlVNIDogMDsKIH0KIAorc3RhdGljIHU2NCB2bXhfZmF1
bHRfZ2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAodmNwdS0+YXJjaC5leGl0X3F1
YWxpZmljYXRpb24gJiBFUFRfVklPTEFUSU9OX0dMQV9WQUxJRCkKKwkJcmV0dXJuIHZtY3NfcmVh
ZGwoR1VFU1RfTElORUFSX0FERFJFU1MpOworCXJldHVybiB+MHVsbDsKK30KKwogc3RhdGljIHN0
cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5oYXJkd2FyZV91
bnNldHVwID0gaGFyZHdhcmVfdW5zZXR1cCwKIApAQCAtNzc3OSw2ICs3Nzg2LDggQEAgc3RhdGlj
IHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCiAJLm1zcl9m
aWx0ZXJfY2hhbmdlZCA9IHZteF9tc3JfZmlsdGVyX2NoYW5nZWQsCiAJLmNwdV9kaXJ0eV9sb2df
c2l6ZSA9IHZteF9jcHVfZGlydHlfbG9nX3NpemUsCisKKwkuZmF1bHRfZ2xhID0gdm14X2ZhdWx0
X2dsYSwKIH07CiAKIHN0YXRpYyBfX2luaXQgaW50IGhhcmR3YXJlX3NldHVwKHZvaWQpCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
