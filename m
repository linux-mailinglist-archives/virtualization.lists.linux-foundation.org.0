Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA35A3D3D
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 19:51:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0D4EA633D;
	Fri, 30 Aug 2019 17:51:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 91B5F619D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 17:49:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EB0471FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 17:49:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id l2so8303148wmg.0
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 10:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a9y5rfT6nLtA1XdTe+7F8mFNtN6YI5hHOXo6XezMGeM=;
	b=MHOAWosS69n1MZDxUnmAZoQlakafemLqnOX8xOYY8UiBq/bvmqmNbOLhBAEZGOx/H3
	EppFwORAEbQmjiKohgFOV1fCDNDfgXbB/5fpFe0bcwhibf+L5BgSkJ4IsPQsKiDRwwO5
	ORSa/SlDl7oy4nJLHwtYjPeFduAKi9JbeFOoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a9y5rfT6nLtA1XdTe+7F8mFNtN6YI5hHOXo6XezMGeM=;
	b=UjjXRx+C1orB7Tbc92CBfC/Ztqvs5BekaNuMMMSMUPQgVSSZllshJ4BZBzaVTUgqOk
	UjgBZ0cKN42Aou/s+QC+hh7CIEyp5iLNogvOE9tifm6q4sdSTpq3gRPEKO00ILPsaftM
	jZNFp+nd2/PWdnsKcNbN2U3vUV22n+UPHn5t/x2bkYwnUSsAQRJOyq0wJ2nZM9mVcEtL
	tlhwLkKuWhtfRnLWACL4tdXElR1q5xLNWjB/B2bG8KrxVkj31ClrMHQi2/GKdqVvFrAO
	/MDRZsyCLn0TLgepT2G4N0Jx12KX/xjJAzuEdJJSHPXvO8X2MGz9ZsdiXS26MgnvUF76
	dxbg==
X-Gm-Message-State: APjAAAUvD42oxLQwv53TMrPPgv42rmiupsc4Vb6JFCqXCAOKt9Tdwboo
	qxHu2twEH/i/PFkT3d2C7vu6xj++X94a0AraPtY2lQ==
X-Google-Smtp-Source: APXvYqys1bqBF6qilHbFw8ePP8Oz0kqMCC/OyqNSyE71nRg4AfWBpT/ltc4wsYnBZWUacn7ta7ZaDkRg7iZTRYkT488=
X-Received: by 2002:a1c:f702:: with SMTP id v2mr20309772wmh.114.1567187377255; 
	Fri, 30 Aug 2019 10:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
	<CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
	<20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
In-Reply-To: <20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
From: David Riley <davidriley@chromium.org>
Date: Fri, 30 Aug 2019 10:49:25 -0700
Message-ID: <CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
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

Hi Gerd,

On Fri, Aug 30, 2019 at 4:16 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > > -     kfree(vbuf->data_buf);
> > > > +     kvfree(vbuf->data_buf);
> > >
> > > if (is_vmalloc_addr(vbuf->data_buf)) ...
> > >
> > > needed here I gues?
> > >
> >
> > kvfree() handles vmalloc/kmalloc/kvmalloc internally by doing that check.
>
> Ok.
>
> > - videobuf_vmalloc_to_sg in drivers/media/v4l2-core/videobuf-dma-sg.c,
> > assumes contiguous array of scatterlist and that the buffer being converted
> > is page aligned
>
> Well, vmalloc memory _is_ page aligned.

True, but this function gets called for all potential enqueuings (eg
resource_create_3d, resource_attach_backing) and I was concerned that
some other usage in the future might not have that guarantee.  But if
that's overly being paranoid, I'm willing to backtrack on that.

> sg_alloc_table_from_pages() does alot of what you need, you just need a
> small loop around vmalloc_to_page() create a struct page array
> beforehand.

That feels like an extra allocation when under memory pressure and
more work, to not gain much -- there still needs to be a function that
iterates through all the pages.  But I don't feel super strongly about
it and can change it if you think that it will be less maintenance
overhead.

> Completely different approach: use get_user_pages() and don't copy the
> execbuffer at all.

This one I'd rather not do unless we can show that the copy is
actually a problem.  As it stands I expect this to be a fallback
instead of the regular case, and if it's not then the VMs need to
revisit how long the control queue size is.  Right now most
execbuffers end up being copied into a single contiguous buffer which
results in 3 descriptors of the virtio queue.  If vmalloc ends up
being used (which is only a fallback because vmemdup_user tries
kmalloc first still), then there'll be 66 descriptors for a 256KB
buffer.   I think that's fine for exceptional cases, but not ideal if
it was commonplace.

Chia-I suggested that we could have a flag for the ioctl execbuffer
indicating that the buffer is BO to solve that, but again I'd prefer
to see that it's actually a problem.

I'll also be moving the sg table construction out of the critical
section and properly accounting for the required number of descriptors
before entering it in response to his comments.

Thanks,
Dave
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
