Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 820D4229C93
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E6EBF88253;
	Wed, 22 Jul 2020 16:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhJBpyIcdRqe; Wed, 22 Jul 2020 16:01:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B9A2D887CC;
	Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0A0CC004C;
	Wed, 22 Jul 2020 16:01:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C56DC0050
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 358FE2273B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q8BsWDklMKnp
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by silver.osuosl.org (Postfix) with ESMTPS id D492B203DE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 2DC05305D65A; Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 222FD305FFA0;
 Wed, 22 Jul 2020 19:01:33 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 30/34] KVM: vmx: make use of EPTP_INDEX in
 vmx_set_ept_view()
Date: Wed, 22 Jul 2020 19:01:17 +0300
Message-Id: <20200722160121.9601-31-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKU2lnbmVk
LW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBiaXRkZWZlbmRlci5jb20+Ci0tLQog
YXJjaC94ODYva3ZtL3ZteC92bXguYyB8IDcgKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2FyY2gveDg2L2t2bS92bXgvdm14LmMgYi9hcmNoL3g4
Ni9rdm0vdm14L3ZteC5jCmluZGV4IDAzNWY2YzQzYTJhNC4uNzM2YjZjYzZjYThmIDEwMDY0NAot
LS0gYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCisrKyBiL2FyY2gveDg2L2t2bS92bXgvdm14LmMK
QEAgLTQ0MDgsNiArNDQwOCwxMyBAQCBzdGF0aWMgaW50IHZteF9zZXRfZXB0X3ZpZXcoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1LCB1MTYgdmlldykKIAkJa3ZtX21tdV91bmxvYWQodmNwdSk7CiAJCXIg
PSBrdm1fbW11X3JlbG9hZCh2Y3B1KTsKIAkJV0FSTl9PTl9PTkNFKHIpOworCisJCS8qIFdoZW4g
I1ZFIGhhcHBlbnMsIGN1cnJlbnQgRVBUIGluZGV4IHdpbGwgYmUgc2F2ZWQKKwkJICogYnkgdGhl
IGxvZ2ljYWwgcHJvY2Vzc29yIGludG8gVkUgaW5mb3JtYXRpb24gYXJlYSwKKwkJICogc2VlIGNo
YXB0ZXIgMjQuNi4xOCBhbmQgMjUuNS42LjIgZnJvbSBJbnRlbCBTRE0uCisJCSAqLworCQlpZiAo
a3ZtX3ZlX3N1cHBvcnRlZCkKKwkJCXZtY3Nfd3JpdGUxNihFUFRQX0lOREVYLCB2aWV3KTsKIAl9
CiAKIAlyZXR1cm4gMDsKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxp
bnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWls
bWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
