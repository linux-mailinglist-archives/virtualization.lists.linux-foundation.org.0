Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF02523396
	for <lists.virtualization@lfdr.de>; Wed, 11 May 2022 15:01:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0F0C83DFA;
	Wed, 11 May 2022 13:01:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzO2vlHUjciw; Wed, 11 May 2022 13:01:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 9D99383276;
	Wed, 11 May 2022 13:01:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02890C002D;
	Wed, 11 May 2022 13:01:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E651C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E2714031D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:01:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5bxzlTnHXUN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:01:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 20C4940150
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:01:01 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id bv19so3894705ejb.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 06:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=8H0o24KOPQorK5IuPCvtUAMCss3nDd12IGHbq327CjI=;
 b=QCgiXKrmjLjOwu5RIXWerhjrFe0TxbJELrTheINhK1/ZySoO6xGJNrs+YvBmmDEHLS
 m1P1laJ7/b5/OuV2hPq8G/8kXd8yNygrSap0X0lcZAJGPePoJDAM0mxTkwLWOKEcEcAS
 G0I8AHos8HIhKn3OKVzvjsO6TJshkap+4Xpy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=8H0o24KOPQorK5IuPCvtUAMCss3nDd12IGHbq327CjI=;
 b=eFwxha5xbNtYT9KYpmoiAxrLBWTYYLpZKVKjlRkNbh0ZRjaeveaCgX2kLdb8NLSLyz
 3LAlb0cWW71oaHi6hLV/aAENLeBNGd42pGHgYpjRPWR3l03M7XnuULIyG9jdncMMLC5I
 w9vwPWx2bZtDNcgkfiHxnJlF+ur9cZ538PoJPgVwAZdqovjtKV0/LDLXhxx7Tptn3hpx
 SU09CCLqc+Uo4oni+gjizCkESgcUxkHwBq75aBHbJrLR8il5ADkSxz1CFDtAYftJkyOG
 hpT7idys3qPf8REk5YArr5VikTI3BCq29WhT7I4u3SptIqoxiBAGkEJ8KFEnzduKtjLy
 /goA==
X-Gm-Message-State: AOAM533n/6O3HTwjtLA7qV/M1yJDH/f4e0prQXT69px1MZKNRd0t6bdf
 KMK6U0/eymiOmdC2K/01H88Njw==
X-Google-Smtp-Source: ABdhPJxyOpCfVHeSngNM9HPrB3DRbfpHeuzK7N4EjLCSkbhminjBZqUrAZg9c6E5I/yQRq8gdrSzvg==
X-Received: by 2002:a17:907:9482:b0:6f5:171d:f7f5 with SMTP id
 dm2-20020a170907948200b006f5171df7f5mr24771106ejc.68.1652274059411; 
 Wed, 11 May 2022 06:00:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a50c8cd000000b0042617ba6389sm1217537edh.19.2022.05.11.06.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:00:58 -0700 (PDT)
Date: Wed, 11 May 2022 15:00:56 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Message-ID: <YnuziJDmXVR09UzP@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
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
References: <248083d2-b8f2-a4d7-099d-70a7e7859c11@suse.de>
 <d9e7bec1-fffb-e0c4-8659-ef3ce2c31280@collabora.com>
 <YmlYHNlcmNMfOeyy@phenom.ffwll.local>
 <8f932ab0-bb72-8fea-4078-dc59e9164bd4@collabora.com>
 <YnI3lE0TxLfZaQjE@phenom.ffwll.local>
 <01506516-ab2f-cb6e-7507-f2a3295efb59@collabora.com>
 <YnOHAh9I1ds4+1J+@phenom.ffwll.local>
 <83e68918-68de-c0c6-6f9b-e94d34b19383@collabora.com>
 <YnkaUk0mZNuPsZ5r@phenom.ffwll.local>
 <4d08b382-0076-1ea2-b565-893d50b453cb@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d08b382-0076-1ea2-b565-893d50b453cb@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh@kernel.org>,
 Daniel Stone <daniel@fooishbar.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
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

On Tue, May 10, 2022 at 04:39:53PM +0300, Dmitry Osipenko wrote:
> On 5/9/22 16:42, Daniel Vetter wrote:
> > On Fri, May 06, 2022 at 01:49:12AM +0300, Dmitry Osipenko wrote:
> >> On 5/5/22 11:12, Daniel Vetter wrote:
> >>> On Wed, May 04, 2022 at 06:56:09PM +0300, Dmitry Osipenko wrote:
> >>>> On 5/4/22 11:21, Daniel Vetter wrote:
> >>>> ...
> >>>>>>> - Maybe also do what you suggest and keep a separate lock for thi=
s, but
> >>>>>>>   the fundamental issue is that this doesn't really work - if you=
 share
