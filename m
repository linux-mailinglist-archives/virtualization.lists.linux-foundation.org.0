Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EEA3BC627
	for <lists.virtualization@lfdr.de>; Tue,  6 Jul 2021 07:42:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E92148316F;
	Tue,  6 Jul 2021 05:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pBaONzGLmML; Tue,  6 Jul 2021 05:42:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DD13F831EF;
	Tue,  6 Jul 2021 05:42:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6232CC0022;
	Tue,  6 Jul 2021 05:42:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E059EC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 05:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0A1A60692
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 05:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvrM56e5yyr4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 05:42:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26C4460603
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 05:42:07 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AE7AF68BEB; Tue,  6 Jul 2021 07:42:03 +0200 (CEST)
Date: Tue, 6 Jul 2021 07:42:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Subject: Re: [PATCH V2 5/6] virtio: add one field into virtio_device for
 recording if device uses managed irq
Message-ID: <20210706054203.GC17027@lst.de>
References: <20210702150555.2401722-1-ming.lei@redhat.com>
 <20210702150555.2401722-6-ming.lei@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702150555.2401722-6-ming.lei@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 John Garry <john.garry@huawei.com>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Daniel Wagner <dwagner@suse.de>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wen Xiong <wenxiong@us.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
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

On Fri, Jul 02, 2021 at 11:05:54PM +0800, Ming Lei wrote:
> blk-mq needs to know if the device uses managed irq, so add one field
> to virtio_device for recording if device uses managed irq.
> 
> If the driver use managed irq, this flag has to be set so it can be
> passed to blk-mq.

I don't think all this boilerplate code make a whole lot of sense.
I think we need to record this information deep down in the irq code by
setting a flag in struct device only if pci_alloc_irq_vectors_affinity
atually managed to allocate multiple vectors and the PCI_IRQ_AFFINITY
flag was set.  Then blk-mq can look at that flag, and also check that
more than one queue is in used and work based on that.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
