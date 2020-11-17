Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 013DB2B69F2
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 17:22:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A9D3F86FB4;
	Tue, 17 Nov 2020 16:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TnDJIOjM53Ls; Tue, 17 Nov 2020 16:22:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EB58386FB1;
	Tue, 17 Nov 2020 16:22:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BEFA7C07FF;
	Tue, 17 Nov 2020 16:22:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E4E1C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8BFED86FB4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ih2JTet8dBc7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:22:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E6A8086FB1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 16:22:13 +0000 (UTC)
IronPort-SDR: Q3SuvWqzvRj2EEtlWzP01lVJrBXhh9kIopLslY3lsqwJJdrQq28U3J6cn4qEqcoggSI1xS3S8T
 WZ8x8/l+ujDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="255669060"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="255669060"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2020 08:22:12 -0800
IronPort-SDR: CoGzXPEVNbKmnYjIVbZO9kezAllEJyz0IDtWk8i0pxuD6cgse6FPzRuCUZYsNgnXmjHipt4DZj
 c/reFg8COcNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; d="scan'208";a="367935190"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 17 Nov 2020 08:22:07 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 17 Nov 2020 18:22:06 +0200
Date: Tue, 17 Nov 2020 18:22:06 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/10] drm/fb-helper: Call dirty helper after writing to
 fbdev
Message-ID: <20201117162206.GF6112@intel.com>
References: <20201116200437.17977-1-tzimmermann@suse.de>
 <20201116200437.17977-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201116200437.17977-2-tzimmermann@suse.de>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: airlied@linux.ie, Daniel Vetter <daniel.vetter@ffwll.ch>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 virtualization@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 daniel@ffwll.ch, sam@ravnborg.org, christian.koenig@amd.com
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Nov 16, 2020 at 09:04:28PM +0100, Thomas Zimmermann wrote:
> If fbdev uses a shadow framebuffer, call the damage handler. Otherwise
> the update might not make it to the screen.
> =

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 222ec45f4c69 ("drm/fb_helper: Support framebuffers in I/O memory")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: virtualization@lists.linux-foundation.org
> ---
>  drivers/gpu/drm/drm_fb_helper.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
> index 25edf670867c..ee1a19e22df2 100644
> --- a/drivers/gpu/drm/drm_fb_helper.c
> +++ b/drivers/gpu/drm/drm_fb_helper.c
> @@ -2189,6 +2189,9 @@ static ssize_t drm_fbdev_fb_write(struct fb_info *i=
nfo, const char __user *buf,
>  	if (ret > 0)
>  		*ppos +=3D ret;
>  =

> +	if (ret > 0)
> +		drm_fb_helper_dirty(info, 0, 0, info->var.xres, info->var.yres);

Should that rather be 0->{x,y}res_virtual or {x,y}offset->{x,y}res?

> +
>  	return ret ? ret : err;
>  }
>  =

> -- =

> 2.29.2
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
