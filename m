Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD70A281037
	for <lists.virtualization@lfdr.de>; Fri,  2 Oct 2020 11:58:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6AFC287370;
	Fri,  2 Oct 2020 09:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qeMu0ihpTfZ1; Fri,  2 Oct 2020 09:58:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6B52D8735C;
	Fri,  2 Oct 2020 09:58:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47ECBC0051;
	Fri,  2 Oct 2020 09:58:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E736C0051
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 09:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 142B620346
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 09:58:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxYgBNm09nVr
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 09:58:37 +0000 (UTC)
X-Greylist: delayed 00:10:30 by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 87B29203A7
 for <virtualization@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 09:58:36 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c18so1104597wrm.9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 02 Oct 2020 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=mEkpAjpBBFBC2OSbPf1rcPxheU+j8eHJKLr+XyTj9VA=;
 b=Kv9fFmwsLnH3rxc4YORHIlCmE7gMf2ANx+U1VpZfjN8Kq3n/95x+iLFFYY69i5o/VM
 aXKz1OGxaPgu4YEY2NOXjk9cQA0FvF45c+2KvuEJGmF6wRE5OG+7rgoxKuBnH3Yb2xng
 VP9WbgOJz1wPpF8BMrgVCxTdasm5/jVPq77KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mEkpAjpBBFBC2OSbPf1rcPxheU+j8eHJKLr+XyTj9VA=;
 b=KqHjuLc9TkVKYwtj370DV/ZbJlQYwr1UykQe1cVemzZZoUBeY96sCzY6exD9d9gVBH
 6wDcMsvzHw4blm1XzQ/6lmUcbY8CH215HNp9L1bRZzseoS7UlcKs37foI9M27NWu6UWF
 fqqBbtprTAdGj+4TEkL85zYblBFo7WRiJp01WMvfs2c71xr8gARfUbxsLiB4ZAcCn0gu
 3ydflUELbNPB+z1ssfdykPFWFyYa7IihhvVxYIUxAO4EXuqMl43BY1bQjmQaGvzcxZto
 0TpFcsNn9Z9IHumiw7RTIts2c9a5UsSi7pxZU2ZaDn6YHe5UCndAfGLE+XhsXDyr6Nu1
 7aGg==
X-Gm-Message-State: AOAM531zXmYIhRHroFtC3cLmU8eBnjs9dC0bFRdhcaTLrPgfSa5oS+dw
 aSNSVndvB/uBGluH/0V0WWQVrA==
X-Google-Smtp-Source: ABdhPJyaxWM6azv8IiEEW0NJpIjAdBSSpixIyMrO0zJEmyGJ5I3RnUPpVbxcJ/Exwy9Zm9yRUkU4Bg==
X-Received: by 2002:a5d:5751:: with SMTP id q17mr2092527wrw.409.1601632714647; 
 Fri, 02 Oct 2020 02:58:34 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q18sm1109551wre.78.2020.10.02.02.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 02:58:33 -0700 (PDT)
Date: Fri, 2 Oct 2020 11:58:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3 2/7] drm/ttm: Add ttm_kmap_obj_to_dma_buf_map() for
 type conversion
Message-ID: <20201002095830.GH438822@phenom.ffwll.local>
References: <20200929151437.19717-1-tzimmermann@suse.de>
 <20200929151437.19717-3-tzimmermann@suse.de>
 <8fad0114-064a-4ed5-c21d-d1b4294de0a1@amd.com>
 <2614314a-81f7-4722-c400-68d90e48e09a@suse.de>
 <8a84f62b-33f3-f44c-52af-c859a0e0d1fb@gmail.com>
 <07972ada-9135-3743-a86b-487f610c509f@suse.de>
 <b569b7e3-68f0-edcc-c8f4-170e9042d348@gmail.com>
 <20200930094712.GW438822@phenom.ffwll.local>
 <8479d0aa-3826-4f37-0109-55daca515793@amd.com>
 <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uH0U36NG8w98i0x6HVGeogiwnYDRiKquLW-8znLa7-0yg@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Dave Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Wilson,
 Chris" <chris@chris-wilson.co.uk>, Melissa Wen <melissa.srw@gmail.com>,
 "Anholt, Eric" <eric@anholt.net>, Huang Rui <ray.huang@amd.com>,
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Steven Price <steven.price@arm.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 "open list:DRM DRIVER FOR QXL VIRTUAL GPU" <spice-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Qiang Yu <yuq825@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>
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

