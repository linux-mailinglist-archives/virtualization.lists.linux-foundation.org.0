Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 174B9229CA1
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:02:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B803F887DC;
	Wed, 22 Jul 2020 16:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1IisVKAsTMQ; Wed, 22 Jul 2020 16:02:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6868E8887D;
	Wed, 22 Jul 2020 16:01:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 369DCC004E;
	Wed, 22 Jul 2020 16:01:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3CDCCC0052
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2ABEA88734
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nJWUM0ADQ83u
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BBEB1885FB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 EF4DE305D6CF; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id DC45D305FFB4;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 27/34] KVM: x86: add .disable_ve()
Date: Wed, 22 Jul 2020 19:01:14 +0300
Message-Id: <20200722160121.9601-28-alazar@bitdefender.com>
In-Reply-To: <20200722160121.9601-1-alazar@bitdefender.com>
References: <20200722160121.9601-1-alazar@bitdefender.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?=C8=98tefan=20=C8=98icleru?= <ssicleru@bitdefender.com>,
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKVGhpcyBm
dW5jdGlvbiBpcyBuZWVkZWQgZm9yIHRoZSBLVk1JX1ZDUFVfRElTQUJMRV9WRSBjb21tYW5kLgoK
U2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+
Ci0tLQogYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaCB8ICAxICsKIGFyY2gveDg2L2t2
bS92bXgvdm14LmMgICAgICAgICAgfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9z
dC5oIGIvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3QuaAppbmRleCA0Y2VlNjQxYWY0OGUu
LjU0OTY5YzJlODA0ZSAxMDA2NDQKLS0tIGEvYXJjaC94ODYvaW5jbHVkZS9hc20va3ZtX2hvc3Qu
aAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9rdm1faG9zdC5oCkBAIC0xMzE2LDYgKzEzMTYs
NyBAQCBzdHJ1Y3Qga3ZtX3g4Nl9vcHMgewogCWludCAoKmNvbnRyb2xfZXB0X3ZpZXcpKHN0cnVj
dCBrdm1fdmNwdSAqdmNwdSwgdTE2IHZpZXcsIHU4IHZpc2libGUpOwogCWludCAoKnNldF92ZV9p
bmZvKShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgdmVfaW5mbywKIAkJCQli
b29sIHRyaWdnZXJfdm1leGl0KTsKKwlpbnQgKCpkaXNhYmxlX3ZlKShzdHJ1Y3Qga3ZtX3ZjcHUg
KnZjcHUpOwogfTsKIAogc3RydWN0IGt2bV94ODZfbmVzdGVkX29wcyB7CmRpZmYgLS1naXQgYS9h
cmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwppbmRleCA4NzFj
YzQ5MDYzZDguLjk2YWE0YjdlMjg1NyAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3ZtL3ZteC92bXgu
YworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC00NDY0LDYgKzQ0NjQsMTUgQEAgc3Rh
dGljIGludCB2bXhfc2V0X3ZlX2luZm8oc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBs
b25nIHZlX2luZm8sCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgdm14X2Rpc2FibGVfdmUo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1KQoreworCWlmIChrdm1fdmVfc3VwcG9ydGVkKQorCQlzZWNv
bmRhcnlfZXhlY19jb250cm9sc19jbGVhcmJpdCh0b192bXgodmNwdSksCisJCQkJCQkgU0VDT05E
QVJZX0VYRUNfRVBUX1ZFKTsKKworCXJldHVybiAwOworfQorCiAjZGVmaW5lIFZNWF9YU1NfRVhJ
VF9CSVRNQVAgMAogCiAvKgpAQCAtODM5MCw2ICs4Mzk5LDcgQEAgc3RhdGljIHN0cnVjdCBrdm1f
eDg2X29wcyB2bXhfeDg2X29wcyBfX2luaXRkYXRhID0gewogCS5zZXRfZXB0X3ZpZXcgPSB2bXhf
c2V0X2VwdF92aWV3LAogCS5jb250cm9sX2VwdF92aWV3ID0gdm14X2NvbnRyb2xfZXB0X3ZpZXcs
CiAJLnNldF92ZV9pbmZvID0gdm14X3NldF92ZV9pbmZvLAorCS5kaXNhYmxlX3ZlID0gdm14X2Rp
c2FibGVfdmUsCiB9OwogCiBzdGF0aWMgX19pbml0IGludCBoYXJkd2FyZV9zZXR1cCh2b2lkKQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
