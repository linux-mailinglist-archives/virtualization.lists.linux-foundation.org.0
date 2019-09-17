Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F7B48F9
	for <lists.virtualization@lfdr.de>; Tue, 17 Sep 2019 10:14:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ED3C01169;
	Tue, 17 Sep 2019 08:14:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E3EBD1112
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 08:14:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A172576D
	for <virtualization@lists.linux-foundation.org>;
	Tue, 17 Sep 2019 08:14:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE6373082B1F;
	Tue, 17 Sep 2019 08:14:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-47.ams2.redhat.com
	[10.36.116.47])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F14F60BF7;
	Tue, 17 Sep 2019 08:14:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id D17C317444; Tue, 17 Sep 2019 10:14:48 +0200 (CEST)
Date: Tue, 17 Sep 2019 10:14:48 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 2/8] drm/shmem: switch shmem helper to
	&drm_gem_object_funcs.mmap
Message-ID: <20190917081448.zonghnqa4aoc4bmp@sirius.home.kraxel.org>
References: <20190913122908.784-1-kraxel@redhat.com>
	<20190913122908.784-3-kraxel@redhat.com>
	<197fdced-cf4a-c59a-47fd-aa5dbf8e04a2@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <197fdced-cf4a-c59a-47fd-aa5dbf8e04a2@arm.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 17 Sep 2019 08:14:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Maxime Ripard <maxime.ripard@bootlin.com>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
	"open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
	David Airlie <airlied@linux.ie>,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
	Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
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

> > -	/* VM_PFNMAP was set by drm_gem_mmap() */
> > -	vma->vm_flags &= ~VM_PFNMAP;
> > -	vma->vm_flags |= VM_MIXEDMAP;
> > +	vma->vm_flags |= (VM_MIXEDMAP|VM_DONTEXPAND);
> 
> I'm finding this a bit hard to follow - but I think here we've lost
> VM_IO and VM_DONTDUMP which used to be set by drm_gem_mmap().

Yep.  Intentional, but I think I better split that off to a separate
patch with a commit message explaining things.

> Also it looks like nothing is fiddling vma->vm_page_prot anymore.

Oops, that one was not intentional.  Will fix.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
