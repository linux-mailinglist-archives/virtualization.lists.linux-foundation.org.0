Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B3790227E56
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 13:09:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6084E88C3D;
	Tue, 21 Jul 2020 11:09:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n2K+VVjMd1Ea; Tue, 21 Jul 2020 11:09:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0B0F188C3C;
	Tue, 21 Jul 2020 11:09:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E49F8C016F;
	Tue, 21 Jul 2020 11:09:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41C6BC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2FD90874FB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:09:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UC62o4GIjh3S
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:09:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 69AD4874F7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 11:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595329778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LZAXnntkLhkcLOqby4Ic/aYn82wdCMM/OIUvTatqoM=;
 b=dVOa77PM4ud5nbCIf7p1r5qvtycTTGku76Xj09ycLD0HBpcmXvvhuW2Yn1QZL1JjL40MVK
 RhckOly8Es8jPqHSpuRIEHbBYhsybungVYCeXN7Ypf0KT1taZCMvq9xcyK8R88PbrioIRJ
 3YRzbkOhk7YcANaqKy2K/8RaXziCq2I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-5iDd30yMNTuz4Sd4x5-MNA-1; Tue, 21 Jul 2020 07:09:36 -0400
X-MC-Unique: 5iDd30yMNTuz4Sd4x5-MNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 673A9100AA23;
 Tue, 21 Jul 2020 11:09:33 +0000 (UTC)
Received: from starship (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEC5F1755E;
 Tue, 21 Jul 2020 11:09:17 +0000 (UTC)
Message-ID: <cef747910431d81524e455e6380df1c610d1884c.camel@redhat.com>
Subject: Re: [PATCH 01/10] block: introduce blk_is_valid_logical_block_size
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Tue, 21 Jul 2020 14:09:16 +0300
In-Reply-To: <CY4PR04MB37512BDEFD7B977FCD32A10AE7780@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-2-mlevitsk@redhat.com>
 <CY4PR04MB37512BDEFD7B977FCD32A10AE7780@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "open list:NVM EXPRESS
 DRIVER" <linux-nvme@lists.infradead.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>, Hou Tao <houtao1@huawei.com>,
 Christoph Hellwig <hch@lst.de>, Maxim Levitsky <maximlevitsky@gmail.com>,
 "open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Ajay Joshi <Ajay.Joshi@wdc.com>,
 Alex Dubov <oakad@yahoo.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Keith Busch <kbusch@kernel.org>,
 "open list:NETWORK BLOCK
 DEVICE \(NBD\)" <nbd@other.debian.org>, Bart Van Assche <bvanassche@acm.org>,
 Sagi Grimberg <sagi@grimberg.me>, Jens Axboe <axboe@kernel.dk>,
 Jens Axboe <axboe@fb.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:SONY
 MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>, Tejun Heo <tj@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, 2020-07-21 at 11:05 +0000, Damien Le Moal wrote:
> On 2020/07/21 19:53, Maxim Levitsky wrote:
> > Kernel block layer has never supported logical block
> > sizes less that SECTOR_SIZE nor larger that PAGE_SIZE.
> > 
> > Some drivers have runtime configurable block size,
> > so it makes sense to have common helper for that.
> 
> ...common helper to check the validity of the logical block size set by the driver.
Agree, will fix.
> 
> ("for that" does not refer to a clear action)
> 
> > Signed-off-by: Maxim Levitsky  <mlevitsk@redhat.com>
> > ---
> >  block/blk-settings.c   | 18 ++++++++++++++++++
> >  include/linux/blkdev.h |  1 +
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/block/blk-settings.c b/block/blk-settings.c
> > index 9a2c23cd97007..3c4ef0d00c2bc 100644
> > --- a/block/blk-settings.c
> > +++ b/block/blk-settings.c
> > @@ -311,6 +311,21 @@ void blk_queue_max_segment_size(struct request_queue *q, unsigned int max_size)
> >  }
> >  EXPORT_SYMBOL(blk_queue_max_segment_size);
> >  
> > +
> > +/**
> > + * blk_check_logical_block_size - check if logical block size is supported
> > + * by the kernel
> > + * @size:  the logical block size, in bytes
> > + *
> > + * Description:
> > + *   This function checks if the block layers supports given block size
> > + **/
> > +bool blk_is_valid_logical_block_size(unsigned int size)
> > +{
> > +	return size >= SECTOR_SIZE && size <= PAGE_SIZE && !is_power_of_2(size);
Note here a typo, made in last minute change which I didn't test.
It should be without '!'

Best regards,
	Maxim Levitsky

> > +}
> > +EXPORT_SYMBOL(blk_is_valid_logical_block_size);
> > +
> >  /**
> >   * blk_queue_logical_block_size - set logical block size for the queue
> >   * @q:  the request queue for the device
> > @@ -323,6 +338,8 @@ EXPORT_SYMBOL(blk_queue_max_segment_size);
> >   **/
> >  void blk_queue_logical_block_size(struct request_queue *q, unsigned int size)
> >  {
> > +	WARN_ON(!blk_is_valid_logical_block_size(size));
> > +
> >  	q->limits.logical_block_size = size;
> >  
> >  	if (q->limits.physical_block_size < size)
> > @@ -330,6 +347,7 @@ void blk_queue_logical_block_size(struct request_queue *q, unsigned int size)
> >  
> >  	if (q->limits.io_min < q->limits.physical_block_size)
> >  		q->limits.io_min = q->limits.physical_block_size;
> > +
> 
> white line change.
> 
> >  }
> >  EXPORT_SYMBOL(blk_queue_logical_block_size);
> >  
> > diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> > index 57241417ff2f8..2ed3151397e41 100644
> > --- a/include/linux/blkdev.h
> > +++ b/include/linux/blkdev.h
> > @@ -1099,6 +1099,7 @@ extern void blk_queue_max_write_same_sectors(struct request_queue *q,
> >  		unsigned int max_write_same_sectors);
> >  extern void blk_queue_max_write_zeroes_sectors(struct request_queue *q,
> >  		unsigned int max_write_same_sectors);
> > +extern bool blk_is_valid_logical_block_size(unsigned int size);
> >  extern void blk_queue_logical_block_size(struct request_queue *, unsigned int);
> >  extern void blk_queue_max_zone_append_sectors(struct request_queue *q,
> >  		unsigned int max_zone_append_sectors);
> > 
> 
> 


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
