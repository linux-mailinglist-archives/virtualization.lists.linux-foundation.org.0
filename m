Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F51D4D250B
	for <lists.virtualization@lfdr.de>; Wed,  9 Mar 2022 01:56:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9606960F77;
	Wed,  9 Mar 2022 00:56:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6C3EU3jXIm4R; Wed,  9 Mar 2022 00:56:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 29C8B60F6E;
	Wed,  9 Mar 2022 00:56:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C447C0073;
	Wed,  9 Mar 2022 00:56:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 186B1C000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 00:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F6F44168A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 00:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z5-Sh_8jS_aE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 00:56:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 404504167B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Mar 2022 00:56:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id x15so621470wru.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 08 Mar 2022 16:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wbAfhbFyUGwe2Q5HZ4gVH7hz+BJKhZp/1dIJkpLWrYg=;
 b=oPAjcdMKk2cbLSR0NXJPl2YEmIHZ9WRBbKIrDfh1EAFvaUhr+N8XmHO6RLfSQ4jZIB
 HH32lTtvocQ3aFw0+L1BvytAwA00qmSTIRhPgYDW5bvxvuSckOReH75dbn6+SKgCti5W
 6LF0obtutW0ITI/xSxNCKm5Gt3nBWGqCujHICGD7c/dmBCY4nzn1nk6PbTBurljXT0NE
 WSuPGbUUGMW1XNsH+d5yNCdaFYBwn+X9XzNrAA8gSYwhbV5P1vbpukFZh6s3Zhx/OJkQ
 9AF2wYbYahKsOk8Xj+r1EUjiSfBvGdUh9E5s/TodiCnl4b2GW1PhAWSzW0p4RrC+Ehy2
 +/qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wbAfhbFyUGwe2Q5HZ4gVH7hz+BJKhZp/1dIJkpLWrYg=;
 b=OSOEcXZFicVpNqSh59TAiIee23bJNMsHif5Z9k33OvlSmcDTN1dehi2d8IChU/izGm
 TCkA052quma7RkFPR2E1lMxOicEdp8ktgwWusYoC0zEd15VWt0y2RhuURoAnXuVMv0PW
 FaMXq2Ljyw5ICWs5xiseANi8lYQzCfiNKZzqgrMiSyVYiKJmlVYj2qKU0gGfZKcsc0GC
 59Ivyro9ZyGPQRSIwc3z4Jfwmw09U0yeclVmY3jdALslWt+gnNkaLMk6trGzDcEfq+WE
 cg5RA2x7NnzBJF9VbGd0JDWgXKDCbNKxowtEvDxITkUO6SnE5NTIgH6ds1arHhYvfjmc
 4WPA==
X-Gm-Message-State: AOAM532MtZrL7uPmHfeAGNY6UfWoxNpc3tY/Ki+kmHxpCD2lRIySFmen
 MvHlfmrvCCwuQfmPr/wsluz+ogqqsnTYcCJOxUs=
X-Google-Smtp-Source: ABdhPJxfgZD8CgR/7M44RNEKX6Cd7Bp3Q9o+CLYddiReGvJz3GUsWhptZe9HM1Nrq5JSZmuGN0pej2+BoxLRYImgyD8=
X-Received: by 2002:a5d:6344:0:b0:1f0:21ee:9705 with SMTP id
 b4-20020a5d6344000000b001f021ee9705mr13938132wrw.93.1646787375187; Tue, 08
 Mar 2022 16:56:15 -0800 (PST)
MIME-Version: 1.0
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
 <CAF6AEGt=aVJ9nR+Wv+bJEFZrn-cNOSNXG1TaJr=Cx-FTgutwKA@mail.gmail.com>
 <d2290971-ea22-8203-631e-b896c76a994b@collabora.com>
 <CAF6AEGuR8B6z+z=VFQ6y01wbboYS_qpkghD1GYdLES_RZOW1wA@mail.gmail.com>
 <42facae5-8f2c-9c1f-5144-4ebb99c798bd@collabora.com>
