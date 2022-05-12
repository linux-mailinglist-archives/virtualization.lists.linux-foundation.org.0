Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A51C5246FB
	for <lists.virtualization@lfdr.de>; Thu, 12 May 2022 09:29:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9ADA9405C7;
	Thu, 12 May 2022 07:29:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jl-HDxl7nTxq; Thu, 12 May 2022 07:29:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 67B3A400FD;
	Thu, 12 May 2022 07:29:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB635C007E;
	Thu, 12 May 2022 07:29:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4E03C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 07:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4160405C7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 07:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kwQsSRWD13Yt
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 07:29:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0626E400FD
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 07:29:39 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id z2so8435203ejj.3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 May 2022 00:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=6pAZCGyP8MKNDHSnHkp9Vkj/nq2Rx3C2O79znDA1ohY=;
 b=gxJRzrkmadF3F010BI/AMYnQC5Uyk0pnkL9ydptziONsEZn/T/Fbr536Bj0CqT43/F
 OE8wBqNbrMI1khevv0mxyHVfbDzMZ0KwNdeo/bIpVHajTT+EF0oDYf7N0VNN3eIe2c0O
 bJgEjttmuMaTQOa5J2uuTwyztqxfHYcUX2fk7ZNZB18NWHk4aV009x5qtgb8QqTLTAaS
 8y1to59ZLt6vcN6xaJxMesvLgIVpZbaUxsHo0IzdyH1F+HGrknc0It+VZabYdtbKbDlG
 oOIQGI+//4lh04gMHGLybH31m8u8DcH87bpUKK9AOmqcOMltr0HhDsM4I8CDWsx0WSDg
 fO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6pAZCGyP8MKNDHSnHkp9Vkj/nq2Rx3C2O79znDA1ohY=;
 b=I25/VkO08EH3ePcP8MPLl8gADKgZi8I/aWvdxJSBs8OK701YCnfVF1DBmDbqeyOnwJ
 +s/en7a8TyULUDMog4g2NSCiIMS3YZ6J0OevYvqfYFtQLCdy64icGReT2gP2msl629J6
 gYx4iYlHCE+9o0Q3WahZkmqircy+hqHeKxNXpjJk+VOXGYUU/3jpNMMZy/I3cMRTknON
 Ss4wLW+La6YnQtaIIShD6GPXaWvB8Md2ivLx2WX200pZGPbFDZw8MGg0koD7gVLAdDRq
 1+2FJc7SIyf0e8BhH3N7wbu76upx0EPzZWVhtBx0/zNUO2VOreYKRpjkdpM8iF0PpjM9
 A3WQ==
X-Gm-Message-State: AOAM5307iTwHcznpVqElBPNyPNx3ZOZAkrTRhwcIzxDntMELYwnNGlJR
 19D2yNVGaVjfgBFoTfdfN3o=
X-Google-Smtp-Source: ABdhPJzmYNUvkYEksV5JP3JbnVmzNZnB1l4WyXgWPZVb+mOEjX9GxlW5bDRlUp4xgoD9wQN+D9XfMw==
X-Received: by 2002:a17:907:60d6:b0:6fa:95d3:d4e5 with SMTP id
 hv22-20020a17090760d600b006fa95d3d4e5mr13864164ejc.357.1652340578275; 
 Thu, 12 May 2022 00:29:38 -0700 (PDT)
Received: from [192.168.178.21] (p5b0ea033.dip0.t-ipconnect.de. [91.14.160.51])
 by smtp.gmail.com with ESMTPSA id
 da26-20020a056402177a00b0042617ba63a5sm2274053edb.47.2022.05.12.00.29.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 00:29:37 -0700 (PDT)
Message-ID: <f6e42cfb-0252-1273-2ba3-76af818e0799@gmail.com>
Date: Thu, 12 May 2022 09:29:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v4 10/15] drm/shmem-helper: Take reservation lock instead
 of drm_gem_shmem locks
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Stone
 <daniel@fooishbar.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
References: <01506516-ab2f-cb6e-7507-f2a3295efb59@collabora.com>
 <YnOHAh9I1ds4+1J+@phenom.ffwll.local>
 <83e68918-68de-c0c6-6f9b-e94d34b19383@collabora.com>
 <YnkaUk0mZNuPsZ5r@phenom.ffwll.local>
 <4d08b382-0076-1ea2-b565-893d50b453cb@collabora.com>
 <YnuziJDmXVR09UzP@phenom.ffwll.local>
 <56787b70-fb64-64da-6006-d3aa3ed59d12@gmail.com>
 <3a362c32-870c-1d73-bba6-bbdcd62dc326@collabora.com>
 <YnvWUbh5QDDs6u2B@phenom.ffwll.local>
 <ba2836d0-9a3a-b879-cb1e-a48aed31637d@collabora.com>
 <YnwI5UX/zvmnAHvg@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <YnwI5UX/zvmnAHvg@phenom.ffwll.local>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Am 11.05.22 um 21:05 schrieb Daniel Vetter:
> [SNIP]
>>>> It's unclear to me which driver may ever want to do the mapping under
>>>> the dma_resv_lock. But if we will ever have such a driver that will need
>>>> to map imported buffer under dma_resv_lock, then we could always add the
>>>> dma_buf_vmap_locked() variant of the function. In this case the locking
>>>> rule will sound like this:
>>>>
>>>> "All dma-buf importers are responsible for holding the dma-reservation
>>>> lock around the dmabuf->ops->mmap/vmap() calls."
>> Are you okay with this rule?
> Yeah I think long-term it's where we want to be, just trying to find
> clever ways to get there.
>
> And I think Christian agrees with that?

Yes, completely.

A design where most DMA-buf functions are supposed to be called with the 
reservation lock held is exactly what I have in mind for the long term.

>>>>> It shouldn't be that hard to clean up. The last time I looked into it my
>>>>> main problem was that we didn't had any easy unit test for it.
>>>> Do we have any tests for dma-bufs at all? It's unclear to me what you
>>>> are going to test in regards to the reservation locks, could you please
>>>> clarify?
>>> Unfortunately not really :-/ Only way really is to grab a driver which
>>> needs vmap (those are mostly display drivers) on an imported buffer, and
>>> see what happens.
>>>
>>> 2nd best is liberally sprinkling lockdep annotations all over the place
>>> and throwing it at intel ci (not sure amd ci is accessible to the public)
>>> and then hoping that's good enough. Stuff like might_lock and
>>> dma_resv_assert_held.
>> Alright
> So throwing it at intel-gfx-ci can't hurt I think, but that only covers
> i915 so doesn't really help with the bigger issue of catching all the
> drivers.

BTW: We have now somebody working on converting the existing 
libdrm_amdgpu unit tests over to igt.

Regards,
Christian.

>
> Cheers, Daniel

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
