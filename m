Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6E918AE8C
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 09:46:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2179086AB7;
	Thu, 19 Mar 2020 08:46:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FBoOghYzaq3l; Thu, 19 Mar 2020 08:46:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2C96686AAC;
	Thu, 19 Mar 2020 08:46:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A8D1C07FF;
	Thu, 19 Mar 2020 08:46:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC4AAC07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A3EF1879AA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0ehW7nq2QILy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:46:01 +0000 (UTC)
X-Greylist: delayed 00:05:57 by SQLgrey-1.7.6
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 426D587988
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 08:46:01 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id d62so1808599oia.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ACN5TXHytCQ9oPIhIdCfNcH/pNHuSSltZdjJw7+EaRg=;
 b=A7NboF2/Hz8lWvoBTGeYPrQgAwRxBjdgXIJR/1akF0SZVx5wIQu0CN/7CL80GXNQmg
 4rmVYRb0lYTdlQaiJRmDTsoYiGLCBJ+IDGv1Lp33jY1utb0+pr9jXvzBwAbmqtuCuxtb
 rbnTIa/mG4eu6te9zzbxaeRET942OOWKDEDgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ACN5TXHytCQ9oPIhIdCfNcH/pNHuSSltZdjJw7+EaRg=;
 b=F1IJ3w1rNzvfBe3asvvddntpHZVuf58T5nEjF0KiGVWg+gW/7XiL3ZWiCZOWlPrdHX
 lJiHemWAhHMxK/iirKPT/t/jU3eFgSE9RjsHrHycOI6c8qBtDFV9Ta0gCUhh6DidysU+
 xlz1EBcClvGmM2Y1nvfniBs66bKaSVz5mqQZr8EAhAw7mn2/1SWT1sTFZ7ohNcbYJzOA
 K/guLIWwKBq0BeEtCL+gmYKJubNEGt+NWm+1AADbsv/9s+CSSY1dmyGhjnYA7RiUuPwS
 oJPG21Vp2xROMQEG2wNCkdPJ3hnWNjtE3+uK0WLJOC0ToiMV0g8+Iqir7zIuFLKXb3eP
 nkPA==
X-Gm-Message-State: ANhLgQ2llhROCPYoBiBwznuT7gsZoMLHTT7v7JqQPaNgA6tYdvVQFSnT
 PYOI5jKFKnym9D4419pGzbTAO2UFuswFp6IMPgMLM0fq
X-Google-Smtp-Source: ADFU+vt3ZzgRUF2QVHwIZ2Dg+soGlY7nM/mYmDu2kjCnCgsthelSdzxb44Mh83yzZ1MJ1ma3yWffDCZUEBGsisIAZiA=
X-Received: by 2002:aca:be08:: with SMTP id o8mr1404601oif.101.1584607203202; 
 Thu, 19 Mar 2020 01:40:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200313084152.2734-1-kraxel@redhat.com>
 <20200317164941.GP2363188@phenom.ffwll.local>
 <20200318064211.rg5s4sgrnqhht3f4@sirius.home.kraxel.org>
In-Reply-To: <20200318064211.rg5s4sgrnqhht3f4@sirius.home.kraxel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Mar 2020 09:39:52 +0100
Message-ID: <CAKMK7uE52i2_BhFoH0timOG_jUQP3OThA+wUWoMx6tfH9mMT6w@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bochs: downgrade pci_request_region failure from
 error to warning
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 marmarek@invisiblethingslab.com, dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR BOCHS VIRTUAL GPU"
 <virtualization@lists.linux-foundation.org>
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

On Wed, Mar 18, 2020 at 7:49 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Tue, Mar 17, 2020 at 05:49:41PM +0100, Daniel Vetter wrote:
> > On Fri, Mar 13, 2020 at 09:41:52AM +0100, Gerd Hoffmann wrote:
> > > Shutdown of firmware framebuffer has a bunch of problems.  Because
> > > of this the framebuffer region might still be reserved even after
> > > drm_fb_helper_remove_conflicting_pci_framebuffers() returned.
> >
> > Is that still the fbdev lifetime fun where the cleanup might be delayed if
> > the char device node is still open?
>
> Yes.

In that case I think a FIXME comment that this should be upgraded
again to a full error once fbdev unloading is fixed should be added.
With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess you might want a cc: stable on this too?
-Daniel

>
> cheers,
>   Gerd
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
