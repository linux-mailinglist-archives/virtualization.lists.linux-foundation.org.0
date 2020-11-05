Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC0E2A7C4D
	for <lists.virtualization@lfdr.de>; Thu,  5 Nov 2020 11:52:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7C95322E6E;
	Thu,  5 Nov 2020 10:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tz7kv5+eWhv4; Thu,  5 Nov 2020 10:52:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8E59522E20;
	Thu,  5 Nov 2020 10:52:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61E56C0889;
	Thu,  5 Nov 2020 10:52:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1744BC0889
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 10:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F13BC870BA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 10:52:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1MODsXsmTCUy
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 10:52:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C6FFB8702C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  5 Nov 2020 10:52:42 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id x6so1094664ljd.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 05 Nov 2020 02:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IbC7h6sutytvBKVgRkW8YBm4v4oQThhwvuIz3XlFJpw=;
 b=d/RC4QlHsEU0Pk+87b5hebgQR1nvUbGfz+KWgyYPw8avJty+oHtYWwRBfI9ZwNnjQk
 6x1f9VNEkjxS+WacQizm9QFnRFRoNTRgXz7J8hUL7gDHTr1r0B4CDTIH++hxOUWPbRHA
 faB9Z1G3wfURCCb570cPMFzwdpYsz5NNLR9grwb6NletLAXur80zPGuj6TnPTgqIsI6W
 73tvdQLbSeHs/ZIHScGvMbbglljfvtEcmDpRr1SmCjt0Cs2115AxcxEJIltrAcsJpAIs
 i7f4CKXDgFTYIlx2Oia+shgKsQ9vbBqcm5RZnKYsE+6tO+5eUkPHBV9yZoGBsu8zWwxP
 sFlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IbC7h6sutytvBKVgRkW8YBm4v4oQThhwvuIz3XlFJpw=;
 b=NsuNuMDgZk9TIp+xWojetfo08PjdmOwrGVLnA/2J7Kq1N407Q0aIMXTs55xxZAAE0m
 4C6llSG5ov915gAh3Qm0UjO+U4z4kQWIcssFOYCDVac3vX5RoNrgSSYCqn6aIo0Fi3hy
 Ag4+Oe8dEw2g4HhH/vykD1Iq2FwrjurOcaQbh60XxW1T4+PworadMrQhygg5nO5lMq8s
 s6rPbwmgytjG7ccQQvLZ/FIaKN3G0+JZ7ug54IGk4DhCHSixDzhV+q072IhZo6EpnVVr
 SN8lxJrDOJI200iR4cRbwm0FEshsAYL/mkC7N6RuBuUwfq/PPfugtjnKUkYqKFVVOhLv
 uuRA==
X-Gm-Message-State: AOAM530b2tJMkrN1t+Gfkw+CNJb6fDrYxZoOhR9NGf1wOI45dfcwR9Hn
 xW9YdVgJi0TLugXIp+2BjrJSTFLFD24hhz7FEzYUTg==
X-Google-Smtp-Source: ABdhPJwMZsQSFYx3yHXvvtRlVkabm7C64j8LuP2+XUU2+XVFwAx/DWoa4YDvNPprZ43yAgspd5XcguY3mqI1O9Ir5Vs=
X-Received: by 2002:a05:651c:1205:: with SMTP id
 i5mr726163lja.283.1604573560846; 
 Thu, 05 Nov 2020 02:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20201027121725.24660-1-brgl@bgdev.pl>
In-Reply-To: <20201027121725.24660-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Nov 2020 11:52:30 +0100
Message-ID: <CACRpkdYbpOZGmWONeOQFY7DE+t2ev30DQQ-8cxrJNoK9fVVunA@mail.gmail.com>
Subject: Re: [PATCH 0/8] slab: provide and use krealloc_array()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Gustavo Padovan <gustavo@padovan.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Christoph Lameter <cl@linux.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 David Rientjes <rientjes@google.com>,
 virtualization@lists.linux-foundation.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linaro-mm-sig@lists.linaro.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, netdev <netdev@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Pekka Enberg <penberg@kernel.org>, James Morse <james.morse@arm.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Oct 27, 2020 at 1:17 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Andy brought to my attention the fact that users allocating an array of
> equally sized elements should check if the size multiplication doesn't
> overflow. This is why we have helpers like kmalloc_array().
>
> However we don't have krealloc_array() equivalent and there are many
> users who do their own multiplication when calling krealloc() for arrays.
>
> This series provides krealloc_array() and uses it in a couple places.
>
> A separate series will follow adding devm_krealloc_array() which is
> needed in the xilinx adc driver.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

I really like this.

Yours,
Linus Walleij
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
