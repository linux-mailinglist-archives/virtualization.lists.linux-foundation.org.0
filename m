Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id EB11D5ECC5
	for <lists.virtualization@lfdr.de>; Wed,  3 Jul 2019 21:27:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7EC8FEA8;
	Wed,  3 Jul 2019 19:27:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 21FA0E85
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 19:27:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7964A70D
	for <virtualization@lists.linux-foundation.org>;
	Wed,  3 Jul 2019 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org;
	s=ds201810; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Fim4j7VbqUMQEUX2smRAc1YukNARo49PRYDt+wRVbD8=; 
	b=rXq8H6H0u6cgVf65W0gUoq2V/HdYfMzP8KLS8aPEdZuhNdgQvI+R1FVuqwjghzyO1X1xBU8RikkotMgipD39UPsvzRva4wxAUNemBVScpXmNLoeIt4+2/COx8ktUVuFsgBwKXEqZaW+BlYZlEj9GPVqDlsvVO5b+gpZJs3STjEzBmFuZ+sQac0vENwaOCQf3luR1UmGzW4L1CNjenM/LlO1d2s6CMpvcbhGFrYSquDJCaa852pSaKpFbanPGEtbwiQbGamUqg5nYaX93jiYyzEt/7JG0D7iu8ef9vtvbYDYmcWdnpkPEt+QvUkqcX+mzjWQlot5VlgsAZbrsSPFzIw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:62952
	helo=[192.168.10.173]) by smtp.domeneshop.no with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84_2)
	(envelope-from <noralf@tronnes.org>)
	id 1hikur-0000r8-61; Wed, 03 Jul 2019 21:27:41 +0200
Subject: Re: [PATCH 0/5] Unmappable DRM client buffers for fbdev emulation
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
	daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com, 
	maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
	yc_chen@aspeedtech.com
References: <20190703083302.2609-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <a2e3baa8-f8e8-4628-e18f-cb3119194afb@tronnes.org>
Date: Wed, 3 Jul 2019 21:27:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190703083302.2609-1-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
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



Den 03.07.2019 10.32, skrev Thomas Zimmermann:
> DRM client buffers are permanently mapped throughout their lifetime. This
> prevents us from using generic framebuffer emulation for devices with
> small dedicated video memory, such as ast or mgag200. With fb buffers
> permanently mapped, such devices often won't have enougth space left to
> display other content (e.g., X11).
> 
> This patch set introduces unmappable DRM client buffers for framebuffer
> emulation with shadow buffers. While the shadow buffer remains in system
> memory permanently, the respective buffer object will only be mapped briefly
> during updates from the shadow buffer. Hence, the driver can relocate he
> buffer object among memory regions as needed.
> 
> The default behoviour for DRM client buffers is still to be permanently
> mapped.
> 
> The patch set converts ast and mgag200 to generic framebuffer emulation
> and removes a large amount of framebuffer code from these drivers. For
> bochs, a problem was reported where the driver could not display the console
> because it was pinned in system memory. [1] The patch set fixes this bug
> by converting bochs to use the shadow fb.
> 
> The patch set has been tested on ast and mga200 HW.
> 

I've been thinking, this enables dirty tracking in DRM userspace for
these drivers since the dirty callback is now set on all framebuffers.
Is this OK? Should we add a drm_fbdev_generic_shadow_setup() that sets a
flag enabling the shadow buffer instead?

Really nice diffstat by the way :-)

Noralf.

> [1] https://lists.freedesktop.org/archives/dri-devel/2019-June/224423.html
> 
> Thomas Zimmermann (5):
>   drm/client: Support unmapping of DRM client buffers
>   drm/fb-helper: Unmap BO for shadow-buffered framebuffer console
>   drm/ast: Replace struct ast_fbdev with generic framebuffer emulation
>   drm/bochs: Use shadow buffer for bochs framebuffer console
>   drm/mgag200: Replace struct mga_fbdev with generic framebuffer
>     emulation
> 
>  drivers/gpu/drm/ast/Makefile           |   2 +-
>  drivers/gpu/drm/ast/ast_drv.c          |  22 +-
>  drivers/gpu/drm/ast/ast_drv.h          |  17 --
>  drivers/gpu/drm/ast/ast_fb.c           | 341 -------------------------
>  drivers/gpu/drm/ast/ast_main.c         |  30 ++-
>  drivers/gpu/drm/ast/ast_mode.c         |  21 --
>  drivers/gpu/drm/bochs/bochs_kms.c      |   2 +-
>  drivers/gpu/drm/drm_client.c           |  71 ++++-
>  drivers/gpu/drm/drm_fb_helper.c        |  14 +-
>  drivers/gpu/drm/mgag200/Makefile       |   2 +-
>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  19 --
>  drivers/gpu/drm/mgag200/mgag200_fb.c   | 309 ----------------------
>  drivers/gpu/drm/mgag200/mgag200_main.c |  61 +++--
>  drivers/gpu/drm/mgag200/mgag200_mode.c |  27 --
>  include/drm/drm_client.h               |   3 +
>  15 files changed, 154 insertions(+), 787 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ast/ast_fb.c
>  delete mode 100644 drivers/gpu/drm/mgag200/mgag200_fb.c
> 
> --
> 2.21.0
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
