Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E82B662B
	for <lists.virtualization@lfdr.de>; Tue, 17 Nov 2020 15:02:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18B1F85078;
	Tue, 17 Nov 2020 14:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gsCnyIWpKUMZ; Tue, 17 Nov 2020 14:02:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8210D84E8F;
	Tue, 17 Nov 2020 14:02:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B2D4C07FF;
	Tue, 17 Nov 2020 14:02:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65C67C07FF
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 14:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5DCD7214E9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 14:02:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VquyQ4aydjx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 14:02:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id C9370203A9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Nov 2020 14:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=m0hk7B27NeOlPrLY9cJvHDlIQhUidBou/7Utsa5IK1g=; b=dmPoiDU8T3nNQ2t/waEeUgrzZI
 k5qNrx2A0lHyPcMXIWNDO0HshkfKPtpOVNdWQJYjkYcYByLttcMxJHgNzVu4a90Z78/r3OezLmBao
 FU3EuqTrqylL4pd0zDJ5wo11G8mxUPs4VesrCfSMlYHNoCE8LZ2KA5caKj2Qe+IaFAGjBLzd9eXX5
 bOQrnE7lBoJmrbAJcCv0y6TXYbj9qmzcmPHMyjfeECuKcA+1f9Yksr1Ij0vg0393q5JhoLioopfN0
 tg4wklF1HbhnUL6sdcamNXOADkGJY5O/Hh8vYDxX9NMdbEV8SIRiV2R/YnhtFWW58o2fpWe2r/FqC
 qMBg9a3w==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kf1Z0-00087I-Ri; Tue, 17 Nov 2020 14:02:30 +0000
Date: Tue, 17 Nov 2020 14:02:30 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Subject: Re: [PATCH virtio] virtio: virtio_console: fix DMA memory allocation
 for rproc serial
Message-ID: <20201117140230.GA30567@infradead.org>
References: <AOKowLclCbOCKxyiJ71WeNyuAAj2q8EUtxrXbyky5E@cp7-web-042.plabs.ch>
 <20201116091950.GA30524@infradead.org>
 <ca183081-5a9f-0104-bf79-5fea544c9271@st.com>
 <20201116162844.GB16619@infradead.org>
 <20201116163907.GA19209@infradead.org>
 <79d2eb78-caad-9c0d-e130-51e628cedaaa@st.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <79d2eb78-caad-9c0d-e130-51e628cedaaa@st.com>
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

On Tue, Nov 17, 2020 at 03:00:32PM +0100, Arnaud POULIQUEN wrote:
> The dma_declare_coherent_memory allows to associate vdev0buffer memory region
> to the remoteproc virtio device (vdev parent). This region is used to allocated
> the rpmsg buffers.
> The memory for the rpmsg buffer is allocated by the rpmsg_virtio device in
> rpmsg_virtio_bus[1]. The size depends on the total size needed for the rpmsg
> buffers.
> 
> The vrings are allocated directly by the remoteproc device.

Weird.  I thought virtio was pretty strict in not allowing diret DMA
API usage in drivers to support the legacy no-mapping case.

Either way, the point stands:  if you want these magic buffers handed
out to specific rpmsg instances I think not having to detour through the
DMA API is going to make everyones life easier.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
