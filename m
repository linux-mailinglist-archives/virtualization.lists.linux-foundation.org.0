Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4996075D
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 16:07:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AC75A13F4;
	Fri,  5 Jul 2019 14:07:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 51CE5127D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 14:07:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EA20688E
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 14:07:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2FCC459451;
	Fri,  5 Jul 2019 14:07:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-90.ams2.redhat.com
	[10.36.116.90])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D1D277DE33;
	Fri,  5 Jul 2019 14:07:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C692B16E2D; Fri,  5 Jul 2019 16:07:46 +0200 (CEST)
Date: Fri, 5 Jul 2019 16:07:46 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 15/18] drm/virtio: rework
	virtio_gpu_transfer_to_host_ioctl fencing
Message-ID: <20190705140746.czs2e5ffryx2slxf@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-16-kraxel@redhat.com>
	<CAPaKu7S0n=E7g0o2e6fEk1YjP+u=tsoV8upw7J=noSx88PgP+A@mail.gmail.com>
	<20190704115138.ou77sb3rlrex67tj@sirius.home.kraxel.org>
	<CAPaKu7SDwR1TgFQK2XGEbRqSkCO0XZYxGhcjzsAwOH42aOHEEw@mail.gmail.com>
	<20190705090553.jx5zcdoxeimojq2i@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705090553.jx5zcdoxeimojq2i@sirius.home.kraxel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 05 Jul 2019 14:07:49 +0000 (UTC)
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

> > > ... 3d case passes the objs list to virtio_gpu_cmd_transfer_to_host_3d,
> > > so it gets added to the vbuf and released when the command is finished.
> > Why doesn't this apply to virtio_gpu_cmd_transfer_to_host_2d?
> 
> Hmm, yes, makes sense to handle both the same way.
> 
> With virgl=off qemu processes the commands from the guest
> synchronously, so it'll work fine as-is.  So you can't hit
> the theoretical race window in practice.  But depending
> on that host-side implementation detail isn't a good idea
> indeed.

Branch with incremental fixes:
https://git.kraxel.org/cgit/linux/log/?h=drm-virtio-kill-ttm

I'll be offline three weeks now, will resume this when I'm back.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