> >>>>>>>   buffers both ways with two drivers using shmem helpers, then the
> >>>>>>>   ordering of this vmap_count_mutex vs dma_resv_lock is inconsist=
ent and
> >>>>>>>   you can get some nice deadlocks. So not a great approach (and a=
lso the
> >>>>>>>   reason why we really need to get everyone to move towards dma_r=
esv_lock
> >>>>>>>   as _the_ buffer object lock, since otherwise we'll never get a
> >>>>>>>   consistent lock nesting hierarchy).
> >>>>>>
> >>>>>> The separate locks should work okay because it will be always the
> >>>>>> exporter that takes the dma_resv_lock. But I agree that it's less =
ideal
> >>>>>> than defining the new rules for dma-bufs since sometime you will t=
ake
> >>>>>> the resv lock and sometime not, potentially hiding bugs related to=
 lockings.
> >>>>>
> >>>>> That's the issue, some importers need to take the dma_resv_lock for
> >>>>> dma_buf_vmap too (e.g. to first nail the buffer in place when it's a
> >>>>> dynamic memory manager). In practice it'll work as well as what we =
have
> >>>>> currently, which is similarly inconsistent, except with per-driver =
locks
> >>>>> instead of shared locks from shmem helpers or dma-buf, so less obvi=
ous
> >>>>> that things are inconsistent.
> >>>>>
> >>>>> So yeah if it's too messy maybe the approach is to have a separate =
lock
> >>>>> for vmap for now, land things, and then fix up dma_buf_vmap in a fo=
llow up
> >>>>> series.
> >>>>
> >>>> The amdgpu driver was the fist who introduced the concept of movable
> >>>> memory for dma-bufs. Now we want to support it for DRM SHMEM too. For
> >>>> both amdgpu ttm and shmem drivers we will want to hold the reservati=
on
> >>>> lock when we're touching moveable buffers. The current way of denoti=
ng
> >>>> that dma-buf is movable is to implement the pin/unpin callbacks of t=
he
> >>>> dma-buf ops, should be doable for shmem.
> >>>
> >>> Hm that sounds like a bridge too far? I don't think we want to start
> >>> adding moveable dma-bufs for shmem, thus far at least no one asked for
> >>> that. Goal here is just to streamline the locking a bit and align acr=
oss
> >>> all the different ways of doing buffers in drm.
> >>>
> >>> Or do you mean something else and I'm just completely lost?
> >>
> >> I'm talking about aligning DRM locks with the dma-buf locks. The probl=
em
> >> is that the convention of dma-bufs isn't specified yet. In particular
> >> there is no convention for the mapping operations.
> >>
> >> If we want to switch vmapping of shmem to use reservation lock, then
> >> somebody will have to hold this lock for dma_buf_vmap() and the locking
> >> convention needs to be specified firmly.
> > =

> > Ah yes that makes sense.
> > =

> >> In case of dynamic buffers, we will also need to specify whether
> >> dma_buf_vmap() should imply the implicit pinning by exporter or the
> >> buffer must be pinned explicitly by importer before dma_buf_vmap() is
> >> invoked.
> >>
> >> Perhaps I indeed shouldn't care about this for this patchset. The
> >> complete locking model of dma-bufs must be specified first.
> > =

> > Hm I thought vmap is meant to pin itself, and not rely on any other
> > pinning done already. And from a quick look through the long call chain
> > for amd (which is currently the only driver supporting dynamic dma-buf)
> > that seems to be the case.
> =

> The vmapping behaviour is implementation-defined until it's documented
> explicitly, IMO.
> =

