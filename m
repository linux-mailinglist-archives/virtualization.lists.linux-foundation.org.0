Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8557514A19
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 14:45:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC48A4675;
	Mon,  6 May 2019 12:45:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AE733466C
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 12:43:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 67124FD
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 12:43:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4B64307D86F;
	Mon,  6 May 2019 12:43:47 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 71ED35F9A7;
	Mon,  6 May 2019 12:43:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A331A16E0A; Mon,  6 May 2019 14:43:44 +0200 (CEST)
Date: Mon, 6 May 2019 14:43:44 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
Message-ID: <20190506124344.hltulw6e3kkcg4w3@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506082649.942-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 06 May 2019 12:43:48 +0000 (UTC)
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

On Mon, May 06, 2019 at 10:26:30AM +0200, Thomas Zimmermann wrote:
> Several simple framebuffer drivers copy most of the TTM code from each
> other. The implementation is always the same; except for the name of
> some data structures.
> 
> As recently discussed, this patch set provides generic memory-management
> code for simple framebuffers with dedicated video memory. It further
> converts the respective drivers to the generic code. The shared code
> is basically the same implementation as the one copied among individual
> drivers.
> 
> The patch set contains two major changes: first, it introduces
> |struct drm_gem_vram_object| and helpers (GEM VRAM). It's a GEM object
> that is backed by VRAM. The type's purpose is somewhat similar to
> |struct drm_gem_{cma, shmem}_object|: it provides an commom implementation
> that handles all the basic cases. Second, the patch set introduces
> |struct drm_vram_mm| and helpers (VRAM MM). It's an implementation of a
> basic memory manager for VRAM.
> 
> Both, GEM VRAM and VRAM MM, support buffer placement in VRAM and system
> memory. Both can be used independedly from each other if desired by the
> DRM driver.

Looks good to me overall, some small nits in replies to patches.

> Currently ast, bochs, mgag200, vboxvideo and hisilicon/hibmc can use
> these helpers.

I've tested bochs on qemu, works fine.
What is the testing status of the other drivers?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
