Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F84FC0640
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 15:25:09 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D888103A;
	Fri, 27 Sep 2019 13:25:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BF0A1101B
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:25:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 149958C7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 13:25:01 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f22so6167090wmc.2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 06:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PwNDIPDY2oKs3xrzZ+xUYN+WsNBz/04hGM9/C6T63AE=;
	b=bMiuKYnnvWNOCw9rAU3HuUAmLPzuOyUw1PQf7twiEb/ocLlGT7mXuIBChDdV6RERnG
	qlDJwq2BjjZWZJ/0d4r0rhF5E43it8h6kmIcRPs8DVmblfrVTFDZPbpmDffYibGTKEnp
	zKnu8XR5W486LaQavGo7aMSzC6S6jsp98gbfApKZ9SRGuzB64h+trMvkPBSYgQGTlLIC
	cg8zJblfzIDITJU/jhLFfKzk3GixXGRYtRD3306wa3hLigBqNRSNplLQDGxhGYHxXuju
	h9VMvpbaw2uAAo80PZtn+ZN3AE+koBpdufFq5o5x8ZdBJsjHQBivoaIDEyvJpVqQnqIr
	II2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PwNDIPDY2oKs3xrzZ+xUYN+WsNBz/04hGM9/C6T63AE=;
	b=Vueq5rwUjIhUn4PWJAOB+35eoEMAUWq8cuA1aKkUWYhSLLrpJxa+6gTED5A+q7+MER
	YXEJNyR3I0F/apoghIFEQzAdwbsrgyoRDAX5l+e3EKMcnVF9/4pow7SEOUtitwqPW6gc
	EbzNJh6zjvUEm1pDjKxE7uXdYLQY8+6xfGBA6FTiRe8SQtZBHC9Qqx3lUCtz8y3LlHDa
	9Gn8ARRxuFj00czbbHkRMUMXlj16UODDry94aJWCThqkl8QEpd1UN0xiLYyA/mvKJXAG
	LKuKejGpcwh/L86OqIzAw1LvW+mGjQ+4knxla5cPLLd+8QzNO2M8kTTpoVpqbdqloq6r
	1qPQ==
X-Gm-Message-State: APjAAAUiHgJm9ioLEq+ZBcvLe2BWOCmig0Tj7JhinVY+mFRUnsSxnL1s
	KD8Zp60DGxAde3T4EMudwjA=
X-Google-Smtp-Source: APXvYqwyCNlKENrB2ladvwGe436qNQLkMeG4OCH4lPvGCuv7KPls7uPKYhO0ceX900iBjDMyRvnq7Q==
X-Received: by 2002:a1c:e916:: with SMTP id q22mr7256946wmc.15.1569590699737; 
	Fri, 27 Sep 2019 06:24:59 -0700 (PDT)
Received: from baker.fritz.box ([2a02:908:1252:fb60:2d04:d861:e9c6:56ab])
	by smtp.gmail.com with ESMTPSA id z3sm4917181wmi.30.2019.09.27.06.24.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Sep 2019 06:24:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>
To: airlied@redhat.com, kraxel@redhat.com, daniel@ffwll.ch,
	virtualization@lists.linux-foundation.org,
	spice-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/qxl: stop abusing TTM to call driver internal
	functions
Date: Fri, 27 Sep 2019 15:24:57 +0200
Message-Id: <20190927132458.4359-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

