Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C14CCE0805
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 17:55:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 84295103A;
	Tue, 22 Oct 2019 15:55:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 13F73103A
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 15:55:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 464BA8A2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 15:55:42 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b24so16658422wmj.5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 08:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YS0GekJ72h4QWTJCzBYGtGOwzBVrDEe0pE3cwjzRtLM=;
	b=hHiUBuT9zDldmDUt90WJdRY6jxBsQqR47iezq2iMyWbumsA9zz25UPuarmQn834ngZ
	W33J+1Lp8hGIICPz7h/ii8Zw1+3ZrsGL1kRmIy8Oj5ZkbAaMEIqSDXkgRPCwygWLEhnd
	cUp9epeM63QOlBS06tiFyKFVJkISUd+qtW/Ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YS0GekJ72h4QWTJCzBYGtGOwzBVrDEe0pE3cwjzRtLM=;
	b=eXWs4Kuk/TLkikMwZe15OGUc1G8cvSG3UeRL80lpSx9x7/uMTqYVCaxRPW16JLFZ9A
	EX01vMuquQ3GZBo6axasgVE63usvMK5Y+JyGNTMMtfDLerjHMzT8xem+rFOGXB+5FdDL
	rsjJA68qqMtxHLCX1cX9hR4Wfv/tfQjXqTgoB2QMos+26lH4FYlcwwjK76tJnAcem6xt
	4FcPbwFW5L5j203SBztYvPC9GMheGiiSZSMqg7UoSx6EYnwQq2tSCKV9lYyZ70gw3qoI
	ti0pD9HquGinXog1Cf5sF7ETKDnQ027N4hsbP9s02KeVsZQdTZ+fXRYOpZo1htenwC5p
	SzXQ==
X-Gm-Message-State: APjAAAV3C35STz9bUi5Gg4LvnKai4kxeSeYXl08yrCzkk3Io0DOHgjFN
	mFpCecKVdhmLhTJKDaApSkrpag==
X-Google-Smtp-Source: APXvYqyTDiEsG9b+uQLErcNY8uGBbnTs51bzge5ZAUJaOCN+Pqc8+e3xas6iNUQPR5aCgqkildOnRQ==
X-Received: by 2002:a1c:9ecf:: with SMTP id h198mr3587410wme.45.1571759741585; 
	Tue, 22 Oct 2019 08:55:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
	[212.51.149.96]) by smtp.gmail.com with ESMTPSA id
	c21sm16465839wmb.46.2019.10.22.08.55.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 08:55:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/simple-kms: Standardize arguments for callbacks
Date: Tue, 22 Oct 2019 17:55:36 +0200
Message-Id: <20191022155536.27939-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
	=?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Daniel Vetter <daniel.vetter@intel.com>,
	Emil Velikov <emil.velikov@collabora.com>
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

