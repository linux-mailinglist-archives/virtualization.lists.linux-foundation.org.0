Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6793BC780
	for <lists.virtualization@lfdr.de>; Tue,  6 Jul 2021 09:54:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EDE240364;
	Tue,  6 Jul 2021 07:54:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1I7_uLQxnYK; Tue,  6 Jul 2021 07:54:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 02760403DE;
	Tue,  6 Jul 2021 07:54:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AA11C0022;
	Tue,  6 Jul 2021 07:54:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17A1DC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E82B560768
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4FsAmdu_ZlLA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:54:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B97306071A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Jul 2021 07:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625558043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8ux+PSgT2GR6+4EgHNJBMyL9fh1iK5spRQecJIWp478=;
 b=OYyz9OT2WFfNzwwLAQg1WqFB9FCh0xr9efx9MFmhOMR+vZJQ/THA0TeTOdg6MQ3tZQTcGt
 SnQimtRDAOxGExjIvhNDo+RX3cnLIIyTa6S1XYjvsLnFchIdM1MKqb1R8q5bgVXuh6wHKx
 amIW2SM8++pRikW5eZTGD1YoXjUpeeo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-_18DDJ-UNGCsMLIxyYEdRQ-1; Tue, 06 Jul 2021 03:54:01 -0400
X-MC-Unique: _18DDJ-UNGCsMLIxyYEdRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 756188030B0;
 Tue,  6 Jul 2021 07:53:59 +0000 (UTC)
Received: from T590 (ovpn-12-27.pek2.redhat.com [10.72.12.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F1FCF5D9DE;
 Tue,  6 Jul 2021 07:53:43 +0000 (UTC)
Date: Tue, 6 Jul 2021 15:53:39 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V2 5/6] virtio: add one field into virtio_device for
 recording if device uses managed irq
Message-ID: <YOQMAwE0HPh0rzby@T590>
References: <20210702150555.2401722-1-ming.lei@redhat.com>
 <20210702150555.2401722-6-ming.lei@redhat.com>
 <20210706054203.GC17027@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706054203.GC17027@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 Sagi Grimberg <sagi@grimberg.me>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Garry <john.garry@huawei.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Daniel Wagner <dwagner@suse.de>, Wen Xiong <wenxiong@us.ibm.com>
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

On Tue, Jul 06, 2021 at 07:42:03AM +0200, Christoph Hellwig wrote:
> On Fri, Jul 02, 2021 at 11:05:54PM +0800, Ming Lei wrote:
> > blk-mq needs to know if the device uses managed irq, so add one field
> > to virtio_device for recording if device uses managed irq.
> > 
> > If the driver use managed irq, this flag has to be set so it can be
> > passed to blk-mq.
> 
> I don't think all this boilerplate code make a whole lot of sense.
> I think we need to record this information deep down in the irq code by
> setting a flag in struct device only if pci_alloc_irq_vectors_affinity
> atually managed to allocate multiple vectors and the PCI_IRQ_AFFINITY
> flag was set.  Then blk-mq can look at that flag, and also check that
> more than one queue is in used and work based on that.

How can blk-mq look at that flag? Usually blk-mq doesn't play with
physical device(HBA).

So far almost all physically properties(segment, max_hw_sectors, ...)
are not provided to blk-mq directly, instead by queue limits abstract.

Thanks,
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
