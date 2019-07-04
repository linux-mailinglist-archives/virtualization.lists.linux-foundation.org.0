Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 622BC5FD4E
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 21:08:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 37FB0D91;
	Thu,  4 Jul 2019 19:08:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3CFF49D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 19:08:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D66C287B
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 19:08:25 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id h6so6379729iom.7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 04 Jul 2019 12:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9btak+fKeivJpFWumZoTjMC0trVA+9MBYmqaPWrOHn0=;
	b=kKiKA2Bj2KAI7YLiGcXr0lnUd35Z3UyghngWdqXiuA02WwEsXazhsQZ2v/rgyYCWIH
	QIHGE6M8JPkfdOpDTW3UzfojE/jdlxwLksTRbmJMTtStjpQz8CGWJu/qF7ygua0YZEgx
	MZAT43VECo5VkmOouhrKOC82DAu+xzsJ9+fYC364Z+Ux3E64M4LkH+0oB4H2QVUGDLuc
	RT5MGIzK7yMVUmB8K99/ot6LYVjDmM2Mz+qfqYj+PU7GDG5x0Y3gx9YQJiemTx42YtI4
	MZpCNrpKfIjAWtnU5SUwmQ7+d79p6bmIychFN/kp1I0+ymcIhPYGJS4UOPL1qIcZDu6a
	K6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9btak+fKeivJpFWumZoTjMC0trVA+9MBYmqaPWrOHn0=;
	b=K4AupOMpgiq8zKkK6LrbqZbGSdxUV77tNXXzPN8jUcMp3VUROZBfKXDedlmNn7sw7P
	dq4HNnJmJ3rdwHJN2gk6Qeo31y+V9QNZKfszodPcUTe5gAE+mZoA88F97CwRg8HgwADp
	VJZZl99jg9dDra7Xk7yAulpu/YSMrTkbH4FF605tn4UDyRCGysAk5VHravpOKHXCOTiS
	1LVk++Rp8RCQMYIymQi95gYTHEXeG2Y1mnCj+PLxp55S3ZeT7A59Z5AYNatBHAfx+EFp
	Vz7gqcKcGs8ubu1PJdGKElSMxzaqNyUHLjM8DELSp/nf3zl8uXalZmjWMY3A9JyBqGOW
	SWdA==
X-Gm-Message-State: APjAAAU1ozvBwBHkap9jNnJidJK5cgkFmLwHqIzzppyylvnzxXGAiyh0
	y8Obw8J5g8647Xv5Mjkuzl7xARnTMOXgsySAjtY=
X-Google-Smtp-Source: APXvYqwVyWfwlxBxJohecI/H5oxgmdJ1n8iHxHi16NUSGnX6AI3z95oR6ILRv45iTfcdHoNfZuLXFs+sMg1SjT1yH1E=
X-Received: by 2002:a6b:6012:: with SMTP id r18mr5922135iog.241.1562267305070; 
	Thu, 04 Jul 2019 12:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-16-kraxel@redhat.com>
	<CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
	<20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
In-Reply-To: <20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 4 Jul 2019 12:08:14 -0700
Message-ID: <CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
	virtio_gpu_transfer_to_host_ioctl fencing
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

On Thu, Jul 4, 2019 at 4:51 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > >         convert_to_hw_box(&box, &args->box);
> > >         if (!vgdev->has_virgl_3d) {
> > >                 virtio_gpu_cmd_transfer_to_host_2d
> > > -                       (vgdev, qobj, offset,
> > > +                       (vgdev, gem_to_virtio_gpu_obj(objs->objs[0]), offset,
> > >                          box.w, box.h, box.x, box.y, NULL);
> > > +               virtio_gpu_array_put_free(objs);
> > Don't we need this in non-3D case as well?
>
> No, ...
>
> > >                 virtio_gpu_cmd_transfer_to_host_3d
> > > -                       (vgdev, qobj,
> > > +                       (vgdev,
> > >                          vfpriv ? vfpriv->ctx_id : 0, offset,
> > > -                        args->level, &box, fence);
> > > -               reservation_object_add_excl_fence(qobj->base.base.resv,
> > > -                                                 &fence->f);
> > > +                        args->level, &box, objs, fence);
>
> ... 3d case passes the objs list to virtio_gpu_cmd_transfer_to_host_3d,
> so it gets added to the vbuf and released when the command is finished.
Why doesn't this apply to virtio_gpu_cmd_transfer_to_host_2d?

When object array was introduced, it was said that the object array
was to keep the objects alive until the vbuf using the objects is
retired..  That sounded applicable to any vbuf that uses objects.


>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
