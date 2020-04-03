Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A2B19D837
	for <lists.virtualization@lfdr.de>; Fri,  3 Apr 2020 15:59:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A5282204CA;
	Fri,  3 Apr 2020 13:59:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CygxMi-Fn-C2; Fri,  3 Apr 2020 13:59:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EF40A204E9;
	Fri,  3 Apr 2020 13:59:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAB36C07FF;
	Fri,  3 Apr 2020 13:59:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 64F30C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 53A982047D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fdeZhX0xctM
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by silver.osuosl.org (Postfix) with ESMTPS id BA9E6203E0
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:21 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f6so7818304wmj.3
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Apr 2020 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5A+k4shKLAk+kqqUo7Y8HJznsDuW0cxoB/GKOh12bj0=;
 b=YWiIhBiKOvaPktwCTj/0x1o02aqPjV2TQeq9rwpaKwElROZUYvZIDj7ZtC6yXBq2Qb
 QsajXatPcuorDi8pAsCL8rYzc7eFO43NpgZ+7QDOVaHlIUrqlyk04PjQDol5gidz/iC1
 oHto3H2Hi6gOg2z65/WVYCyHpTEGUWSRdcMmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5A+k4shKLAk+kqqUo7Y8HJznsDuW0cxoB/GKOh12bj0=;
 b=ds+Z2zeyK6D7bcxi8VPz21xOptQOdfiXh6Io5pqUtm96qhfalYn06woXgUsm4KR9kb
 KxqEGBMbZv3jPspcHvrk9yWrvSEiYF3z8n41YHZLcpsKVogKgUuA5nLyZVadY8vpTjc1
 bD9gFwgUV44MhAojEhiOWIpd46vW4e68ozBZSK4iTkGCAWdJHkv5mIxrUDVmkqQSh2X1
 Bm6Qy3dFlwEyKwHNz1jBrVzGafvxjbKE4mQmDuF0WjzJbq0Rk7EnmeRTXXV6e/Pco8Hz
 eE6I0Zs8jK0MDP6R0NehHDjosYqP91u5GbcJcgRN7B26K0mMYKfbV++aLwZqpTVsi+wt
 4HMg==
X-Gm-Message-State: AGi0PuYg4k2B3Jydm77SPwhrUqUUe19b+DSbaMb4aUxlQ2+l4aGn3es+
 P4cjASxdNj2Mdkj2GqZkl848DQ==
X-Google-Smtp-Source: APiQypIbdB3FwA94s3RYl6Ch3fYWfnoRTSB23vcfVNOW+d/gxiNpE3xJM902sNU32BPNDPsZ0yAFBA==
X-Received: by 2002:a1c:99d3:: with SMTP id b202mr9169424wme.170.1585922360198; 
 Fri, 03 Apr 2020 06:59:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 40/44] drm/cirrus: Don't use drm_device->dev_private
Date: Fri,  3 Apr 2020 15:58:24 +0200
Message-Id: <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
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

