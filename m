Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D441499A
	for <lists.virtualization@lfdr.de>; Mon,  6 May 2019 14:32:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C7C0C462B;
	Mon,  6 May 2019 12:32:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 058104624
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 12:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A48B1837
	for <virtualization@lists.linux-foundation.org>;
	Mon,  6 May 2019 12:31:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C47DE30833A5;
	Mon,  6 May 2019 12:31:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EABF60851;
	Mon,  6 May 2019 12:31:15 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7621116E0A; Mon,  6 May 2019 14:31:14 +0200 (CEST)
Date: Mon, 6 May 2019 14:31:14 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 01/19] drm: Add |struct drm_gem_vram_object| and helpers
Message-ID: <20190506123114.hzyl2hkix7lvqjyx@sirius.home.kraxel.org>
References: <20190506082649.942-1-tzimmermann@suse.de>
	<20190506082649.942-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190506082649.942-2-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 06 May 2019 12:31:18 +0000 (UTC)
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

> +/**
> + * drm_gem_vram_unpin() - Unpins a GEM VRAM object
> + * @gbo:	the GEM VRAM object
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise.
> + */
> +int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
> +{
> +	int i, ret;
> +	struct ttm_operation_ctx ctx = { false, false };
> +
> +	if (!gbo->pin_count)
> +		return 0;

WARN_ON_ONCE() here?  That should not happen ...

> +/**
> + * drm_gem_vram_push_to_system() - \
> +	Unpins a GEM VRAM object and moves it to system memory
> + * @gbo:	the GEM VRAM object
> + *
> + * This operation only works if the caller holds the final pin on the
> + * buffer object.
> + *
> + * Returns:
> + * 0 on success, or
> + * a negative error code otherwise.
> + */
> +int drm_gem_vram_push_to_system(struct drm_gem_vram_object *gbo)
> +{
> +	int i, ret;
> +	struct ttm_operation_ctx ctx = { false, false };
> +
> +	if (!gbo->pin_count)
> +		return 0;

Likewise.

> +	--gbo->pin_count;
> +	if (gbo->pin_count)
> +		return 0;
> +
> +	if (gbo->kmap.virtual)
> +		ttm_bo_kunmap(&gbo->kmap);
> +
> +	drm_gem_vram_placement(gbo, TTM_PL_FLAG_SYSTEM);
> +	for (i = 0; i < gbo->placement.num_placement ; ++i)
> +		gbo->placements[i].flags |= TTM_PL_FLAG_NO_EVICT;
> +
> +	ret = ttm_bo_validate(&gbo->bo, &gbo->placement, &ctx);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_gem_vram_push_to_system);

Very simliar to drm_gem_vram_unpin, can't we just call that function?

Something like this:

	drm_gem_vram_push_to_system()
	{
		if (gbo->pin_count == 1 && gbo->kmap.virtual)
			ttm_bo_kunmap(&gbo->kmap);
		return drm_gem_vram_unpin();
	}

> +struct drm_gem_vram_object {
> +	/* Supported placements are %TTM_PL_VRAM and %TTM_PL_SYSTEM */
> +	struct ttm_placement placement;
> +	struct ttm_place placements[3];

placements[2] should be enough I guess?

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
