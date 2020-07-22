Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0502293F5
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 10:50:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3DC848813D;
	Wed, 22 Jul 2020 08:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id clwFUdf9LXgL; Wed, 22 Jul 2020 08:50:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E9098810D;
	Wed, 22 Jul 2020 08:50:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C3BDC004C;
	Wed, 22 Jul 2020 08:50:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5806C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B27128821B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:50:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NYpvLWRe309e
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:50:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 194448781C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595407850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H24R8qVAxwYFcsepHzRqkh8E1U4cEvx3I96Wl9ElKtQ=;
 b=dToKlsajvwNGdihfbGpWk+z3N0yzQ86VouiasiyTvrbeb09VwVCGgr3QV9Vx2MwjUW3qhx
 1/uMSx16Z61P4q9C+e1TxhlaZeLZlFv9BL6J2VNZYr7bPoiC5Me/sfXwALsevqU02bJabE
 LS+HZGjdo/u4zsLPK7zqHHs/smOdEuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-M4qKbPESN9G2w4ycP9uygQ-1; Wed, 22 Jul 2020 04:50:46 -0400
X-MC-Unique: M4qKbPESN9G2w4ycP9uygQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13A376C2F3;
 Wed, 22 Jul 2020 08:50:34 +0000 (UTC)
Received: from fedora-32-enviroment (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3615969317;
 Wed, 22 Jul 2020 08:50:27 +0000 (UTC)
Message-ID: <c9124b5487ed51e02dc9264fa8c87b93313fa68f.camel@redhat.com>
Subject: Re: [PATCH 01/10] block: introduce blk_is_valid_logical_block_size
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Wed, 22 Jul 2020 11:50:26 +0300
In-Reply-To: <20200721151313.GA10620@lst.de>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-2-mlevitsk@redhat.com> <20200721151313.GA10620@lst.de>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
 "open list:VIRTIO CORE
 AND NET DRIVERS" <virtualization@lists.linux-foundation.org>,
 Hou Tao <houtao1@huawei.com>, Sagi Grimberg <sagi@grimberg.me>,
 "open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Ajay Joshi <ajay.joshi@wdc.com>,
 Alex Dubov <oakad@yahoo.com>, "James E.J.
 Bottomley" <jejb@linux.ibm.com>, Josef Bacik <josef@toxicpanda.com>,
 Ming Lei <ming.lei@redhat.com>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Keith Busch <kbusch@kernel.org>,
 "open list:NETWORK BLOCK DEVICE \(NBD\)" <nbd@other.debian.org>,
 Bart Van Assche <bvanassche@acm.org>, Maxim Levitsky <maximlevitsky@gmail.com>,
 Jens Axboe <axboe@kernel.dk>, Jens Axboe <axboe@fb.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:SONY MEMORYSTICK SUBSYSTEM" <linux-mmc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>,
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

On Tue, 2020-07-21 at 17:13 +0200, Christoph Hellwig wrote:
> > +/**
> > + * blk_check_logical_block_size - check if logical block size is
> > supported
> > + * by the kernel
> > + * @size:  the logical block size, in bytes
> > + *
> > + * Description:
> > + *   This function checks if the block layers supports given block
> > size
> > + **/
> > +bool blk_is_valid_logical_block_size(unsigned int size)
> > +{
> > +	return size >= SECTOR_SIZE && size <= PAGE_SIZE &&
> > !is_power_of_2(size);
> 
> Shouldn't this be a ... && is_power_of_2(size)?
Yep. I noticed that few minutes after I sent the patches.

> 
> >  	if (q->limits.io_min < q->limits.physical_block_size)
> >  		q->limits.io_min = q->limits.physical_block_size;
> > +
> >  }
> 
> This adds a pointless empty line.
Will fix.
> 
> > +extern bool blk_is_valid_logical_block_size(unsigned int size);
> 
> No need for externs on function declarations.
I also think so, but I followed the style of all existing function
prototypes in this file. Most of them have 'extern'.

Thanks for the review!

Best regards,
	maxim Levitsky

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
