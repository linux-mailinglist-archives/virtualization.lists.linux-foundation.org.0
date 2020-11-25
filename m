Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9A62C3C48
	for <lists.virtualization@lfdr.de>; Wed, 25 Nov 2020 10:41:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB3A1869DD;
	Wed, 25 Nov 2020 09:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuT6On2_6qDv; Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A29B3869B9;
	Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 665B7C1836;
	Wed, 25 Nov 2020 09:41:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FD21C0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1C3FE8698F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XPJKXXtp_EKf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 99E5886920
 for <virtualization@lists.linux-foundation.org>;
 Wed, 25 Nov 2020 09:41:51 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 E21B2305D505; Wed, 25 Nov 2020 11:35:45 +0200 (EET)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id BFB963072785;
 Wed, 25 Nov 2020 11:35:45 +0200 (EET)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v10 19/81] KVM: x86: save the error code during EPT/NPF exits
 handling
Date: Wed, 25 Nov 2020 11:34:58 +0200
Message-Id: <20201125093600.2766-20-alazar@bitdefender.com>
In-Reply-To: <20201125093600.2766-1-alazar@bitdefender.com>
References: <20201125093600.2766-1-alazar@bitdefender.com>
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
ZWQgZm9yIGt2bV9wYWdlX3RyYWNrX2VtdWxhdGlvbl9mYWlsdXJlKCkuCgpXaGVuIHRoZSBpbnRy
b3NwZWN0aW9uIHRvb2wge3JlYWQsd3JpdGUsZXhlY30tcHJvdGVjdCBhIGd1ZXN0IG1lbW9yeQpw
YWdlLCBpdCBpcyBub3RpZmllZCBmcm9tIHRoZSByZWFkL3dyaXRlL2ZldGNoIGNhbGxiYWNrcyB1
c2VkIGJ5CnRoZSBLVk0gZW11bGF0b3IuIElmIHRoZSBlbXVsYXRpb24gZmFpbHMgaXQgaXMgcG9z
c2libGUgdGhhdCB0aGUKcmVhZC93cml0ZSBjYWxsYmFja3Mgd2VyZSBub3QgdXNlZC4gSW4gc3Vj
aCBjYXNlcywgdGhlIGVtdWxhdG9yIHdpbGwKY2FsbCBrdm1fcGFnZV90cmFja19lbXVsYXRpb25f
ZmFpbHVyZSgpIHRvIGVuc3VyZSB0aGF0IHRoZSBpbnRyb3NwZWN0aW9uCnRvb2wgaXMgbm90aWZp
ZWQgb2YgdGhlIHJlYWQvd3JpdGUgI1BGIChiYXNlZCBvbiB0aGlzIHNhdmVkIGVycm9yIGNvZGUp
LAp3aGljaCBpbiB0dXJuIGNhbiBlbXVsYXRlIHRoZSBpbnN0cnVjdGlvbiBvciB1bnByb3RlY3Qg
dGhlIG1lbW9yeSBwYWdlCihhbmQgbGV0IHRoZSBndWVzdCBleGVjdXRlIHRoZSBpbnN0cnVjdGlv
bikuCgpTaWduZWQtb2ZmLWJ5OiBNaWhhaSBEb27Im3UgPG1kb250dUBiaXRkZWZlbmRlci5jb20+
ClNpZ25lZC1vZmYtYnk6IEFkYWxiZXJ0IExhesSDciA8YWxhemFyQGJpdGRlZmVuZGVyLmNvbT4K
LS0tCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oIHwgMyArKysKIGFyY2gveDg2L2t2
bS9zdm0vc3ZtLmMgICAgICAgICAgfCAyICsrCiBhcmNoL3g4Ni9rdm0vdm14L3ZteC5jICAgICAg
ICAgIHwgMSArCiAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oCmluZGV4IDAxODUzNDUzYTY1OS4uODYwNDgwMzdkYTIzIDEwMDY0NAotLS0gYS9h
cmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNt
L2t2bV9ob3N0LmgKQEAgLTgxMyw2ICs4MTMsOSBAQCBzdHJ1Y3Qga3ZtX3ZjcHVfYXJjaCB7CiAJ
CSAqLwogCQlib29sIGVuZm9yY2U7CiAJfSBwdl9jcHVpZDsKKworCS8qICNQRiB0cmFuc2xhdGVk
IGVycm9yIGNvZGUgZnJvbSBFUFQvTlBUIGV4aXQgcmVhc29uICovCisJdTY0IGVycm9yX2NvZGU7
CiB9OwogCiBzdHJ1Y3Qga3ZtX2xwYWdlX2luZm8gewpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3Zt
L3N2bS9zdm0uYyBiL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKaW5kZXggMmJmZWZjZmJkZGQ3Li40
M2EyZTRlYzYxNzggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2t2bS9zdm0vc3ZtLmMKKysrIGIvYXJj
aC94ODYva3ZtL3N2bS9zdm0uYwpAQCAtMTkxNiw2ICsxOTE2LDggQEAgc3RhdGljIGludCBucGZf
aW50ZXJjZXB0aW9uKHN0cnVjdCB2Y3B1X3N2bSAqc3ZtKQogCXU2NCBmYXVsdF9hZGRyZXNzID0g
X19zbWVfY2xyKHN2bS0+dm1jYi0+Y29udHJvbC5leGl0X2luZm9fMik7CiAJdTY0IGVycm9yX2Nv
ZGUgPSBzdm0tPnZtY2ItPmNvbnRyb2wuZXhpdF9pbmZvXzE7CiAKKwlzdm0tPnZjcHUuYXJjaC5l
cnJvcl9jb2RlID0gZXJyb3JfY29kZTsKKwogCXRyYWNlX2t2bV9wYWdlX2ZhdWx0KGZhdWx0X2Fk
ZHJlc3MsIGVycm9yX2NvZGUpOwogCXJldHVybiBrdm1fbW11X3BhZ2VfZmF1bHQoJnN2bS0+dmNw
dSwgZmF1bHRfYWRkcmVzcywgZXJyb3JfY29kZSwKIAkJCXN0YXRpY19jcHVfaGFzKFg4Nl9GRUFU
VVJFX0RFQ09ERUFTU0lTVFMpID8KZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMg
Yi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCmluZGV4IGE3ZDJiYWIzODIzMy4uZDVkNDIwMzM3OGQz
IDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92
bXgvdm14LmMKQEAgLTUzOTAsNiArNTM5MCw3IEBAIHN0YXRpYyBpbnQgaGFuZGxlX2VwdF92aW9s
YXRpb24oc3RydWN0IGt2bV92Y3B1ICp2Y3B1KQogCQkgICAgICA/IFBGRVJSX0dVRVNUX0ZJTkFM
X01BU0sgOiBQRkVSUl9HVUVTVF9QQUdFX01BU0s7CiAKIAl2Y3B1LT5hcmNoLmV4aXRfcXVhbGlm
aWNhdGlvbiA9IGV4aXRfcXVhbGlmaWNhdGlvbjsKKwl2Y3B1LT5hcmNoLmVycm9yX2NvZGUgPSBl
cnJvcl9jb2RlOwogCiAJLyoKIAkgKiBDaGVjayB0aGF0IHRoZSBHUEEgZG9lc24ndCBleGNlZWQg
cGh5c2ljYWwgbWVtb3J5IGxpbWl0cywgYXMgdGhhdCBpcwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmly
dHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51
eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
