Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA1D19DCF1
	for <lists.virtualization@lfdr.de>; Fri,  3 Apr 2020 19:40:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2A6782690C;
	Fri,  3 Apr 2020 17:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sXqBxoXPxT8; Fri,  3 Apr 2020 17:40:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5508D26781;
	Fri,  3 Apr 2020 17:40:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F2F8C07FF;
	Fri,  3 Apr 2020 17:40:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 34B0EC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 17:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1C4A088B93
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 17:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7ER1qFD4SrNV
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 17:40:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED37788B3D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 17:40:40 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id v16so7825481ljg.5
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Apr 2020 10:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g8RDp4K/dvB2DqCHMRGbTSsNwhQ5/+cJi1oXxVKrFmo=;
 b=eJDAk22lU0U43+noNq5RI+b9wJ/eeRQ5ayIssbySEwBKkkU2Xc0ITvRjqwBS3oDMq3
 s/R8V1/PIGo8eIiasd54u17oVrxZXeE9br7fp3IbDcath4ZE/C43zSZvoEV0hjUHVguo
 znMWWYquyR/igp1jniYjgBcRDDG8wATCksRLAdAJ3thss/waz8NgQJKCaSUc5nYyD8c5
 +WH17tMRBJFU21n1hpKlu1XqbDF3ySjX1fWNFL6pNuSPNj2XYndTTCMRG51p+dir0csP
 XWQxuFLIJickNO5wRM6Q68EFrRgNmXaYK7M2Y69HVOd6Q7CEiVYJfG2gjKAWcVkP9n8e
 wO8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g8RDp4K/dvB2DqCHMRGbTSsNwhQ5/+cJi1oXxVKrFmo=;
 b=Q4LkWSGJpm60XoOIAznM4+/6XSwDZFfY5reC2/5PGksi5Rqz4j+dq9c/0bLfWmkhtd
 ffAoT41uQAewZpXNYEPFaSvtaz0mjOcSGW/SVgNKF/MEts8oYz14K8cULYS44queLCnZ
 +gEptupIbPUzCFM1LzQc7yhPXyKk8GYvPF8uU/43LlC0k5EE3e0wVEPG4xtohQ63FlnP
 gKNNOh1XZvmZRNGyzZXZqFLINeXdGLpuly3v/cyDCrY3VaThS8NvJWuPKEApqT/YbEqL
 iTM/bVQz0IrraI8WLXaMxjia9j2npPAE0UIgZsArH60oaCFQF8INbJ6NN0xgfcgp6w9X
 3R4g==
X-Gm-Message-State: AGi0PuabWHbQUDMn+QJ/8/lEjjepaB0jGZvcRN9+9zkGrQtMmRAYM5sQ
 u00D/eOWmP+4okrv7KOdQYMNMZbNxnUmI9B0tIrxYQ==
X-Google-Smtp-Source: APiQypL6K9C9KAf8cM322y1wwt4cNClW2SqIJKNy9zZasiFHLXr2fQImDnC3nKrTguc+/KhPtos1Rb5wODUejqSrD8Q=
X-Received: by 2002:a2e:a176:: with SMTP id u22mr5595232ljl.84.1585935638718; 
 Fri, 03 Apr 2020 10:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
In-Reply-To: <20200403135828.2542770-41-daniel.vetter@ffwll.ch>
From: Eric Anholt <eric@anholt.net>
Date: Fri, 3 Apr 2020 10:40:27 -0700
Message-ID: <CADaigPWZ9LHOoOPAX442nrXE2rdko04fHsJkuZcgdraicge6zQ@mail.gmail.com>
Subject: Re: [PATCH 40/44] drm/cirrus: Don't use drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
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

T24gRnJpLCBBcHIgMywgMjAyMCBhdCA2OjU5IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gVXBjYXN0aW5nIHVzaW5nIGEgY29udGFpbmVyX29mIG1h
Y3JvIGlzIG1vcmUgdHlwZXNhZmUsIGZhc3RlciBhbmQKPiBlYXNpZXIgZm9yIHRoZSBjb21waWxl
ciB0byBvcHRpbWl6ZS4KPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgo+IENjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgo+
IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiBDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgoKQWNr
ZWQtYnk6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5uZXQ+Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApW
aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxp
bnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
