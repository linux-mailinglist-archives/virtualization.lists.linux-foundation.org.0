Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D746E602DC
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 11:06:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B3A1510F7;
	Fri,  5 Jul 2019 09:06:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B577810BA
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:06:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 64D5087B
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 09:06:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE86F30860A0;
	Fri,  5 Jul 2019 09:05:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
	[10.36.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B3281BC67;
	Fri,  5 Jul 2019 09:05:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4FE3116E32; Fri,  5 Jul 2019 11:05:53 +0200 (CEST)
Date: Fri, 5 Jul 2019 11:05:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
	virtio_gpu_transfer_to_host_ioctl fencing
Message-ID: <20190705090553.jx5zcdoxeimojq2i@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-16-kraxel@redhat.com>
	<CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
	<20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
	<CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 05 Jul 2019 09:06:00 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
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

On Thu, Jul 04, 2019 at 12:08:14PM -0700, Chia-I Wu wrote:
> On Thu, Jul 4, 2019 at 4:51 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > >         convert_to_hw_box(&box, &args->box);
> > > >         if (!vgdev->has_virgl_3d) {
> > > >                 virtio_gpu_cmd_transfer_to_host_2d
> > > > -                       (vgdev, qobj, offset,
> > > > +                       (vgdev, gem_to_virtio_gpu_obj(objs->objs[0]), offset,
> > > >                          box.w, box.h, box.x, box.y, NULL);
> > > > +               virtio_gpu_array_put_free(objs);
> > > Don't we need this in non-3D case as well?
> >
> > No, ...
> >
> > > >                 virtio_gpu_cmd_transfer_to_host_3d
> > > > -                       (vgdev, qobj,
> > > > +                       (vgdev,
> > > >                          vfpriv ? vfpriv->ctx_id : 0, offset,
> > > > -                        args->level, &box, fence);
> > > > -               reservation_object_add_excl_fence(qobj->base.base.resv,
> > > > -                                                 &fence->f);
> > > > +                        args->level, &box, objs, fence);
> >
> > ... 3d case passes the objs list to virtio_gpu_cmd_transfer_to_host_3d,
> > so it gets added to the vbuf and released when the command is finished.
> Why doesn't this apply to virtio_gpu_cmd_transfer_to_host_2d?

Hmm, yes, makes sense to handle both the same way.

With virgl=off qemu processes the commands from the guest
synchronously, so it'll work fine as-is.  So you can't hit
the theoretical race window in practice.  But depending
on that host-side implementation detail isn't a good idea
indeed.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
