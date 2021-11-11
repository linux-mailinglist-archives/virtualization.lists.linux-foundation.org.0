Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D10C444DCBD
	for <lists.virtualization@lfdr.de>; Thu, 11 Nov 2021 21:52:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FCCB81CDC;
	Thu, 11 Nov 2021 20:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfRJ1YrX0ao6; Thu, 11 Nov 2021 20:52:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 29D0C81D02;
	Thu, 11 Nov 2021 20:52:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 914BCC0020;
	Thu, 11 Nov 2021 20:52:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 05C5BC000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 20:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3CF64037A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 20:52:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A8hTfSG1fUyz
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 20:52:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97451400C1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 20:52:07 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id s186so18131588yba.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 12:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kyN9KPpJEiqasVoovUD2ShkSHxsg8GDQXZqCB7xqQao=;
 b=IEz3lhjwgibwspCVdh1v93npJ4/qkmXS3x+aNpifYgVqhND7dLTN9eIWI5dB+O0QfE
 c0xSfdbR+dWF4mueSUJiErO+4tDo9APKnLAaHUym/j+c4NIshuIx6qeIC649U1E9hitR
 PAsJe+0VRykwgoHmpEvg6svA0Hk3qJ/PAvPZlq6zOFRvLiXbmZfEcbsrDkseT8UmP7+I
 V3LL5/7Yjtqainyv8Okab9P8HHBWiDRTJTnfVsb1pyZRWgaMrplTHKVQ3z7g//thmlRC
 YT1zQla1i73Hn25e3zTCXUUcyJSwlpFcuTWNT+5FC6I9kuFtgNz7G/6PLYQFyL5ctt9B
 lWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kyN9KPpJEiqasVoovUD2ShkSHxsg8GDQXZqCB7xqQao=;
 b=TaxtwNilEKWGdiptiz7Q3M1wW5sgmx4yKE/TGdX3lr26GVk+ESLshwkaRGOgmwnTJ+
 NFbwfXedGZfmclABEHgN0L1ob1c0OIyBAXYlufBeKuHjF6dk9Z+w0j1B7uGt0S5ncWFd
 aLTn/bZhyPKWXqnFoC0WcNnJ6pCOm10qN7fhqLo+6bYUVkOQiW7kUcS9td1puubGeOGz
 kDtHVF3gHHgyixkVZoi7gxS2zs8uRUkYMBp9cJI+olbmxt8VZz/CNp/0DRVop1yovN4c
 40iimCrI2yowY15IPdrfa5vWinD4DN2VJJDs+x7A9kO1xtMkPn1bEHF4FD3Ap9MgZH1m
 A90g==
X-Gm-Message-State: AOAM531Rc0Ei2eimJ5/JD/UjtinGaCw0amXqJLFJl98lV3k62W6mUmJG
 OS1ZS55l1xVflrkErAU1eh9RKSU27cMhRNQZgUI=
X-Google-Smtp-Source: ABdhPJwBytVtWwVGDTLmrrLfoxxM3A2+VqmPf4lQGtZ4h23e0LlCj+4GenH3Hsb1R+qFOlorixMzitEgzrKFh6o1SR4=
X-Received: by 2002:a25:bb52:: with SMTP id b18mr12085046ybk.506.1636663926521; 
 Thu, 11 Nov 2021 12:52:06 -0800 (PST)
MIME-Version: 1.0
References: <CADVatmOuOk6RoZF=M9sZm2L=9NuDDsSNNCJJbAtkgScG0og1Ww@mail.gmail.com>
In-Reply-To: <CADVatmOuOk6RoZF=M9sZm2L=9NuDDsSNNCJJbAtkgScG0og1Ww@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Thu, 11 Nov 2021 20:51:30 +0000
Message-ID: <CADVatmP_Sn+SS5Yu5+7sJJ5SVpcaZcW8Z_Bj5vmYz9g3kJD86g@mail.gmail.com>
Subject: Re: regression with mainline kernel
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Verne <nverne@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Gurchetan Singh <gurchetansingh@chromium.org>
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

Hi Linus,

