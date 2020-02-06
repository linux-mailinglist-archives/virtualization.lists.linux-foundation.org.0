Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF61154B56
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 19:41:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 188A2203F9;
	Thu,  6 Feb 2020 18:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wk9R3pTwmk3B; Thu,  6 Feb 2020 18:41:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7AE64203BF;
	Thu,  6 Feb 2020 18:41:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A3E8C013E;
	Thu,  6 Feb 2020 18:41:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 037D7C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DFEAB86749
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:41:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uGZji3Qybizk
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:41:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 425CB86483
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 18:41:51 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id l4so6057308ilj.1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 10:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rvfv9s/3mm0fiIdqT4gq2TIV6qswfw3gcSHxln5Qesg=;
 b=EvstfC2C+SB/UiURgygiLq5HrwrbptH4mgesLSEhapDxG97zndtPhgViZiqgl4Glmp
 sGqdACNG2iQfQgQz6LVZdzHl/uPm3O6aRtkKfZngKCMJKvttmKl3/csBAjlcy97CCS5U
 0W8n6coud4RguAe6BS9SOmXB2QRPd0cvK9qNM1uSouk7DX5yDlOK6HHuTs4Sk7rCCfmw
 Lr9vfKxVcDSLGXyGeyHF1oemrcenaY7RNXhhute37l/qxRI5mPORFGiUnUE/5//QI1A1
 dBcRyC/KgLgBtg7iPUKkY7Q7OAcBTtTKy05hxRB44vBxv5m5pUZzdVW/1n/upw3isDoc
 9vGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rvfv9s/3mm0fiIdqT4gq2TIV6qswfw3gcSHxln5Qesg=;
 b=lGu+S1MVxGmLjQ4Bw2hKaTFrlqBfk1sxV0bqHnAKxVgSFnxqIMGnqCmprI//dV3TM4
 ISouqBdwY3alJj4vbd7VPSr2tasfsMbzwMnu+iPcXwHF7HR+QejqIGhXK2KzpoVlRkqr
 YgVNFLESXV174rBQwo6/c2o/8LAduyFBdEd50BNwlaHsLjy9WrA0h38uESqZzHMs0BQi
 T8alhvdHgnwAVJLH0GZwGzwUyL7b0bZe7vICSXA7C7TyqvqZZu2OvI6ROMR7pJgGESnR
 ZlTxDsAXbhw7BouZB5CYB1tBHE2w9/1Esa4sXz8tY5dnhx3Z6tYR/2o9BlSbRV4O+R8b
 LZ9Q==
X-Gm-Message-State: APjAAAWlSsu7ZwIJ+KYazmsXkhv7Tf0iDdRLLtF3W7KHKXxbHPUYW8Ea
 0rBp6JZ6M6ervAOqX7YTmMw2TnIVkS5B2t9b5YU=
X-Google-Smtp-Source: APXvYqw/HdiF1QLiDq8FBR9ivWT4hH47VQKvqmRG8CV2Fh4h6/Y5ruVY2lyZwJyJBSbPZCdA81XhI1OmVffIWLIcKNI=
X-Received: by 2002:a92:84ce:: with SMTP id y75mr5203539ilk.93.1581014510574; 
 Thu, 06 Feb 2020 10:41:50 -0800 (PST)
MIME-Version: 1.0
References: <20200205105955.28143-1-kraxel@redhat.com>
 <20200205105955.28143-5-kraxel@redhat.com>
 <CAPaKu7RxijC_oS4GPukS9wEe9gn8DPQgaGZKwG6g8M8xwTnsig@mail.gmail.com>
 <20200206085540.pa6py4ieoi242gma@sirius.home.kraxel.org>
In-Reply-To: <20200206085540.pa6py4ieoi242gma@sirius.home.kraxel.org>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Thu, 6 Feb 2020 10:41:39 -0800
Message-ID: <CAPaKu7RDZYnpjFB-Vou0RwiDGCxrD4ak2vLEf89UupdYm59ZYw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/virtio: move virtio_gpu_mem_entry initialization
 to new function
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

On Thu, Feb 6, 2020 at 12:55 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > >         virtio_gpu_cmd_resource_attach_backing(vgdev, obj->hw_res_handle,
> > > -                                              ents, nents,
> > > +                                              obj->ents, obj->nents,
> > >                                                fence);
> > > +       obj->ents = NULL;
> > > +       obj->nents = 0;
> > Hm, if the entries are temporary, can we allocate and initialize them
> > in this function?
>
> Well, the plan for CREATE_RESOURCE_BLOB is to use obj->ents too ...
Is obj->ents needed after CREATE_RESOURCE_BLOB?  If not, having yet
another helper

  ents = virtio_gpu_object_alloc_mem_entries(..., &count);

seems cleaner.  We would also be able to get rid of virtio_gpu_object_attach.

>
> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