UGFzc2luZyB0aGUgd3JvbmcgdHlwZSBmZWVscyBpY2t5LCBldmVyeXdoZXJlIGVsc2Ugd2UgdXNl
IHRoZSBwaXBlIGFzCnRoZSBmaXJzdCBwYXJhbWV0ZXIuIFNwb3R0ZWQgd2hpbGUgZGlzY3Vzc2lu
ZyBwYXRjaGVzIHdpdGggVGhvbWFzClppbW1lcm1hbm4uCgpDYzogVGhvbWFzIFppbW1lcm1hbm4g
PHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVz
Lm9yZz4KQ2M6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPgpDYzogRXJpYyBBbmhv
bHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IEVtaWwgVmVsaWtvdiA8ZW1pbC52ZWxpa292QGNvbGxh
Ym9yYS5jb20+CkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpD
YzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vY2lycnVzL2NpcnJ1cy5jICAgICAgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X3NpbXBsZV9rbXNfaGVscGVyLmMgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFf
ZGlzcGxheS5jICAgfCA0ICsrLS0KIGluY2x1ZGUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5o
ICAgICB8IDIgKy0KIDQgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2
ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCmluZGV4IDdkMDhkMDY3ZTFhNC4uMjQ4YzlmNzY1
YzQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKQEAgLTM5MCw3ICszOTAsNyBAQCBzdGF0aWMg
aW50IGNpcnJ1c19jb25uX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKIC8qIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSAqLwogLyogY2lycnVzIChzaW1wbGUpIGRpc3BsYXkgcGlwZQkJCQkJICAgICAgKi8K
IAotc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIGNpcnJ1c19waXBlX21vZGVfdmFsaWQoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAorc3RhdGljIGVudW0gZHJtX21vZGVfc3RhdHVzIGNpcnJ1c19w
aXBlX21vZGVfdmFsaWQoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCQkJ
CQkJICAgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCiB7CiAJaWYgKGNpcnJ1
c19jaGVja19zaXplKG1vZGUtPmhkaXNwbGF5LCBtb2RlLT52ZGlzcGxheSwgTlVMTCkgPCAwKQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jCmluZGV4IDA0NjA1NTcxOTI0NS4u
MTVmYjUxNmFlMmQ4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3NpbXBsZV9rbXNf
aGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5jCkBA
IC00Myw3ICs0Myw3IEBAIGRybV9zaW1wbGVfa21zX2NydGNfbW9kZV92YWxpZChzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCiAJCS8qIEFueXRoaW5nIGdvZXMgKi8KIAkJcmV0dXJuIE1PREVfT0s7CiAK
LQlyZXR1cm4gcGlwZS0+ZnVuY3MtPm1vZGVfdmFsaWQoY3J0YywgbW9kZSk7CisJcmV0dXJuIHBp
cGUtPmZ1bmNzLT5tb2RlX3ZhbGlkKHBpcGUsIG1vZGUpOwogfQogCiBzdGF0aWMgaW50IGRybV9z
aW1wbGVfa21zX2NydGNfY2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLApkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9w
bDExMS9wbDExMV9kaXNwbGF5LmMKaW5kZXggMDI0NzcxYTQwODNlLi43MDNkZGM4MDNjNTUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wbDExMS9wbDExMV9kaXNwbGF5LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3BsMTExL3BsMTExX2Rpc3BsYXkuYwpAQCAtNDgsMTAgKzQ4LDEwIEBAIGly
cXJldHVybl90IHBsMTExX2lycShpbnQgaXJxLCB2b2lkICpkYXRhKQogfQogCiBzdGF0aWMgZW51
bSBkcm1fbW9kZV9zdGF0dXMKLXBsMTExX21vZGVfdmFsaWQoc3RydWN0IGRybV9jcnRjICpjcnRj
LAorcGwxMTFfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUs
CiAJCSBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKLQlzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtID0gY3J0Yy0+ZGV2OworCXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBwaXBl
LT5jcnRjLmRldjsKIAlzdHJ1Y3QgcGwxMTFfZHJtX2Rldl9wcml2YXRlICpwcml2ID0gZHJtLT5k
ZXZfcHJpdmF0ZTsKIAl1MzIgY3BwID0gcHJpdi0+dmFyaWFudC0+ZmJfYnBwIC8gODsKIAl1NjQg
Ync7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9zaW1wbGVfa21zX2hlbHBlci5oCmluZGV4IDRkODljZDBhNjBkYi4uMTVh
ZmVlOWNmMDQ5IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaApAQCAtNDksNyArNDks
NyBAQCBzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZnVuY3MgewogCSAqCiAJICogZHJt
X21vZGVfc3RhdHVzIEVudW0KIAkgKi8KLQllbnVtIGRybV9tb2RlX3N0YXR1cyAoKm1vZGVfdmFs
aWQpKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKKwllbnVtIGRybV9tb2RlX3N0YXR1cyAoKm1vZGVf
dmFsaWQpKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJCQkJICAgY29u
c3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpOwogCiAJLyoqCi0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0
aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9y
ZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0
dWFsaXphdGlvbg==
