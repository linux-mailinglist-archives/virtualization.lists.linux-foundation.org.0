Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 026FF3DF263
	for <lists.virtualization@lfdr.de>; Tue,  3 Aug 2021 18:21:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AFC4402CB;
	Tue,  3 Aug 2021 16:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aHgjd6JQn9G6; Tue,  3 Aug 2021 16:21:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 434BB402BB;
	Tue,  3 Aug 2021 16:21:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BF790C000E;
	Tue,  3 Aug 2021 16:21:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 42292C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 16:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31E69835FB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 16:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id loFqvzUIuWir
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 16:21:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 762FE835E9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Aug 2021 16:21:22 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id dad9e189-f476-11eb-9082-0050568c148b;
 Tue, 03 Aug 2021 16:21:28 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 5F66C194B70;
 Tue,  3 Aug 2021 18:21:45 +0200 (CEST)
Date: Tue, 3 Aug 2021 18:21:18 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/11] Provide offset-adjusted framebuffer mappings
Message-ID: <YQls/oxklkZWqEnD@ravnborg.org>
References: <20210803125928.27780-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803125928.27780-1-tzimmermann@suse.de>
Cc: linux-hyperv@vger.kernel.org, rodrigosiqueiramelo@gmail.com,
 hdegoede@redhat.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, melissa.srw@gmail.com,
 drawat.floss@gmail.com, noralf@tronnes.org, daniel@ffwll.ch,
 airlied@redhat.com, sean@poorly.run
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi Thomas,

On Tue, Aug 03, 2021 at 02:59:17PM +0200, Thomas Zimmermann wrote:
> A framebuffer's offsets field might be non-zero to make the BO data
> start at the specified offset within the BO's memory. Handle this
> case in drm_gem_fb_vmap() and update all callers. So far, many drivers
> ignore the offsets, which can lead to visual artifacts.
> 
> Patch 1 adds an optional argument to drm_gem_fb_vmap() to return the
> offset-adjusted data address for use with shadow-buffered planes.
> 
> Patches 3 and 11 convert gud and vkms, which are the other callers of
> drm_gem_fb_vmap(). For gud, it's just a cleanup. Vkms will handle the
> framebuffer offsets correctly for its input and output framebuffers.
> 
> The other patches convert users of shadow-buffered planes to use the
> data address. After conversion, each driver will use the correct data
> for non-zero offsets.
> 

>   drm/ast: Use offset-adjusted shadow-plane mappings
>   drm/gud: Get offset-adjusted mapping from drm_gem_fb_vmap()
>   drm/hyperv: Use offset-adjusted shadow-plane mappings
>   drm/mgag200: Use offset-adjusted shadow-plane mappings
>   drm/cirrus: Use offset-adjusted shadow-plane mappings
>   drm/gm12u320: Use offset-adjusted shadow-plane mappings
>   drm/simpledrm: Use offset-adjusted shadow-plane mapping
>   drm/udl: Use offset-adjusted shadow-plane mapping
>   drm/vbox: Use offset-adjusted shadow-plane mappings
>   drm/vkms: Use offset-adjusted shadow-plane mappings and output
Everything looked good while reading through the patches.
I cannot say if everything was properly converted but the patches looked
good.

So they are all:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

There was a few TODO comments visible aboput using the mapping api
properly. I assume this is coming in a later patch set..

	Sam
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
