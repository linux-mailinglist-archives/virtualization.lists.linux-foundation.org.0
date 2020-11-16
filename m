Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A571B2B4B0B
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 17:29:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4CFEA2050C;
	Mon, 16 Nov 2020 16:29:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7Qnhf34XoBj; Mon, 16 Nov 2020 16:28:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7987220034;
	Mon, 16 Nov 2020 16:28:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5797BC07FF;
	Mon, 16 Nov 2020 16:28:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F19A3C07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EC7CA85772
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nlNf5ia4Mzn1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:28:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 634AA85926
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=e6BIfEgLkkUxsF4JnpPb8DQA1qDtb10rWlavNgMcshc=; b=TkwDO8qI70+8k28fwxwWYA22+F
 oyOJIZthD5i8Uiq5L/C85fjaQ4tukb00LfGvBmcAXcG9RfCXGguc3eUTXTKn8SlLGxAfoKXnP1FsB
 08H/JpHSTfRTfjg3knsT+dV7hws49LNcp2145KJM6C9fBxaTytcj9KzZIjUgFio8RhHcSf5ZPuzgf
 +VjTYMxfzdzZnUVfuWVgS+qSG16pktxVQm1re3xtPqHxIHZvX6j41u80C4EjY/PDhon+DdpmVb3cP
 wI292BEj9Fegqi6XCXXT1PJ9/SpS8vy7ldK4JrXTqrfIcwp5iAeBk/GrgxxFz6F3mdOuHV3fgb5Jc
 X8CdcWsA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kehMy-0004U3-Jx; Mon, 16 Nov 2020 16:28:44 +0000
Date: Mon, 16 Nov 2020 16:28:44 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201116162844.GB16619@infradead.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
 <ca183081-5a9f-0104-bf79-5fea544c9271@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca183081-5a9f-0104-bf79-5fea544c9271@st.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, Alexander Lobakin <alobakin@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, Suman Anna <s-anna@ti.com>,
 "virtualization@lists.linux-foundation.org"
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

On Mon, Nov 16, 2020 at 11:46:59AM +0100, Arnaud POULIQUEN wrote:
> Hi all,
> 
> On 11/16/20 10:19 AM, Christoph Hellwig wrote:
> > I just noticed this showing up in Linus' tree and I'm not happy.
> > 
> > This whole model of the DMA subdevices in remoteproc is simply broken.
> > 
> > We really need to change the virtio code pass an expicit DMA device (
> > similar to what e.g. the USB and RDMA code does), instead of faking up
> > devices with broken adhoc inheritance of DMA properties and magic poking
> > into device parent relationships.
> 
> For your formation I started some stuff on my side to be able to declare the
> virtio device in DT as a remoteproc child node.
> 
> https://lkml.org/lkml/2020/4/16/1817
> 
> Quite big refactoring, but could be a way to answer...

Yes, that series is exactly what we need to do conceptually (can't
comment on all the nitty grity details as I'm not too familiar with
the remoteproc code).
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