On Wed, Sep 30, 2020 at 02:51:46PM +0200, Daniel Vetter wrote:
> On Wed, Sep 30, 2020 at 2:34 PM Christian K=F6nig
> <christian.koenig@amd.com> wrote:
> >
> > Am 30.09.20 um 11:47 schrieb Daniel Vetter:
> > > On Wed, Sep 30, 2020 at 10:34:31AM +0200, Christian K=F6nig wrote:
> > >> Am 30.09.20 um 10:19 schrieb Thomas Zimmermann:
> > >>> Hi
> > >>>
> > >>> Am 30.09.20 um 10:05 schrieb Christian K=F6nig:
> > >>>> Am 29.09.20 um 19:49 schrieb Thomas Zimmermann:
> > >>>>> Hi Christian
> > >>>>>
> > >>>>> Am 29.09.20 um 17:35 schrieb Christian K=F6nig:
> > >>>>>> Am 29.09.20 um 17:14 schrieb Thomas Zimmermann:
> > >>>>>>> The new helper ttm_kmap_obj_to_dma_buf() extracts address and l=
ocation
> > >>>>>>> from and instance of TTM's kmap_obj and initializes struct dma_=
buf_map
> > >>>>>>> with these values. Helpful for TTM-based drivers.
> > >>>>>> We could completely drop that if we use the same structure insid=
e TTM as
> > >>>>>> well.
> > >>>>>>
> > >>>>>> Additional to that which driver is going to use this?
> > >>>>> As Daniel mentioned, it's in patch 3. The TTM-based drivers will
> > >>>>> retrieve the pointer via this function.
> > >>>>>
> > >>>>> I do want to see all that being more tightly integrated into TTM,=
 but
> > >>>>> not in this series. This one is about fixing the bochs-on-sparc64
> > >>>>> problem for good. Patch 7 adds an update to TTM to the DRM TODO l=
ist.
> > >>>> I should have asked which driver you try to fix here :)
> > >>>>
> > >>>> In this case just keep the function inside bochs and only fix it t=
here.
> > >>>>
> > >>>> All other drivers can be fixed when we generally pump this through=
 TTM.
> > >>> Did you take a look at patch 3? This function will be used by VRAM
> > >>> helpers, nouveau, radeon, amdgpu and qxl. If we don't put it here, =
we
> > >>> have to duplicate the functionality in each if these drivers. Bochs
> > >>> itself uses VRAM helpers and doesn't touch the function directly.
> > >> Ah, ok can we have that then only in the VRAM helpers?
> > >>
> > >> Alternative you could go ahead and use dma_buf_map in ttm_bo_kmap_obj
> > >> directly and drop the hack with the TTM_BO_MAP_IOMEM_MASK.
> > >>
> > >> What I want to avoid is to have another conversion function in TTM b=
ecause
> > >> what happens here is that we already convert from ttm_bus_placement =
to
> > >> ttm_bo_kmap_obj and then to dma_buf_map.
> > > Hm I'm not really seeing how that helps with a gradual conversion of
> > > everything over to dma_buf_map and assorted helpers for access? There=
's
> > > too many places in ttm drivers where is_iomem and related stuff is us=
ed to
> > > be able to convert it all in one go. An intermediate state with a bun=
ch of
> > > conversions seems fairly unavoidable to me.
> >
> > Fair enough. I would just have started bottom up and not top down.
> >
> > Anyway feel free to go ahead with this approach as long as we can remove
> > the new function again when we clean that stuff up for good.
> =

> Yeah I guess bottom up would make more sense as a refactoring. But the
> main motivation to land this here is to fix the __mmio vs normal
> memory confusion in the fbdev emulation helpers for sparc (and
> anything else that needs this). Hence the top down approach for
> rolling this out.

Ok I started reviewing this a bit more in-depth, and I think this is a bit
too much of a de-tour.

Looking through all the callers of ttm_bo_kmap almost everyone maps the
entire object. Only vmwgfx uses to map less than that. Also, everyone just
immediately follows up with converting that full object map into a
pointer.

So I think what we really want here is:
- new function

