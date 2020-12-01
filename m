Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D87C2C9F6A
	for <lists.virtualization@lfdr.de>; Tue,  1 Dec 2020 11:36:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 37D2886B8E;
	Tue,  1 Dec 2020 10:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8HEqnN-691j; Tue,  1 Dec 2020 10:36:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74F5E86B92;
	Tue,  1 Dec 2020 10:36:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B3F0C0052;
	Tue,  1 Dec 2020 10:36:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05AE3C163C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F41992E159
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:36:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GnL8Z8ClxMbM
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:36:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id A106A2E147
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Dec 2020 10:36:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 426AAACF1;
 Tue,  1 Dec 2020 10:36:00 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 15/20] drm/radeon: Fix trailing whitespaces
Date: Tue,  1 Dec 2020 11:35:37 +0100
Message-Id: <20201201103542.2182-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201201103542.2182-1-tzimmermann@suse.de>
References: <20201201103542.2182-1-tzimmermann@suse.de>
MIME-Version: 1.0
Cc: nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, spice-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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

QWRoZXJlIHRvIGtlcm5lbCBjb2Rpbmcgc3R5bGUuCgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNo
ZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYyAgICAgICB8IDIgKy0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yMTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYwppbmRleCAy
NGM4ZGI2NzM5MzEuLmU0YWUwOWI1Mjk0ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yMTAwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKQEAgLTI3OTcs
NyArMjc5Nyw3IEBAIHZvaWQgcjEwMF92cmFtX2luaXRfc2l6ZXMoc3RydWN0IHJhZGVvbl9kZXZp
Y2UgKnJkZXYpCiAJCQlyZGV2LT5tYy5yZWFsX3ZyYW1fc2l6ZSA9IDgxOTIgKiAxMDI0OwogCQkJ
V1JFRzMyKFJBREVPTl9DT05GSUdfTUVNU0laRSwgcmRldi0+bWMucmVhbF92cmFtX3NpemUpOwog
CQl9Ci0JCS8qIEZpeCBmb3IgUk41MCwgTTYsIE03IHdpdGggOC8xNi8zMig/PykgTUJzIG9mIFZS
QU0gLSAKKwkJLyogRml4IGZvciBSTjUwLCBNNiwgTTcgd2l0aCA4LzE2LzMyKD8/KSBNQnMgb2Yg
VlJBTSAtCiAJCSAqIE5vdmVsbCBidWcgMjA0ODgyICsgYWxvbmcgd2l0aCBsb3RzIG9mIHVidW50
dSBvbmVzCiAJCSAqLwogCQlpZiAocmRldi0+bWMuYXBlcl9zaXplID4gY29uZmlnX2FwZXJfc2l6
ZSkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fa21zLmMKaW5kZXggYWJiM2JkZDljYTI1Li43NWIw
Mzg3NDBlYTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ttcy5jCkBAIC03NCw3ICs3NCw3
IEBAIHZvaWQgcmFkZW9uX2RyaXZlcl91bmxvYWRfa21zKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
CiAJfQogCiAJcmFkZW9uX2FjcGlfZmluaShyZGV2KTsKLQkKKwogCXJhZGVvbl9tb2Rlc2V0X2Zp
bmkocmRldik7CiAJcmFkZW9uX2RldmljZV9maW5pKHJkZXYpOwogCi0tIAoyLjI5LjIKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