In-Reply-To: <42facae5-8f2c-9c1f-5144-4ebb99c798bd@collabora.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 8 Mar 2022 16:56:43 -0800
Message-ID: <CAF6AEGtebAbWhkvrxzi4UBLdv2LJPQVPBzH-sXcACs7cxznQ8A@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Rob Clark <robdclark@chromium.org>, Gert Wollny <gert.wollny@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Osipenko <digetx@gmail.com>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Chia-I Wu <olvaffe@gmail.com>
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

On Tue, Mar 8, 2022 at 3:36 PM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 3/9/22 01:24, Rob Clark wrote:
> > On Tue, Mar 8, 2022 at 11:28 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 3/8/22 19:29, Rob Clark wrote:
> >>> On Tue, Mar 8, 2022 at 5:17 AM Dmitry Osipenko
> >>> <dmitry.osipenko@collabora.com> wrote:
> >>>>
> >>>> Hello,
> >>>>
> >>>> This patchset introduces memory shrinker for the VirtIO-GPU DRM driver.
> >>>> During OOM, the shrinker will release BOs that are marked as "not needed"
> >>>> by userspace using the new madvise IOCTL. The userspace in this case is
> >>>> the Mesa VirGL driver, it will mark the cached BOs as "not needed",
> >>>> allowing kernel driver to release memory of the cached shmem BOs on lowmem
> >>>> situations, preventing OOM kills.
> >>>
> >>> Will host memory pressure already trigger shrinker in guest?
> >>
> >> The host memory pressure won't trigger shrinker in guest here. This
> >> series will help only with the memory pressure within the guest using a
> >> usual "virgl context".
> >>
> >> Having a host shrinker in a case of "virgl contexts" should be a
> >> difficult problem to solve.
> >
> > Hmm, I think we just need the balloon driver to trigger the shrinker
> > in the guest kernel?  I suppose a driver like drm/virtio might want to
> > differentiate between host and guest pressure (ie. consider only
> > objects that have host vs guest storage), but even without that,
> > freeing up memory in the guest when host is under memory pressure
> > seems worthwhile.  Maybe I'm over-simplifying?
>
> Might be the opposite, i.e. me over-complicating :) The variant with
> memory ballooning actually could be good and will work for all kinds of
> virtio contexts universally. There will be some back-n-forth between
> host and guest, but perhaps it will work okay. Thank you for the suggestion.
>
> >>> This is
> >>> something I'm quite interested in for "virtgpu native contexts" (ie.
> >>> native guest driver with new context type sitting on top of virtgpu),
> >>
> >> In a case of "native contexts" it should be doable, at least I can't see
> >> any obvious problems. The madvise invocations could be passed to the
> >> host using a new virtio-gpu command by the guest's madvise IOCTL
> >> handler, instead-of/in-addition-to handling madvise in the guest's
> >> kernel, and that's it.
> >
> > I think we don't want to do that, because MADV:WILLNEED would be by
> > far the most frequent guest<->host synchronous round trip.  So from
> > that perspective tracking madvise state in guest kernel seems quite
> > attractive.
>
> This is a valid concern. I'd assume that the overhead should be
> tolerable, but I don't have any actual perf numbers.

jfwiw, MADV:WILLNEED is a *very* hot path for gl drivers, based on
some measurements I did a while back with various apps/benchmarks..
easily more than 10x the next most frequent ioctl (for MADV:WONTNEED
and MADV:WILLNEED each, so more than 20x combined.. but MADV:WONTNEED
can be async).

But if the balloon triggering shrinker approach works out, that would
be pretty great.. it seems like the easy option and doesn't require
adding new host kernel uabi :-)

BR,
-R

> > If we really can't track madvise state in the guest for dealing with
> > host memory pressure, I think the better option is to introduce
> > MADV:WILLNEED_REPLACE, ie. something to tell the host kernel that the
> > buffer is needed but the previous contents are not (as long as the GPU
> > VA remains the same).  With this the host could allocate new pages if
> > needed, and the guest would not need to wait for a reply from host.
>
> If variant with the memory ballooning will work, then it will be
> possible to track the state within guest-only. Let's consider the
> simplest variant for now.
>
> I'll try to implement the balloon driver support in the v2 and will get
> back to you.
>
> >>> since that isn't using host storage
> >>
> >> s/host/guest ?
> >
> > Yes, sorry, I meant that it is not using guest storage.
>
> Thank you for the clarification.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