int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map);

  _vmap name since that's consistent with both dma_buf functions and
  what's usually used to implement this. Outside of the ttm world kmap
  usually just means single-page mappings using kmap() or it's iomem
  sibling io_mapping_map* so rather confusing name for a function which
  usually is just used to set up a vmap of the entire buffer.

- a helper which can be used for the drm_gem_object_funcs vmap/vunmap
  functions for all ttm drivers. We should be able to make this fully
  generic because a) we now have dma_buf_map and b) drm_gem_object is
  embedded in the ttm_bo, so we can upcast for everyone who's both a ttm
  and gem driver.

  This is maybe a good follow-up, since it should allow us to ditch quite
  a bit of the vram helper code for this more generic stuff. I also might
  have missed some special-cases here, but from a quick look everything
  just pins the buffer to the current location and that's it.

  Also this obviously requires Christian's generic ttm_bo_pin rework
  first.

- roll the above out to drivers.

Christian/Thomas, thoughts on this?

I think for the immediate need of rolling this out for vram helpers and
fbdev code we should be able to do this, but just postpone the driver wide
roll-out for now.

Cheers, Daniel

> -Daniel
> =

> >
> > Christian.
> >
> > > -Daniel
> > >
> > >> Thanks,
> > >> Christian.
> > >>
> > >>> Best regards
> > >>> Thomas
> > >>>
> > >>>> Regards,
> > >>>> Christian.
> > >>>>
> > >>>>> Best regards
> > >>>>> Thomas
> > >>>>>
> > >>>>>> Regards,
> > >>>>>> Christian.
> > >>>>>>
> > >>>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > >>>>>>> ---
> > >>>>>>>     include/drm/ttm/ttm_bo_api.h | 24 ++++++++++++++++++++++++
> > >>>>>>>     include/linux/dma-buf-map.h  | 20 ++++++++++++++++++++
> > >>>>>>>     2 files changed, 44 insertions(+)
> > >>>>>>>
> > >>>>>>> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm=
_bo_api.h
> > >>>>>>> index c96a25d571c8..62d89f05a801 100644
> > >>>>>>> --- a/include/drm/ttm/ttm_bo_api.h
> > >>>>>>> +++ b/include/drm/ttm/ttm_bo_api.h
> > >>>>>>> @@ -34,6 +34,7 @@
> > >>>>>>>     #include <drm/drm_gem.h>
> > >>>>>>>     #include <drm/drm_hashtab.h>
> > >>>>>>>     #include <drm/drm_vma_manager.h>
> > >>>>>>> +#include <linux/dma-buf-map.h>
> > >>>>>>>     #include <linux/kref.h>
> > >>>>>>>     #include <linux/list.h>
> > >>>>>>>     #include <linux/wait.h>
> > >>>>>>> @@ -486,6 +487,29 @@ static inline void *ttm_kmap_obj_virtual(s=
truct
> > >>>>>>> ttm_bo_kmap_obj *map,
> > >>>>>>>         return map->virtual;
> > >>>>>>>     }
> > >>>>>>>     +/**
> > >>>>>>> + * ttm_kmap_obj_to_dma_buf_map
> > >>>>>>> + *
> > >>>>>>> + * @kmap: A struct ttm_bo_kmap_obj returned from ttm_bo_kmap.
> > >>>>>>> + * @map: Returns the mapping as struct dma_buf_map
> > >>>>>>> + *
> > >>>>>>> + * Converts struct ttm_bo_kmap_obj to struct dma_buf_map. If t=
he memory
> > >>>>>>> + * is not mapped, the returned mapping is initialized to NULL.
> > >>>>>>> + */
> > >>>>>>> +static inline void ttm_kmap_obj_to_dma_buf_map(struct ttm_bo_k=
map_obj
> > >>>>>>> *kmap,
> > >>>>>>> +                           struct dma_buf_map *map)
> > >>>>>>> +{
> > >>>>>>> +    bool is_iomem;
> > >>>>>>> +    void *vaddr =3D ttm_kmap_obj_virtual(kmap, &is_iomem);
> > >>>>>>> +
> > >>>>>>> +    if (!vaddr)
> > >>>>>>> +        dma_buf_map_clear(map);
> > >>>>>>> +    else if (is_iomem)
> > >>>>>>> +        dma_buf_map_set_vaddr_iomem(map, (void __force __iomem=
 *)vaddr);
> > >>>>>>> +    else
> > >>>>>>> +        dma_buf_map_set_vaddr(map, vaddr);
> > >>>>>>> +}
> > >>>>>>> +
> > >>>>>>>     /**
> > >>>>>>>      * ttm_bo_kmap
> > >>>>>>>      *
> > >>>>>>> diff --git a/include/linux/dma-buf-map.h b/include/linux/dma-bu=
f-map.h
> > >>>>>>> index fd1aba545fdf..2e8bbecb5091 100644
> > >>>>>>> --- a/include/linux/dma-buf-map.h
> > >>>>>>> +++ b/include/linux/dma-buf-map.h
> > >>>>>>> @@ -45,6 +45,12 @@
> > >>>>>>>      *
> > >>>>>>>      *    dma_buf_map_set_vaddr(&map. 0xdeadbeaf);
> > >>>>>>>      *
> > >>>>>>> + * To set an address in I/O memory, use dma_buf_map_set_vaddr_=
iomem().
> > >>>>>>> + *
> > >>>>>>> + * .. code-block:: c
> > >>>>>>> + *
> > >>>>>>> + *    dma_buf_map_set_vaddr_iomem(&map. 0xdeadbeaf);
> > >>>>>>> + *
> > >>>>>>>      * Test if a mapping is valid with either dma_buf_map_is_se=
t() or
> > >>>>>>>      * dma_buf_map_is_null().
> > >>>>>>>      *
> > >>>>>>> @@ -118,6 +124,20 @@ static inline void dma_buf_map_set_vaddr(s=
truct
> > >>>>>>> dma_buf_map *map, void *vaddr)
> > >>>>>>>         map->is_iomem =3D false;
> > >>>>>>>     }
> > >>>>>>>     +/**
> > >>>>>>> + * dma_buf_map_set_vaddr_iomem - Sets a dma-buf mapping struct=
ure to
> > >>>>>>> an address in I/O memory
> > >>>>>>> + * @map:        The dma-buf mapping structure
> > >>>>>>> + * @vaddr_iomem:    An I/O-memory address
> > >>>>>>> + *
> > >>>>>>> + * Sets the address and the I/O-memory flag.
> > >>>>>>> + */
> > >>>>>>> +static inline void dma_buf_map_set_vaddr_iomem(struct dma_buf_=
map *map,
> > >>>>>>> +                           void __iomem *vaddr_iomem)
> > >>>>>>> +{
> > >>>>>>> +    map->vaddr_iomem =3D vaddr_iomem;
> > >>>>>>> +    map->is_iomem =3D true;
> > >>>>>>> +}
> > >>>>>>> +
> > >>>>>>>     /**
> > >>>>>>>      * dma_buf_map_is_equal - Compares two dma-buf mapping stru=
ctures
> > >>>>>>> for equality
> > >>>>>>>      * @lhs:    The dma-buf mapping structure
> > >>>>>> _______________________________________________
> > >>>>>> dri-devel mailing list
> > >>>>>> dri-devel@lists.freedesktop.org
> > >>>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C=
01%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd896=
1fe4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdHOA%2=
F1VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> > >>>>> _______________________________________________
> > >>>>> amd-gfx mailing list
> > >>>>> amd-gfx@lists.freedesktop.org
> > >>>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F=
%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%=
7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe=
4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5HKCsT=
rksRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
> > >>>> _______________________________________________
> > >>>> dri-devel mailing list
> > >>>> dri-devel@lists.freedesktop.org
> > >>>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01=
%7Cchristian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961f=
e4884e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DHdHOA%2F1=
VcIX%2F7YtfYTiAqYEvw7Ag%2FS%2BxS5VwJKOv5y0%3D&amp;reserved=3D0
> > >>>>
> > >>> _______________________________________________
> > >>> amd-gfx mailing list
> > >>> amd-gfx@lists.freedesktop.org
> > >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7C=
christian.koenig%40amd.com%7C472c3d655a61411deb6708d86525d1b8%7C3dd8961fe48=
84e608e11a82d994e183d%7C0%7C0%7C637370560438965013&amp;sdata=3DH%2B5HKCsTrk=
sRV2EyEiFGSTyS79jsWCmJimSMoJYusx8%3D&amp;reserved=3D0
> >
> =

> =

> -- =

> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
