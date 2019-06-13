Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 922D97374B
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:06:11 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5C6BA14DF;
	Wed, 24 Jul 2019 18:59:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 06889DBC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 22:39:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6A7517C3
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 22:39:23 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m10so503623edv.6
	for <virtualization@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 15:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=tcd-ie.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8su+LTkJ3gu2cKId6zqNGdio1nz4zdi4nwIHQT6LW2c=;
	b=JS+r5933+fWnWQ/iL9KFp6vvmc39vjWY4aRQgEQUu1LHWyJrIRUXht606UlZxnurzI
	KAZLXBy3sIe36V/9BqMsC+vFbmjMnVY97ZzJCtRgYx8mdzAE7wVffMFLBO6UqxUWabJz
	0Hz+OFHE49MVr7p7JzNgIvA7ge1zMROlXfBGhix+41c3+QmSSkVaLXEUSaz7w2Anb43A
	p7ZG1gGsFVDTPk6FbKEwSNEUZ12beSwqVxE0k6szS1Aw+RC1JWhFHl1yrwzCSOaWKO0U
	RhQWM8WCkxOXdm2nnnmop1AtPe0bhW1GtbPyhmT0+gh/oNrPgb0xrnAUDwg81BqDyFwo
	RLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8su+LTkJ3gu2cKId6zqNGdio1nz4zdi4nwIHQT6LW2c=;
	b=uGOq6vaveUbvm7FTmZVNIWyHPvw4h0yHtFbo1qo6DO2VVdKIJJalpadwZjSmwxGzEW
	6WABBB5CoP7+g4jZAA4Q/NKWEcBUokQolxbFJ09/8GzH/H4KHHrJ0o5wkgdMBZwp0M0n
	BvWi7NnkYdzj+X8+X6/KfUvWmSRYO8njZgLhg637ac4lJG8zuhuXC6ZbmHFMae+fmlgC
	HWKD2A7VqCKmBunDNkc9ppuVZ1Yi1W1ORjl2PyQjzjOj2O+jaqK3X8cGhdkpA9SqfMqj
	FE6tXaMgFV0BgP/cPay3MfCVNSHtwF3kUqbWZkqUumt1JYuwOCl5JSRY46oWQq2L4X+W
	S0Hg==
X-Gm-Message-State: APjAAAUE875H57zD52VB8xn3vH6FLOmRev12jipufCHBEy/1FwutbcKS
	yicw9RLGNeXE6H2vrqf1aRslnA==
X-Google-Smtp-Source: APXvYqwiLsgtWLoYPPZl+fyjinK6XDv3NWeGJwWa5Qvs5fKDD2WwJE8mSwCbHvv+PkgMGDmQa9RuEQ==
X-Received: by 2002:a17:906:32d2:: with SMTP id
	k18mr20071313ejk.232.1560465562018; 
	Thu, 13 Jun 2019 15:39:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:8042:d435:a754:1f22])
	by smtp.googlemail.com with ESMTPSA id
	s16sm216522eji.27.2019.06.13.15.39.20
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 13 Jun 2019 15:39:21 -0700 (PDT)
From: Tom Murphy <murphyt7@tcd.ie>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v4 1/5] iommu/amd: Remove unnecessary locking from AMD iommu
	driver
Date: Thu, 13 Jun 2019 23:38:56 +0100
Message-Id: <20190613223901.9523-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613223901.9523-1-murphyt7@tcd.ie>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: Heiko Stuebner <heiko@sntech.de>, Will Deacon <will.deacon@arm.com>,
	virtualization@lists.linux-foundation.org,
	David Brown <david.brown@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Krzysztof Kozlowski <krzk@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Gerald Schaefer <gerald.schaefer@de.ibm.com>,
	linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
	linux-kernel@vger.kernel.org, Tom Murphy <murphyt7@tcd.ie>,
	Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
	David Woodhouse <dwmw2@infradead.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