VGhlIHR0bV9tZW1faW9fKiBmdW5jdGlvbnMgYXJlIGFjdHVhbGx5IGludGVybmFsIHRvIFRUTSBh
bmQgc2hvdWxkbid0IGJlCnVzZWQgaW4gYSBkcml2ZXIuCgpJbnN0ZWFkIGNhbGwgdGhlIHF4bF90
dG1faW9fbWVtX3Jlc2VydmUoKSBmdW5jdGlvbiBkaXJlY3RseS4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcXhsL3F4bF9kcnYuaCAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9v
YmplY3QuYyB8IDExICstLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyAg
ICB8ICA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9xeGwvcXhsX2Rydi5oCmluZGV4IDllMDM0YzVmYTg3ZC4uOGEyNGY4ZTEwMWRh
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaAorKysgYi9kcml2ZXJz
L2dwdS9kcm0vcXhsL3F4bF9kcnYuaApAQCAtMzU0LDYgKzM1NCw4IEBAIGludCBxeGxfbW9kZV9k
dW1iX21tYXAoc3RydWN0IGRybV9maWxlICpmaWxwLAogLyogcXhsIHR0bSAqLwogaW50IHF4bF90
dG1faW5pdChzdHJ1Y3QgcXhsX2RldmljZSAqcWRldik7CiB2b2lkIHF4bF90dG1fZmluaShzdHJ1
Y3QgcXhsX2RldmljZSAqcWRldik7CitpbnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwKKwkJCSAgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKTsKIGlu
dCBxeGxfbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEp
OwogCiAvKiBxeGwgaW1hZ2UgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKaW5kZXggNTQ4ZGZl
NmYzYjI2Li4yOTllNjNhOTUxYzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhs
X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCkBAIC0xNDgs
NyArMTQ4LDYgQEAgaW50IHF4bF9ib19rbWFwKHN0cnVjdCBxeGxfYm8gKmJvLCB2b2lkICoqcHRy
KQogdm9pZCAqcXhsX2JvX2ttYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYs
CiAJCQkgICAgICBzdHJ1Y3QgcXhsX2JvICpibywgaW50IHBhZ2Vfb2Zmc2V0KQogewotCXN0cnVj
dCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuID0gJmJvLT50Ym8uYmRldi0+bWFuW2JvLT50Ym8u
bWVtLm1lbV90eXBlXTsKIAl2b2lkICpycHRyOwogCWludCByZXQ7CiAJc3RydWN0IGlvX21hcHBp
bmcgKm1hcDsKQEAgLTE2MCw5ICsxNTksNyBAQCB2b2lkICpxeGxfYm9fa21hcF9hdG9taWNfcGFn
ZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKIAllbHNlCiAJCWdvdG8gZmFsbGJhY2s7CiAKLQko
dm9pZCkgdHRtX21lbV9pb19sb2NrKG1hbiwgZmFsc2UpOwotCXJldCA9IHR0bV9tZW1faW9fcmVz
ZXJ2ZShiby0+dGJvLmJkZXYsICZiby0+dGJvLm1lbSk7Ci0JdHRtX21lbV9pb191bmxvY2sobWFu
KTsKKwlyZXQgPSBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKGJvLT50Ym8uYmRldiwgJmJvLT50Ym8u
bWVtKTsKIAogCXJldHVybiBpb19tYXBwaW5nX21hcF9hdG9taWNfd2MobWFwLCBiby0+dGJvLm1l
bS5idXMub2Zmc2V0ICsgcGFnZV9vZmZzZXQpOwogZmFsbGJhY2s6CkBAIC0xOTMsMTcgKzE5MCwx
MSBAQCB2b2lkIHF4bF9ib19rdW5tYXAoc3RydWN0IHF4bF9ibyAqYm8pCiB2b2lkIHF4bF9ib19r
dW5tYXBfYXRvbWljX3BhZ2Uoc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYsCiAJCQkgICAgICAgc3Ry
dWN0IHF4bF9ibyAqYm8sIHZvaWQgKnBtYXApCiB7Ci0Jc3RydWN0IHR0bV9tZW1fdHlwZV9tYW5h
Z2VyICptYW4gPSAmYm8tPnRiby5iZGV2LT5tYW5bYm8tPnRiby5tZW0ubWVtX3R5cGVdOwotCiAJ
aWYgKChiby0+dGJvLm1lbS5tZW1fdHlwZSAhPSBUVE1fUExfVlJBTSkgJiYKIAkgICAgKGJvLT50
Ym8ubWVtLm1lbV90eXBlICE9IFRUTV9QTF9QUklWKSkKIAkJZ290byBmYWxsYmFjazsKIAogCWlv
X21hcHBpbmdfdW5tYXBfYXRvbWljKHBtYXApOwotCi0JKHZvaWQpIHR0bV9tZW1faW9fbG9jayht
YW4sIGZhbHNlKTsKLQl0dG1fbWVtX2lvX2ZyZWUoYm8tPnRiby5iZGV2LCAmYm8tPnRiby5tZW0p
OwotCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7CiAJcmV0dXJuOwogIGZhbGxiYWNrOgogCXF4bF9i
b19rdW5tYXAoYm8pOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYwppbmRleCA5YjI0NTE0Yzc1YWEuLmNiODBl
NTEyZGQ0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMKQEAgLTE1OSw4ICsxNTksOCBAQCBzdGF0aWMg
aW50IHF4bF92ZXJpZnlfYWNjZXNzKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIHN0cnVj
dCBmaWxlICpmaWxwKQogCQkJCQkgIGZpbHAtPnByaXZhdGVfZGF0YSk7CiB9CiAKLXN0YXRpYyBp
bnQgcXhsX3R0bV9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKLQkJ
CQkgIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQoraW50IHF4bF90dG1faW9fbWVtX3Jlc2VydmUo
c3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCisJCQkgICBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1l
bSkKIHsKIAlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5tYW5bbWVt
LT5tZW1fdHlwZV07CiAJc3RydWN0IHF4bF9kZXZpY2UgKnFkZXYgPSBxeGxfZ2V0X3FkZXYoYmRl
dik7Ci0tIAoyLjE0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5s
aW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFp
bG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
