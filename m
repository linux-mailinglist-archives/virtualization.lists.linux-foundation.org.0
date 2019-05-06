Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBCF14BB5
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 16:22:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8FE2A4687;
	Mon,  6 May 2019 14:21:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 768B64682
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 14:20:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2AD8AFD
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 14:20:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 243BC3001809;
	Mon,  6 May 2019 14:20:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D0C0E5E1A7;
	Mon,  6 May 2019 14:20:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 0056911AAA; Mon,  6 May 2019 16:20:34 +0200 (CEST)
Date: Mon, 6 May 2019 16:20:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 00/19] Share TTM code among DRM framebuffer drivers
Message-ID: <20190506142034.kb3lfvw25xbkrkyq@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
	<20190506122233.76pya5kpdfgp4f25@sirius.home.kraxel.org>
	<fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fcb3efd9-64f2-ca35-e36e-83b7055f8055@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 06 May 2019 14:20:38 +0000 (UTC)
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

On Mon, May 06, 2019 at 03:09:20PM +0200, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.05.19 um 14:22 schrieb Gerd Hoffmann:
> >> GEM VRAM could implement PRIME helpers, which would allow for using
> >> the generic fbcon.
> > 
> > bochs_gem_prime_*() functions with this series applied look like you can
> > just rename them & move over to vram helpers.
> > 
> > It's not a full prime implementation, specifically actual export/import
> > isn't there.  But pin+vmap (needed by generic fbcon) is implemented.
> 
> I did have a patch to do this, but then I read that prime requires DMA
> for buffer sharing and bochs works only because it's emulated.

For actual buffer sharing with other drivers yes because dma-bufs
typically are a bunch of pages (struct page**) and live in RAM.

Not sure whenever it is possible or useful to place the vram in
ZONE_DEVICE to get page structs for it, then export buffers located
in vram that way without copying them over to main memory.  I suspect
most importers would fail to properly setup PCI-PCI dma in that case.

> If bochs' implementation is complete enough to be useful for other
> drivers, I'll add it to the patch set.

It's good enough for generic fbcon.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
