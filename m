Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B775B228AAC
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 23:16:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5227186B7E;
	Tue, 21 Jul 2020 21:16:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0GLx18rpB2Q; Tue, 21 Jul 2020 21:16:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 51A6B86B47;
	Tue, 21 Jul 2020 21:16:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39092C016F;
	Tue, 21 Jul 2020 21:16:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C6DADC088E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B51FE88250
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:16:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6AFQ0uHEoYR
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6984C88236
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 21:15:57 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 875D5305D76C; Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 63DF9304FA13;
 Wed, 22 Jul 2020 00:09:22 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v9 23/84] KVM: x86: add .fault_gla()
Date: Wed, 22 Jul 2020 00:08:21 +0300
Message-Id: <20200721210922.7646-24-alazar@bitdefender.com>
In-Reply-To: <20200721210922.7646-1-alazar@bitdefender.com>
References: <20200721210922.7646-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Mihai=20Don=C8=9Bu?= <mdontu@bitdefender.com>,
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBmdW5jdGlv
biBpcyBuZWVkZWQgZm9yIGt2bWlfdXBkYXRlX2FkX2ZsYWdzKCkKYW5kIGt2bV9wYWdlX3RyYWNr
X2VtdWxhdGlvbl9mYWlsdXJlKCkuCgprdm1pX3VwZGF0ZV9hZF9mbGFncygpIHVzZXMgdGhlIHRo
ZSBleGlzdGluZyBndWVzdCBwYWdlIHRhYmxlIHdhbGsgY29kZQp0byB1cGRhdGUgdGhlIEEvRCBi
aXRzIGFuZCByZXR1cm4gdG8gZ3Vlc3QgKG9uIFNQVCBwYWdlIGZhdWx0cyBjYXVzZWQKYnkgZ3Vl
c3QgcGFnZSB0YWJsZSB3YWxrcyB3aGVuIHRoZSBpbnRyb3NwZWN0aW9uIHRvb2wgd3JpdGUtcHJv
dGVjdHMKdGhlIGd1ZXN0IHBhZ2UgdGFibGVzKS4KCmt2bV9wYWdlX3RyYWNrX2VtdWxhdGlvbl9m
YWlsdXJlKCkgY2FsbHMgdGhlIHBhZ2UgdHJhY2tpbmcgY29kZSwgd2hpY2gKd2lsbCBiZSBjaGFu
Z2VkIHdpdGggYSBmb2xsb3dpbmcgcGF0Y2ggdG8gcmVjZWl2ZSB0aGUgR1ZBIGluIGFkZGl0aW9u
IHRvCnRoZSBHUEEuIEJvdGggbWlnaHQgYmUgbmVlZGVkIGJ5IHRoZSBpbnRyb3NwZWN0aW9uIHRv
b2wuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+
CkNvLWRldmVsb3BlZC1ieTogTmljdciZb3IgQ8OuyJt1IDxuY2l0dUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IE5pY3XImW9yIEPDrsibdSA8bmNpdHVAYml0ZGVmZW5kZXIuY29tPgpT
aWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0t
LQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8IDIgKysKIGFyY2gveDg2L2luY2x1
ZGUvYXNtL3ZteC5oICAgICAgfCAyICsrCiBhcmNoL3g4Ni9rdm0vc3ZtL3N2bS5jICAgICAgICAg
IHwgOSArKysrKysrKysKIGFyY2gveDg2L2t2bS92bXgvdm14LmMgICAgICAgICAgfCA5ICsrKysr
KysrKwogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvYXJj
aC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9o
b3N0LmgKaW5kZXggMjUzMGFmNDQyMGNmLi5jY2YyODA0ZjQ2YjkgMTAwNjQ0Ci0tLSBhL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKKysrIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3Zt
X2hvc3QuaApAQCAtMTI5MCw2ICsxMjkwLDggQEAgc3RydWN0IGt2bV94ODZfb3BzIHsKIAlpbnQg
KCplbmFibGVfZGlyZWN0X3RsYmZsdXNoKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogCiAJdm9p
ZCAoKm1pZ3JhdGVfdGltZXJzKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworCisJdTY0ICgqZmF1
bHRfZ2xhKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwogfTsKIAogc3RydWN0IGt2bV94ODZfbmVz
dGVkX29wcyB7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaCBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3ZteC5oCmluZGV4IGNkN2RlNGI0MDFmZS4uMDQ0ODdlYjM4YjVjIDEw
MDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS92bXguaAorKysgYi9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS92bXguaApAQCAtNTQzLDYgKzU0Myw3IEBAIGVudW0gdm1fZW50cnlfZmFpbHVyZV9j
b2RlIHsKICNkZWZpbmUgRVBUX1ZJT0xBVElPTl9SRUFEQUJMRV9CSVQJMwogI2RlZmluZSBFUFRf
VklPTEFUSU9OX1dSSVRBQkxFX0JJVAk0CiAjZGVmaW5lIEVQVF9WSU9MQVRJT05fRVhFQ1VUQUJM
RV9CSVQJNQorI2RlZmluZSBFUFRfVklPTEFUSU9OX0dMQV9WQUxJRF9CSVQJNwogI2RlZmluZSBF
UFRfVklPTEFUSU9OX0dWQV9UUkFOU0xBVEVEX0JJVCA4CiAjZGVmaW5lIEVQVF9WSU9MQVRJT05f
QUNDX1JFQUQJCSgxIDw8IEVQVF9WSU9MQVRJT05fQUNDX1JFQURfQklUKQogI2RlZmluZSBFUFRf
VklPTEFUSU9OX0FDQ19XUklURQkJKDEgPDwgRVBUX1ZJT0xBVElPTl9BQ0NfV1JJVEVfQklUKQpA
QCAtNTUwLDYgKzU1MSw3IEBAIGVudW0gdm1fZW50cnlfZmFpbHVyZV9jb2RlIHsKICNkZWZpbmUg
RVBUX1ZJT0xBVElPTl9SRUFEQUJMRQkJKDEgPDwgRVBUX1ZJT0xBVElPTl9SRUFEQUJMRV9CSVQp
CiAjZGVmaW5lIEVQVF9WSU9MQVRJT05fV1JJVEFCTEUJCSgxIDw8IEVQVF9WSU9MQVRJT05fV1JJ
VEFCTEVfQklUKQogI2RlZmluZSBFUFRfVklPTEFUSU9OX0VYRUNVVEFCTEUJKDEgPDwgRVBUX1ZJ
T0xBVElPTl9FWEVDVVRBQkxFX0JJVCkKKyNkZWZpbmUgRVBUX1ZJT0xBVElPTl9HTEFfVkFMSUQJ
CSgxIDw8IEVQVF9WSU9MQVRJT05fR0xBX1ZBTElEX0JJVCkKICNkZWZpbmUgRVBUX1ZJT0xBVElP
Tl9HVkFfVFJBTlNMQVRFRAkoMSA8PCBFUFRfVklPTEFUSU9OX0dWQV9UUkFOU0xBVEVEX0JJVCkK
IAogLyoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0v
c3ZtL3N2bS5jCmluZGV4IDFlYzg4ZmYyNDFhYi4uODZiNjcwZmYzM2RkIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9rdm0vc3ZtL3N2bS5jCisrKyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKQEAgLTQw
ODIsNiArNDA4MiwxMyBAQCBzdGF0aWMgaW50IHN2bV92bV9pbml0KHN0cnVjdCBrdm0gKmt2bSkK
IAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHU2NCBzdm1fZmF1bHRfZ2xhKHN0cnVjdCBrdm1fdmNw
dSAqdmNwdSkKK3sKKwljb25zdCBzdHJ1Y3QgdmNwdV9zdm0gKnN2bSA9IHRvX3N2bSh2Y3B1KTsK
KworCXJldHVybiBzdm0tPnZjcHUuYXJjaC5jcjIgPyBzdm0tPnZjcHUuYXJjaC5jcjIgOiB+MHVs
bDsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX2luaXRkYXRh
ID0gewogCS5oYXJkd2FyZV91bnNldHVwID0gc3ZtX2hhcmR3YXJlX3RlYXJkb3duLAogCS5oYXJk
d2FyZV9lbmFibGUgPSBzdm1faGFyZHdhcmVfZW5hYmxlLApAQCAtNDIwOCw2ICs0MjE1LDggQEAg
c3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyBzdm1feDg2X29wcyBfX2luaXRkYXRhID0gewogCS5u
ZWVkX2VtdWxhdGlvbl9vbl9wYWdlX2ZhdWx0ID0gc3ZtX25lZWRfZW11bGF0aW9uX29uX3BhZ2Vf
ZmF1bHQsCiAKIAkuYXBpY19pbml0X3NpZ25hbF9ibG9ja2VkID0gc3ZtX2FwaWNfaW5pdF9zaWdu
YWxfYmxvY2tlZCwKKworCS5mYXVsdF9nbGEgPSBzdm1fZmF1bHRfZ2xhLAogfTsKIAogc3RhdGlj
IHN0cnVjdCBrdm1feDg2X2luaXRfb3BzIHN2bV9pbml0X29wcyBfX2luaXRkYXRhID0gewpkaWZm
IC0tZ2l0IGEvYXJjaC94ODYva3ZtL3ZteC92bXguYyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
aW5kZXggNjU1NGMyMjc4MTc2Li5hMDRjNDZjZGU1YjMgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2
bS92bXgvdm14LmMKKysrIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpAQCAtNzkwMiw2ICs3OTAy
LDEzIEBAIHN0YXRpYyBib29sIHZteF9jaGVja19hcGljdl9pbmhpYml0X3JlYXNvbnModWxvbmcg
Yml0KQogCXJldHVybiBzdXBwb3J0ZWQgJiBCSVQoYml0KTsKIH0KIAorc3RhdGljIHU2NCB2bXhf
ZmF1bHRfZ2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKK3sKKwlpZiAodmNwdS0+YXJjaC5leGl0
X3F1YWxpZmljYXRpb24gJiBFUFRfVklPTEFUSU9OX0dMQV9WQUxJRCkKKwkJcmV0dXJuIHZtY3Nf
cmVhZGwoR1VFU1RfTElORUFSX0FERFJFU1MpOworCXJldHVybiB+MHVsbDsKK30KKwogc3RhdGlj
IHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5oYXJkd2Fy
ZV91bnNldHVwID0gaGFyZHdhcmVfdW5zZXR1cCwKIApAQCAtODAzOCw2ICs4MDQ1LDggQEAgc3Rh
dGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5uZWVk
X2VtdWxhdGlvbl9vbl9wYWdlX2ZhdWx0ID0gdm14X25lZWRfZW11bGF0aW9uX29uX3BhZ2VfZmF1
bHQsCiAJLmFwaWNfaW5pdF9zaWduYWxfYmxvY2tlZCA9IHZteF9hcGljX2luaXRfc2lnbmFsX2Js
b2NrZWQsCiAJLm1pZ3JhdGVfdGltZXJzID0gdm14X21pZ3JhdGVfdGltZXJzLAorCisJLmZhdWx0
X2dsYSA9IHZteF9mYXVsdF9nbGEsCiB9OwogCiBzdGF0aWMgX19pbml0IGludCBoYXJkd2FyZV9z
ZXR1cCh2b2lkKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgt
Zm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4v
bGlzdGluZm8vdmlydHVhbGl6YXRpb24=
