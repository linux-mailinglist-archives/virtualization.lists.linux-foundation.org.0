Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D0A1A0ABF
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 12:04:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A03CA87E6E;
	Tue,  7 Apr 2020 10:04:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yyT3No4s9QP; Tue,  7 Apr 2020 10:04:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7407287627;
	Tue,  7 Apr 2020 10:04:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55DFAC1D8D;
	Tue,  7 Apr 2020 10:04:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C0E1C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:04:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4400583C00
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:04:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sx7+5kHe9XMo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:04:22 +0000 (UTC)
X-Greylist: delayed 00:06:15 by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A603287B61
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 10:04:22 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x2so834630qtr.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 07 Apr 2020 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XlRrtk04Drccp1IaTlKa1DPuRVn27tHDYLsET4EpF9I=;
 b=wA6RVWrGZsTvyQtipGlQPkx/zUrMle6j/PotPS/Ubl+1rUlzDuQJHGGTaWn9pBGS94
 16eiWdiG0Uj54QLqStMqvzt0Vrq+V/aGzVTBBEKpa6GoDtAtJ3Nwfa2MD4il9MQsiZu0
 +0YaAJkHWlROCy7YvKoMm3EGWcRaXOX3FgiFrZJ99qtqsJEnvq7c99tBL02yA0kMadQJ
 3gMAPBRwaQi4ggynes7NGTM0NIeFUdLAuw0OMg+zsQaJgY/v9/KSEqpLpWFaBdYbDldX
 JLo5MsaJ9O2qScwUxYoer4R5IylAMN5UZ5C0/vp0fPMln72xoMrG/HMyoY/yznxhyxS6
 iz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XlRrtk04Drccp1IaTlKa1DPuRVn27tHDYLsET4EpF9I=;
 b=UK4HEtj8zltHfWGGiQeIMAnLF2yB6FGCLKOr0Bld4CLFsn8fIjg2k3Ufs71e+dRwPM
 NNUgltR3THmMxcRipYDHnNbdBcVVHqffnbkBMAryyxTefT+hvpj8j6By04r2CBUmSSX2
 aUGwtg4+WPcxpK2kFV7yk2CGTqrtQhrOzYKg/s/o620wRNp5Q2X++Hg+JWRNvTFYElaf
 vrpVDdXzzSNfz2hZBD1e4P/isExSnzo/whbtP7hAvQZEr0UHhnqAVMAr6EmYZbSq5stq
 CeEaP0TUDVfD0qAa1GZ+b6RTO/V0X0/nOId8VnZMTwkXyGk9B0C17cAcOJZrHyzr40Ch
 GTmg==
X-Gm-Message-State: AGi0PuYWJ+aO/MOvkbOOaq43EJigYMwIzVEBtlyAN2q1CtNC5FsGlIuo
 kMKckinZOfvLNjxk62kCeIWpud6X0YLwoYcs5wV1t/yLvyk=
X-Google-Smtp-Source: APiQypIVkup6lPiinv10OxautZSlD/0H+G8ygJP+Y1zlmhVZq44N0hs/Atb3q7hlgMorG94PI0Jdbec7sG00UJjWQWk=
X-Received: by 2002:ac8:370c:: with SMTP id o12mr1366857qtb.380.1586253485793; 
 Tue, 07 Apr 2020 02:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <00000000000091056b05a2999f1e@google.com>
 <CACT4Y+b4RcgG_GrcpaghmqhX47zUVsAcGGd6vb6MYJT=6gf89g@mail.gmail.com>
 <20200406080612.v5ubxvyliuso6v5h@sirius.home.kraxel.org>
 <CAKMK7uE9uQ_YCXfDOH9zQBu_ffoz546hqRd1R_r1+L-T072Lew@mail.gmail.com>
 <20200406131602.ggugjwkm36r4zvkr@sirius.home.kraxel.org>
In-Reply-To: <20200406131602.ggugjwkm36r4zvkr@sirius.home.kraxel.org>
Date: Tue, 7 Apr 2020 11:57:54 +0200
Message-ID: <CACT4Y+aF1fNRgq_1a2NnVdy9epQvy5TzRF8VQ8OUSSkh6HAc0g@mail.gmail.com>
Subject: Re: upstream boot error: KASAN: slab-out-of-bounds Write in
 virtio_gpu_object_create
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>,
 syzbot <syzbot+d3a7951ed361037407db@syzkaller.appspotmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>
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
From: Dmitry Vyukov via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Apr 6, 2020 at 3:16 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > > +drivers/gpu/drm/virtio/virtgpu_object.c maintainers
> > > > Now we have both mainline and linux-next boot broken (linux-next is
> > > > broken for the past 40 days).
> > > > No testing of new code happens.
> > > >
> > > > >  virtio_gpu_object_shmem_init drivers/gpu/drm/virtio/virtgpu_object.c:151 [inline]
> > > > >  virtio_gpu_object_create+0x9f3/0xaa0 drivers/gpu/drm/virtio/virtgpu_object.c:230
> > >
> > > Ah, that one.
> > >
> > > broken patch: f651c8b05542 ("drm/virtio: factor out the sg_table from virtio_gpu_object")
> > > fixed by: 0666a8d7f6a4 ("drm/virtio: fix OOB in virtio_gpu_object_create")
> > >
> > > Both are in drm-misc-next.  I suspect the fix was added after
> > > drm-misc-next was closed for the 5.7 merge window and thus should
> > > have been submitted to drm-misc-next-fixes instead.
> > >
> > > So, what to do now?  Should I cherry-pick 0666a8d7f6a4 into
> > > drm-misc-next-fixes?  Or should it go into drm-misc-fixes instead?
> >
> > Yup cherry-pick it over, with -x, to drm-misc-next-fixes.
> > -Daniel
>
> Done.  So the next linux-next build should be green again.

Linux-next is boot broken with 2 or 3 other bugs for a month. This
won't fix linux-next.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
