Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D40A1228022
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 14:42:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 85A8688717;
	Tue, 21 Jul 2020 12:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t0Grv+xxnW4y; Tue, 21 Jul 2020 12:42:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F14B18870E;
	Tue, 21 Jul 2020 12:42:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9740C016F;
	Tue, 21 Jul 2020 12:42:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 58BDCC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3DCB986DC9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:42:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azEhJ_cBfie5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:42:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5143586BB1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595335342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sxEWR5e+zFYMBJOOuaa+SYdRZddlN9HI1DKBH6wob58=;
 b=ZRTvmXSz7Rh+hPT0fQAvmYiDjwXPM+ti/tOaKzGp6FVMRz3Q8Lekog1wEFY1v5wTpHRbCU
 2OMkIf4g9pOflXTvHshxcY2cM+IbyRmobhCZagQiDqJWzOWJNgtME82sR1DHPhavU4NLrb
 10M9jw4Q3LVcUFTB0Ugkeu9TBwUgooI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263--3BfRSnxPBiIkZC8r_aHkQ-1; Tue, 21 Jul 2020 08:42:20 -0400
X-MC-Unique: -3BfRSnxPBiIkZC8r_aHkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35D7780047E;
 Tue, 21 Jul 2020 12:42:16 +0000 (UTC)
Received: from starship (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1F9870105;
 Tue, 21 Jul 2020 12:42:08 +0000 (UTC)
Message-ID: <435f1c04b58bd2298be3166b7bab458640927118.camel@redhat.com>
Subject: Re: [PATCH 05/10] block: null: use blk_is_valid_logical_block_size
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Tue, 21 Jul 2020 15:42:07 +0300
In-Reply-To: <CY4PR04MB3751882A6BDF7C073D6ECF88E7780@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-6-mlevitsk@redhat.com>
 <CY4PR04MB3751882A6BDF7C073D6ECF88E7780@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

On Tue, 2020-07-21 at 11:15 +0000, Damien Le Moal wrote:
> On 2020/07/21 19:54, Maxim Levitsky wrote:
> > This slightly changes the behavier of the driver,
> 
> s/behavier/behavior
Thanks. This is one of the typos I make very consistently.

> 
> > when given invalid block size (non power of two, or below 512 bytes),
> > but shoudn't matter.
> > 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  drivers/block/null_blk_main.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
> > index 87b31f9ca362e..e4df4b903b90b 100644
> > --- a/drivers/block/null_blk_main.c
> > +++ b/drivers/block/null_blk_main.c
> > @@ -1684,8 +1684,8 @@ static int null_init_tag_set(struct nullb *nullb, struct blk_mq_tag_set *set)
> >  
> >  static int null_validate_conf(struct nullb_device *dev)
> >  {
> > -	dev->blocksize = round_down(dev->blocksize, 512);
> > -	dev->blocksize = clamp_t(unsigned int, dev->blocksize, 512, 4096);
> > +	if (!blk_is_valid_logical_block_size(dev->blocksize))
> > +		return -ENODEV;
> >  
> >  	if (dev->queue_mode == NULL_Q_MQ && dev->use_per_node_hctx) {
> >  		if (dev->submit_queues != nr_online_nodes)
> > @@ -1865,7 +1865,7 @@ static int __init null_init(void)
> >  	struct nullb *nullb;
> >  	struct nullb_device *dev;
> >  
> > -	if (g_bs > PAGE_SIZE) {
> > +	if (!blk_is_valid_logical_block_size(g_bs)) {
> >  		pr_warn("invalid block size\n");
> >  		pr_warn("defaults block size to %lu\n", PAGE_SIZE);
> >  		g_bs = PAGE_SIZE;
> 
> Not sure if this change is OK. Shouldn't the if here be kept as is and
> blk_is_valid_logical_block_size() called after it to check values lower than 4K ?

The thing is that this driver supports two ways of creating the block devices.
On module load it creates by default a single block device and it uses g_bs
as its block size, but then it also has configfs based interface that allows
to create more block devices.

The default is taken also from g_bs but then user can change it (
via those NULLB_DEVICE_ATTR wrappers)
I changed the behavior slightly, that now if user supplies bad value,
it will be rejected instead of finding closest valid value.

In addition to that there is very small bug that didn't bother to fix in
this series (but I will in next one). The bug is that when null_validate_conf
fails, it return value is overriden with -ENOMEM, which gives the user a wrong
error message.

Thanks for the review!

Best regards,
	Maxim Levitsky

> 
> 


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
