Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 151002B4B24
	for <lists.virtualization@lfdr.de>; Mon, 16 Nov 2020 17:30:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C34FD85E28;
	Mon, 16 Nov 2020 16:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8asXCBR1ejXv; Mon, 16 Nov 2020 16:30:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5F1FB85DD1;
	Mon, 16 Nov 2020 16:30:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51A05C07FF;
	Mon, 16 Nov 2020 16:30:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39B3DC07FF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2E4152050C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wph3UshrPI0i
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:30:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id CB43620034
 for <virtualization@lists.linux-foundation.org>;
 Mon, 16 Nov 2020 16:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yUFvC+ZrK6PRN0rtQL0QXcTBGoDM4oX8Dm71BpkV+wM=; b=rQ5Eb0gDl+z8/n2Td6rzDkxACs
 BemXonCnVeay50Gy70B/PnPwg3sUEpjhTPG9l6RdYa8NsvnUeTuEM50tGQmceYj2UfAmnVGOHJUTb
 U4rLn2oHqfeleNJYBC9GOy+AURtdfNM4/y2n3o6Bqz1zXjUETpuQRwZ+krsSb+58qKfDqSJyCbkGu
 qok1Sg6MsvhYZMhLsJ0gr4bk6BX4wiokcauSf4Zu/ePCaMTsqE2ulpMN5zBFVf2ryn3u2LRGU9Qwh
 awIzRsXoX9qbb61KX3yGdHqiqFX7Po5HNzcSYYug3yWnnaaLLL5+EWCERNDEoaLxxYKJY36/1MnZc
 UMUS094Q==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kehOY-0004dX-T1; Mon, 16 Nov 2020 16:30:22 +0000
Date: Mon, 16 Nov 2020 16:30:22 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Alexander Lobakin <alobakin@pm.me>
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201116163022.GC16619@infradead.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
 <20201116071910-mutt-send-email-mst@kernel.org>
 <u9RJBckNwnezQttAPrOyEqDYKu0rnhedUZYGpaS83qg@cp3-web-024.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <u9RJBckNwnezQttAPrOyEqDYKu0rnhedUZYGpaS83qg@cp3-web-024.plabs.ch>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Amit Shah <amit@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Arnaud Pouliquen <arnaud.pouliquen@st.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Christoph Hellwig <hch@infradead.org>, linux-remoteproc@vger.kernel.org,
 Suman Anna <s-anna@ti.com>, virtualization@lists.linux-foundation.org
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

On Mon, Nov 16, 2020 at 01:07:28PM +0000, Alexander Lobakin wrote:
> But lots of subsystems like netdev for example uses dev->parent for
> DMA operations. I know that their pointers go directly to the
> platform/PCI/etc. device, but still.

Oh, every drivers is perfectly fine to use ->parent as it suits.  The
problem is when we have layered architectures, where this pokes a
massive hole into the layering.

> The only reason behind "fake" DMA devices for rproc is to be able to
> reserve DMA memory through the Device Tree exclusively for only one
> virtio dev like virtio_console or virtio_rpmsg_bus. That's why
> they are present, are coercing DMA caps from physical dev
> representor, and why questinable dma_declare_coherent_memory()
> is still here and doesn't allow to build rproc core as a module.
> I agree that this is not the best model obviously, and we should take
> a look at it.

As far as I can tell the series from Arnaud does the right thing here.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
