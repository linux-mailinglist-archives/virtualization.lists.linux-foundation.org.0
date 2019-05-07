Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E8415941
	for <lists.virtualization@lfdr.de>; Tue,  7 May 2019 07:35:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4656742DF;
	Tue,  7 May 2019 05:35:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8568742D9
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 05:35:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B0DA7DB
	for <virtualization@lists.linux-foundation.org>;
	Tue,  7 May 2019 05:35:21 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
	[73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 04C172087F;
	Tue,  7 May 2019 05:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557207321;
	bh=pdVdyom2uZTEAtZ+3r+7LEvj378VMGzw2pWsGonkZFA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CDhVKSXB9VQD5C7OazCIf0nIjlDEGmYWsaNIxogDMuoEKewAbk5c6ikOglXLvbF4N
	0E+4blx8e5Wir0DT9mCUTWNvhRAYqLzih2vhQ7J1UviNy5QU50PpBqliyLFJmsEq7K
	DvkBGrhqVEysH4QLC2D2kak79YgHp1kftjCJ7Ks4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 85/99] Revert "drm/virtio: drop prime
	import/export callbacks"
Date: Tue,  7 May 2019 01:32:19 -0400
Message-Id: <20190507053235.29900-85-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, Dave Airlie <airlied@redhat.com>,
	virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
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

RnJvbTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KClsgVXBzdHJlYW0gY29tbWl0
IGEwY2VjYzIzY2ZjYmYyNjI2NDk3YThjODc3MDg1NmRkNTZiNjc5MTcgXQoKVGhpcyBwYXRjaCBk
b2VzIG1vcmUgaGFybSB0aGFuIGdvb2QsIGFzIGl0IGJyZWFrcyBib3RoIFh3YXlsYW5kIGFuZApn
bm9tZS1zaGVsbCB3aXRoIFgxMS4KClh3YXlsYW5kIHJlcXVpcmVzIERSSTMgJiBEUkkzIHJlcXVp
cmVzIFBSSU1FLgoKWDExIGNyYXNoIGZvciBvYnNjdXJlIGRvdWJsZS1mcmVlIHJlYXNvbiB3aGlj
aCBhcmUgaGFyZCB0byBkZWJ1Zwooc3RhcnRpbmcgWDExIGJ5IGhhbmQgZG9lc24ndCB0cmlnZ2Vy
IHRoZSBjcmFzaCkuCgpJIGRvbid0IHNlZSBhbiBhcHBhcmVudCBwcm9ibGVtIGltcGxlbWVudGlu
ZyB0aG9zZSBzdHViIHByaW1lCmZ1bmN0aW9ucywgdGhleSBtYXkgcmV0dXJuIGFuIGVycm9yIGF0
IHJ1bi10aW1lLCBhbmQgaXQgc2VlbXMgdG8gYmUKaGFuZGxlZCBmaW5lIGJ5IEdOT01FIGF0IGxl
YXN0LgoKVGhpcyByZXZlcnRzIGNvbW1pdCBiMzE4ZTNmZjdjYTA2NWQ2YjEwN2U0MjRjODVhNjNk
N2E2Nzk4YTY5LgpbYWlybGllZDoKVGhpcyBicm9rZSB1c2Vyc3BhY2UgZm9yIHZpcnRpby1ncHVz
LCBhbmQgcmVncmVzc2VkIHRoaW5ncyBmcm9tIERSSTMgdG8gRFJJMi4KClRoaXMgYnJpbmdzIGJh
Y2sgdGhlIG9yaWdpbmFsIHByb2JsZW0sIGJ1dCBpdCdzIGJldHRlciB0aGFuIHJlZ3Jlc3Npb25z
Ll0KCkZpeGVzOiBiMzE4ZTNmZjdjYTA2NWQ2YjEwN2U0MjRjODVhNjNkN2E2Nzk4YSAoImRybS92
aXJ0aW86IGRyb3AgcHJpbWUgaW1wb3J0L2V4cG9ydCBjYWxsYmFja3MiKQpTaWduZWQtb2ZmLWJ5
OiBNYXJjLUFuZHLDqSBMdXJlYXUgPG1hcmNhbmRyZS5sdXJlYXVAcmVkaGF0LmNvbT4KU2lnbmVk
LW9mZi1ieTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTog
U2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0
aW8vdmlydGdwdV9kcnYuYyAgIHwgIDQgKysrKwogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0
Z3B1X2Rydi5oICAgfCAgNCArKysrCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcHJp
bWUuYyB8IDEyICsrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jCmluZGV4IDJkMWFhY2E0OTEwNS4uZjdm
MzJhODg1YWY3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jCkBAIC0xMjcsMTAg
KzEyNywxNCBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewogI2lmIGRlZmlu
ZWQoQ09ORklHX0RFQlVHX0ZTKQogCS5kZWJ1Z2ZzX2luaXQgPSB2aXJ0aW9fZ3B1X2RlYnVnZnNf
aW5pdCwKICNlbmRpZgorCS5wcmltZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRs
ZV90b19mZCwKKwkucHJpbWVfZmRfdG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5k
bGUsCiAJLmdlbV9wcmltZV9leHBvcnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKIAkuZ2VtX3By
aW1lX2ltcG9ydCA9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAogCS5nZW1fcHJpbWVfcGluID0gdmly
dGdwdV9nZW1fcHJpbWVfcGluLAogCS5nZW1fcHJpbWVfdW5waW4gPSB2aXJ0Z3B1X2dlbV9wcmlt
ZV91bnBpbiwKKwkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IHZpcnRncHVfZ2VtX3ByaW1lX2dl
dF9zZ190YWJsZSwKKwkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IHZpcnRncHVfZ2VtX3By
aW1lX2ltcG9ydF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX3ZtYXAgPSB2aXJ0Z3B1X2dlbV9wcmlt
ZV92bWFwLAogCS5nZW1fcHJpbWVfdnVubWFwID0gdmlydGdwdV9nZW1fcHJpbWVfdnVubWFwLAog
CS5nZW1fcHJpbWVfbW1hcCA9IHZpcnRncHVfZ2VtX3ByaW1lX21tYXAsCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfZHJ2LmgKaW5kZXggMGMxNTAwMGY5MjZlLi4xZGViNDFkNDJlYTQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9kcnYuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmgKQEAgLTM3Miw2ICszNzIsMTAgQEAgaW50IHZp
cnRpb19ncHVfb2JqZWN0X3dhaXQoc3RydWN0IHZpcnRpb19ncHVfb2JqZWN0ICpibywgYm9vbCBu
b193YWl0KTsKIC8qIHZpcnRncHVfcHJpbWUuYyAqLwogaW50IHZpcnRncHVfZ2VtX3ByaW1lX3Bp
bihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7CiB2b2lkIHZpcnRncHVfZ2VtX3ByaW1lX3Vu
cGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKK3N0cnVjdCBzZ190YWJsZSAqdmlydGdw
dV9nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKK3N0
cnVjdCBkcm1fZ2VtX29iamVjdCAqdmlydGdwdV9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKAor
CXN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFj
aCwKKwlzdHJ1Y3Qgc2dfdGFibGUgKnNndCk7CiB2b2lkICp2aXJ0Z3B1X2dlbV9wcmltZV92bWFw
KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqKTsKIHZvaWQgdmlydGdwdV9nZW1fcHJpbWVfdnVu
bWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB2b2lkICp2YWRkcik7CiBpbnQgdmlydGdw
dV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wcmltZS5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMKaW5kZXggYzU5ZWMzNGM4MGE1Li5lYjUxYTc4ZTExOTkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wcmltZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wcmltZS5jCkBAIC0zOSw2ICszOSwxOCBA
QCB2b2lkIHZpcnRncHVfZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KQogCVdBUk5fT05DRSgxLCAibm90IGltcGxlbWVudGVkIik7CiB9CiAKK3N0cnVjdCBzZ190YWJs
ZSAqdmlydGdwdV9nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAq
b2JqKQoreworCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOworfQorCitzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKnZpcnRncHVfZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSgKKwlzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsCisJc3RydWN0IHNn
X3RhYmxlICp0YWJsZSkKK3sKKwlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsKK30KKwogdm9pZCAq
dmlydGdwdV9nZW1fcHJpbWVfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIHsKIAlz
dHJ1Y3QgdmlydGlvX2dwdV9vYmplY3QgKmJvID0gZ2VtX3RvX3ZpcnRpb19ncHVfb2JqKG9iaik7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
