Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE19522835C
	for <lists.virtualization@lfdr.de>; Tue, 21 Jul 2020 17:14:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F43E85FAE;
	Tue, 21 Jul 2020 15:14:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9pwAw5AzFu0p; Tue, 21 Jul 2020 15:14:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2304E86088;
	Tue, 21 Jul 2020 15:14:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B510C088E;
	Tue, 21 Jul 2020 15:14:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB489C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 15:14:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B9CA422056
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 15:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o+mVxe-YdiZ5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 15:14:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by silver.osuosl.org (Postfix) with ESMTPS id B12A32274B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jul 2020 15:14:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9AD7268B05; Tue, 21 Jul 2020 17:14:37 +0200 (CEST)
Date: Tue, 21 Jul 2020 17:14:37 +0200
From: Christoph Hellwig <hch@lst.de>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH 02/10] block: virtio-blk: check logical block size
Message-ID: <20200721151437.GB10620@lst.de>
References: <20200721105239.8270-1-mlevitsk@redhat.com>
 <20200721105239.8270-3-mlevitsk@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721105239.8270-3-mlevitsk@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:NVM EXPRESS DRIVER" <linux-nvme@lists.infradead.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>, Hou Tao <houtao1@huawei.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 "open list:SCSI CDROM DRIVER" <linux-scsi@vger.kernel.org>,
 Satya Tangirala <satyat@google.com>, Ajay Joshi <ajay.joshi@wdc.com>,
 Alex Dubov <oakad@yahoo.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
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

On Tue, Jul 21, 2020 at 01:52:31PM +0300, Maxim Levitsky wrote:
> Linux kernel only supports logical block sizes which are power of two,
> at least 512 bytes and no more that PAGE_SIZE.
> 
> Check this instead of crashing later on.
> 
> Note that there is no need to check physical block size since it is
> only a hint, and virtio-blk already only supports power of two values.
> 
> Bugzilla link: https://bugzilla.redhat.com/show_bug.cgi?id=1664619
> 
> Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> ---
>  drivers/block/virtio_blk.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 980df853ee497..b5ee87cba00ed 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -809,10 +809,18 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
>  				   struct virtio_blk_config, blk_size,
>  				   &blk_size);
> -	if (!err)
> +	if (!err) {
> +		if (!blk_is_valid_logical_block_size(blk_size)) {
> +			dev_err(&vdev->dev,
> +				"%s failure: invalid logical block size %d\n",
> +				__func__, blk_size);
> +			err = -EINVAL;
> +			goto out_cleanup_queue;
> +		}
>  		blk_queue_logical_block_size(q, blk_size);

Hmm, I wonder if we should simply add the check and warning to
blk_queue_logical_block_size and add an error in that case.  Then
drivers only have to check the error return, which might add a lot
less boiler plate code.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
