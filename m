Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB59517783
	for <lists.virtualization@lfdr.de>; Mon,  2 May 2022 21:41:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25EE2415FD;
	Mon,  2 May 2022 19:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRgEaz8FhCnC; Mon,  2 May 2022 19:41:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 90E42415FC;
	Mon,  2 May 2022 19:41:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9687C007E;
	Mon,  2 May 2022 19:41:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 018D9C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 19:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D48BF4015D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 19:41:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=ideasonboard.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CU0bxwkAHXKc
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 19:41:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34C0040133
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 19:41:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E27C1484;
 Mon,  2 May 2022 21:41:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1651520489;
 bh=7fS1iDiQS0BFHXb6Blv7uJsVuEU2kQ6EnwifQcIZAzE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L6vTOnaYs7l4Xlv3+utCAZq5wLz1L8z9dE5E8+De/yg2+Pma+zdmoo/867c5Ze76+
 exCdf2KgzXrGOkXEsHqhG4eyuJpbCE1tqzVXQPVbHV8+oMRr0hcpp/eZbX9GD6wYiL
 rZ001sxYlJkkZ4F/yveoIbAQI0FZ6+DVNlid2hh0=
Date: Mon, 2 May 2022 22:41:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/3] drm: Remove superfluous arg when calling to
 drm_fbdev_generic_setup()
Message-ID: <YnAz6HPPfWpYcZvF@pendragon.ideasonboard.com>
References: <20220502153900.408522-1-javierm@redhat.com>
 <20220502153900.408522-2-javierm@redhat.com>
 <YnABjdpGC166yIY7@pendragon.ideasonboard.com>
 <5dd80287-1b09-d02c-9f67-5a0bb0a4566c@redhat.com>
 <bc6b6598-0e09-1a43-4086-e4164ab42a20@redhat.com>
 <YnAkwRL7b++a0omG@pendragon.ideasonboard.com>
 <21db3772-b85a-59ff-df17-9056b3099977@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21db3772-b85a-59ff-df17-9056b3099977@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 virtualization@lists.linux-foundation.org
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

On Mon, May 02, 2022 at 09:28:45PM +0200, Javier Martinez Canillas wrote:
> On 5/2/22 20:36, Laurent Pinchart wrote:
> > On Mon, May 02, 2022 at 07:15:16PM +0200, Javier Martinez Canillas wrote:
> >> On 5/2/22 18:55, Javier Martinez Canillas wrote:
> >>
> >> [snip]
> >>
> >>>> drop the depth option to drm_fbdev_generic_setup() ? There's a FIXME
> >>>> comment in drm_fbdev_generic_setup() that could be related.
> >>>
> >>> A FIXME makes sense, I'll add that to when posting a v3.
> >>
> >> There's actually a FIXME already in drm_fbdev_generic_setup(), so it's
> >> a documented issue [0]:
> > 
> > That's what I meant by "there's a FIXME" :-) It doesn't have to be
> > addressed by this series, but it would be good to fix it.
> 
> doh, I misread your original email. Yes, it's the same issue as you
> said and something that I plan to look at some point as a follow-up.
>  
> I hope that we could just replace fbcon with a kms/systemd-consoled/foo
> user-space implementation before fixing all the stuff in the DRM fbdev
> emulation layer :)

If you can do that, I'll provide champagne :-)

-- 
Regards,

Laurent Pinchart
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
