Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 73137229C79
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 18:01:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1772A88253;
	Wed, 22 Jul 2020 16:01:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c+6d73pK7eZq; Wed, 22 Jul 2020 16:01:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 37B19887A1;
	Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2ACA5C004E;
	Wed, 22 Jul 2020 16:01:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47FF0C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3636686AE3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qqSQonswe5a
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mx01.bbu.dsd.mx.bitdefender.com
 (mx01.bbu.dsd.mx.bitdefender.com [91.199.104.161])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 992AC86B10
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 16:01:37 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp01.buh.bitdefender.com [10.17.80.75])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 B9D1E305D770; Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.6])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id B0358305FFAB;
 Wed, 22 Jul 2020 19:01:32 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: kvm@vger.kernel.org
Subject: [RFC PATCH v1 24/34] KVM: vmx: trigger vm-exits for mmio sptes by
 default when #VE is enabled
Date: Wed, 22 Jul 2020 19:01:11 +0300
Message-Id: <20200722160121.9601-25-alazar@bitdefender.com>
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

RnJvbTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVAYml0ZGVmZW5kZXIuY29tPgoKQWxsIHNw
dGVzLCBpbmNsdWRpbmcgbW1pbyBzcHRlcyBtdXN0IGhhdmUgU1ZFIGJpdCBzZXQgYnkgZGVmYXVs
dCwgaW4Kb3JkZXIgdG8gdHJpZ2dlciB2bS1leGl0cyBpbnN0ZWFkIG9mICNWRXMgKGluIGNhc2Ug
b2YgYW4gRVBUIHZpb2xhdGlvbikuCk1NSU8gc3B0ZXMgd2VyZSBvdmVybG9va2VkIGluIGNvbW1p
dCAyOGI4YmM3MDQxMTEgKCJLVk06IFZNWDogU3VwcHJlc3MgRVBUIHZpb2xhdGlvbiAjVkUgYnkg
ZGVmYXVsdCAod2hlbiBlbmFibGVkKSIpCndoaWNoIHByb3ZpZGVkIGEgbmV3IG1hc2sgZm9yIG5v
bi1tbWlvIHNwdGVzLgoKU2lnbmVkLW9mZi1ieTogyJh0ZWZhbiDImGljbGVydSA8c3NpY2xlcnVA
Yml0ZGVmZW5kZXIuY29tPgpTaWduZWQtb2ZmLWJ5OiBBZGFsYmVydCBMYXrEg3IgPGFsYXphckBi
aXRkZWZlbmRlci5jb20+Ci0tLQogYXJjaC94ODYva3ZtL3ZteC92bXguYyB8IDEwICsrKysrKysr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jIGIvYXJjaC94ODYva3ZtL3ZteC92bXguYwpp
bmRleCAzNDI4ODU3YzYxNTcuLmI2NWJkMGQxNDRlNSAxMDA2NDQKLS0tIGEvYXJjaC94ODYva3Zt
L3ZteC92bXguYworKysgYi9hcmNoL3g4Ni9rdm0vdm14L3ZteC5jCkBAIC00MzY3LDExICs0MzY3
LDE5IEBAIHN0YXRpYyB2b2lkIHZteF9jb21wdXRlX3NlY29uZGFyeV9leGVjX2NvbnRyb2woc3Ry
dWN0IHZjcHVfdm14ICp2bXgpCiAKIHN0YXRpYyB2b2lkIGVwdF9zZXRfbW1pb19zcHRlX21hc2so
dm9pZCkKIHsKKwl1NjQgbW1pb192YWx1ZSA9IFZNWF9FUFRfTUlTQ09ORklHX1dYX1ZBTFVFOwor
CisJLyogQWxsIHNwdGVzLCBpbmNsdWRpbmcgbW1pbyBzcHRlcyBzaG91bGQgdHJpZ2dlciB2bS1l
eGl0cyBieQorCSAqIGRlZmF1bHQsIGluc3RlYWQgb2YgI1ZFICh3aGVuIHN1cHBvcnRlZCkKKwkg
Ki8KKwlpZiAoa3ZtX3ZlX3N1cHBvcnRlZCkKKwkJbW1pb192YWx1ZSB8PSBWTVhfRVBUX1NVUFBS
RVNTX1ZFX0JJVDsKKwogCS8qCiAJICogRVBUIE1pc2NvbmZpZ3VyYXRpb25zIGNhbiBiZSBnZW5l
cmF0ZWQgaWYgdGhlIHZhbHVlIG9mIGJpdHMgMjowCiAJICogb2YgYW4gRVBUIHBhZ2luZy1zdHJ1
Y3R1cmUgZW50cnkgaXMgMTEwYiAod3JpdGUvZXhlY3V0ZSkuCiAJICovCi0Ja3ZtX21tdV9zZXRf
bW1pb19zcHRlX21hc2soVk1YX0VQVF9NSVNDT05GSUdfV1hfVkFMVUUsIDApOworCWt2bV9tbXVf
c2V0X21taW9fc3B0ZV9tYXNrKG1taW9fdmFsdWUsIDApOwogfQogCiBzdGF0aWMgaW50IHZteF9h
bGxvY19lcHRwX2xpc3RfcGFnZShzdHJ1Y3QgdmNwdV92bXggKnZteCkKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBs
aXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
