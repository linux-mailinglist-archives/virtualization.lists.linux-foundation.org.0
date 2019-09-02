Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8D3A4ED7
	for <lists.virtualization@lfdr.de>; Mon,  2 Sep 2019 07:29:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 27DF1A80;
	Mon,  2 Sep 2019 05:28:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C34E672A
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 05:28:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 75EE6709
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 05:28:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F00BF307CDE7;
	Mon,  2 Sep 2019 05:28:53 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 579F55D6B7;
	Mon,  2 Sep 2019 05:28:53 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 3E46B16E08; Mon,  2 Sep 2019 07:28:52 +0200 (CEST)
Date: Mon, 2 Sep 2019 07:28:52 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Riley <davidriley@chromium.org>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190902052852.vqejjqrib6tvv2v5@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
	<CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
	<20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
	<CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASgrz0SXc2bEXq4xPCry_oHMXNbau36Q9i20anbFq1X0FsoMQ@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 02 Sep 2019 05:28:54 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
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

On Fri, Aug 30, 2019 at 10:49:25AM -0700, David Riley wrote:
> Hi Gerd,
> 
> On Fri, Aug 30, 2019 at 4:16 AM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> >   Hi,
> >
> > > > > -     kfree(vbuf->data_buf);
> > > > > +     kvfree(vbuf->data_buf);
> > > >
> > > > if (is_vmalloc_addr(vbuf->data_buf)) ...
> > > >
> > > > needed here I gues?
> > > >
> > >
> > > kvfree() handles vmalloc/kmalloc/kvmalloc internally by doing that check.
> >
> > Ok.
> >
> > > - videobuf_vmalloc_to_sg in drivers/media/v4l2-core/videobuf-dma-sg.c,
> > > assumes contiguous array of scatterlist and that the buffer being converted
> > > is page aligned
> >
> > Well, vmalloc memory _is_ page aligned.
> 
> True, but this function gets called for all potential enqueuings (eg
> resource_create_3d, resource_attach_backing) and I was concerned that
> some other usage in the future might not have that guarantee.

The vmalloc_to_sg call is wrapped into "if (is_vmalloc())", so this
should not be a problem.

> > sg_alloc_table_from_pages() does alot of what you need, you just need a
> > small loop around vmalloc_to_page() create a struct page array
> > beforehand.
> 
> That feels like an extra allocation when under memory pressure and
> more work, to not gain much -- there still needs to be a function that
> iterates through all the pages.  But I don't feel super strongly about
> it and can change it if you think that it will be less maintenance
> overhead.

Lets see how vmalloc_to_sg looks like when it assumes page-aligned
memory.  It's probably noticeable shorter then.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
