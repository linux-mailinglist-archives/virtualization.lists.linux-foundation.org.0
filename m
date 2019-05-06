Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3A14AC3
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 15:18:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C3951453D;
	Mon,  6 May 2019 13:18:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 89182451B
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:17:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4672AFD
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 13:17:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92E11307D93F;
	Mon,  6 May 2019 13:17:46 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F2B8171B7;
	Mon,  6 May 2019 13:17:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 4809B1747B; Mon,  6 May 2019 15:17:39 +0200 (CEST)
Date: Mon, 6 May 2019 15:17:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Message-ID: <20190506131739.hmadwiqmjil2weth@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
	<20190506082649.942-2-tzimmermann@suse.de>
	<20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
	<0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fad955f-5a9e-15b1-0dca-c5e842b297c6@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Mon, 06 May 2019 13:17:46 +0000 (UTC)
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

> This misses the call to drm_gem_vram_placement(), where
> drm_gem_vram_push_to_system() enforces placement in system memory.

Ah, missed that detail.

> We
> could build a common implementation out of both interfaces, but that
> would obfuscate the code IMHO. I'd just leave it as it is.

Ok.

> >> +struct drm_gem_vram_object {
> >> +	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
> >> +	struct ttm_placement placement;
> >> +	struct ttm_place placements[3];
> > 
> > placements[2] should be enough I guess?
> 
> TTM_PL_VRAM has index 2 and TTM_PL_SYSTEM has index 0. There's TTM_PL_TT
> at index 1. We don't use all three array entries here, but I'm not sure
> if something in TTM does. I took the line from the drivers and didn't
> change it for that reason.

TTM_PL_* isn't an index into that array.  See drm_gem_vram_placement()
which fills that array.  It'll use one or two entries of that array.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