> > But yeah the locking isn't specificied yet, and that makes it a bit a m=
ess
> > :-(
> > =

> >>>> A day ago I found that mapping of imported dma-bufs is broken at lea=
st
> >>>> for the Tegra DRM driver (and likely for others too) because driver
> >>>> doesn't assume that anyone will try to mmap imported buffer and just
> >>>> doesn't handle this case at all, so we're getting a hard lockup on
> >>>> touching mapped memory because we're mapping something else than the
> >>>> dma-buf.
> >>>
> >>> Huh that sounds bad, how does this happen? Pretty much all pieces of
> >>> dma-buf (cpu vmap, userspace mmap, heck even dma_buf_attach) are opti=
onal
> >>> or at least can fail for various reasons. So exporters not providing =
mmap
> >>> support is fine, but importers then dying is not.
> >>
> >> Those drivers that die don't have userspace that uses dma-bufs
> >> extensively. I noticed it only because was looking at this code too mu=
ch
> >> for the last days.
> >>
> >> Drivers that don't die either map imported BOs properly or don't allow
> >> mapping at all.
> > =

> > Ah yeah driver bugs as explanation makes sense :-/
> > =

> >>>> My plan is to move the dma-buf management code to the level of DRM c=
ore
> >>>> and make it aware of the reservation locks for the dynamic dma-bufs.
> >>>> This way we will get the proper locking for dma-bufs and fix mapping=
 of
> >>>> imported dma-bufs for Tegra and other drivers.
> >>>
> >>> So maybe we're completely talking past each another, or coffee is not
> >>> working here on my end, but I've no idea what you mean.
> >>>
> >>> We do have some helpers for taking care of the dma_resv_lock dance, a=
nd
> >>> Christian K=F6nig has an rfc patch set to maybe unify this further. B=
ut that
> >>> should be fairly orthogonal to reworking shmem (it might help a bit w=
ith
> >>> reworking shmem though).
> >>
> >> The reservation lock itself doesn't help much shmem, IMO. It should he=
lp
> >> only in the context of dynamic dma-bufs and today we don't have a need
> >> in the dynamic shmem dma-bufs.
> >>
> >> You were talking about making DRM locks consistent with dma-buf locks,
> >> so I thought that yours main point of making use of reservation locks
> >> for shmem is to prepare to the new locking scheme.
> >>
> >> I wanted to try to specify the dma-buf locking convention for mapping
> >> operations because it's missing right now and it should affect how DRM
> >> should take the reservation locks, but this is not easy to do as I see=
 now.
> >>
> >> Could you please point at the Christian's RFC patch? He posted too many
> >> patches, can't find it :) I'm curious to take a look.
> > =

> > https://lore.kernel.org/dri-devel/20220504074739.2231-1-christian.koeni=
g@amd.com/
> > =

> > Wrt this patch series here I'm wondering whether we could do an interim
> > solution that side-steps the dma_buf_vmap mess.
> > =

> > - in shmem helpers pin any vmapped buffer (it's how dma-buf works too),
> >   and that pinning would be done under dma_resv_lock (like with other
> >   drivers using dma_resv_lock for bo protection)
> > =

> > - switch over everything else except vmap code to dma_resv_lock, but le=
ave
> >   vmap locking as-is
> > =

> > - shrinker then only needs to trylock dma_resv_trylock in the shrinker,
> >   which can check for pinned buffer and that's good enough to exclude
> >   vmap'ed buffer. And it avoids mixing the vmap locking into the new
> >   shrinker code and driver interfaces.
> > =

> > This still leaves the vmap locking mess as-is, but I think that's a mess
> > that's orthogonal to shrinker work.
> > =

> > Thoughts?
> =

> Since vmapping implies implicit pinning, we can't use a separate lock in
> drm_gem_shmem_vmap() because we need to protect the
> drm_gem_shmem_get_pages(), which is invoked by drm_gem_shmem_vmap() to
> pin the pages and requires the dma_resv_lock to be locked.
> =

> Hence the problem is:
> =

> 1. If dma-buf importer holds the dma_resv_lock and invokes
> dma_buf_vmap() -> drm_gem_shmem_vmap(), then drm_gem_shmem_vmap() shall
> not take the dma_resv_lock.
> =

> 2. Since dma-buf locking convention isn't specified, we can't assume
> that dma-buf importer holds the dma_resv_lock around dma_buf_vmap().
> =

> The possible solutions are:
> =

> 1. Specify the dma_resv_lock convention for dma-bufs and make all
> drivers to follow it.
> =

> 2. Make only DRM drivers to hold dma_resv_lock around dma_buf_vmap().
> Other non-DRM drivers will get the lockdep warning.
> =

> 3. Make drm_gem_shmem_vmap() to take the dma_resv_lock and get deadlock
> if dma-buf importer holds the lock.
> =

> ...

Yeah this is all very annoying.

> There are actually very few drivers in kernel that use dma_buf_vmap()
> [1], so perhaps it's not really a big deal to first try to define the
> locking and pinning convention for the dma-bufs? At least for
> dma_buf_vmap()? Let me try to do this.
> =

> [1] https://elixir.bootlin.com/linux/v5.18-rc6/C/ident/dma_buf_vmap

Yeah looking through the code there's largely two classes of drivers that
need vmap:

- display drivers that need to do cpu upload (usb, spi, i2c displays).
  Those generally set up the vmap at import time or when creating the
  drm_framebuffer object (e.g. see
  drm_gem_cma_prime_import_sg_table_vmap()), because that's really the
  only place where you can safely do that without running into locking
  inversion issues sooner or later

- lots of other drivers (and shmem helpers) seem to do dma_buf_vmap just
  because they can, but only actually ever use vmap on native objects,
  never on imported objects. Or at least I think so.

So maybe another approach here:

1. In general drivers which need a vmap need to set that up at dma_buf
import time - the same way we pin the buffers at import time for
non-dynamic importers because that's the only place where across all
drivers it's ok to just take dma_resv_lock.

2. We remove the "just because we can" dma_buf_vmap support from
helpers/drivers - the paths all already can cope with NULL since
dma_buf_vmap can fail. vmap will only work on native objects, not imported
ones.

3. If there is any driver using shmem helpers that absolutely needs vmap
to also work on imported it needs a special import function (like cma
helpers) which sets up the vmap at import time.

So since this is all very tricky ... what did I miss this time around?

> I envision that the extra dma_resv_locks for dma-bufs potentially may
> create unnecessary bottlenecks for some drivers if locking isn't really
> necessary by a specific driver, so drivers will need to keep this in
> mind. On the other hand, I don't think that any of the today's drivers
> will notice the additional resv locks in practice.

Nah I don't think the extra locking will ever create a bottleneck,
especially not for vmap. Generally vmap is a fallback or at least cpu
operation, so at that point you're already going very slow.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
