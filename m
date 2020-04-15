Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA11A9481
	for <lists.virtualization@lfdr.de>; Wed, 15 Apr 2020 09:41:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8C9F9861B5;
	Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1Sso5880ZKM; Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1A5AC87E38;
	Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 058AAC1D7D;
	Wed, 15 Apr 2020 07:41:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26AFDC0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 230EE87D9C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WROtksBNFfP1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 372A7861B5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 07:41:19 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id x4so16186414wmj.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 00:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=68pRrV/FcZHhfKF8N6ed2Kst21jlb9WtulkqBRnU6S8=;
 b=Gyz+CtzkcX37Hl3nRFOLm4GVr0azPRX/NrKG8ap0W4baKemymnbW+Lxwz1Xp6GzRWr
 lx8lnLIxv1Ol9V12XsfA9QbmLLL+3YuN9Oi/tEmm8esrE92s8XrfhUVGnPj+V2YfEa9U
 /1rFjd2vFJTcNB51K1Lp7i6tJvkBxa6hlf7kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=68pRrV/FcZHhfKF8N6ed2Kst21jlb9WtulkqBRnU6S8=;
 b=nd4kof6YC6NOQVWidbRfZODNFegeZo5pSV9Q+xWchO0ueuPRDxWFr3Z5q2azEaqCzS
 SYUcXUJLe20bKeH7+sAKHzyYXb5LnOhK3+TgWzcltEG85DfQ2K0nWEzlU8sc9H/HawYd
 f2GKZtbe1pwm8zGGa6Mv9D7QxSiMlXgQx310CzJFvg78aMAr/A24I2+UpZpHmyx0DoaR
 OdQJfPSefkhAJ8Z1giDFiA/V383V7DT0bt71IuExqru05acT2TGIMCaXsgkA+fxAwj/X
 5KDm5yzXbp2w+/+DtCluoWr4xRsc4znODKKLsLm7w36u496vLdpKdIOyE8ru13eP9vad
 qhFw==
X-Gm-Message-State: AGi0PuZCN0RSwyKuNbEVKFA3GT39ppvChxUHC0NrToC4xAKUEkC7KXMU
 PyHVFlyIza86NK75CheLG/FKSWXBUXs=
X-Google-Smtp-Source: APiQypK5zCrPi1yHK4Hs/xsz2aEThr6qJhfA2NsVnJXgzOw3DJadAR07qQZyjbKa0Tk2q2OD7lnVVg==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4095533wmd.117.1586936477577; 
 Wed, 15 Apr 2020 00:41:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:41:17 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 35/59] drm/cirrus: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:40:10 +0200
Message-Id: <20200415074034.175360-36-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>
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

QWxyZWFkeSB1c2luZyBkZXZtX2RybV9kZXZfaW5pdCwgc28gdmVyeSBzaW1wbGUgcmVwbGFjbWVu
dC4KCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQWNrZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogU2FtIFJhdm5ib3JnIDxz
YW1AcmF2bmJvcmcub3JnPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9y
Zz4KQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CkNjOiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgfCAxMyArKysrLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
Y2lycnVzL2NpcnJ1cy5jCmluZGV4IGEzNjI2OTcxN2MzYi4uNGI2NTYzNzE0N2JhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9jaXJydXMvY2lycnVzLmMKQEAgLTU2NywxOCArNTY3LDEzIEBAIHN0YXRpYyBpbnQgY2lycnVz
X3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJcmV0dXJuIHJldDsKIAogCXJldCA9
IC1FTk9NRU07Ci0JY2lycnVzID0ga3phbGxvYyhzaXplb2YoKmNpcnJ1cyksIEdGUF9LRVJORUwp
OwotCWlmIChjaXJydXMgPT0gTlVMTCkKLQkJcmV0dXJuIHJldDsKKwljaXJydXMgPSBkZXZtX2Ry
bV9kZXZfYWxsb2MoJnBkZXYtPmRldiwgJmNpcnJ1c19kcml2ZXIsCisJCQkJICAgIHN0cnVjdCBj
aXJydXNfZGV2aWNlLCBkZXYpOworCWlmIChJU19FUlIoY2lycnVzKSkKKwkJcmV0dXJuIFBUUl9F
UlIoY2lycnVzKTsKIAogCWRldiA9ICZjaXJydXMtPmRldjsKLQlyZXQgPSBkZXZtX2RybV9kZXZf
aW5pdCgmcGRldi0+ZGV2LCBkZXYsICZjaXJydXNfZHJpdmVyKTsKLQlpZiAocmV0KSB7Ci0JCWtm
cmVlKGNpcnJ1cyk7Ci0JCXJldHVybiByZXQ7Ci0JfQogCWRldi0+ZGV2X3ByaXZhdGUgPSBjaXJy
dXM7Ci0JZHJtbV9hZGRfZmluYWxfa2ZyZWUoZGV2LCBjaXJydXMpOwogCiAJY2lycnVzLT52cmFt
ID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAwKSwK
IAkJCQkgICAgcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKSk7Ci0tIAoyLjI1LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