VXBjYXN0aW5nIHVzaW5nIGEgY29udGFpbmVyX29mIG1hY3JvIGlzIG1vcmUgdHlwZXNhZmUsIGZh
c3RlciBhbmQKZWFzaWVyIGZvciB0aGUgY29tcGlsZXIgdG8gb3B0aW1pemUuCgpTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IERhdmUgQWly
bGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAiTm9y
YWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1A
cmF2bmJvcmcub3JnPgpDYzogRXJpYyBBbmhvbHQgPGVyaWNAYW5ob2x0Lm5ldD4KQ2M6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25AbGlz
dHMubGludXgtZm91bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1
cy5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXggNGI2NTYzNzE0N2JhLi43NDRh
OGUzMzdlNDEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAtNTksNiArNTksOCBAQCBzdHJ1
Y3QgY2lycnVzX2RldmljZSB7CiAJdm9pZCBfX2lvbWVtCQkgICAgICAgKm1taW87CiB9OwogCisj
ZGVmaW5lIHRvX2NpcnJ1cyhfZGV2KSBjb250YWluZXJfb2YoX2Rldiwgc3RydWN0IGNpcnJ1c19k
ZXZpY2UsIGRldikKKwogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tICovCiAvKgogICogVGhlIG1lYXQgb2YgdGhpcyBk
cml2ZXIuIFRoZSBjb3JlIHBhc3NlcyB1cyBhIG1vZGUgYW5kIHdlIGhhdmUgdG8gcHJvZ3JhbQpA
QCAtMzExLDcgKzMxMyw3IEBAIHN0YXRpYyBpbnQgY2lycnVzX21vZGVfc2V0KHN0cnVjdCBjaXJy
dXNfZGV2aWNlICpjaXJydXMsCiBzdGF0aWMgaW50IGNpcnJ1c19mYl9ibGl0X3JlY3Qoc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIsCiAJCQkgICAgICAgc3RydWN0IGRybV9yZWN0ICpyZWN0KQog
ewotCXN0cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMgPSBmYi0+ZGV2LT5kZXZfcHJpdmF0ZTsK
KwlzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzID0gdG9fY2lycnVzKGZiLT5kZXYpOwogCXZv
aWQgKnZtYXA7CiAJaW50IGlkeCwgcmV0OwogCkBAIC00MzYsNyArNDM4LDcgQEAgc3RhdGljIHZv
aWQgY2lycnVzX3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlw
ZSwKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX2NydGNfc3RhdGUgKmNydGNfc3RhdGUsCiAJCQkgICAg
ICAgc3RydWN0IGRybV9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCiB7Ci0Jc3RydWN0IGNpcnJ1
c19kZXZpY2UgKmNpcnJ1cyA9IHBpcGUtPmNydGMuZGV2LT5kZXZfcHJpdmF0ZTsKKwlzdHJ1Y3Qg
Y2lycnVzX2RldmljZSAqY2lycnVzID0gdG9fY2lycnVzKHBpcGUtPmNydGMuZGV2KTsKIAogCWNp
cnJ1c19tb2RlX3NldChjaXJydXMsICZjcnRjX3N0YXRlLT5tb2RlLCBwbGFuZV9zdGF0ZS0+ZmIp
OwogCWNpcnJ1c19mYl9ibGl0X2Z1bGxzY3JlZW4ocGxhbmVfc3RhdGUtPmZiKTsKQEAgLTQ0NSw3
ICs0NDcsNyBAQCBzdGF0aWMgdm9pZCBjaXJydXNfcGlwZV9lbmFibGUoc3RydWN0IGRybV9zaW1w
bGVfZGlzcGxheV9waXBlICpwaXBlLAogc3RhdGljIHZvaWQgY2lycnVzX3BpcGVfdXBkYXRlKHN0
cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwKIAkJCSAgICAgICBzdHJ1Y3QgZHJt
X3BsYW5lX3N0YXRlICpvbGRfc3RhdGUpCiB7Ci0Jc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1
cyA9IHBpcGUtPmNydGMuZGV2LT5kZXZfcHJpdmF0ZTsKKwlzdHJ1Y3QgY2lycnVzX2RldmljZSAq
Y2lycnVzID0gdG9fY2lycnVzKHBpcGUtPmNydGMuZGV2KTsKIAlzdHJ1Y3QgZHJtX3BsYW5lX3N0
YXRlICpzdGF0ZSA9IHBpcGUtPnBsYW5lLnN0YXRlOwogCXN0cnVjdCBkcm1fY3J0YyAqY3J0YyA9
ICZwaXBlLT5jcnRjOwogCXN0cnVjdCBkcm1fcmVjdCByZWN0OwpAQCAtNTczLDcgKzU3NSw2IEBA
IHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAkJcmV0
dXJuIFBUUl9FUlIoY2lycnVzKTsKIAogCWRldiA9ICZjaXJydXMtPmRldjsKLQlkZXYtPmRldl9w
cml2YXRlID0gY2lycnVzOwogCiAJY2lycnVzLT52cmFtID0gZGV2bV9pb3JlbWFwKCZwZGV2LT5k
ZXYsIHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAwKSwKIAkJCQkgICAgcGNpX3Jlc291cmNlX2xl
bihwZGV2LCAwKSk7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlv
bkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlv
bi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
