Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id F352E5233B7
	for <lists.virtualization@lfdr.de>; Wed, 11 May 2022 15:09:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E28983E22;
	Wed, 11 May 2022 13:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bjwc0C9_rCF0; Wed, 11 May 2022 13:09:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0AE3583E00;
	Wed, 11 May 2022 13:09:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5CF85C0081;
	Wed, 11 May 2022 13:09:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22E00C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 105FB40180
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ffwll.ch
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L6IIScwAb9lr
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:09:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA21940150
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 13:09:44 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id kq17so3969655ejb.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 11 May 2022 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=JAobyhQX8H28MWg1GXlj8hoyzU7OkAnh8WBV4s4iSFA=;
 b=O0tqaeHW1b34CdyLh6rhmuS8HHLjDsWSGIXiwQNqVGt1ohbeSFo6zK0TNyMZaGEpF8
 /1h5/CYnXf+rbXS8dfpx3ZBhlABsIek+tgMaijJ7ylZwJOeumQPS5k0hAvwJjQG9JEAT
 1cmWL9qgE/5A1kVb4rrQV/mYuqEG8xxD088nU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=JAobyhQX8H28MWg1GXlj8hoyzU7OkAnh8WBV4s4iSFA=;
 b=N6NJZCUArkcfC6u+xFSAfgChg5sBnVZs6Zv/cgdjxmRLg0kId9kOLVEbHch/BBNC3P
 qy3PrhOw+ZhLFjk+cFrFbjW73nZeAHf2gu5DF+icqxIapupiGY1dLXV7Tl+7emmaOWvO
 HKBmDG5tBscpYbuk/rMpOD+I4DzufZCDC2xHyKQVauGgYfATVQOoBoQKF996VP3KuCyy
 e0si5guWLSaKekrytyPPedo9sXEQfx1hMfEFeCiaY1NamHqks8EZPQAcKPuchsEutak8
 lYgOYtTmpoERs3/bEoiap0VG111BoO+JBLDB91H6FNHTL2bnmf7Gx2gjN9V2P8KSiGxG
 7hog==
X-Gm-Message-State: AOAM531oDKkbEEOeIfOQalnztIp5FCb7U9JF/2Gzw9FtJ+4WOte0gHlV
 EPNGhPAzeNUOV8r1BsFEy8qlXQ==
X-Google-Smtp-Source: ABdhPJxQyu3mGcdaLrUBTixmsVRWayFME/f8TFtVOcPnDDroBUBuDYz0i+eVHsIFOn98nhRIyA8C7w==
X-Received: by 2002:a17:906:3104:b0:6ce:6b85:ecc9 with SMTP id
 4-20020a170906310400b006ce6b85ecc9mr23720564ejx.339.1652274582909; 
 Wed, 11 May 2022 06:09:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 hh3-20020a170906a94300b006f3ef214e32sm958477ejb.152.2022.05.11.06.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 06:09:41 -0700 (PDT)
Date: Wed, 11 May 2022 15:09:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v4 11/15] drm/shmem-helper: Add generic memory shrinker
Message-ID: <Ynu1k5lH+xvqtObG@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
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
References: <20220417223707.157113-1-dmitry.osipenko@collabora.com>
 <20220417223707.157113-12-dmitry.osipenko@collabora.com>
 <e6108e9c-6e67-2d71-0665-654e11d9c3a5@suse.de>
 <ff97790a-fb64-1e15-74b4-59c807bce0b9@collabora.com>
 <Ynkb1U2nNWYPML88@phenom.ffwll.local>
 <5fdf5232-e2b2-b444-5a41-f1db7e6a04da@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5fdf5232-e2b2-b444-5a41-f1db7e6a04da@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh@kernel.org>,
 Daniel Stone <daniel@fooishbar.org>, Steven Price <steven.price@arm.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
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

On Tue, May 10, 2022 at 04:47:52PM +0300, Dmitry Osipenko wrote:
> On 5/9/22 16:49, Daniel Vetter wrote:
> > On Fri, May 06, 2022 at 03:10:43AM +0300, Dmitry Osipenko wrote:
> >> On 5/5/22 11:34, Thomas Zimmermann wrote:
> >>> Hi
> >>>
> >>> Am 18.04.22 um 00:37 schrieb Dmitry Osipenko:
> >>>> Introduce a common DRM SHMEM shrinker. It allows to reduce code
> >>>> duplication among DRM drivers that implement theirs own shrinkers.
> >>>> This is initial version of the shrinker that covers basic needs of
> >>>> GPU drivers, both purging and eviction of shmem objects are supporte=
d.
> >>>>
> >>>> This patch is based on a couple ideas borrowed from Rob's Clark MSM
> >>>> shrinker and Thomas' Zimmermann variant of SHMEM shrinker.
> >>>>
> >>>> In order to start using DRM SHMEM shrinker drivers should:
> >>>>
> >>>> 1. Implement new purge(), evict() + swap_in() GEM callbacks.
> >>>> 2. Register shrinker using drm_gem_shmem_shrinker_register(drm_devic=
e).
> >>>> 3. Use drm_gem_shmem_set_purgeable_and_evictable(shmem) and alike API
> >>>> =A0=A0=A0 functions to activate shrinking of GEMs.
> >>>
> >>> Honestly speaking, after reading the patch and the discussion here I
> >>> really don't like where all tis is going. The interfaces and
> >>> implementation are overengineered.=A0 Descisions about evicting and
> >>> purging should be done by the memory manager. For the most part, it's
> >>> none of the driver's business.
> >>
> >> Daniel mostly suggesting to make interface more flexible for future
> >> drivers, so we won't need to re-do it later on. My version of the
> >> interface is based on what drivers need today.
> >>
> >> Why do you think it's a problem to turn shmem helper into the simple
> >> generic memory manager? I don't see how it's better to have drivers
> >> duplicating the exactly same efforts and making different mistakes.
> >>
> >> The shmem shrinker implementation is mostly based on the freedreno's
> >> shrinker and it's very easy to enable generic shrinker for VirtIO and
> >> Panfrost drivers. I think in the future freedreno and other drivers
> >> could switch to use drm shmem instead of open coding the memory manage=
ment.
> > =

