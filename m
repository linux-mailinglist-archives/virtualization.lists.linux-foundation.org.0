Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BE78514012B
	for <lists.virtualization@lfdr.de>; Fri, 17 Jan 2020 01:56:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5AFC888031;
	Fri, 17 Jan 2020 00:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UiJeuWWHKBoK; Fri, 17 Jan 2020 00:56:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 65F5888018;
	Fri, 17 Jan 2020 00:56:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57ADBC077D;
	Fri, 17 Jan 2020 00:56:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E872FC077D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 00:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DA70886BAD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 00:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IaOPhDO+3G3P
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 00:56:11 +0000 (UTC)
X-Greylist: delayed 00:26:43 by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 84BB586B04
 for <virtualization@lists.linux-foundation.org>;
 Fri, 17 Jan 2020 00:56:11 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 4so11094177pfz.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 16:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Gho4j8nrfzG7IIa/FHOMHSYrFD9fBFO6dW7IZ3T+oY4=;
 b=jbhk43HgBzxIo1ehyWHQ3muHVCKVicJMw4lGK9hDDoNneH25t7nrMv/E81aXUS90/s
 3tvwCtF0XAuQrXjsOwIjUXKjNYyVv6RXJn8sJTbf2LmSn7P6svL8hVeQ5WF1FFtipGyl
 /2ioKaex4roC/Vnvketgbv7xEvV/AMxjAEG4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Gho4j8nrfzG7IIa/FHOMHSYrFD9fBFO6dW7IZ3T+oY4=;
 b=alw9sbNONWWXNGOcOXn1j99ELGkIoeueUgi+Jgkmv6kgj8cTzxWV4mEkSKAkQdBqct
 2NmJB7aGYc/gCrm8vU94QNG0IRSnSqgPxrfC+0irs1IuXkmV/m7cF51vYiT2gt+aVB2S
 NFIZXfhFo1y9Zp2MwYEoVAra5RZUXuDBrX6Sub4E72AArrt/OWg2MZvkxqgVMwru28Ov
 lJpLcAR0nwH0FO3HP+wgrj0fB7Z2RwWr+ZcsqLjj5AXeD4X3uZuvLLWsH+AwFR7/Jhmy
 U9TIlwV0WIvoM1iX4E7cmDEiiS40gCQxl2Q2p5suWjnyyLn+OIsCYOTQyJoRs9GJqCJo
 mnVQ==
X-Gm-Message-State: APjAAAXqbYDYE4ZYqNqV5hnDFSOA922YC8y8uHemH4D28IS23mOMpVUv
 7lSPRtht4UusizOv66vSwdxXKExDCJ7N3gOA
X-Google-Smtp-Source: APXvYqxP2Z2WaBH4UioHB+9TA8u7yA9J5IQZGxDpGRFn2bAKhkdPT8u9RWRLkISvPb3UIhMzZ3zSGA==
X-Received: by 2002:a17:902:8bc3:: with SMTP id
 r3mr28824480plo.220.1579219200714; 
 Thu, 16 Jan 2020 16:00:00 -0800 (PST)
Received: from dvetter-linux.ger.corp.intel.com ([138.44.248.126])
 by smtp.gmail.com with ESMTPSA id d26sm25172656pgv.66.2020.01.16.15.59.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 16:00:00 -0800 (PST)
Date: Fri, 17 Jan 2020 00:59:51 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events
 by default
Message-ID: <20200116235951.GD8400@dvetter-linux.ger.corp.intel.com>
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
 <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
X-Operating-System: Linux dvetter-linux.ger.corp.intel.com
 5.2.11-200.fc30.x86_64 
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, oleksandr_andrushchenko@epam.com,
 Dave Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Emil Velikov <emil.velikov@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, david@lechnology.com
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

On Thu, Jan 16, 2020 at 05:22:34PM +0000, Emil Velikov wrote:
> Hi all,
> 
> On Thu, 16 Jan 2020 at 07:37, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> 
> > > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > index 7cf3cf936547..23d2f51fc1d4 100644
> > > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > > @@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
> > >       /* Self refresh should be canceled when a new update is available */
> > >       state->active = drm_atomic_crtc_effectively_active(state);
> > >       state->self_refresh_active = false;
> > > +
> > > +     if (drm_dev_has_vblank(crtc->dev))
> > > +             state->no_vblank = true;
> > > +     else
> > > +             state->no_vblank = false;
> > >  }
> > >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
> >
> > I think the if/else branches are in the wrong order.

Yeah fumbled that.

> > But generally speaking, is it really that easy? The xen driver already
> > has to work around simple-kms's auto-enabling of no_vblank (see patch
> > 4). Maybe this settings interferes with other drivers as well. At least
> > the calls for sending fake vblanks should be removed from all affected
> > drivers.

Hm xen is really special, in that it has a flip complete event, but not a
vblank. I think forcing drivers to overwrite stuff in that case makes
sense.

> I'm not sure if setting no_vblank based on dev->num_crtcs is the correct thing.
> From the original commit and associated description for no_vblank:
> 
> In some cases CRTCs are active but are not able to generating events, at
> least not at every frame at it's expected to.
> This is typically the case when the CRTC is feeding a writeback connector...

Yeah, but Thomas' series here wants to extend that. And I think if we roll
this out the common case will be "no hw vblank", and the writeback special
case is going to be the exception to the exception. Yup, patch 1 that
updates the docs doesn't reflect that, which is why I'm bringing up more
suggestions here around code & semantics of all these pieces to make them
do the most reasonable thing for most of the drivers.

> Reflects the ability of a CRTC to send VBLANK events....
> 
> 
> The proposed handling of no_vblank feels a little dirty, although
> nothing better comes to mind.
> Nevertheless code seems perfectly reasonable, so if it were me I'd merge it.

The idea with setting it very early is that drivers can overwrite it very
easily. Feels slightly dirty, so I guess we could also set it somewhere in
the atomic_helper_check function (similar to how we set the various
crtc->*_changed flags, but we're not entirely consistent on these either).

For the overall thing what feels irky to me is making this no_vblank
default logic (however we end up computing it in the end, whether like
this or what I suggested) specific to simple pipe helpers feels kinda
wrong. Simple pipe tends to have a higher ratio of drivers for hw without
vblank support, but by far not the only ones. Having that special case
feels confusing to me (and likely will trip up some people, vblank and
event handling is already a huge source of confusion in drm).

One idea behind drm_dev_has_vblank() is also that we could formalize a bit
all that, at least for the usual case - xen and maybe others being some
exceptions as usual (hence definitely not something the core code should
handle).

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
