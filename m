Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3B85FD2D
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 20:56:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE886D7E;
	Thu,  4 Jul 2019 18:56:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6992FD7C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 18:56:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 14F0387C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 18:56:11 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id j6so14554691ioa.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 04 Jul 2019 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dVPI54F8WztxoPvvjrKlk6t2iT7s82kVikoygRX/3n8=;
	b=DIf/ee9k2Z3dPthl5Ioi3W+zUz0Naw3h98O8/cIJvOQr2OguAQaYQ9/kWMGcp8zUI8
	MAT9owEMUZvzIHfO94gDHaf7rjxGpW8Z4FlIsOhETeickK9dOPi7j0OwJgMph6sSg9CW
	HWKDxvhqH4+zwwXhEQzOyKGxFLSohHnGiAo9nxOHWGhA2iZbGTYfSWuR+73+PhMJtyIb
	/LvwizkK5g44YnpbwLdy+qB+qFZIoY4meT65RCjC1K/RMNS9+qHgrhcuUB7+FCkx5Hld
	vXQs1+iaUhtVDJH1hFaxqm9343a0RehxmKCxkdm+UssSPkqKaHjitzLG8uyJPFXXNFs/
	jd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dVPI54F8WztxoPvvjrKlk6t2iT7s82kVikoygRX/3n8=;
	b=iWUqTO4fMOAGaRG0AM1KlS5/W3YS59HYpI7r7UcoH8mWFfVGX2KEhCDYXMm351Ofwd
	u5snlWJ9ESm8t8rIPRHKNnWlE7I+Mf2LC3E/TAiDvBc6RxSm9Fa23rkYHf0Wt4g7uj59
	RXskzTHe+PV8LOYmTdrolDsEKzV8UGXgTzL6O7mjtd4H/IyIVKx0IAwRe8tBen24JSJX
	+viYzpYp935OEuQHqnrbd5pjZE9UCAF12zcfKK/wAuP/JMwNyQMx4C4FzObFjiUJFWQo
	erjxODUDzSsxl2x3r9GD9qxlQhOBPDquWQvKpOaC1LTaDESMrax7c5IILkAFpdXzrVu4
	HWzQ==
X-Gm-Message-State: APjAAAXeFtJ8cw7L1wA+nvNDFq3h/nDAhb2v+jpvOs1NmE0zBsnFseU2
	YG/Z1h72f/WI36nWJiuRDt4YrwkqckWGyThtqew=
X-Google-Smtp-Source: APXvYqyuufs960P1/vdGPNwzz71qxLDK4zx/ys1xqg1z6vid7XwTdQRhtt9ehbnzPiPsMMVOwUiY5nfaXOyov9XPTsE=
X-Received: by 2002:a05:6602:104:: with SMTP id
	s4mr39095774iot.200.1562266570329; 
	Thu, 04 Jul 2019 11:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-15-kraxel@redhat.com>
	<CAPaKu7T3GvYVMueYgJFhADFSFEVbHEdaupw8=mq_+i150a1mLA@mail.gmail.com>
	<20190704114756.eavkszsgsyymns3m@sirius.home.kraxel.org>
In-Reply-To: <20190704114756.eavkszsgsyymns3m@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 11:55:59 -0700
Message-ID: <CAPaKu7SXJwDg1uE0qDOYNS6J44UuQUh6m5rpJ3hBtW2tqYmMKA@mail.gmail.com>
Subject: Re: [PATCH v6 14/18] drm/virtio: rework
	virtio_gpu_transfer_from_host_ioctl fencing
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	Gurchetan Singh <gurchetansingh@chromium.org>
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

On Thu, Jul 4, 2019 at 4:48 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Wed, Jul 03, 2019 at 01:05:12PM -0700, Chia-I Wu wrote:
> > On Tue, Jul 2, 2019 at 7:19 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Switch to the virtio_gpu_array_* helper workflow.
> > (just repeating my question on patch 6)
> >
> > Does this fix the obj refcount issue?  When was the issue introduced?
>
> obj refcount should be fine in both old and new code.
>
> old code:
>   drm_gem_object_lookup
>   drm_gem_object_put_unlocked
>
> new code:
>   virtio_gpu_array_from_handles
>   virtio_gpu_array_put_free (in virtio_gpu_dequeue_ctrl_func).
>
> Or did I miss something?
In the old code, drm_gem_object_put_unlocked is called before the vbuf
using the object is retired.  Isn't that what object array wants to
fix?

We get away with that because the host only sees  hw_res_handles, and
executes the commands in order.

Maybe it was me who missed something..?

>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