> > Yeah I think we have enough shrinkers all over drm to actually design
> > something solid here.
> > =

> > There's also the i915 shrinker and some kinda shrinker in ttm too. So we
> > are definitely past the "have 3 examples to make sure you design someth=
ing
> > solid" rule of thumb.
> > =

> > I also have a bit an idea that we could try to glue the shmem shrinker
> > into ttm, at least at a very high level that's something that would make
> > some sense.
> =

> Before gluing the shmem shrinker into ttm, the drivers should be
> switched to ttm? Or do you mean something else by the gluing?

No, drivers which don't need ttm shouldn't be forced to use it.

> Perhaps it should be possible to have a common drm-shrinker helper that
> will do the basic-common things like tracking the eviction size and
> check whether BO is exported or locked, but we shouldn't consider doing
> this for now. For the starter more reasonable should be to create a
> common shrinker base for drivers that use drm-shmem, IMO.

Yeah that might be the more practical approach. But really this was just
an aside, absolutely no need to worry about this for now. I just wanted to
point out that there really is a lot of use for this.

> >>> I'd like to ask you to reduce the scope of the patchset and build the
> >>> shrinker only for virtio-gpu. I know that I first suggested to build
> >>> upon shmem helpers, but it seems that it's easier to do that in a lat=
er
> >>> patchset.
> >>
> >> The first version of the VirtIO shrinker didn't support memory evictio=
n.
> >> Memory eviction support requires page fault handler to be aware of the
> >> evicted pages, what should we do about it? The page fault handling is a
> >> part of memory management, hence to me drm-shmem is already kinda a MM.
> > =

> > Hm I still don't get that part, why does that also not go through the
> > shmem helpers?
> =

> The drm_gem_shmem_vm_ops includes the page faults handling, it's a
> helper by itself that is used by DRM drivers.
> =

> I could try to move all the shrinker logic to the VirtIO and re-invent
> virtio_gem_shmem_vm_ops, but what is the point of doing this for each
> driver if we could have it once and for all in the common drm-shmem code?
> =

> Maybe I should try to factor out all the shrinker logic from drm-shmem
> into a new drm-shmem-shrinker that could be shared by drivers? Will you
> be okay with this option?

I think we're talking past each another a bit. I'm only bringing up the
purge vs eviction topic we discussed in the other subthread again.

> > I'm still confused why drivers need to know the difference
> > between evition and purging. Or maybe I'm confused again.
> =

> Example:
> =

> If userspace uses IOV addresses, then these addresses must be kept
> reserved while buffer is evicted.
> =

> If BO is purged, then we don't need to retain the IOV space allocated
> for the purged BO.

Yeah but is that actually needed by anyone? If userspace fails to allocate
another bo because of lack of gpu address space then it's very easy to
handle that:

1. Make a rule that "out of gpu address space" gives you a special errno
code like ENOSPC

2. If userspace gets that it walks the list of all buffers it marked as
purgeable and nukes them (whether they have been evicted or not). Then it
retries the bo allocation.

Alternatively you can do step 2 also directly from the bo alloc ioctl in
step 1. Either way you clean up va space, and actually a lot more (you
potentially nuke all buffers marked as purgeable, not just the ones that
have been purged already) and only when va cleanup is actually needed

Trying to solve this problem at eviction time otoh means:
- we have this difference between eviction and purging
- it's still not complete, you still need to glue step 2 above into your
  driver somehow, and once step 2 above is glued in doing additional
  cleanup in the purge function is just duplicated logic

So at least in my opinion this isn't the justification we need. And we
should definitely not just add that complication "in case, for the
future", if we don't have a real need right now. Adding it later on is
easy, removing it later on because it just gets in the way and confuses is
much harder.

> The drm-shmem only handles shmem pages, not the mappings of these pages.

Yeah that's why you need an evict callback into the driver. That part is
clear.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
