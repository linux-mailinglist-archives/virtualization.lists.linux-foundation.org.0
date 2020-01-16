Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A9E13E6C1
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 18:22:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B6CA8641E;
	Thu, 16 Jan 2020 17:22:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ITxopq-9z46I; Thu, 16 Jan 2020 17:22:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 36B3A864BD;
	Thu, 16 Jan 2020 17:22:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16A07C077D;
	Thu, 16 Jan 2020 17:22:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10CCDC077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0C2D220341
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-kEWZZh4qDG
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:22:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 970C320030
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:22:08 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id c7so7904417uaf.5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 09:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hjlPO7BPZ/JlQoLqlUXvQTlJfTAbQfDZ8K8Uze8BU/s=;
 b=YKMxolQBt/5TtzXuM46+gh9+XoXFQUxQh/cVpqTPRL0MhbKQNmtAXQKA013/fyOecO
 w136SaOLrnBnJBQtcqo0CSjSuaDQjPv55UatHkkhtYeF88FMZL8rGhX9mMFc9grHdBXe
 9SuUZBrHr+8b/qwPkCSb4ftodkLJBP1DGWj0o28IQuMPz7nOqJ//eyp+S2oLV/hf1FkZ
 U6ayL/rVh/7ZtcFiYIHF6p1z9xQAcb+9jsVzlmo4YgRCaVHQ4ESCv1TfZvGT8NrH9sLu
 TrKfjOztyqm3R0nOU3nG9D/tKkM9/NO+NWzfV/+d2Pk0xorsvpuk5/1tENmSDHf+cGTy
 IG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hjlPO7BPZ/JlQoLqlUXvQTlJfTAbQfDZ8K8Uze8BU/s=;
 b=cO51OPohPY/SsKG9yqvZNRhXz8nWWqVWFJUMYKc4zb2gTLLEuOZuY97pSAqnNdtYQJ
 Npz+jrPAken3IZ6+wOLfhucFBuvezyD1sjnhgRXDg1vluNK0MkqusXhH5GckZGzH3PPZ
 FrnxSHfNfnB8OEiutZJyi+s6tIzdba9YH6XhsfAK5u2LYDlNdLU6c1IAzj/b56/a3Hdg
 v8swyftrZvwZ8aWerNJ4xegRNG/bgXxbXUpipwHlvkJQpoDHJgmEhwSIxoZ4cRyouv3Y
 ygyJA7FegIuqy9IApXEYTTjmMjeOQMvdlZRO0TBW76eeyzEgA6iBu3B5Ga1IL5ruwm1w
 y5cw==
X-Gm-Message-State: APjAAAX2fkiqQ9dSyL5xxDODd0n1W/Jc40NIFH9p9oT6uyWLK6PyP5cZ
 u8yFNdS/CrG77nRIPdF/kqelLfTv3X4UWQFfqHs=
X-Google-Smtp-Source: APXvYqyZHt1bqJYkRt6MbFegAzbw6GywWUBqaQuyP76aQnU4RRq0QOEI8YeE5E4qQi+Z4gewiSopIQgd5bPceS0uhj4=
X-Received: by 2002:ab0:14a2:: with SMTP id d31mr18349536uae.106.1579195327403; 
 Thu, 16 Jan 2020 09:22:07 -0800 (PST)
MIME-Version: 1.0
References: <20200115125226.13843-1-tzimmermann@suse.de>
 <20200115125226.13843-5-tzimmermann@suse.de>
 <20200116064107.GB8400@dvetter-linux.ger.corp.intel.com>
 <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
In-Reply-To: <33fdd33f-ce8d-70d3-544e-fac727d2686b@suse.de>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 16 Jan 2020 17:22:34 +0000
Message-ID: <CACvgo52gwC6U5HjnsQSUUDgE7Gp_EDb-QqCY8VDFjAX7cE0Lxg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/simple-kms: Let DRM core send VBLANK events by
 default
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, david@lechnology.com,
 oleksandr_andrushchenko@epam.com, Dave Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
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

Hi all,

On Thu, 16 Jan 2020 at 07:37, Thomas Zimmermann <tzimmermann@suse.de> wrote:

> > diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
> > index 7cf3cf936547..23d2f51fc1d4 100644
> > --- a/drivers/gpu/drm/drm_atomic_state_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_state_helper.c
> > @@ -149,6 +149,11 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
> >       /* Self refresh should be canceled when a new update is available */
> >       state->active = drm_atomic_crtc_effectively_active(state);
> >       state->self_refresh_active = false;
> > +
> > +     if (drm_dev_has_vblank(crtc->dev))
> > +             state->no_vblank = true;
> > +     else
> > +             state->no_vblank = false;
> >  }
> >  EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
>
> I think the if/else branches are in the wrong order.
>
> But generally speaking, is it really that easy? The xen driver already
> has to work around simple-kms's auto-enabling of no_vblank (see patch
> 4). Maybe this settings interferes with other drivers as well. At least
> the calls for sending fake vblanks should be removed from all affected
> drivers.
>

I'm not sure if setting no_vblank based on dev->num_crtcs is the correct thing.
From the original commit and associated description for no_vblank:

In some cases CRTCs are active but are not able to generating events, at
least not at every frame at it's expected to.
This is typically the case when the CRTC is feeding a writeback connector...

Reflects the ability of a CRTC to send VBLANK events....


The proposed handling of no_vblank feels a little dirty, although
nothing better comes to mind.
Nevertheless code seems perfectly reasonable, so if it were me I'd merge it.

HTH
Emil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
