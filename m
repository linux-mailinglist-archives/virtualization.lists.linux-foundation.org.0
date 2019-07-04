Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AECD5F72B
	for <lists.virtualization@lfdr.de>; Thu,  4 Jul 2019 13:19:48 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A318410B3;
	Thu,  4 Jul 2019 11:19:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 515851088
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 11:19:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1814887F
	for <virtualization@lists.linux-foundation.org>;
	Thu,  4 Jul 2019 11:19:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8A8402F8BD6;
	Thu,  4 Jul 2019 11:19:35 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6924118B97;
	Thu,  4 Jul 2019 11:19:33 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 70D9511AB5; Thu,  4 Jul 2019 13:19:27 +0200 (CEST)
Date: Thu, 4 Jul 2019 13:19:27 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH v6 07/18] drm/virtio: add virtio_gpu_object_array & helpers
Message-ID: <20190704111927.u34xaaqeeiwrwrtb@sirius.home.kraxel.org>
References: <20190702141903.1131-1-kraxel@redhat.com>
	<20190702141903.1131-8-kraxel@redhat.com>
	<CAPaKu7TJ1RgL_CjGnieE1hOOXnT-ECRk67ntRCPTFiv+EmrX4Q@mail.gmail.com>
	<CAPaKu7RFd4EVsV8VbNtNbVv2cPmSbpQ7pkBPpbbeUDz+i=nEfQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7RFd4EVsV8VbNtNbVv2cPmSbpQ7pkBPpbbeUDz+i=nEfQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 04 Jul 2019 11:19:40 +0000 (UTC)
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

> > > +int virtio_gpu_array_lock_resv(struct virtio_gpu_object_array *objs)
> > > +{
> > > +       return drm_gem_lock_reservations(objs->objs, objs->nents,
> > > +                                        &objs->ticket);
> Unlike in other drivers where an "object array" is only needed in
> execbuffer, we will use this in several places, and often with only 1
> object in the array.  Can we special case that and do a quick
> reservation_object_lock?

Yes, done.

> > > +void virtio_gpu_array_unlock_resv(struct virtio_gpu_object_array *objs)
> > > +{
> > > +       drm_gem_unlock_reservations(objs->objs, objs->nents,
> > > +                                   &objs->ticket);
> > > +}
> > > +

Likewise here.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
