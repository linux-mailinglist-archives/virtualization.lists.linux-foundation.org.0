Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEBC2788E4
	for <lists.virtualization@lfdr.de>; Fri, 25 Sep 2020 14:59:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B351886DE7;
	Fri, 25 Sep 2020 12:59:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HSGrAQ3InWE; Fri, 25 Sep 2020 12:59:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8D2B786DE4;
	Fri, 25 Sep 2020 12:59:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6C1D1C0859;
	Fri, 25 Sep 2020 12:59:10 +0000 (UTC)
X-Original-To: virtualization@lists.linuxfoundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D40A8C0859
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C34A986AEB
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:59:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q09x10_Zmq-6
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:59:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A198386AD0
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 12:59:06 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e16so3541272wrm.2
 for <virtualization@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 05:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9eT1oZ9PgrU1jdXi7fYi4acA1czIwdtwVY/kAyMWRU=;
 b=zT3p1w6zUFNJ20/+EwFBQqMR+Y5rKNFb9ZY04ww0i/XqWnq5j5v4z8NxLDJBr+Us/1
 wTdtmpy4LKMBgniZ9C6xNXpgGff8U/mvjX+cd3niKGQnc1c6FcFUXXpDawolWTT4E5b4
 0FmTYLVplO2F+SbcpE8R4a1vX6BW0O4nWnr6dDex7VK7Qqx4vDo1f7QPh60180QERAyk
 NNIgjw04m/V0krJh01tzmrUP5XXxMiv+4PDk0RXDSN06k6VMbJ1jE8RI3M13G4FSwOXr
 9waI5ISaS3T8Rcpfv7dQxKijf2l38ytY5793syneVyry9t1rp88sisn/yqDIpoayZ5DL
 /WHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9eT1oZ9PgrU1jdXi7fYi4acA1czIwdtwVY/kAyMWRU=;
 b=JaMwlpPvuHdvyQpwnLujszp7Rd5y2UwMcVOeCJ3UyMJA/cMdUuTUaGqpJ+9isrEwYJ
 qaCfbev3QPkZSJk+A3YsxLocN2dZr8S1YRHJNjdzOlZ7Zp7ZOn/u9YiuNnkM9DPVLse8
 CXeNGpu8sxyYT4+kFsUTSoIVKVBtDn/xax3ZEwIJH3aiFPg7cwDw6y3LFITqtSUU9MX0
 7BOkqAZZI/Tsi4nHt/2JtiEhGVqikLXf2BKbJWqs8cGgngsd+Z0HKLdM1A8iyTRcJq93
 B76OI8CDKGd2eED665VXJwHRIZC5FnsjyLyHBszGV/RAY1tcVpsJMIhW745pnHLA8qXF
 jf+Q==
X-Gm-Message-State: AOAM530PWnBv/Q3kzmQorGqxuQSwon73rGG7rckT8nDb155rBX0X7HMi
 h6Odg9GlOW0QWnPWuLyGpLNzZg==
X-Google-Smtp-Source: ABdhPJy5z2JTSE7xjlqn9lmm3x6ZThm35XF11X2xktR9qINldTWdDf5oKrIdHbtjdTA4P0VidpRpFw==
X-Received: by 2002:a5d:574c:: with SMTP id q12mr4373496wrw.253.1601038744992; 
 Fri, 25 Sep 2020 05:59:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u63sm2867369wmb.13.2020.09.25.05.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 05:59:02 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A112E1FF9E;
 Fri, 25 Sep 2020 13:51:49 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org, maxim.uvarov@linaro.org, joakim.bech@linaro.org,
 ilias.apalodimas@linaro.org, tomas.winkler@intel.com, yang.huang@intel.com,
 bing.zhu@intel.com, Matti.Moell@opensynergy.com, hmo@opensynergy.com
Subject: [RFC PATCH 15/19] tools/vhost-user-rpmb: implement
 VIRTIO_RPMB_REQ_DATA_WRITE
Date: Fri, 25 Sep 2020 13:51:43 +0100
Message-Id: <20200925125147.26943-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200925125147.26943-1-alex.bennee@linaro.org>
References: <20200925125147.26943-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Cc: jean-philippe@linaro.org, takahiro.akashi@linaro.org,
 virtualization@lists.linuxfoundation.org, arnd@linaro.org,
 stratos-dev@op-lists.linaro.org
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

