Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A492178C
	for <lists.virtualization@lfdr.de>; Fri, 17 May 2019 13:17:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2144EB7D;
	Fri, 17 May 2019 11:17:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ED07CAC8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 11:17:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AE977882
	for <virtualization@lists.linux-foundation.org>;
	Fri, 17 May 2019 11:17:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EDC28553F;
	Fri, 17 May 2019 11:17:09 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C417F348CE;
	Fri, 17 May 2019 11:17:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id CDE9C11AA3; Fri, 17 May 2019 13:17:03 +0200 (CEST)
Date: Fri, 17 May 2019 13:17:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 0/2] Add BO reservation to GEM VRAM
	pin/unpin/push_to_system
Message-ID: <20190517111703.j3qtk74awnnebupe@sirius.home.kraxel.org>
References: <20190516162746.11636-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190516162746.11636-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 17 May 2019 11:17:16 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: noralf@tronnes.org, airlied@linux.ie, puck.chen@hisilicon.com,
	dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
	z.liuxinliang@hisilicon.com, hdegoede@redhat.com,
	kong.kongxinwei@hisilicon.com, ray.huang@amd.com,
	daniel@ffwll.ch, zourongrong@gmail.com, sam@ravnborg.org,
	christian.koenig@amd.com
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

> It turns out that the bochs and vbox drivers automatically reserved and
> unreserved the BO from within their pin and unpin functions. The other
> drivers; ast, hibmc and mgag200; performed reservation explicitly. With the
> GEM VRAM conversion, automatic BO reservation within pin and unpin functions
> accidentally got lost. So for bochs and vbox, ttm_bo_validate() worked on
> unlocked BOs.
> 
> This patch set fixes the problem by adding automatic reservation to the
> implementation of drm_gem_vram_{pin,unpin,push_to_system}() to fix bochs
> and vbox. It removes explicit BO reservation around the pin, unpin and
> push-to-system calls in the ast, hibmc and mgag200 drivers.
> 
> The only exception is the cursor handling of mgag200. In this case, the
> mgag200 driver now calls drm_gem_vram_{pin,unpin}_reserved(), which works
> with reserved BOs. The respective code should be refactored in a future
> patch to work with the regular pin and unpin functions.

Looks good, pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