V2UgY2FuIHJlbW92ZSB0aGUgbXV0ZXggbG9jayBmcm9tIGFtZF9pb21tdV9tYXAgYW5kIGFtZF9p
b21tdV91bm1hcC4KaW9tbXVfbWFwIGRvZXNu4oCZdCBsb2NrIHdoaWxlIG1hcHBpbmcgYW5kIHNv
IG5vIHR3byBjYWxscyBzaG91bGQgdG91Y2gKdGhlIHNhbWUgaW92YSByYW5nZS4gVGhlIEFNRCBk
cml2ZXIgYWxyZWFkeSBoYW5kbGVzIHRoZSBwYWdlIHRhYmxlIHBhZ2UKYWxsb2NhdGlvbnMgd2l0
aG91dCBsb2NrcyBzbyB3ZSBjYW4gc2FmZWx5IHJlbW92ZSB0aGUgbG9ja3MuCgpTaWduZWQtb2Zm
LWJ5OiBUb20gTXVycGh5IDxtdXJwaHl0N0B0Y2QuaWU+Ci0tLQogZHJpdmVycy9pb21tdS9hbWRf
aW9tbXUuYyAgICAgICB8IDEwICstLS0tLS0tLS0KIGRyaXZlcnMvaW9tbXUvYW1kX2lvbW11X3R5
cGVzLmggfCAgMSAtCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxMCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L2FtZF9pb21tdS5jIGIvZHJpdmVycy9p
b21tdS9hbWRfaW9tbXUuYwppbmRleCA3Mzc0MGI5NjllNjIuLjA2NTYzOWUwOTBmZSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9pb21tdS9hbWRfaW9tbXUuYworKysgYi9kcml2ZXJzL2lvbW11L2FtZF9p
b21tdS5jCkBAIC0yODU4LDcgKzI4NTgsNiBAQCBzdGF0aWMgdm9pZCBwcm90ZWN0aW9uX2RvbWFp
bl9mcmVlKHN0cnVjdCBwcm90ZWN0aW9uX2RvbWFpbiAqZG9tYWluKQogc3RhdGljIGludCBwcm90
ZWN0aW9uX2RvbWFpbl9pbml0KHN0cnVjdCBwcm90ZWN0aW9uX2RvbWFpbiAqZG9tYWluKQogewog
CXNwaW5fbG9ja19pbml0KCZkb21haW4tPmxvY2spOwotCW11dGV4X2luaXQoJmRvbWFpbi0+YXBp
X2xvY2spOwogCWRvbWFpbi0+aWQgPSBkb21haW5faWRfYWxsb2MoKTsKIAlpZiAoIWRvbWFpbi0+
aWQpCiAJCXJldHVybiAtRU5PTUVNOwpAQCAtMzA0NSw5ICszMDQ0LDcgQEAgc3RhdGljIGludCBh
bWRfaW9tbXVfbWFwKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbSwgdW5zaWduZWQgbG9uZyBpb3Zh
LAogCWlmIChpb21tdV9wcm90ICYgSU9NTVVfV1JJVEUpCiAJCXByb3QgfD0gSU9NTVVfUFJPVF9J
VzsKIAotCW11dGV4X2xvY2soJmRvbWFpbi0+YXBpX2xvY2spOwogCXJldCA9IGlvbW11X21hcF9w
YWdlKGRvbWFpbiwgaW92YSwgcGFkZHIsIHBhZ2Vfc2l6ZSwgcHJvdCwgR0ZQX0tFUk5FTCk7Ci0J
bXV0ZXhfdW5sb2NrKCZkb21haW4tPmFwaV9sb2NrKTsKIAogCWRvbWFpbl9mbHVzaF9ucF9jYWNo
ZShkb21haW4sIGlvdmEsIHBhZ2Vfc2l6ZSk7CiAKQEAgLTMwNTgsMTYgKzMwNTUsMTEgQEAgc3Rh
dGljIHNpemVfdCBhbWRfaW9tbXVfdW5tYXAoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tLCB1bnNp
Z25lZCBsb25nIGlvdmEsCiAJCQkgICBzaXplX3QgcGFnZV9zaXplKQogewogCXN0cnVjdCBwcm90
ZWN0aW9uX2RvbWFpbiAqZG9tYWluID0gdG9fcGRvbWFpbihkb20pOwotCXNpemVfdCB1bm1hcF9z
aXplOwogCiAJaWYgKGRvbWFpbi0+bW9kZSA9PSBQQUdFX01PREVfTk9ORSkKIAkJcmV0dXJuIDA7
CiAKLQltdXRleF9sb2NrKCZkb21haW4tPmFwaV9sb2NrKTsKLQl1bm1hcF9zaXplID0gaW9tbXVf
dW5tYXBfcGFnZShkb21haW4sIGlvdmEsIHBhZ2Vfc2l6ZSk7Ci0JbXV0ZXhfdW5sb2NrKCZkb21h
aW4tPmFwaV9sb2NrKTsKLQotCXJldHVybiB1bm1hcF9zaXplOworCXJldHVybiBpb21tdV91bm1h
cF9wYWdlKGRvbWFpbiwgaW92YSwgcGFnZV9zaXplKTsKIH0KIAogc3RhdGljIHBoeXNfYWRkcl90
IGFtZF9pb21tdV9pb3ZhX3RvX3BoeXMoc3RydWN0IGlvbW11X2RvbWFpbiAqZG9tLApkaWZmIC0t
Z2l0IGEvZHJpdmVycy9pb21tdS9hbWRfaW9tbXVfdHlwZXMuaCBiL2RyaXZlcnMvaW9tbXUvYW1k
X2lvbW11X3R5cGVzLmgKaW5kZXggNTJjMzVkNTU3ZmFkLi41ZDVmNWQwMDliMTkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvaW9tbXUvYW1kX2lvbW11X3R5cGVzLmgKKysrIGIvZHJpdmVycy9pb21tdS9h
bWRfaW9tbXVfdHlwZXMuaApAQCAtNDYxLDcgKzQ2MSw2IEBAIHN0cnVjdCBwcm90ZWN0aW9uX2Rv
bWFpbiB7CiAJc3RydWN0IGlvbW11X2RvbWFpbiBkb21haW47IC8qIGdlbmVyaWMgZG9tYWluIGhh
bmRsZSB1c2VkIGJ5CiAJCQkJICAgICAgIGlvbW11IGNvcmUgY29kZSAqLwogCXNwaW5sb2NrX3Qg
bG9jazsJLyogbW9zdGx5IHVzZWQgdG8gbG9jayB0aGUgcGFnZSB0YWJsZSovCi0Jc3RydWN0IG11
dGV4IGFwaV9sb2NrOwkvKiBwcm90ZWN0IHBhZ2UgdGFibGVzIGluIHRoZSBpb21tdS1hcGkgcGF0
aCAqLwogCXUxNiBpZDsJCQkvKiB0aGUgZG9tYWluIGlkIHdyaXR0ZW4gdG8gdGhlIGRldmljZSB0
YWJsZSAqLwogCWludCBtb2RlOwkJLyogcGFnaW5nIG1vZGUgKDAtNiBsZXZlbHMpICovCiAJdTY0
ICpwdF9yb290OwkJLyogcGFnZSB0YWJsZSByb290IHBvaW50ZXIgKi8KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