V2l0aCB0aGlzIGNvbW1hbmQgd2UgYXJlIGZpbmFsbHkgdXBkYXRpbmcgZGF0YSB0byB0aGUgYmFj
a2luZyBzdG9yZQphbmQgY3ljbGluZyB0aGUgd3JpdGVfY291bnQgYW5kIGVhY2ggc3VjY2Vzc2Z1
bCB3cml0ZS4gV2UgYWxzbyBpbmNsdWRlCnRoZSB3cml0ZSBjb3VudCBpbiBhbGwgcmVzcG9uc2Ug
ZnJhbWVzIGFzIHRoZSBzcGVjIGlzIGEgbGl0dGxlIHVuY2xlYXIKYnV0IHRoZSBleGFtcGxlIHRl
c3QgY29kZSBleHBlY3RlZCBpdC4KClNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5i
ZW5uZWVAbGluYXJvLm9yZz4KLS0tCiB0b29scy92aG9zdC11c2VyLXJwbWIvbWFpbi5jIHwgMTEx
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMTA1
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvdmhvc3Qt
dXNlci1ycG1iL21haW4uYyBiL3Rvb2xzL3Zob3N0LXVzZXItcnBtYi9tYWluLmMKaW5kZXggODg3
NDdjNTBmYTQ0Li5hMTdjM2I0YmNjNGUgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Zob3N0LXVzZXItcnBt
Yi9tYWluLmMKKysrIGIvdG9vbHMvdmhvc3QtdXNlci1ycG1iL21haW4uYwpAQCAtNjIsNiArNjIs
NyBAQCBlbnVtIHsKICNkZWZpbmUgS2lCICAgICAoMVVMIDw8IDEwKQogI2RlZmluZSBNQVhfUlBN
Ql9TSVpFIChLaUIgKiAxMjggKiAyNTYpCiAjZGVmaW5lIFJQTUJfS0VZX01BQ19TSVpFIDMyCisj
ZGVmaW5lIFJQTUJfQkxPQ0tfU0laRSAyNTYKIAogLyogUlBNQiBSZXF1ZXN0IFR5cGVzICovCiAj
ZGVmaW5lIFZJUlRJT19SUE1CX1JFUV9QUk9HUkFNX0tFWSAgICAgICAgMHgwMDAxCkBAIC0xMDAs
NyArMTAxLDcgQEAgc3RydWN0IHZpcnRpb19ycG1iX2NvbmZpZyB7CiBzdHJ1Y3QgdmlydGlvX3Jw
bWJfZnJhbWUgewogICAgIHVpbnQ4X3Qgc3R1ZmZbMTk2XTsKICAgICB1aW50OF90IGtleV9tYWNb
UlBNQl9LRVlfTUFDX1NJWkVdOwotICAgIHVpbnQ4X3QgZGF0YVsyNTZdOworICAgIHVpbnQ4X3Qg
ZGF0YVtSUE1CX0JMT0NLX1NJWkVdOwogICAgIHVpbnQ4X3Qgbm9uY2VbMTZdOwogICAgIC8qIHJl
bWFpbmluZyBmaWVsZHMgYXJlIGJpZy1lbmRpYW4gKi8KICAgICB1aW50MzJfdCB3cml0ZV9jb3Vu
dGVyOwpAQCAtMTI0LDYgKzEyNSw3IEBAIHR5cGVkZWYgc3RydWN0IFZ1UnBtYiB7CiAgICAgdWlu
dDhfdCAgbGFzdF9ub25jZVsxNl07CiAgICAgdWludDE2X3QgbGFzdF9yZXN1bHQ7CiAgICAgdWlu
dDE2X3QgbGFzdF9yZXFyZXNwOworICAgIHVpbnQxNl90IGxhc3RfYWRkcmVzczsKICAgICB1aW50
MzJfdCB3cml0ZV9jb3VudDsKIH0gVnVScG1iOwogCkBAIC0yMzksMTcgKzI0MSwzMCBAQCB2cnBt
Yl9zZXRfY29uZmlnKFZ1RGV2ICpkZXYsIGNvbnN0IHVpbnQ4X3QgKmRhdGEsCiAgKiB3aGljaCBp
dHNlbGYgdXNlcyBhIDMgY2xhdXNlIEJTRCBjaHVuayBvZiBjb2RlLgogICovCiAKK3N0YXRpYyBj
b25zdCBpbnQgcnBtYl9mcmFtZV9kbGVuID0gKHNpemVvZihzdHJ1Y3QgdmlydGlvX3JwbWJfZnJh
bWUpIC0KKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9mZnNldG9mKHN0cnVj
dCB2aXJ0aW9fcnBtYl9mcmFtZSwgZGF0YSkpOworCiBzdGF0aWMgdm9pZCB2cnBtYl91cGRhdGVf
bWFjX2luX2ZyYW1lKFZ1UnBtYiAqciwgc3RydWN0IHZpcnRpb19ycG1iX2ZyYW1lICpmcm0pCiB7
CiAgICAgaG1hY19zaGEyNTZfY3R4IGN0eDsKLSAgICBzdGF0aWMgY29uc3QgaW50IGRsZW4gPSAo
c2l6ZW9mKHN0cnVjdCB2aXJ0aW9fcnBtYl9mcmFtZSkgLQotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBvZmZzZXRvZihzdHJ1Y3QgdmlydGlvX3JwbWJfZnJhbWUsIGRhdGEpKTsKIAogICAg
IGhtYWNfc2hhMjU2X2luaXQoJmN0eCwgci0+a2V5LCBSUE1CX0tFWV9NQUNfU0laRSk7Ci0gICAg
aG1hY19zaGEyNTZfdXBkYXRlKCZjdHgsIGZybS0+ZGF0YSwgZGxlbik7CisgICAgaG1hY19zaGEy
NTZfdXBkYXRlKCZjdHgsIGZybS0+ZGF0YSwgcnBtYl9mcmFtZV9kbGVuKTsKICAgICBobWFjX3No
YTI1Nl9maW5hbCgmY3R4LCAmZnJtLT5rZXlfbWFjWzBdLCAzMik7CiB9CiAKK3N0YXRpYyBib29s
IHZycG1iX3ZlcmlmeV9tYWNfaW5fZnJhbWUoVnVScG1iICpyLCBzdHJ1Y3QgdmlydGlvX3JwbWJf
ZnJhbWUgKmZybSkKK3sKKyAgICBobWFjX3NoYTI1Nl9jdHggY3R4OworICAgIHVpbnQ4X3QgY2Fs
Y3VsYXRlZF9tYWNbUlBNQl9LRVlfTUFDX1NJWkVdOworCisgICAgaG1hY19zaGEyNTZfaW5pdCgm
Y3R4LCByLT5rZXksIFJQTUJfS0VZX01BQ19TSVpFKTsKKyAgICBobWFjX3NoYTI1Nl91cGRhdGUo
JmN0eCwgZnJtLT5kYXRhLCBycG1iX2ZyYW1lX2RsZW4pOworICAgIGhtYWNfc2hhMjU2X2ZpbmFs
KCZjdHgsIGNhbGN1bGF0ZWRfbWFjLCBSUE1CX0tFWV9NQUNfU0laRSk7CisKKyAgICByZXR1cm4g
bWVtY21wKGNhbGN1bGF0ZWRfbWFjLCBmcm0tPmtleV9tYWMsIFJQTUJfS0VZX01BQ19TSVpFKSA9
PSAwOworfQorCiAvKgogICogSGFuZGxlcnMgZm9yIGluZGl2aWR1YWwgY29udHJvbCBtZXNzYWdl
cwogICovCkBAIC0zMjQsNiArMzM5LDgyIEBAIHZycG1iX2hhbmRsZV9nZXRfd3JpdGVfY291bnRl
cihWdURldiAqZGV2LCBzdHJ1Y3QgdmlydGlvX3JwbWJfZnJhbWUgKmZyYW1lKQogICAgIHJldHVy
biByZXNwOwogfQogCisvKgorICogdnJwbWJfaGFuZGxlX3dyaXRlOgorICoKKyAqIFdlIHdpbGwg
cmVwb3J0IHRoZSBzdWNjZXNzL2ZhaWwgb24gcmVjZWlwdCBvZgorICogVklSVElPX1JQTUJfUkVR
X1JFU1VMVF9SRUFELiBSZXR1cm5zIHRoZSBudW1iZXIgb2YgZXh0cmEgZnJhbWVzCisgKiBwcm9j
ZXNzZWQgaW4gdGhlIHJlcXVlc3QuCisgKi8KK3N0YXRpYyBpbnQgdnJwbWJfaGFuZGxlX3dyaXRl
KFZ1RGV2ICpkZXYsIHN0cnVjdCB2aXJ0aW9fcnBtYl9mcmFtZSAqZnJhbWUpCit7CisgICAgVnVS
cG1iICpyID0gY29udGFpbmVyX29mKGRldiwgVnVScG1iLCBkZXYucGFyZW50KTsKKyAgICBpbnQg
ZXh0cmFfZnJhbWVzID0gMDsKKyAgICB1aW50MTZfdCBibG9ja19jb3VudCA9IGJlMTZ0b2goZnJh
bWUtPmJsb2NrX2NvdW50KTsKKyAgICB1aW50MzJfdCB3cml0ZV9jb3VudGVyID0gYmUzMnRvaChm
cmFtZS0+d3JpdGVfY291bnRlcik7CisgICAgc2l6ZV90IG9mZnNldDsKKworICAgIHItPmxhc3Rf
cmVxcmVzcCA9IFZJUlRJT19SUE1CX1JFU1BfREFUQV9XUklURTsKKyAgICByLT5sYXN0X2FkZHJl
c3MgPSBiZTE2dG9oKGZyYW1lLT5hZGRyZXNzKTsKKyAgICBvZmZzZXQgPSAgci0+bGFzdF9hZGRy
ZXNzICogUlBNQl9CTE9DS19TSVpFOworCisgICAgLyoKKyAgICAgKiBSdW4gdGhlIGNoZWNrcyBm
cm9tOgorICAgICAqIDUuMTIuNi4xLjMgRGV2aWNlIFJlcXVpcmVtZW50czogRGV2aWNlIE9wZXJh
dGlvbjogRGF0YSBXcml0ZQorICAgICAqLworICAgIGlmICghci0+a2V5KSB7CisgICAgICAgIGdf
d2FybmluZygibm8ga2V5IHByb2dyYW1tZWQiKTsKKyAgICAgICAgci0+bGFzdF9yZXN1bHQgPSBW
SVJUSU9fUlBNQl9SRVNfTk9fQVVUSF9LRVk7CisgICAgfSBlbHNlIGlmIChibG9ja19jb3VudCA9
PSAwIHx8CisgICAgICAgICAgICAgICBibG9ja19jb3VudCA+IHItPnZpcnRpb19jb25maWcubWF4
X3dyX2NudCkgeworICAgICAgICByLT5sYXN0X3Jlc3VsdCA9IFZJUlRJT19SUE1CX1JFU19HRU5F
UkFMX0ZBSUxVUkU7CisgICAgfSBlbHNlIGlmIChmYWxzZSAvKiB3aGF0IGRvZXMgYW4gZXhwaXJl
ZCB3cml0ZSBjb3VudGVyIG1lYW4/ICovKSB7CisgICAgICAgIHItPmxhc3RfcmVzdWx0ID0gVklS
VElPX1JQTUJfUkVTX1dSSVRFX0NPVU5URVJfRVhQSVJFRDsKKyAgICB9IGVsc2UgaWYgKG9mZnNl
dCA+IChyLT52aXJ0aW9fY29uZmlnLmNhcGFjaXR5ICogKDEyOCAqIEtpQikpKSB7CisgICAgICAg
IHItPmxhc3RfcmVzdWx0ID0gVklSVElPX1JQTUJfUkVTX0FERFJfRkFJTFVSRTsKKyAgICB9IGVs
c2UgaWYgKCF2cnBtYl92ZXJpZnlfbWFjX2luX2ZyYW1lKHIsIGZyYW1lKSkgeworICAgICAgICBy
LT5sYXN0X3Jlc3VsdCA9IFZJUlRJT19SUE1CX1JFU19BVVRIX0ZBSUxVUkU7CisgICAgfSBlbHNl
IGlmICh3cml0ZV9jb3VudGVyICE9IHItPndyaXRlX2NvdW50KSB7CisgICAgICAgIHItPmxhc3Rf
cmVzdWx0ID0gVklSVElPX1JQTUJfUkVTX0NPVU5UX0ZBSUxVUkU7CisgICAgfSBlbHNlIHsKKyAg
ICAgICAgaW50IGk7CisgICAgICAgIC8qIEF0IHRoaXMgcG9pbnQgd2UgaGF2ZSBhIHZhbGlkIGF1
dGhlbnRpY2F0ZWQgd3JpdGUgcmVxdWVzdAorICAgICAgICAgKiBzbyB0aGUgY291bnRlciBjYW4g
aW5jcmVtZW50ZWQgYW5kIHdlIGNhbiBhdHRlbXB0IHRvCisgICAgICAgICAqIHVwZGF0ZSB0aGUg
YmFja2luZyBkZXZpY2UuCisgICAgICAgICAqLworICAgICAgICByLT53cml0ZV9jb3VudCsrOwor
ICAgICAgICBmb3IgKGkgPSAwOyBpIDwgYmxvY2tfY291bnQ7IGkrKykgeworICAgICAgICAgICAg
dm9pZCAqYmxrID0gci0+Zmxhc2hfbWFwICsgb2Zmc2V0OworICAgICAgICAgICAgZ19kZWJ1Zygi
JXM6IHdyaXRpbmcgYmxvY2sgJWQiLCBfX2Z1bmNfXywgaSk7CisgICAgICAgICAgICBpZiAobXBy
b3RlY3QoYmxrLCBSUE1CX0JMT0NLX1NJWkUsIFBST1RfV1JJVEUpICE9IDApIHsKKyAgICAgICAg
ICAgICAgICByLT5sYXN0X3Jlc3VsdCA9ICBWSVJUSU9fUlBNQl9SRVNfV1JJVEVfRkFJTFVSRTsK
KyAgICAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgICAgIH0KKyAgICAgICAgICAgIG1lbWNw
eShibGssIGZyYW1lW2ldLmRhdGEsIFJQTUJfQkxPQ0tfU0laRSk7CisgICAgICAgICAgICBpZiAo
bXN5bmMoYmxrLCBSUE1CX0JMT0NLX1NJWkUsIE1TX1NZTkMpICE9IDApIHsKKyAgICAgICAgICAg
ICAgICBnX3dhcm5pbmcoIiVzOiBmYWlsZWQgdG8gc3luYyB1cGRhdGUiLCBfX2Z1bmNfXyk7Cisg
ICAgICAgICAgICAgICAgci0+bGFzdF9yZXN1bHQgPSBWSVJUSU9fUlBNQl9SRVNfV1JJVEVfRkFJ
TFVSRTsKKyAgICAgICAgICAgICAgICBicmVhazsKKyAgICAgICAgICAgIH0KKyAgICAgICAgICAg
IGlmIChtcHJvdGVjdChibGssIFJQTUJfQkxPQ0tfU0laRSwgUFJPVF9SRUFEKSAhPSAwKSB7Cisg
ICAgICAgICAgICAgICAgZ193YXJuaW5nKCIlczogZmFpbGVkIHRvIHJlLWFwcGx5IHJlYWQgcHJv
dGVjdGlvbiIsIF9fZnVuY19fKTsKKyAgICAgICAgICAgICAgICByLT5sYXN0X3Jlc3VsdCA9IFZJ
UlRJT19SUE1CX1JFU19HRU5FUkFMX0ZBSUxVUkU7CisgICAgICAgICAgICAgICAgYnJlYWs7Cisg
ICAgICAgICAgICB9CisgICAgICAgICAgICBvZmZzZXQgKz0gUlBNQl9CTE9DS19TSVpFOworICAg
ICAgICB9CisgICAgICAgIHItPmxhc3RfcmVzdWx0ID0gVklSVElPX1JQTUJfUkVTX09LOworICAg
ICAgICBleHRyYV9mcmFtZXMgPSBpIC0gMTsKKyAgICB9CisKKyAgICBnX2luZm8oIiVzOiAlcyAo
JXgsICVkIGV4dHJhIGZyYW1lcyBwcm9jZXNzZWQpLCB3cml0ZV9jb3VudD0lZCIsIF9fZnVuY19f
LAorICAgICAgICAgICByLT5sYXN0X3Jlc3VsdCA9PSBWSVJUSU9fUlBNQl9SRVNfT0sgPyAic3Vj
Y2Vzc2Z1bCI6ImZhaWxlZCIsCisgICAgICAgICAgIHItPmxhc3RfcmVzdWx0LCBleHRyYV9mcmFt
ZXMsIHItPndyaXRlX2NvdW50KTsKKworICAgIHJldHVybiBleHRyYV9mcmFtZXM7Cit9CisKKwog
LyoKICAqIFJldHVybiB0aGUgcmVzdWx0IG9mIHRoZSBsYXN0IG1lc3NhZ2UuIFRoaXMgaXMgb25s
eSB2YWxpZCBpZiB0aGUKICAqIHByZXZpb3VzIG1lc3NhZ2Ugd2FzIFZJUlRJT19SUE1CX1JFUV9Q
Uk9HUkFNX0tFWSBvcgpAQCAtMzM5LDEwICs0MzAsMTQgQEAgc3RhdGljIHN0cnVjdCB2aXJ0aW9f
cnBtYl9mcmFtZSAqIHZycG1iX2hhbmRsZV9yZXN1bHRfcmVhZChWdURldiAqZGV2KQogICAgIGdf
aW5mbygiJXM6IGZvciByZXF1ZXN0OiV4IHJlc3VsdDoleCIsIF9fZnVuY19fLAogICAgICAgICAg
ICByLT5sYXN0X3JlcXJlc3AsIHItPmxhc3RfcmVzdWx0KTsKIAotICAgIGlmIChyLT5sYXN0X3Jl
cXJlc3AgPT0gVklSVElPX1JQTUJfUkVTUF9QUk9HUkFNX0tFWSB8fAotICAgICAgICByLT5sYXN0
X3JlcXJlc3AgPT0gVklSVElPX1JQTUJfUkVRX0RBVEFfV1JJVEUpIHsKKyAgICBpZiAoci0+bGFz
dF9yZXFyZXNwID09IFZJUlRJT19SUE1CX1JFU1BfUFJPR1JBTV9LRVkpIHsKICAgICAgICAgcmVz
cC0+cmVzdWx0ID0gaHRvYmUxNihyLT5sYXN0X3Jlc3VsdCk7CiAgICAgICAgIHJlc3AtPnJlcV9y
ZXNwID0gaHRvYmUxNihyLT5sYXN0X3JlcXJlc3ApOworICAgIH0gZWxzZSBpZiAoci0+bGFzdF9y
ZXFyZXNwID09IFZJUlRJT19SUE1CX1JFU1BfREFUQV9XUklURSkgeworICAgICAgICByZXNwLT5y
ZXN1bHQgPSBodG9iZTE2KHItPmxhc3RfcmVzdWx0KTsKKyAgICAgICAgcmVzcC0+cmVxX3Jlc3Ag
PSBodG9iZTE2KHItPmxhc3RfcmVxcmVzcCk7CisgICAgICAgIHJlc3AtPndyaXRlX2NvdW50ZXIg
PSBodG9iZTMyKHItPndyaXRlX2NvdW50KTsKKyAgICAgICAgcmVzcC0+YWRkcmVzcyA9IGh0b2Jl
MTYoci0+bGFzdF9hZGRyZXNzKTsKICAgICB9IGVsc2UgewogICAgICAgICByZXNwLT5yZXN1bHQg
PSBodG9iZTE2KFZJUlRJT19SUE1CX1JFU19HRU5FUkFMX0ZBSUxVUkUpOwogICAgIH0KQEAgLTQ0
NSw2ICs1NDAsMTAgQEAgdnJwbWJfaGFuZGxlX2N0cmwoVnVEZXYgKmRldiwgaW50IHFpZHgpCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXyk7CiAgICAgICAgICAgICAgICAg
fQogICAgICAgICAgICAgICAgIGJyZWFrOworICAgICAgICAgICAgY2FzZSBWSVJUSU9fUlBNQl9S
RVFfREFUQV9XUklURToKKyAgICAgICAgICAgICAgICAvKiB3ZSBjYW4gaGF2ZSBtdWx0aXBsZSBi
bG9ja3MgaGFuZGxlZCAqLworICAgICAgICAgICAgICAgIG4gKz0gdnJwbWJfaGFuZGxlX3dyaXRl
KGRldiwgZik7CisgICAgICAgICAgICAgICAgYnJlYWs7CiAgICAgICAgICAgICBkZWZhdWx0Ogog
ICAgICAgICAgICAgICAgIGdfZGVidWcoInVuLWhhbmRsZWQgcmVxdWVzdDogJXgiLCBmLT5yZXFf
cmVzcCk7CiAgICAgICAgICAgICAgICAgYnJlYWs7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
