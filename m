Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B2EA749A
	for <lists.virtualization@lfdr.de>; Tue,  3 Sep 2019 22:28:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2986DFAB;
	Tue,  3 Sep 2019 20:27:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8214EC77
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 20:27:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 41082712
	for <virtualization@lists.linux-foundation.org>;
	Tue,  3 Sep 2019 20:27:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id k1so873530wmi.1
	for <virtualization@lists.linux-foundation.org>;
	Tue, 03 Sep 2019 13:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/b2QHbCNP+aT9un1NN+bENpn3vUoUF45wJf6gW6ANh0=;
	b=GCMat47+ln2ZL+YdHP0Tk7eE6pnHP0TvcZwh5LKi/Mw6LL7vl/KQy9uPMwMikh2YTc
	8nkINnJeY/vz1F42wZNhvV1MpdoTOcNMgjQfPgLTWju+e2zSZdyRSVoZ9us5Pe+xpQVZ
	gSwMG+cj4PS7ZvMY617QkEGh8fuckVn0Ahbzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/b2QHbCNP+aT9un1NN+bENpn3vUoUF45wJf6gW6ANh0=;
	b=sbEwSaQjsZc8b13t0Yc+Uhcl33vO4hdFBHixEnrNSDgUrcNTU5Nv0XzFBwEBVIg9pG
	TwKksgbKNBJfYEEBnUOr+WLANVLfNqOWiaEdjqrTZs0FyveUYT+Nx7FbhpysWZavNYgd
	pME5ZqQRpRoJXnfPgymOL689kp9sCjYlHqc6bxPRg2yKokogZ41sGN5QUj90psLhwDTf
	PUCmvCQxJUve4GLP6jyg/w5yxf3IJkqWjnZTnb1VlRgIZMqSjlmJxYjGoYDTRNgdxmYP
	y2M33OW8cefQdKLekXoli5p0iq2EZxH8Q67ye7Gi3MubTZGOBaujbHK4hRLQ9YI3Z9Wi
	D4bw==
X-Gm-Message-State: APjAAAXdjJGIhcvSlTO1jwGz98iU3e534O5eD5emaFydlh3G0TtnkSVc
	fdvuSQdTNnWF6dmy9i8JCLkFnaUcCCkqg2zy0I7AXg==
X-Google-Smtp-Source: APXvYqwf5YJGifCM+NEVFPPjuCChvoU5yCQm/Yq9u+hrQ8LuXqKbrI/Jc5ugnZkobaG2J3YOiX6RhsCZ32+T8arEsTs=
X-Received: by 2002:a7b:c8ca:: with SMTP id f10mr1364009wml.36.1567542469567; 
	Tue, 03 Sep 2019 13:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
	<CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
	<20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
	<CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
	<20190902052852.vqejjqrib6tvv2v5@sirius.home.kraxel.org>
In-Reply-To: <20190902052852.vqejjqrib6tvv2v5@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Tue, 3 Sep 2019 13:27:37 -0700
Message-ID: <CAASgrz1GKRGncD_6aDUKnDuBiZpZOjkP0P62Ukmk+DN6csKm7w@mail.gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
To: Gerd Hoffmann <kraxel@redhat.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
	virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Sun, Sep 1, 2019 at 10:28 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> On Fri, Aug 30, 2019 at 10:49:25AM -0700, David Riley wrote:
> > Hi Gerd,
> >
> > On Fri, Aug 30, 2019 at 4:16 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > >   Hi,
> > >
> > > > > > -     kfree(vbuf->data_buf);
> > > > > > +     kvfree(vbuf->data_buf);
> > > > >
> > > > > if (is_vmalloc_addr(vbuf->data_buf)) ...
> > > > >
> > > > > needed here I gues?
> > > > >
> > > >
> > > > kvfree() handles vmalloc/kmalloc/kvmalloc internally by doing that check.
> > >
> > > Ok.
> > >
> > > > - videobuf_vmalloc_to_sg in drivers/media/v4l2-core/videobuf-dma-sg.c,
> > > > assumes contiguous array of scatterlist and that the buffer being converted
> > > > is page aligned
> > >
> > > Well, vmalloc memory _is_ page aligned.
> >
> > True, but this function gets called for all potential enqueuings (eg
> > resource_create_3d, resource_attach_backing) and I was concerned that
> > some other usage in the future might not have that guarantee.
>
> The vmalloc_to_sg call is wrapped into "if (is_vmalloc())", so this
> should not be a problem.
>
> > > sg_alloc_table_from_pages() does alot of what you need, you just need a
> > > small loop around vmalloc_to_page() create a struct page array
> > > beforehand.
> >
> > That feels like an extra allocation when under memory pressure and
> > more work, to not gain much -- there still needs to be a function that
> > iterates through all the pages.  But I don't feel super strongly about
> > it and can change it if you think that it will be less maintenance
> > overhead.
>
> Lets see how vmalloc_to_sg looks like when it assumes page-aligned
> memory.  It's probably noticeable shorter then.

It's not really.  The allocation of the table is one unit less, and
doesn't need to take into account that data might be an offset within
the page.  It still needs error handling, partial final page handling,
and marking of the end of the scatterlist.  Things could be slightly
simplified to assume that you can always get a contiguous allocation
of the table instead of using sg_alloc_table/for_each_sg, but given
that we're only going down this path when memory is fragmented and in
a fallback, doesn't seem worthwhile to make that trade-off.

I've written a different version of vmalloc_to_sgt which uses
sg_alloc_table_from_pages under the covers and it comes in slightly
shorter (39 lines vs 55 lines), but incurs another allocation as
previously so I'm personally in favour of things as written.
fpga_mgr_buf_load is another function which roughly does the same sort
of operation and it's a bit longer.

I'll post a v2 shortly, but if you think it's worth making the extra
allocation of the pages array to use, I can post that instead.

> cheers,
>   Gerd
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
