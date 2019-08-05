Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A0B81781
	for <lists.virtualization@lfdr.de>; Mon,  5 Aug 2019 12:50:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A64FE61;
	Mon,  5 Aug 2019 10:50:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B6348AC8
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 10:50:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 39EC15E4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 10:50:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 68AA5C051676;
	Mon,  5 Aug 2019 10:50:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-81.ams2.redhat.com
	[10.36.116.81])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 15EC45D712;
	Mon,  5 Aug 2019 10:50:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4A79816E08; Mon,  5 Aug 2019 12:50:39 +0200 (CEST)
Date: Mon, 5 Aug 2019 12:50:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Frediano Ziglio <fziglio@redhat.com>
Subject: Re: [Spice-devel] [PATCH] drm/qxl: get vga ioports
Message-ID: <20190805105039.cxf2ogbzdf7hropp@sirius.home.kraxel.org>
References: <20190805085355.12527-1-kraxel@redhat.com>
	<1869747233.4556840.1564996693878.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1869747233.4556840.1564996693878.JavaMail.zimbra@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 05 Aug 2019 10:50:40 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org, "open list:DRM DRIVER FOR QXL VIRTUAL GPU"
	<virtualization@lists.linux-foundation.org>,
	Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
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

  Hi,

> > +	ret = vga_get_interruptible(pdev, VGA_RSRC_LEGACY_IO);
> > +	if (ret) {
> > +		DRM_ERROR("can't get legacy vga ports\n");
> > +		goto put_vga;
> 
> I suppose that if this fails it's secondary so should continue.

Ah, right, there are secondary qxl cards (without the vga compat bits).
We should skip the call in that case (likewise for the cleanups).

> What happen configuring 2 QXL devices?
> Only a card should provide VGA registers in the system so
> if any other card provide them QXL won't work.

Well, with intel vgpu everything works fine with this patch.  Probably
i915 skips direct vga register access in case vga_get fails (because qxl
grabed them first).

In any case I'd prefer to fail qxl initialization over continuing
despite vga_get() having failed.  The failure mode is rather awkward:
qemu thinks the qxl card is in vga mode while the guest kernel thinks
qxl is in native mode.  Guest keeps queuing commands until the ring is
full while qemu never takes them out, so at some point the guest kernel
blocks forever in qxl_ring_push().

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
