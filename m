Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 533247D633
	for <lists.virtualization@lfdr.de>; Thu,  1 Aug 2019 09:18:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 412C08A4B;
	Thu,  1 Aug 2019 07:18:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A994789FA
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 07:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6296582B
	for <virtualization@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 07:04:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D16E681120;
	Thu,  1 Aug 2019 07:04:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-54.ams2.redhat.com
	[10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 163B160BF7;
	Thu,  1 Aug 2019 07:04:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 725F711AAA; Thu,  1 Aug 2019 09:04:52 +0200 (CEST)
Date: Thu, 1 Aug 2019 09:04:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/6] Unmappable DRM client buffers for fbdev emulation
Message-ID: <20190801070452.wi3xxu22kq2vxovp@sirius.home.kraxel.org>
References: <20190705092613.7621-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705092613.7621-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 01 Aug 2019 07:04:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: yc_chen@aspeedtech.com, maxime.ripard@bootlin.com, sam@ravnborg.org,
	maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, noralf@tronnes.org,
	daniel@ffwll.ch, airlied@redhat.com, sean@poorly.run
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

> and removes a large amount of framebuffer code from these drivers. For
> bochs, a problem was reported where the driver could not display the console
> because it was pinned in system memory. [1] The patch set fixes this bug
> by converting bochs to use the shadow fb.

So, bochs in 5.3-rcX is broken, and patches 1+2+3+5 of this series unbreak
it.  Series already landed in drm-misc-next, but that doesn't help bochs
in 5.3.

What is the usual way to handle this?
Just cherry-pick the four patches into drm-misc-fixes and push?

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
