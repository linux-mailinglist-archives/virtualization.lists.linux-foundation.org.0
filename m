Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id F269B36B9A2
	for <lists.virtualization@lfdr.de>; Mon, 26 Apr 2021 21:05:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23829605B3;
	Mon, 26 Apr 2021 19:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0UrUtOLeT8g; Mon, 26 Apr 2021 19:05:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCDD608DC;
	Mon, 26 Apr 2021 19:05:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53DDBC000B;
	Mon, 26 Apr 2021 19:05:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 656D8C000B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Apr 2021 19:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BD7B400CE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Apr 2021 19:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dk5jXmA5I_Bb
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Apr 2021 19:05:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 361F240004
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Apr 2021 19:05:41 +0000 (UTC)
Received: by mail-vs1-f48.google.com with SMTP id w24so4857494vsq.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 26 Apr 2021 12:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1Z9q2q+by+XoICx7O5bq4s0qjl0Ui3wq+DFED5QpgnI=;
 b=FSqvL4EseGAhOZbqDTopBttiENL8G/9bPPhSa78nyLJWNLcj2dcCWbxXcNNq/WR9zk
 VnjFL8ZOYpwriSPaHlthRT5VzuzuEWyr/+ECQ+d0lrVjYpCuzPGTUSsxOMIsymyzk2OP
 KT7g85fPnYjEC+MPW9Y3guQ7byEbWfaBEcgBZv/lVvxeTDivSPI8ljc5TwVNONni5JZr
 pE64VTNqeXAvuAkQP7pC9J9YUuQAL5FUo8cDbhof+bUNJo3f3Cl1sIl94+6Y2kx+cOQK
 eujc26WMBF3UvpDHflyqiRCbE/wWQ3yIkxu4LiPjJMcMFsOZ7xG4a5wG3c/3pweYYofw
 4ekQ==
X-Gm-Message-State: AOAM53185nRdV2WHgDEV+Pe9gaDjVL+3vXEDPHT2rMvTPlKJayRHyAvK
 tV29JfhvatNvCmIP9LQu9GRYwKC1RYnTJXZ44lU=
X-Google-Smtp-Source: ABdhPJzFyKjW1O90Y0MBq25L4BoxSoh1eregzeBg4Y17kP7i6270tN+MexYhXLWOJPYKWPcRKKJuueNLlzEA80hUIcA=
X-Received: by 2002:a67:8745:: with SMTP id j66mr14878201vsd.18.1619463940025; 
 Mon, 26 Apr 2021 12:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210416090048.11492-1-tzimmermann@suse.de>
 <CAMuHMdWcC8O+UzQDQj7Bm4uK_myjFT5D2ccTmneTJYi4SMfCRQ@mail.gmail.com>
 <YH6U92Q71ntU6Z1R@phenom.ffwll.local>
 <20210420092204.7azdb7nxgofegjht@sirius.home.kraxel.org>
 <CAMuHMdX=0H3LHP5Yme9tpN4JnmpJcnF=SQN8bc=4XTd-X6AVTg@mail.gmail.com>
 <e2d46fc0-5452-5d13-0354-e2e9bd407139@suse.de>
In-Reply-To: <e2d46fc0-5452-5d13-0354-e2e9bd407139@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Apr 2021 21:05:28 +0200
Message-ID: <CAMuHMdW6HQCZYXS3N+xh4xPQqdKix9dP3vcMU49NJ95179BR9g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] drm: Support simple-framebuffer devices and
 firmware fbs
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: bluescreen_avenger@verizon.net,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Greg KH <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Emil Velikov <emil.l.velikov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Sam Ravnborg <sam@ravnborg.org>
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

Hi Thomas,

On Mon, Apr 26, 2021 at 2:22 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Am 20.04.21 um 11:27 schrieb Geert Uytterhoeven:
> > On Tue, Apr 20, 2021 at 11:22 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >>>>> Patches 4 to 8 add the simpledrm driver. It's build on simple DRM helpers
> >>>>> and SHMEM. It supports 16-bit, 24-bit and 32-bit RGB framebuffers. During
> >>>>
> >>>> .... if support for 8-bit frame buffers would be added?
> >>>
> >>> Is that 8-bit greyscale or 8-bit indexed with 256 entry palette? Former
> >>> shouldn't be a big thing, but the latter is only really supported by the
> >>> overall drm ecosystem in theory. Most userspace assumes that xrgb8888
> >>> works, and we keep that illusion up by emulating it in kernel for hw which
> >>> just doesn't support it. But reformatting xrgb8888 to c8 is tricky at
> >>> best.
> >>
> >> Well.  cirrus converts xrgb8888 on the fly to rgb888 or rgb565
> >> (depending on display resolution).  We could pull off the same trick
> >> here and convert to rgb332 (assuming we can program the palette with the
> >> color cube needed for that).  Wouldn't look pretty, but would probably
> >> work better than expecting userspace know what color palettes are in
> >> 2021 ...
> >
> > Yeah, I already had a similar idea for Amiga HAM ;-)
>
> I vaguely remember that HAM mode uses some crazy format where pixel
> colors depend in the values of their neighbors. (?) How complicated is
> it to write a conversion from RGB to HAM?

Not that complicated, unless you want to do it Good & Fast ;-)

https://en.wikipedia.org/wiki/Hold-And-Modify

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
