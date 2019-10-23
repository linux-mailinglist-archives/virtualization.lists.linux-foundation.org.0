Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF3FE1CAE
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 15:34:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 095F2D09;
	Wed, 23 Oct 2019 13:34:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6A705C21
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 13:34:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5104A87B
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 13:34:41 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id i185so17345710oif.9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 06:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=rlgAUb4WY4bYebtDST8C0ocqKTOSomIXSLYZGI3cJAU=;
	b=i0jlpYaBX/vOYcjTU0UXPJ7iDxNoV+6RP+NKrDfSO8B7MpNwF0xXYjeLKlOhInFTTq
	CeWj1wBO4K3Z8iR2m9Itkbz1pbmSzuKwcj8h21fX5f8O1g4QkS2Vxfshh4JIPC9TVj25
	7nhx916QgsQRibCng0aNrDPEFl3hVJtEoztmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=rlgAUb4WY4bYebtDST8C0ocqKTOSomIXSLYZGI3cJAU=;
	b=AStFxAwdj+oIkeQqTbSssxhRKctpuEC+U/YPiyWj/SE+MHaX7Jfxp+M/fQHMBl+xdB
	ZYWwRVAphOwZ6p8VsT8ThIo8PJnxye+CJlz27CIR8j3BFjJ9vEmUVB9EPw7FBqLpO4va
	mGZigbZczkJSBKu5ic3c1Tej/lgPhPiyFuoaknJU5PH/fodUOfv5ChxcbLXLJ9xcmmZ5
	5copusXZhe+mN7bPLihwrb+0w6Zv78h18zQuTpnaLds6mfLqPWQTLAtDwwU/k/nZ9US3
	Htbmn4huAGy6z+H0RnGe4q8lelDI+OkvdJm/JxtT43v8moQIHGJ4ihRdiUzT+Za/5QXJ
	DDWQ==
X-Gm-Message-State: APjAAAVvdAeG/+jDvS3Uhc0ZtOrUyL6szt3+cZDSsdkH+gX+yDnsvAiz
	agt36PX98ek9dsgFF9UPp8PjkmpWH2Z92BqbX+HCGA==
X-Google-Smtp-Source: APXvYqy6RDvKXlzgV6NahYfYxTpMsFQqfwHGTFFoshW8+fYVQTSO5pSR4bQUi60/9B5kzbnKoIVIfHs8KxTFUlcyEc4=
X-Received: by 2002:aca:1b10:: with SMTP id b16mr7955262oib.110.1571837680242; 
	Wed, 23 Oct 2019 06:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191018113832.5460-1-kraxel@redhat.com>
	<20191022090533.GB11828@phenom.ffwll.local>
	<87mudreh2p.fsf@intel.com>
In-Reply-To: <87mudreh2p.fsf@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 23 Oct 2019 15:34:27 +0200
Message-ID: <CAKMK7uGm7gYQoEyoZDYYzGO6OBw6AdEwHRDOPDtvNOm-ijWJMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: print a single line with device features
To: Jani Nikula <jani.nikula@linux.intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	open list <linux-kernel@vger.kernel.org>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, Oct 23, 2019 at 3:18 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 22 Oct 2019, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Fri, Oct 18, 2019 at 01:38:32PM +0200, Gerd Hoffmann wrote:
> >> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> >> ---
> >>  drivers/gpu/drm/virtio/virtgpu_kms.c | 9 ++++-----
> >>  1 file changed, 4 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/virtio/virtgpu_kms.c b/drivers/gpu/drm/virtio/virtgpu_kms.c
> >> index 0b3cdb0d83b0..2f5773e43557 100644
> >> --- a/drivers/gpu/drm/virtio/virtgpu_kms.c
> >> +++ b/drivers/gpu/drm/virtio/virtgpu_kms.c
> >> @@ -155,16 +155,15 @@ int virtio_gpu_init(struct drm_device *dev)
> >>  #ifdef __LITTLE_ENDIAN
> >>      if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_VIRGL))
> >>              vgdev->has_virgl_3d = true;
> >> -    DRM_INFO("virgl 3d acceleration %s\n",
> >> -             vgdev->has_virgl_3d ? "enabled" : "not supported by host");
> >> -#else
> >> -    DRM_INFO("virgl 3d acceleration not supported by guest\n");
> >>  #endif
> >>      if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_EDID)) {
> >>              vgdev->has_edid = true;
> >> -            DRM_INFO("EDID support available.\n");
> >>      }
> >>
> >> +    DRM_INFO("features: %cvirgl %cedid\n",
> >> +             vgdev->has_virgl_3d ? '+' : '-',
> >> +             vgdev->has_edid     ? '+' : '-');
> >
> > Maybe we should move the various yesno/onoff/enableddisabled helpers from
> > i915_utils.h to drm_utils.h and use them more widely?
>
> I'm trying to take it one step further by adding them to
> include/linux/string-choice.h [1]. Maybe, uh, fourth time's the charm?
>
> BR,
> Jani.
>
> [1] http://lore.kernel.org/r/20191023131308.9420-1-jani.nikula@intel.com

Oh nice, r-b: me on that.

I think the rule for new headers like this is "just do it" once you
have enough senior kernel maintainers' approval. Maybe ask Dave Airlie
for ack and with Greg's r-b then just stuff it into drm-misc-next or
so?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
