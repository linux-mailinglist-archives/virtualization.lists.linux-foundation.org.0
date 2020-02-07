Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 726371558F0
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 15:00:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1A23186BA4;
	Fri,  7 Feb 2020 14:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id matYrCFneitC; Fri,  7 Feb 2020 14:00:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8041C86BBD;
	Fri,  7 Feb 2020 14:00:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 645D3C013E;
	Fri,  7 Feb 2020 14:00:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0A40C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CD6E487E6E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:00:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jkyAAfcHOfJc
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:00:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 40C2086450
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 14:00:35 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 06:00:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="345915846"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 07 Feb 2020 06:00:31 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 16:00:30 +0200
Date: Fri, 7 Feb 2020 16:00:30 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <20200207140030.GY13686@intel.com>
References: <20200207084135.4524-1-tzimmermann@suse.de>
 <20200207084135.4524-3-tzimmermann@suse.de>
 <20200207133720.GZ43062@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200207133720.GZ43062@phenom.ffwll.local>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
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

On Fri, Feb 07, 2020 at 02:37:20PM +0100, Daniel Vetter wrote:
> On Fri, Feb 07, 2020 at 09:41:31AM +0100, Thomas Zimmermann wrote:
> > The simple-encoder helpers initialize an encoder with an empty
> > implementation. This covers the requirements of most of the existing
> > DRM drivers. A call to drm_simple_encoder_create() allocates and
> > initializes an encoder instance, a call to drm_simple_encoder_init()
> > initializes a pre-allocated instance.
> > =

> > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> =

> This has quick a bit midlayer taste to it ... I think having this as a
> helper would be cleaner ...
> =

> The other bit is drm_encoder->possible_crtcs. If we do create a helper for
> these, lets at least try to make them not suck too badly :-) Otherwise I
> guess it would be time to officially document what exactly possible_crtcs
> =3D=3D 0 means from an uabi pov.

I had some improvements for this stuff. Just re-sent the remainder.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
