Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B03197885
	for <lists.virtualization@lfdr.de>; Mon, 30 Mar 2020 12:13:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 45B1C884E4;
	Mon, 30 Mar 2020 10:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6feKMI+dPDUr; Mon, 30 Mar 2020 10:13:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 809B98849C;
	Mon, 30 Mar 2020 10:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75935C1AE8;
	Mon, 30 Mar 2020 10:13:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3C0EC1AE8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 9F85B86980
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moOZugqEVCRC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 790B7869AB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 30 Mar 2020 10:12:54 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 5F710307483A; Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 405FB305B7A0;
 Mon, 30 Mar 2020 13:12:52 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v8 23/81] KVM: x86: save the error code during EPT/NPF exits
 handling
Date: Mon, 30 Mar 2020 13:12:10 +0300
Message-Id: <20200330101308.21702-24-alazar@bitdefender.com>
In-Reply-To: <20200330101308.21702-1-alazar@bitdefender.com>
References: <20200330101308.21702-1-alazar@bitdefender.com>
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

RnJvbTogTWloYWkgRG9uyJt1IDxtZG9udHVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBpcyBuZWVk
ZWQgZm9yIGt2bV9wYWdlX3RyYWNrX2VtdWxhdGlvbl9mYWlsdXJlKCkuCgpTaWduZWQtb2ZmLWJ5
OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+ClNpZ25lZC1vZmYtYnk6IEFk
YWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4KLS0tCiBhcmNoL3g4Ni9pbmNs
dWRlL2FzbS9rdm1faG9zdC5oIHwgMyArKysKIGFyY2gveDg2L2t2bS9zdm0uYyAgICAgICAgICAg
ICAgfCAyICsrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAgICAgIHwgMSArCiAzIGZpbGVz
IGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDcz
YzlmY2Q4MDBmOC4uZmIxYWM1NjQ2ZDMzIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTgy
OCw2ICs4MjgsOSBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7CiAKIAkvKiBBTUQgTVNSQzAwMV8w
MDE1IEhhcmR3YXJlIENvbmZpZ3VyYXRpb24gKi8KIAl1NjQgbXNyX2h3Y3I7CisKKwkvKiAjUEYg
dHJhbnNsYXRlZCBlcnJvciBjb2RlIGZyb20gRVBUL05QVCBleGl0IHJlYXNvbiAqLworCXU2NCBl
cnJvcl9jb2RlOwogfTsKIAogc3RydWN0IGt2bV9scGFnZV9pbmZvIHsKZGlmZiAtLWdpdCBhL2Fy
Y2gveDg2L2t2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9zdm0uYwppbmRleCAxMzM2MDQyOTk4NmUu
LmQ3ZTFlMmQyMGU0OSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3N2bS5jCisrKyBiL2FyY2gv
eDg2L2t2bS9zdm0uYwpAQCAtMjc4Miw2ICsyNzgyLDggQEAgc3RhdGljIGludCBucGZfaW50ZXJj
ZXB0aW9uKHN0cnVjdCB2Y3B1X3N2bSAqc3ZtKQogCXU2NCBmYXVsdF9hZGRyZXNzID0gX19zbWVf
Y2xyKHN2bS0+dm1jYi0+Y29udHJvbC5leGl0X2luZm9fMik7CiAJdTY0IGVycm9yX2NvZGUgPSBz
dm0tPnZtY2ItPmNvbnRyb2wuZXhpdF9pbmZvXzE7CiAKKwlzdm0tPnZjcHUuYXJjaC5lcnJvcl9j
b2RlID0gZXJyb3JfY29kZTsKKwogCXRyYWNlX2t2bV9wYWdlX2ZhdWx0KGZhdWx0X2FkZHJlc3Ms
IGVycm9yX2NvZGUpOwogCXJldHVybiBrdm1fbW11X3BhZ2VfZmF1bHQoJnN2bS0+dmNwdSwgZmF1
bHRfYWRkcmVzcywgZXJyb3JfY29kZSwKIAkJCXN0YXRpY19jcHVfaGFzKFg4Nl9GRUFUVVJFX0RF
Q09ERUFTU0lTVFMpID8KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNo
L3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IGY1OTYyMzhkZDM2OS4uZDNkNWZjZGQ3NTM0IDEwMDY0
NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14
LmMKQEAgLTUyMjQsNiArNTIyNCw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2VwdF92aW9sYXRpb24o
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQkgICAgICA/IFBGRVJSX0dVRVNUX0ZJTkFMX01BU0sg
OiBQRkVSUl9HVUVTVF9QQUdFX01BU0s7CiAKIAl2Y3B1LT5hcmNoLmV4aXRfcXVhbGlmaWNhdGlv
biA9IGV4aXRfcXVhbGlmaWNhdGlvbjsKKwl2Y3B1LT5hcmNoLmVycm9yX2NvZGUgPSBlcnJvcl9j
b2RlOwogCXJldHVybiBrdm1fbW11X3BhZ2VfZmF1bHQodmNwdSwgZ3BhLCBlcnJvcl9jb2RlLCBO
VUxMLCAwKTsKIH0KIApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
