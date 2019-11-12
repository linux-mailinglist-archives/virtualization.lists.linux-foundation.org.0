Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD13F8D71
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 12:03:26 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CC60D14F4;
	Tue, 12 Nov 2019 11:03:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5F71D14E6
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 11:03:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C92CDDF
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 11:03:17 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id m13so14543471edv.9
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 03:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7v/v4nr+zqzk2y/jAd0gNZ9DfjLyLFd4Z21yLnvf0Dw=;
	b=WGcrxOsczq3GVLUIOlQBv9NqR40pTHNB89f52HlTcJP/airVxcI1SbQma3s/xI/y9b
	3FzS+nvwEDIrjUz2i2JkCwft5P+/PNYXiNcxG6SeQicGHSv4apY9rtF/iOfeKgKERvGi
	49Mh+wxoUpPZaJmxb9Nw6btNQVViXnOh65IYkoGrkBwPGsVMEnTa7lGIUtfNvTF+Gn3V
	Qe6PMS86mVL8zxP5qiu8kymKk6Zx8AH19LR1tOXygo4H+xoYMcZsRW7KYCViZ0cRc+oW
	/MXLGW+zWRzqppdLzFyZg5PVEzdYx8ePWwKKIta0fJ9bjReuWFvvR2ms3JaP8Joey/fo
	0Rkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7v/v4nr+zqzk2y/jAd0gNZ9DfjLyLFd4Z21yLnvf0Dw=;
	b=bnBudHK8bEw8N6piyTuhtymJkEiDCvsUirxJFdK4/K0SJHtVf9xkr/iz1T5X9HX2l9
	2JLYqtt4Eoz9HIYNCkV/MUcdcpYzXeX/z6MLGg83ZYgjBii89ER7RJi0KTfvYxwRjHYN
	r9a0DMX6W7qa1BHuFfKcK2rDyuy9WWITz9fcjBtgNt7sfC6i3g854aoc/mGMf2dagJ5C
	xTM7T8L2AgIAJdE38hRF9uGUZzxL8DizxpE8jYQUSiBdiZUNltpbqsD4UzDfi+xxABfP
	q7rt8nosWuWheBD98U+IvMnA4uc7K2GeYivMzJJfFaax5/4knvinMD5e0glo55m0hcWt
	NLzA==
X-Gm-Message-State: APjAAAWc4pHJd1IDyi3ITiuTX7NXixuRnjuHZS2ExJstKWnwknnzmFJv
	dZoUgtiRjGvSjCC2VVEoGDBxe4h61nlQAdgH338=
X-Google-Smtp-Source: APXvYqyF5pycYcqNWugO2851/NH1Ih0TM/Tf5B7Bn9iBKqBF7TP/lwxHh3YlfKn//hB0aWX0AcvVEX/a2g+CgBbh4C8=
X-Received: by 2002:a17:906:f109:: with SMTP id
	gv9mr28018882ejb.196.1573556596349; 
	Tue, 12 Nov 2019 03:03:16 -0800 (PST)
MIME-Version: 1.0
References: <20191109075417.29808-1-hslester96@gmail.com>
	<20191112094031.GF23790@phenom.ffwll.local>
In-Reply-To: <20191112094031.GF23790@phenom.ffwll.local>
From: Chuhong Yuan <hslester96@gmail.com>
Date: Tue, 12 Nov 2019 19:03:05 +0800
Message-ID: <CANhBUQ1HRe4FNWo0o18zxV2ZoANRdNd3PaTeeBZ6dG__0quDUA@mail.gmail.com>
Subject: Re: [PATCH] drm/virtgpu: fix double unregistration
To: Chuhong Yuan <hslester96@gmail.com>, David Airlie <airlied@linux.ie>, 
	Gerd Hoffmann <kraxel@redhat.com>, dri-devel@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, 
	LKML <linux-kernel@vger.kernel.org>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Daniel Vetter <daniel@ffwll.ch>
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

On Tue, Nov 12, 2019 at 5:40 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sat, Nov 09, 2019 at 03:54:17PM +0800, Chuhong Yuan wrote:
> > drm_put_dev also calls drm_dev_unregister, so dev will be unregistered
> > twice.
> > Replace it with drm_dev_put to fix it.
> >
> > Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
>
> Nice catch, I'll apply.
>
> Since this is so confusing, we actually have a todo to remove drm_put_dev
> completely from the codebase (and open-code it with explicit
> unregister+put). Want to do that little patch series to update the
> remaining few drivers and then remove drm_put_dev from core code?
>
> Thanks, Daniel
>

I am sorry that I have to focus on my current project in recent days.
But since this is a problem, I have written a Coccinelle script just now
to find drm_put_dev and open-code it.
I hope this helps.
The script is:

virtual patch

@ drm_put_dev depends on patch exists @
expression dev;
@@

- drm_put_dev(dev);
+ drm_dev_unregister(dev);
+ drm_dev_put(dev);

Regards,
Chuhong
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > index 0fc32fa0b3c0..fccc24e21af8 100644
> > --- a/drivers/gpu/drm/virtio/virtgpu_drv.c
> > +++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
> > @@ -138,7 +138,7 @@ static void virtio_gpu_remove(struct virtio_device *vdev)
> >
> >       drm_dev_unregister(dev);
> >       virtio_gpu_deinit(dev);
> > -     drm_put_dev(dev);
> > +     drm_dev_put(dev);
> >  }
> >
> >  static void virtio_gpu_config_changed(struct virtio_device *vdev)
> > --
> > 2.23.0
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
