Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 732914244B0
	for <lists.virtualization@lfdr.de>; Wed,  6 Oct 2021 19:41:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52F0B60F1C;
	Wed,  6 Oct 2021 17:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzDxJMuGkYsW; Wed,  6 Oct 2021 17:40:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id AC3E760F18;
	Wed,  6 Oct 2021 17:40:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41094C0022;
	Wed,  6 Oct 2021 17:40:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 215E3C0037
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 89DB1407DD
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuRmm3y0-APj
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E499407D0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 Oct 2021 17:40:44 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 82B83307CAE3; Wed,  6 Oct 2021 20:31:00 +0300 (EEST)
Received: from localhost (unknown [91.199.104.28])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 680A83064495;
 Wed,  6 Oct 2021 20:31:00 +0300 (EEST)
X-Is-Junk-Enabled: fGZTSsP0qEJE2AIKtlSuFiRRwg9xyHmJ
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [PATCH v12 18/77] KVM: x86: add kvm_x86_ops.control_singlestep()
Date: Wed,  6 Oct 2021 20:30:14 +0300
Message-Id: <20211006173113.26445-19-alazar@bitdefender.com>
In-Reply-To: <20211006173113.26445-1-alazar@bitdefender.com>
References: <20211006173113.26445-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wanpeng Li <wanpengli@tencent.com>,
 =?UTF-8?q?Nicu=C8=99or=20C=C3=AE=C8=9Bu?= <nicu.citu@icloud.com>,
 Sean Christopherson <seanjc@google.com>, Joerg Roedel <joro@8bytes.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Mathieu Tarral <mathieu.tarral@protonmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>
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
L2luY2x1ZGUvYXNtL2t2bS14ODYtb3BzLmggfCAgMSArCiBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9r
dm1faG9zdC5oICAgIHwgIDEgKwogYXJjaC94ODYva3ZtL3ZteC92bXguYyAgICAgICAgICAgICB8
IDExICsrKysrKysrKysrCiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm0teDg2LW9wcy5oIGIvYXJjaC94ODYvaW5j
bHVkZS9hc20va3ZtLXg4Ni1vcHMuaAppbmRleCBhZDZjMTlkOWJlZjUuLjgwY2QwMTBhYjNmZCAx
MDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtLXg4Ni1vcHMuaAorKysgYi9hcmNo
L3g4Ni9pbmNsdWRlL2FzbS9rdm0teDg2LW9wcy5oCkBAIC0xMzAsNiArMTMwLDcgQEAgS1ZNX1g4
Nl9PUChkZXNjX2ludGVyY2VwdGVkKQogS1ZNX1g4Nl9PUChtc3Jfd3JpdGVfaW50ZXJjZXB0ZWQp
CiBLVk1fWDg2X09QKGNvbnRyb2xfbXNyX2ludGVyY2VwdCkKIEtWTV9YODZfT1AoZmF1bHRfZ2xh
KQorS1ZNX1g4Nl9PUF9OVUxMKGNvbnRyb2xfc2luZ2xlc3RlcCkKIAogI3VuZGVmIEtWTV9YODZf
T1AKICN1bmRlZiBLVk1fWDg2X09QX05VTEwKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL2t2bV9ob3N0LmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCmluZGV4IDk2
MDU4YThhMWU1ZS4uZGZjNTJlNDUxZjliIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9rdm1faG9zdC5oCisrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2t2bV9ob3N0LmgKQEAgLTE1
MTEsNiArMTUxMSw3IEBAIHN0cnVjdCBrdm1feDg2X29wcyB7CiAJdm9pZCAoKnZjcHVfZGVsaXZl
cl9zaXBpX3ZlY3Rvcikoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1OCB2ZWN0b3IpOwogCiAJdTY0
ICgqZmF1bHRfZ2xhKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOworCXZvaWQgKCpjb250cm9sX3Np
bmdsZXN0ZXApKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgYm9vbCBlbmFibGUpOwogfTsKIAogc3Ry
dWN0IGt2bV94ODZfbmVzdGVkX29wcyB7CmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3Zt
eC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCBmM2U4ODBlZjIyYzguLjg2ZmE4NDIw
NWQyMyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9r
dm0vdm14L3ZteC5jCkBAIC03NjI3LDYgKzc2MjcsMTYgQEAgc3RhdGljIHU2NCB2bXhfZmF1bHRf
Z2xhKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSkKIAlyZXR1cm4gfjB1bGw7CiB9CiAKK3N0YXRpYyB2
b2lkIHZteF9jb250cm9sX3NpbmdsZXN0ZXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBib29sIGVu
YWJsZSkKK3sKKwlpZiAoZW5hYmxlKQorCQlleGVjX2NvbnRyb2xzX3NldGJpdCh0b192bXgodmNw
dSksCisJCQkgICAgICBDUFVfQkFTRURfTU9OSVRPUl9UUkFQX0ZMQUcpOworCWVsc2UKKwkJZXhl
Y19jb250cm9sc19jbGVhcmJpdCh0b192bXgodmNwdSksCisJCQkJQ1BVX0JBU0VEX01PTklUT1Jf
VFJBUF9GTEFHKTsKK30KKwogc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29wcyBf
X2luaXRkYXRhID0gewogCS5oYXJkd2FyZV91bnNldHVwID0gaGFyZHdhcmVfdW5zZXR1cCwKIApA
QCAtNzc3MSw2ICs3NzgxLDcgQEAgc3RhdGljIHN0cnVjdCBrdm1feDg2X29wcyB2bXhfeDg2X29w
cyBfX2luaXRkYXRhID0gewogCS52Y3B1X2RlbGl2ZXJfc2lwaV92ZWN0b3IgPSBrdm1fdmNwdV9k
ZWxpdmVyX3NpcGlfdmVjdG9yLAogCiAJLmZhdWx0X2dsYSA9IHZteF9mYXVsdF9nbGEsCisJLmNv
bnRyb2xfc2luZ2xlc3RlcCA9IHZteF9jb250cm9sX3NpbmdsZXN0ZXAsCiB9OwogCiBzdGF0aWMg
X19pbml0IHZvaWQgdm14X3NldHVwX3VzZXJfcmV0dXJuX21zcnModm9pZCkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGlu
ZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8v
bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
