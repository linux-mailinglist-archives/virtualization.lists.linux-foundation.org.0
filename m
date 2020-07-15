Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F03E220A0D
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:34:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D0C752285E;
	Wed, 15 Jul 2020 10:34:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a8I6qywBSlWg; Wed, 15 Jul 2020 10:34:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D9736227DB;
	Wed, 15 Jul 2020 10:34:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEA55C0891;
	Wed, 15 Jul 2020 10:34:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AA7DEC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A6B078AC0D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:34:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0rgnJgCjdzAt
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:34:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4925B89974
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:34:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z13so2015946wrw.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qMUY6llyiVBHai5nrhOTf3JZHya8KtMcnB9MpKaEZPI=;
 b=o3SVj6BlSqIoxI/NdTPa8Rna1RspumQOntproHK00T8T/pG7cJIaYWI0Sp8ez2F8Tx
 mKAwnghTbCuPG6kgc3nedbXtGNrsg+CaO51/WYI8kUWOFv/ftCDl23egIkksWNFuD8bf
 QdPklSuM/NcikmyFKYr6f0GWhhvGAvZaeZNEBvGcPO/LWKWR3t37kDm02nAbwes/NF0g
 uZGbFvgg4ICoypiqeavzk+s8shdUUnLICqqLej68j/1cp/Ly85BbGYpWYKZxrcxOQhdM
 gzQ52xoNEl6mAyv0DbZePFoVA5ZjJgCUadRTzKAmFitC23HQPIweoc/OmKmwM6VnDyNC
 CP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qMUY6llyiVBHai5nrhOTf3JZHya8KtMcnB9MpKaEZPI=;
 b=ellJ4HG9FNihfCJXNiAuMNG44GaXhqfswlDPVqY4enrL+A8TmHhTVXKVhPbY/ZS6mW
 +I2x85Jo7SoxQ2QZmQbWbtea53mSVyCacNrWeWyMaQa35TGix8D/eZn3eptEZy/6TI1y
 dywhPJkzVwtyXDYNgNaH5dZpNzhTXdt9tc3UOeoH36p1GsozwG3QWJHTRLbacS+z6Zf/
 4+1/s/QK7LggvyrsJjIG11NQiNkRT790PBDOCvIZwHJ+HPnmieSpTLMpE1IrkkE0vFgq
 x6xSn3DltNjE1XLZKkp+cTSyiIu9tHfc3+8a9BDDLULpeXVmfXJUop9I4mM/NNEfdOnd
 JFbQ==
X-Gm-Message-State: AOAM53245PidcsSx8NzYI6PLdK+Lx3A9fc9bFjuKelL4hvs+ihcAjasR
 oOZKcCoxEQzrGlJ1AN6UdjXiip3m2ReZyvLtMiI=
X-Google-Smtp-Source: ABdhPJzNsKouENzx8y2K6sU54DBiAnwG5Ytys1zlDwRBxHM5drfl4AvksrGrKDVYNADhYZxk72LP/kthmEg8yPavkfs=
X-Received: by 2002:adf:e850:: with SMTP id d16mr10941653wrn.426.1594809247738; 
 Wed, 15 Jul 2020 03:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200715095518.3724-1-mlevitsk@redhat.com>
In-Reply-To: <20200715095518.3724-1-mlevitsk@redhat.com>
From: Ming Lei <tom.leiming@gmail.com>
Date: Wed, 15 Jul 2020 18:33:56 +0800
Message-ID: <CACVXFVNu+HjGJUvAEK96TB7pOC=k=p5f0Yg3K6t_13qudDAjjw@mail.gmail.com>
Subject: Re: [PATCH] virtio-blk: check host supplied logical block size
To: Maxim Levitsky <mlevitsk@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, "Michael S. Tsirkin" <mst@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO CORE AND NET DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 "open list:BLOCK LAYER" <linux-block@vger.kernel.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Wed, Jul 15, 2020 at 5:55 PM Maxim Levitsky <mlevitsk@redhat.com> wrote:
>
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
>  drivers/block/virtio_blk.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 980df853ee497..36dda31cc4e96 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -681,6 +681,12 @@ static const struct blk_mq_ops virtio_mq_ops = {
>  static unsigned int virtblk_queue_depth;
>  module_param_named(queue_depth, virtblk_queue_depth, uint, 0444);
>
> +
> +static bool virtblk_valid_block_size(unsigned int blksize)
> +{
> +       return blksize >= 512 && blksize <= PAGE_SIZE && is_power_of_2(blksize);
> +}
> +
>  static int virtblk_probe(struct virtio_device *vdev)
>  {
>         struct virtio_blk *vblk;
> @@ -809,9 +815,16 @@ static int virtblk_probe(struct virtio_device *vdev)
>         err = virtio_cread_feature(vdev, VIRTIO_BLK_F_BLK_SIZE,
>                                    struct virtio_blk_config, blk_size,
>                                    &blk_size);
> -       if (!err)
> +       if (!err) {
> +               if (!virtblk_valid_block_size(blk_size)) {
> +                       dev_err(&vdev->dev,
> +                               "%s failure: unsupported logical block size %d\n",
> +                               __func__, blk_size);
> +                       err = -EINVAL;
> +                       goto out_cleanup_queue;
> +               }
>                 blk_queue_logical_block_size(q, blk_size);
> -       else
> +       } else
>                 blk_size = queue_logical_block_size(q);
>
>         /* Use topology information if available */
> @@ -872,6 +885,9 @@ static int virtblk_probe(struct virtio_device *vdev)
>         device_add_disk(&vdev->dev, vblk->disk, virtblk_attr_groups);
>         return 0;
>
> +out_cleanup_queue:
> +       blk_cleanup_queue(vblk->disk->queue);
> +       vblk->disk->queue = NULL;
>  out_free_tags:
>         blk_mq_free_tag_set(&vblk->tag_set);
>  out_put_disk:
> --
> 2.26.2
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization

Looks fine,

Reviewed-by: Ming Lei <ming.lei@redhat.com>

-- 
Ming Lei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
