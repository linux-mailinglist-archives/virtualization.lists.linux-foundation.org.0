Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A6C154B2E
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 19:32:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E891485F5C;
	Thu,  6 Feb 2020 18:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TEXIWEZtgadd; Thu,  6 Feb 2020 18:32:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5875185F68;
	Thu,  6 Feb 2020 18:32:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 30388C013E;
	Thu,  6 Feb 2020 18:32:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB534C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CA9BA87AFE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hfBtMDi-EdBM
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:32:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 261DD87AF4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:32:50 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id x2so5974237ila.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eo58tkWzFG+QPveuoUYzk/xbxuvYMBHe+JEnvPAZ8SM=;
 b=C78D79JR83iHMAAwItqMeFqfF5QI77M9CbRJ/PUHuwKelJmXyB2Uq+2AL/wLJk3HW7
 zHtgI1OKexik0fFwZH7tQUXNcV9p78bpIFM7vzfxR1Ci9JUjSc3BqjVX89L3M7a6a/bU
 S9Wc8qrkJITb4TgIARKEOeHpPj/L3fol7twHTJiSNKs53NssrvzxxEpygWOavTHxU6/V
 lLl+QqnUQdsWlB8uRUDwz3EY6Qiz4tQtRIAp3sGBr2cUkSv7P2umSXqawyizmhhoolrd
 u/ZgBSoJLfeIY/9yzrTHXYAaUNRddrgtP2fxDoOhYosRi0W7rd5Px9eFfZTE9blQM47r
 T9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eo58tkWzFG+QPveuoUYzk/xbxuvYMBHe+JEnvPAZ8SM=;
 b=skev4SxJNWvdEyp08atadhe2GcNQjks3zpBF15QNV71iDiBA91VvlZOAhCXaZDzBOT
 lbItByTkr3neADx6O12Y9KRNQHo61zxINSDG3fObpYiGAJ2lO6tPQDKUSBSEtsSuHZg1
 5HSYx3tQoPZJLlKGJb2redZm79dUQJdIxdYKHgsyvuvn3jzb7kJt7QtxtPml35Hcpb9y
 EcR1J3SV2z4GoJpZhacoLL1nOWQCdBlZJ8UxLmtBEh6DvXYY1jipZ8o9C7lBBZW7temA
 3H6/2tDX3PSnivPDT+DwftuoqqE/vowvnsoTcoDAFec+npP2b2oHKiXyTYLXbhg+m4Gf
 Ygyg==
X-Gm-Message-State: APjAAAUmMphz38Y3FMYeG+sC6eMNJY2eTNnGLB3UK8vKzxIpBLGlRrDA
 sOPwoTAYWUKzbc1POGoK+xQa3kARNwREI4kITjA=
X-Google-Smtp-Source: APXvYqwCwRuEwlR45CzsvgbiELUaIE5822wDHqy5FFXZa8qhVDAli6WE/pbnGUoZZnSZCnYk433yOCAV900RWp3C6rA=
X-Received: by 2002:a92:4a0a:: with SMTP id m10mr5427074ilf.84.1581013969410; 
 Thu, 06 Feb 2020 10:32:49 -0800 (PST)
MIME-Version: 1.0
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-3-kraxel@redhat.com>
 <CAPaKu7SCk_3yeTtzFTTU_y-tyo8EDS7vR8i+mk829=0D-UjLQA@mail.gmail.com>
 <20200206064338.badm6ijgyo2p5mmc@sirius.home.kraxel.org>
In-Reply-To: <20200206064338.badm6ijgyo2p5mmc@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 10:32:38 -0800
Message-ID: <CAPaKu7S0E7Dm66UMkxb+3cwXuX3EXggFD0w66fv8exH4cQH==Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/virtio: resource teardown tweaks
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Gurchetan Singh <gurchetansingh@chromium.org>
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

On Wed, Feb 5, 2020 at 10:43 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > -
> > > -       drm_gem_shmem_free_object(obj);
> > > +       if (bo->created) {
> > > +               virtio_gpu_cmd_unref_resource(vgdev, bo);
> > > +               /* completion handler calls virtio_gpu_cleanup_object() */
> > nitpick: we don't need this comment when virtio_gpu_cmd_unref_cb is
> > defined by this file and passed to virtio_gpu_cmd_unref_resource.
>
> I want virtio_gpu_cmd_unref_cb + virtio_gpu_cmd_unref_resource being
> placed next to each other so it is easier to see how they work hand in
> hand.
>
> > I happen to be looking at our error handling paths.  I think we want
> > virtio_gpu_queue_fenced_ctrl_buffer to call vbuf->resp_cb on errors.
>
> /me was thinking about that too.  Yes, we will need either that,
> or a separate vbuf->error_cb callback.  That'll be another patch
> though.
Or the new virtio_gpu_queue_ctrl_sgs can return errors rather than
eating errors.

Yeah, that should be another patch.
>
> > > +       /*
> > > +        * We are in the release callback and do NOT want refcount
> > > +        * bo, so do NOT use virtio_gpu_array_add_obj().
> > > +        */
> > > +       vbuf->objs = virtio_gpu_array_alloc(1);
> > > +       vbuf->objs->objs[0] = &bo->base.base
> > This is an abuse of obj array.  Add "void *private_data;" to
> > virtio_gpu_vbuffer and use that maybe?
>
> I'd name that *cb_data, but yes, that makes sense.
Sounds great.
>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
