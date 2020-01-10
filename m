Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F06513783B
	for <lists.virtualization@lfdr.de>; Fri, 10 Jan 2020 22:02:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4266C884F4;
	Fri, 10 Jan 2020 21:02:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mx14BwCgwnu0; Fri, 10 Jan 2020 21:02:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C8579884F3;
	Fri, 10 Jan 2020 21:02:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8F693C0881;
	Fri, 10 Jan 2020 21:02:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 728B4C0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 21:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5A86B86BFF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 21:02:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wKl7V0YHCvCu
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 21:02:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D730486C06
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 21:02:29 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b10so3517846iof.11
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jan 2020 13:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DscpuWHCpmPvr4rJjWCNU0C+wW4iWR7q6WdgIPGNWp8=;
 b=DZNIJtWDxi/IFi9rezbRRGdt2PNteEKMx12hwXSahx8QOiYfv5QyoZqEUO/h6dY2nG
 HtYbN0XKSDT8rKy8m4E9XUoK3k8d4QEoCk51sSf7ZKTPnsGDS8Mif3kgP9ZNFg1K+qXk
 LcEY3UPe1tYogE1FsCAoO5Iz+UIzPdbrwyXfEXyetei5BsL/kj6kUWYl5fVf78wUEPDh
 4mJsUUuDU2lH5qsgNRd1M2hov480V52g3r3NyOi1eRaf3yeQ6XpzBmDLzBJ7v9pT5Idt
 PxQfxFN8fEkEWRabStaLVCog4wNnxT8rHfjnwqaWisU+oY0x0ulS0d4iVIad737zTc4U
 mMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DscpuWHCpmPvr4rJjWCNU0C+wW4iWR7q6WdgIPGNWp8=;
 b=SZyvwKNdc4S983hCEfr7wUTCfA0aTPhDVKFf8e5YJgRnchfQTPcQsJ5aLRn3Iz8U4K
 HoKlr45lmyRRVVq+zjPs0eBi+mZQSomDPN4DambET+xrtCfL9+Ghm2dxqgnzblkkeN/L
 6D/KyVrT1QXDHR5iQQuJPz/LdWemhY/vs+vTEa1KOrYqxeY7BpDuWR2jYB9ymMAf7yay
 aiVI0R6Zd1sbAgpdVpZPPRjiwax+a+Ddp/RvYPMnIiX7I42goU+1Blw8Vq+G5EmhjlrL
 mlYXwUkZRq4/8QjtrmsCFy6fB0bvl5ad2sM7dNN0lJGo/aj38qZCaNl1y6bD0ZTc3nUf
 AyJA==
X-Gm-Message-State: APjAAAX82acUprJSm+aVaJnbfZVVbQhO6sAr6FZTdgmnvxRLkhhvO/rq
 uFIiBOZSVUjZBMwUdVyJ+SYnFp7FeUjSBbHeuyw=
X-Google-Smtp-Source: APXvYqwLh4K1IfrVM9/WMlQhAf6HvRXmjNuB6U8BcycbyeLI32u6bBID/d1x4io+NNaZ/oLcomb7JELbKTP/2iO8c2Y=
X-Received: by 2002:a5d:8b96:: with SMTP id p22mr4006771iol.93.1578690149027; 
 Fri, 10 Jan 2020 13:02:29 -0800 (PST)
MIME-Version: 1.0
References: <20200110094535.23472-1-kraxel@redhat.com>
 <CAG48ez0wfLkTqdBtDBV4b1uUQMGeeAr09GPPi9WT++Fn8ph4rA@mail.gmail.com>
In-Reply-To: <CAG48ez0wfLkTqdBtDBV4b1uUQMGeeAr09GPPi9WT++Fn8ph4rA@mail.gmail.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 10 Jan 2020 13:02:17 -0800
Message-ID: <CAPaKu7TQCXOmj1zthBXq4XtNpK8WT4Rv5CwUmLrRBNwm4f0uRw@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: add missing virtio_gpu_array_lock_resv call
To: Jann Horn <jannh@google.com>
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

On Fri, Jan 10, 2020 at 6:27 AM Jann Horn <jannh@google.com> wrote:
>
> On Fri, Jan 10, 2020 at 10:45 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > When submitting a fenced command we must lock the object reservations
> > because virtio_gpu_queue_fenced_ctrl_buffer() unlocks after adding the
> > fence.
>
> Thanks a lot! With this patch applied, my VM doesn't throw lockdep
> warnings anymore. If you want, you can add:
>
> Tested-by: Jann Horn <jannh@google.com>
>
> > Reported-by: Jann Horn <jannh@google.com>
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> > ---
> >  drivers/gpu/drm/virtio/virtgpu_plane.c | 1 +
> >  1 file changed, 1 insertion(+)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
