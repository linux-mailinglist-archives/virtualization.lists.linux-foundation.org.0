Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCE85236B2
	for <lists.virtualization@lfdr.de>; Wed, 11 May 2022 17:08:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 586E583E64;
	Wed, 11 May 2022 15:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UsygMwQq34T0; Wed, 11 May 2022 15:08:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BD30C83E0C;
	Wed, 11 May 2022 15:08:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FD11C0081;
	Wed, 11 May 2022 15:08:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 69E3BC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 15:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4190A40B7D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 15:08:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nG98p6TEeM9B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 15:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E806040B8F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 15:08:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id i27so4654514ejd.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 08:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=+htlxhryt5zwPXYdzhQ7V8KfiLkG4zNwl/s3l6UhuRU=;
 b=LGL3My4x17GvV1KlSY5iXqhDIbJTcIIFeCQmRuTaXTmcLxd0Tcb6e2bQoBM9MJWFvj
 uisVIZpBB8LZrghAFKlDYKZ55c0sU6R9m7bVuDIIOnorc77SoXV/RLFt0g/WY9j3tpUn
 Yk2OymXFAH9PvdVjC5mpLtX8AnABcEu07Io8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=+htlxhryt5zwPXYdzhQ7V8KfiLkG4zNwl/s3l6UhuRU=;
 b=1ym8QsROd0Cf4VxMrol7ZBbNOoo3k7OmuLITeUpl8gGdbfbOsrSvAiu8l2K03bFGMw
 MzmjnsXxVSgnwLTYOdm/9x5k+gSb1ZjgQ5nRN9YhKawtrftNbAaHBBNxVOppnW9OKHQg
 bJtBnU3ltks2S5IN8s0hE64h/jwi/7LKqXdD4N5DjTzrmmG5gm6F6lxPiIm7HHYmzmP7
 YABgG34Jx/QNLy2HulOTMnyyBV8Kv+PNaovY0ljbfRaOlpempjvdIaZUx54VR3ohqzFN
 utkf7siRg6QfhI+HzaYx/fg6KXqr9kn4BonM6MJsMpQBr6D7OtA8lnmUGm8/VWcqDy00
 HzXQ==
X-Gm-Message-State: AOAM533ggHjxIBucHNsSMrvay/r1MO9AHl1WkRbiR7P68FU2gjtbhW0q
 9MhM51AjEBX0xCign2GC7GflMw==
X-Google-Smtp-Source: ABdhPJy09dNf7K0wLNKFEAZ+1JjzzQdDpA0Abjzd5Bxo6hTpOLopY0uPQj69ilRYaiikGgteilAeKw==
X-Received: by 2002:a17:907:7b85:b0:6fd:d799:ef4e with SMTP id
 ne5-20020a1709077b8500b006fdd799ef4emr2539950ejc.319.1652281680003; 
 Wed, 11 May 2022 08:08:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q21-20020aa7d455000000b0042617ba63d3sm1287693edr.93.2022.05.11.08.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 08:07:59 -0700 (PDT)
Date: Wed, 11 May 2022 17:07:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Message-ID: <YnvRTaMoO24y8xE5@phenom.ffwll.local>
Mail-Followup-To: Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Stone <daniel@fooishbar.org>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <YmlYHNlcmNMfOeyy@phenom.ffwll.local>
 <8f932ab0-bb72-8fea-4078-dc59e9164bd4@collabora.com>
 <YnI3lE0TxLfZaQjE@phenom.ffwll.local>
 <01506516-ab2f-cb6e-7507-f2a3295efb59@collabora.com>
 <YnOHAh9I1ds4+1J+@phenom.ffwll.local>
 <83e68918-68de-c0c6-6f9b-e94d34b19383@collabora.com>
 <YnkaUk0mZNuPsZ5r@phenom.ffwll.local>
 <4d08b382-0076-1ea2-b565-893d50b453cb@collabora.com>
 <YnuziJDmXVR09UzP@phenom.ffwll.local>
 <56787b70-fb64-64da-6006-d3aa3ed59d12@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56787b70-fb64-64da-6006-d3aa3ed59d12@gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh@kernel.org>,
 Daniel Stone <daniel@fooishbar.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, virtualization@lists.linux-foundation.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Robin Murphy <robin.murphy@arm.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Wed, May 11, 2022 at 04:24:28PM +0200, Christian K=F6nig wrote:
> Am 11.05.22 um 15:00 schrieb Daniel Vetter:
> > On Tue, May 10, 2022 at 04:39:53PM +0300, Dmitry Osipenko wrote:
> > > [SNIP]
> > > Since vmapping implies implicit pinning, we can't use a separate lock=
 in
