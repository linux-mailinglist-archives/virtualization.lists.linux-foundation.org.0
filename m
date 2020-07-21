Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B51228053
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 14:56:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4C07D226E5;
	Tue, 21 Jul 2020 12:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mxO2hZaB4Kk9; Tue, 21 Jul 2020 12:56:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34AF0226F3;
	Tue, 21 Jul 2020 12:56:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16050C016F;
	Tue, 21 Jul 2020 12:56:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46F7AC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 33DC7226E9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:56:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jCiGnwFWCUor
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:56:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 33D59226E5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 12:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595336160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gcyS8fcxtufsTHCFEHHMYCv8/G/j17I02uFKGiQeviM=;
 b=H886DmZS/NkxE6VFBLjlX5V8P4jQESCAlcFSwZlz39fVN/Pn7iItzPb5DN9FihvBSPSHvq
 7MV2DdqDWQAyKjrMI4plMOvYq01Byw+k+WoeppgmEQ4p6we9N0CyQ2nCtRLBe5WvLU1vXT
 5Mr6hC1gXE2a4dOqLq2rjJeO7vcBnow=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-MY6qAbUXO7O16qVB19jUxQ-1; Tue, 21 Jul 2020 08:55:56 -0400
X-MC-Unique: MY6qAbUXO7O16qVB19jUxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACA018014D7;
 Tue, 21 Jul 2020 12:55:53 +0000 (UTC)
Received: from fedora-32-enviroment (unknown [10.35.206.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 78F657B400;
 Tue, 21 Jul 2020 12:55:38 +0000 (UTC)
Message-ID: <155668af6420a6516ded0e9101e0a47401a928d9.camel@redhat.com>
Subject: Re: [PATCH 09/10] block: scsi: sd: use blk_is_valid_logical_block_size
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Tue, 21 Jul 2020 15:55:37 +0300
In-Reply-To: <CY4PR04MB375113B7D781BF2949FE5B33E7780@CY4PR04MB3751.namprd04.prod.outlook.com>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-10-mlevitsk@redhat.com>
 <CY4PR04MB375113B7D781BF2949FE5B33E7780@CY4PR04MB3751.namprd04.prod.outlook.com>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Tue, 2020-07-21 at 11:25 +0000, Damien Le Moal wrote:
> On 2020/07/21 19:55, Maxim Levitsky wrote:
> > Use blk_is_valid_logical_block_size instead of hardcoded list
> 
> s/hardcoded list/hardcoded checks./
Done, thanks!

Best regards,
	Maxim Levitsky
> 
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  drivers/scsi/sd.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
> > index d90fefffe31b7..f012e7397b058 100644
> > --- a/drivers/scsi/sd.c
> > +++ b/drivers/scsi/sd.c
> > @@ -2520,10 +2520,7 @@ sd_read_capacity(struct scsi_disk *sdkp,
> > unsigned char *buffer)
> >  			  "assuming 512.\n");
> >  	}
> >  
> > -	if (sector_size != 512 &&
> > -	    sector_size != 1024 &&
> > -	    sector_size != 2048 &&
> > -	    sector_size != 4096) {
> > +	if (!blk_is_valid_logical_block_size(sector_size)) {
> >  		sd_printk(KERN_NOTICE, sdkp, "Unsupported sector size
> > %d.\n",
> >  			  sector_size);
> >  		/*
> > 
> 
> With the commit message fixed, looks OK.
> 
> Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
