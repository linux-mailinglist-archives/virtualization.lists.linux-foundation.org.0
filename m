Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F5519D834
	for <lists.virtualization@lfdr.de>; Fri,  3 Apr 2020 15:59:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4E22826067;
	Fri,  3 Apr 2020 13:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9NEofz6NQm7Q; Fri,  3 Apr 2020 13:59:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A6D1B204E9;
	Fri,  3 Apr 2020 13:59:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75EE5C1831;
	Fri,  3 Apr 2020 13:59:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B4E76C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A518988314
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9tPaKRz-dAL
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AC7D387E77
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 13:59:20 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id e9so7823162wme.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Apr 2020 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jWYyUGGEcSZSSlRstW2+Zp7fC8Wgfn2Y5FNgIASkXx8=;
 b=KidbwFBcPhKAa0Wq91jbM8XFGdiS8WMx2dyAOZS1WaoKQ9kh2YP8iVUh2GJ8v6nrtp
 SzMpEMv1yB8s20vOr6lFPHSMbHWQjswmEJRpQ6y2ExXDNmb5GyYjQnP5Tg7+Lytq11tQ
 cqgcGhNA5IAlprzTQxpekvstFIp6vVzmokK18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jWYyUGGEcSZSSlRstW2+Zp7fC8Wgfn2Y5FNgIASkXx8=;
 b=iHWQ1SRxejX8IJqIgkzK1cT1qUiSHfPSCX8rjt7KCDA4UN1K1vcbOK2Q23dBNADPUG
 DNKcqhUYxXYoMIC42MJbcMYBoInJ/pKUbbMYGbgniaakQpMNYtptoixv0Fkc/9vJ4uGL
 wx+iQzQOKxNi+YZDI0Xzp+Tx+ICyHOuE0MdgPFVPnD3BMvvRYeFf4RzL7bNTDI+Rk+6X
 sfZBcJduouQq+K7vBt/z1FZGJqP0idO1gdi8tw0d+IGoOtk92wa7krqChVM8pNVtAv53
 Z239rWx8xT6Bl7ErOERfEyPemM2LuEHabU8pS5sf8oKn33qTONcXne1jmiHS4CPYrZNh
 MaPg==
X-Gm-Message-State: AGi0PuZ/gVWuVXIq6x/+clFdqf+wn3ZgLFNqGWa8yGBvCdq7wSOBSvVr
 592/lTk3tdXcFmcB88VZyGXEeA==
X-Google-Smtp-Source: APiQypIhNaBEVOpN/pgJkGy2Cs08n0fhriLEJmuwdwGQyeCoG1i9kQq0X4dr4nVMOsD+s9DMAP0ehQ==
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr9210352wmh.39.1585922359095;
 Fri, 03 Apr 2020 06:59:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:59:18 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 39/44] drm/cirrus: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:23 +0200
Message-Id: <20200403135828.2542770-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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
dC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
PgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4KQ2M6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6ICJOb3JhbGYgVHLD
uG5uZXMiIDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwu
b3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CkNjOiB2aXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpDYzogRW1pbCBWZWxpa292IDxl
bWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2Np
cnJ1cy5jIHwgMTMgKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2Np
cnJ1cy5jIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwppbmRleCBhMzYyNjk3MTdj
M2IuLjRiNjU2MzcxNDdiYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJy
dXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jCkBAIC01NjcsMTggKzU2
NywxMyBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYs
CiAJCXJldHVybiByZXQ7CiAKIAlyZXQgPSAtRU5PTUVNOwotCWNpcnJ1cyA9IGt6YWxsb2Moc2l6
ZW9mKCpjaXJydXMpLCBHRlBfS0VSTkVMKTsKLQlpZiAoY2lycnVzID09IE5VTEwpCi0JCXJldHVy
biByZXQ7CisJY2lycnVzID0gZGV2bV9kcm1fZGV2X2FsbG9jKCZwZGV2LT5kZXYsICZjaXJydXNf
ZHJpdmVyLAorCQkJCSAgICBzdHJ1Y3QgY2lycnVzX2RldmljZSwgZGV2KTsKKwlpZiAoSVNfRVJS
KGNpcnJ1cykpCisJCXJldHVybiBQVFJfRVJSKGNpcnJ1cyk7CiAKIAlkZXYgPSAmY2lycnVzLT5k
ZXY7Ci0JcmV0ID0gZGV2bV9kcm1fZGV2X2luaXQoJnBkZXYtPmRldiwgZGV2LCAmY2lycnVzX2Ry
aXZlcik7Ci0JaWYgKHJldCkgewotCQlrZnJlZShjaXJydXMpOwotCQlyZXR1cm4gcmV0OwotCX0K
IAlkZXYtPmRldl9wcml2YXRlID0gY2lycnVzOwotCWRybW1fYWRkX2ZpbmFsX2tmcmVlKGRldiwg
Y2lycnVzKTsKIAogCWNpcnJ1cy0+dnJhbSA9IGRldm1faW9yZW1hcCgmcGRldi0+ZGV2LCBwY2lf
cmVzb3VyY2Vfc3RhcnQocGRldiwgMCksCiAJCQkJICAgIHBjaV9yZXNvdXJjZV9sZW4ocGRldiwg
MCkpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMu
bGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21h
aWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
