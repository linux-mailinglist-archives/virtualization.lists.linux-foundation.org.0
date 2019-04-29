Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDBCDD42
	for <lists.virtualization@lfdr.de>; Mon, 29 Apr 2019 09:57:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6DB4F1E6E;
	Mon, 29 Apr 2019 07:56:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 786E71E5B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 07:54:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 29453608
	for <virtualization@lists.linux-foundation.org>;
	Mon, 29 Apr 2019 07:54:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AD6F309266F;
	Mon, 29 Apr 2019 07:54:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D21FD600C2;
	Mon, 29 Apr 2019 07:54:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id F157311AAA; Mon, 29 Apr 2019 09:54:13 +0200 (CEST)
Date: Mon, 29 Apr 2019 09:54:13 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [Spice-devel] [PATCH] Revert "drm/qxl: drop prime import/export
	callbacks"
Message-ID: <20190429075413.smcocftjd2viznhv@sirius.home.kraxel.org>
References: <20190426053324.26443-1-kraxel@redhat.com>
	<CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG+vMU0hqqiKAswu=LqpkcXtLPqbYLRWgoAPpsQQV4qzA@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Mon, 29 Apr 2019 07:54:15 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	David Airlie <airlied@redhat.com>,
	"open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<spice-devel@lists.freedesktop.org>
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

On Fri, Apr 26, 2019 at 04:21:37PM +0200, Daniel Vetter wrote:
> On Fri, Apr 26, 2019 at 7:33 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > This reverts commit f4c34b1e2a37d5676180901fa6ff188bcb6371f8.
> >
> > Simliar to commit a0cecc23cfcb Revert "drm/virtio: drop prime
> > import/export callbacks".  We have to do the same with qxl,
> > for the same reasons (it breaks DRI3).
> >
> > Drop the WARN_ON_ONCE().
> >
> > Fixes: f4c34b1e2a37d5676180901fa6ff188bcb6371f8
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Maybe we need some helpers for virtual drivers which only allow
> self-reimport and nothing else at all?

The current gem prime helpers handle this reasonable well,
I don't see a need for that.

More useful would be some way to signal this self-reimport capability
to userspace somehow.  See DRM_PRIME_CAP_LOCAL patch.

Right now I have the choice to set DRM_PRIME_CAP_{IMPORT,EXPORT}, in
which case some userspace assumes it can do cross-driver export/import
and trips over that not working.  Or I do not set
DRM_PRIME_CAP_{IMPORT,EXPORT}, which breaks DRI3 ...

> I think there's qxl, virgl,

export is implemented for virgl, and import should be possible too.

qxl/bochs is simliar to vmgfx, it could be done but dma-bufs would
basically be bounce buffers (need copy from/to vram) so probably not
worth the effort.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