> > > drm_gem_shmem_vmap() because we need to protect the
> > > drm_gem_shmem_get_pages(), which is invoked by drm_gem_shmem_vmap() to
> > > pin the pages and requires the dma_resv_lock to be locked.
> > > =

> > > Hence the problem is:
> > > =

> > > 1. If dma-buf importer holds the dma_resv_lock and invokes
> > > dma_buf_vmap() -> drm_gem_shmem_vmap(), then drm_gem_shmem_vmap() sha=
ll
> > > not take the dma_resv_lock.
> > > =

> > > 2. Since dma-buf locking convention isn't specified, we can't assume
> > > that dma-buf importer holds the dma_resv_lock around dma_buf_vmap().
> > > =

> > > The possible solutions are:
> > > =

> > > 1. Specify the dma_resv_lock convention for dma-bufs and make all
> > > drivers to follow it.
> > > =

> > > 2. Make only DRM drivers to hold dma_resv_lock around dma_buf_vmap().
> > > Other non-DRM drivers will get the lockdep warning.
> > > =

> > > 3. Make drm_gem_shmem_vmap() to take the dma_resv_lock and get deadlo=
ck
> > > if dma-buf importer holds the lock.
> > > =

> > > ...
> > Yeah this is all very annoying.
> =

> Ah, yes that topic again :)
> =

> I think we could relatively easily fix that by just defining and enforcing
> that the dma_resv_lock must have be taken by the caller when dma_buf_vmap=
()
> is called.
> =

> A two step approach should work:
> 1. Move the call to dma_resv_lock() into the dma_buf_vmap() function and
> remove all lock taking from the vmap callback implementations.
> 2. Move the call to dma_resv_lock() into the callers of dma_buf_vmap() and
> enforce that the function is called with the lock held.
> =

> It shouldn't be that hard to clean up. The last time I looked into it my
> main problem was that we didn't had any easy unit test for it.

Yeah I think it's doable or at least a lot less work than the map/unmap
side, which really was unfixable without just pinning at import time to
avoid the locking fun. But vmap is used a lot less, and mostly by display
drivers (where locking is a lot easier against dma_resv_lock), so it might
be possible to pull off.
-Daniel

> =

> Regards,
> Christian.
> =

> > =

> > > There are actually very few drivers in kernel that use dma_buf_vmap()
> > > [1], so perhaps it's not really a big deal to first try to define the
> > > locking and pinning convention for the dma-bufs? At least for
> > > dma_buf_vmap()? Let me try to do this.
> > > =

> > > [1] https://elixir.bootlin.com/linux/v5.18-rc6/C/ident/dma_buf_vmap
> > Yeah looking through the code there's largely two classes of drivers th=
at
> > need vmap:
> > =

> > - display drivers that need to do cpu upload (usb, spi, i2c displays).
> >    Those generally set up the vmap at import time or when creating the
> >    drm_framebuffer object (e.g. see
> >    drm_gem_cma_prime_import_sg_table_vmap()), because that's really the
> >    only place where you can safely do that without running into locking
> >    inversion issues sooner or later
> > =

> > - lots of other drivers (and shmem helpers) seem to do dma_buf_vmap just
> >    because they can, but only actually ever use vmap on native objects,
> >    never on imported objects. Or at least I think so.
> > =

> > So maybe another approach here:
> > =

> > 1. In general drivers which need a vmap need to set that up at dma_buf
> > import time - the same way we pin the buffers at import time for
> > non-dynamic importers because that's the only place where across all
> > drivers it's ok to just take dma_resv_lock.
> > =

> > 2. We remove the "just because we can" dma_buf_vmap support from
> > helpers/drivers - the paths all already can cope with NULL since
> > dma_buf_vmap can fail. vmap will only work on native objects, not impor=
ted
> > ones.
> > =

> > 3. If there is any driver using shmem helpers that absolutely needs vmap
> > to also work on imported it needs a special import function (like cma
> > helpers) which sets up the vmap at import time.
> > =

> > So since this is all very tricky ... what did I miss this time around?
> > =

> > > I envision that the extra dma_resv_locks for dma-bufs potentially may
> > > create unnecessary bottlenecks for some drivers if locking isn't real=
ly
> > > necessary by a specific driver, so drivers will need to keep this in
> > > mind. On the other hand, I don't think that any of the today's drivers
> > > will notice the additional resv locks in practice.
> > Nah I don't think the extra locking will ever create a bottleneck,
> > especially not for vmap. Generally vmap is a fallback or at least cpu
> > operation, so at that point you're already going very slow.
> > -Daniel
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
