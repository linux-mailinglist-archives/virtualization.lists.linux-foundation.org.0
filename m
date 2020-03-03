Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC2D17713E
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 09:27:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F006820F7;
	Tue,  3 Mar 2020 08:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g1MEH2eaMnzT; Tue,  3 Mar 2020 08:27:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B06868202F;
	Tue,  3 Mar 2020 08:27:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 91049C013E;
	Tue,  3 Mar 2020 08:27:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC594C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 08:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 95EFC84EB4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 08:27:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaZ56SNzEdbf
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 08:27:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CC76884E23
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 08:27:30 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id g83so1869295wme.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 00:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=envAw8gA0RKTACMDEm2KbCUli5Pbd52qjambhk/W3oU=;
 b=PGV3dqbyiAEHWNcWW61Gm89zaeE6HqwphIxclYN26/ubHBrR/2WNRIZWxH47fHfodj
 ruzBVFTqVcQ/wb0B+h5PSdwttFrApcqJF+VI7NjA7nkrTSM3qZwzDQiZ14EsFgMqUFIM
 MJ7Mmnqp2n71+0O/EbqfeuFquv6fEz58a5Vjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=envAw8gA0RKTACMDEm2KbCUli5Pbd52qjambhk/W3oU=;
 b=Rm34iCBfjUfQ56sOrnmjgtEai/CeaESiVXsMbhSkUG44TuQsE3EaaTORWhxi/MzIJT
 /jaY2bSOJ9y1uuMpstIsklaU6PgiAP2sDE5ECWzCmaRgwIx6o1BwDJ010VtEatcGMbsG
 ehUXbDIedVuzexNINkJLzjtQaYbcySKuR9PvLq4t63WpVlAQ9YO78A9Bm5cl8GUcBE4i
 qg2FfdzTJy3Y5yJMb1cfMEaI4w52hKxhpKi915Kc+L5Y89W0wjWDPt5oRaGvBrNwyn9h
 A42LSqSfQ++qT2OHWZFuGvl9YSHd9rAXdAadcYleuZM4Fb7AtfLUHD6+bhI1mY74J2Lt
 FexA==
X-Gm-Message-State: ANhLgQ2REeHt/VXRfoJrq8tHqAxZQ88yl2M/Yh+wcggnlDjgLLtOnlK+
 o9DcH+JYyOL6uoOLzQTtTMwuiQ==
X-Google-Smtp-Source: ADFU+vv7jQX7S+E+km6TFyF76Gbv8kOh0SVJ6E0GZadYOoWm3Fweewas3pR8oHG8XMV4wQklwawbFA==
X-Received: by 2002:a1c:4c0c:: with SMTP id z12mr3040178wmf.63.1583224049100; 
 Tue, 03 Mar 2020 00:27:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o16sm17607147wrj.5.2020.03.03.00.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 00:27:28 -0800 (PST)
Date: Tue, 3 Mar 2020 09:27:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 09/51] drm/cirrus: Use drmm_add_final_kfree
Message-ID: <20200303082726.GL2363188@phenom.ffwll.local>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
 <20200302222631.3861340-10-daniel.vetter@ffwll.ch>
 <20200303074934.vlqxiye7lydnoykd@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303074934.vlqxiye7lydnoykd@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, Linus Walleij <linus.walleij@linaro.org>
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

On Tue, Mar 03, 2020 at 08:49:34AM +0100, Gerd Hoffmann wrote:
> > @@ -575,9 +574,12 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
> >  
> >  	dev = &cirrus->dev;
> >  	ret = drm_dev_init(dev, &cirrus_driver, &pdev->dev);
> > -	if (ret)
> > -		goto err_free_cirrus;
> > +	if (ret) {
> > +		kfree(cirrus);
> > +		goto err_pci_release;
> > +	}
> >  	dev->dev_private = cirrus;
> > +	drmm_add_final_kfree(dev, cirrus);
> 
> That doesn't look like an error path improvement.
> With patch #30 applied it'll looks alot better though.
> So maybe squash the patches?

Breaks the patch set evolution, there's a _lot_ of dependencies in here to
make sure we never break anything interim. But yeah that's why I created
this entire series, since with just the first part it's really not any
better. I also have a pile more ideas on top, so hopefully once this lands
I can get around to them and make everything even better :-)

Cheers, Daniel

> 
> In any case:
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> cheers,
>   Gerd
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
