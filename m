Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 854AB5F730
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 13:25:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 74EAD10A5;
	Thu,  4 Jul 2019 11:25:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AAEAAB8F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 11:25:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 52F4C87F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 11:25:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B00A1882F5;
	Thu,  4 Jul 2019 11:25:36 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 467A759442;
	Thu,  4 Jul 2019 11:25:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 1E36611AB5; Thu,  4 Jul 2019 13:25:34 +0200 (CEST)
Date: Thu, 4 Jul 2019 13:25:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 08/18] drm/virtio: rework virtio_gpu_execbuffer_ioctl
	fencing
Message-ID: <20190704112534.v7icsuverf7wrbjq@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-9-kraxel@redhat.com>
	<CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QP=A2kV_kqcT20Pmc831HviaBJN1RpOFoa=V1g6SmE_g@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 04 Jul 2019 11:25:36 +0000 (UTC)
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

  Hi,

> >         if (fence)
> >                 virtio_gpu_fence_emit(vgdev, hdr, fence);
> > +       if (vbuf->objs) {
> > +               virtio_gpu_array_add_fence(vbuf->objs, &fence->f);
> > +               virtio_gpu_array_unlock_resv(vbuf->objs);
> > +       }
> This is with the spinlock held.  Maybe we should move the
> virtio_gpu_array_unlock_resv call out of the critical section.

That would bring back the race ...

> I am actually more concerned about virtio_gpu_array_add_fence, but it
> is also harder to move.  Should we add a kref to the object array?

Yep, refcounting would be the other way to fix the race.

> This bothers me because I recently ran into a CPU-bound game with very
> bad lock contention here.

Hmm.  Any clue where this comes from?  Multiple threads competing for
virtio buffers I guess?  Maybe we should have larger virtqueues?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