On Thu, Nov 11, 2021 at 2:03 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> Hi Linus,
>
> My testing has been failing for the last few days. Last good test was
> with 6f2b76a4a384 and I started seeing the failure with ce840177930f5
> where boot timeout.
>
> Last good test - https://openqa.qa.codethink.co.uk/tests/323
> Failing test - https://openqa.qa.codethink.co.uk/tests/335
>
> Saw a similar issue with 5.10.79-rc1 today and bisect showed the
> problem with 8615ff6dd1ac but that was already in the last good test I
> had.

Did a bisect and this is a separate issue than the one we saw in 5.10.79-rc1.

The bisect log:
# bad: [ce840177930f591a181f55515fc6ac9e1f56b84a] Merge tag
'defconfig-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
# good: [6f2b76a4a384e05ac8d3349831f29dff5de1e1e2] Merge tag
'Smack-for-5.16' of https://github.com/cschaufler/smack-next
git bisect start 'ce840177930f5' '6f2b76a4a384e05ac8d3349831f29dff5de1e1e2'
# good: [a64a325bf6313aa5cde7ecd691927e92892d1b7f] Merge tag
'afs-next-20211102' of
git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs
git bisect good a64a325bf6313aa5cde7ecd691927e92892d1b7f
# bad: [dcd68326d29b62f3039e4f4d23d3e38f24d37360] Merge tag
'devicetree-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux
git bisect bad dcd68326d29b62f3039e4f4d23d3e38f24d37360
# bad: [c7c774fe09389fc806bbe4b487c18e45f576c1ae] Merge tag
'drm-intel-next-2021-10-04' of
git://anongit.freedesktop.org/drm/drm-intel into drm-next
git bisect bad c7c774fe09389fc806bbe4b487c18e45f576c1ae
# good: [8017ecb11ebbcdfcbdff14c5edbdf1efc14991f4] drm/amd/display:
Added root clock optimization flags
git bisect good 8017ecb11ebbcdfcbdff14c5edbdf1efc14991f4
# good: [8a1ec3f3275479292613273a7be2ac87f2a7f6e6] drm/i915: Remove
DP_PORT_EN stuff from link training code
git bisect good 8a1ec3f3275479292613273a7be2ac87f2a7f6e6
# bad: [9962601ca5719050906915c3c33a63744ac7b15c] drm/bridge:
dw-hdmi-cec: Make use of the helper function
devm_add_action_or_reset()
git bisect bad 9962601ca5719050906915c3c33a63744ac7b15c
# bad: [606b102876e3741851dfb09d53f3ee57f650a52c] drm: fb_helper: fix
CONFIG_FB dependency
git bisect bad 606b102876e3741851dfb09d53f3ee57f650a52c
# good: [c43da06c24a485308e80d709737b446e8cad175d] dt-bindings:
drm/panel: boe-tv101wum-nl6: Support enabling a 3.3V rail
git bisect good c43da06c24a485308e80d709737b446e8cad175d
# good: [8d6b006e1f51c99016aa39ca9e03947cbdd024e3] drm/virtio:
implement context init: handle VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
git bisect good 8d6b006e1f51c99016aa39ca9e03947cbdd024e3
# bad: [d0f5d790ae863079025398015eb59347b01db455] drm/ttm: remove
TTM_PAGE_FLAG_NO_RETRY
git bisect bad d0f5d790ae863079025398015eb59347b01db455
# bad: [f5d28856b89baab4232a9f841e565763fcebcdf9] drm/ttm: stop
calling tt_swapin in vm_access
git bisect bad f5d28856b89baab4232a9f841e565763fcebcdf9
# bad: [78aa20fa4381623cf59a85d053486f98784ca3a0] drm/virtio:
implement context init: advertise feature to userspace
git bisect bad 78aa20fa4381623cf59a85d053486f98784ca3a0
# bad: [cd7f5ca33585918febe5e2f6dc090a21cfa775b0] drm/virtio:
implement context init: add virtio_gpu_fence_event
git bisect bad cd7f5ca33585918febe5e2f6dc090a21cfa775b0
# first bad commit: [cd7f5ca33585918febe5e2f6dc090a21cfa775b0]
drm/virtio: implement context init: add virtio_gpu_fence_event

And, indeed reverting cd7f5ca33585 on top of debe436e77c7 has fixed
the problem I was seeing on my qemu test of x86_64. The qemu image is
based on Ubuntu.

Will be happy to test any fix or more debugging if needed.


-- 
Regards
Sudip
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
