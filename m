Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F183459AD1
	for <lists.virtualization@lfdr.de>; Tue, 23 Nov 2021 04:58:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2290740308;
	Tue, 23 Nov 2021 03:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fopsIMT-Qm0r; Tue, 23 Nov 2021 03:58:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 59BF2403BF;
	Tue, 23 Nov 2021 03:58:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7FF2C0036;
	Tue, 23 Nov 2021 03:58:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EAA08C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D26F160605
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:58:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lGPPDdaOzR3b
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:58:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9041460600
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:58:30 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id o14so15903832plg.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Nov 2021 19:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PB1wtVuH6969BqjxT7GZzORbKKJ5Cskt9OOmBfWH1Q=;
 b=SasFEvIlKDtqGFwbHHum3n8CLP64zznoaD1EPV8E6dDNQLF0iWhIAutPQ4OA0lfGiW
 4Lc4yLnvz2ZfbN44oT1ES2IVAkxt+AstOmp1xDXepVgTR34D5FNHGnK7civIC7R93Xhi
 sqH6/HTcFVNOYupo6mHS3Lb+TjiXREcFMPMaUClhEmZg6SYlQJVIbxMrtZnpiI7kgzaN
 CbpSFTHzw0C+J3H5A3lfEVfmlzOE/WbxUG4JQWOJyN9ZFiGaNdyZhVUNICx8l2fmn/Y+
 xBuIGOvObQwCQPFM6TgRyR/2bzmMrQEXa3K/RBBBtO3dzygDMxHHb6Tv9Uxgwc7QRmgn
 0BCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PB1wtVuH6969BqjxT7GZzORbKKJ5Cskt9OOmBfWH1Q=;
 b=Gkvwi89vsulxHJDg6ZryBuHVthCZmP3gABigJRyWS07qR0r3FbyAJVMszFeMrywebf
 1udfS4tTBVPnglYpZCQgS9sNsloXKLX7pEfkEE4W3Cr9FVwma/l9mvA6s5TSkmdlNqSH
 C0KMKVTeq5zYg29Bw3m6LgzbuNYPyFMcNTUuhSwb5MBXxAxFVb8kl5IuYwomPZL9Uyjk
 ru2Gs6/Y7Kll24LgcCVUfnQ3hmmpOQxJrJzCQFHO93NziIL5Z1TY5qErAxWEZn+3D7ZU
 oFCTK5JpeOs6iQ+l/qpvzhA9ivSRuV+TEQptc/hMNwHEUyfPYuQR5mI0NvX48pgTRqW0
 /jUw==
X-Gm-Message-State: AOAM5332ANWJuxWA+vOIs9hiKqGPzJcuq/YD+VWNHI9tfHTKsDIA+jZo
 s2iJIrXjjNxm4V6SY0kW6aAMw0/MWVkt4ugfnU9wzQ==
X-Google-Smtp-Source: ABdhPJxInJAdRn6jPCEeoEzVGoy17vkp/IXc70+3Q5ZQumx/rL0NS/AC4p+YTcCCh2DDYYMcmB4s34bb0yFwxQ2XwyE=
X-Received: by 2002:a17:902:a50f:b0:143:7dec:567 with SMTP id
 s15-20020a170902a50f00b001437dec0567mr3191771plq.18.1637639909850; Mon, 22
 Nov 2021 19:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-9-hch@lst.de>
In-Reply-To: <20211109083309.584081-9-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 22 Nov 2021 19:58:19 -0800
Message-ID: <CAPcyv4ije6HyKbCjvoxYrEp__jCYOJO508b5mgtwzbibWCMa6g@mail.gmail.com>
Subject: Re: [PATCH 08/29] dax: remove dax_capable
To: Christoph Hellwig <hch@lst.de>
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org,
 linux-xfs <linux-xfs@vger.kernel.org>,
 device-mapper development <dm-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>
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

On Tue, Nov 9, 2021 at 12:33 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Just open code the block size and dax_dev == NULL checks in the callers.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Mike Snitzer <snitzer@redhat.com>

You dropped Gao Xiang's reviewed-by:

https://lore.kernel.org/r/YW1nrxmaw5CfFXBb@B-P7TQMD6M-0146.local

...and Darrick's

https://lore.kernel.org/r/20211019154447.GL24282@magnolia

...which had a few more review comments below, otherwise you can also add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>


> ---
>  drivers/dax/super.c          | 36 ------------------------------------
>  drivers/md/dm-table.c        | 22 +++++++++++-----------
>  drivers/md/dm.c              | 21 ---------------------
>  drivers/md/dm.h              |  4 ----
>  drivers/nvdimm/pmem.c        |  1 -
>  drivers/s390/block/dcssblk.c |  1 -
>  fs/erofs/super.c             | 11 +++++++----
>  fs/ext2/super.c              |  6 ++++--
>  fs/ext4/super.c              |  9 ++++++---
>  fs/xfs/xfs_super.c           | 21 ++++++++-------------
>  include/linux/dax.h          | 14 --------------
>  11 files changed, 36 insertions(+), 110 deletions(-)
>
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index 482fe775324a4..803942586d1b6 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -108,42 +108,6 @@ struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
>         return dax_dev;
>  }
>  EXPORT_SYMBOL_GPL(fs_dax_get_by_bdev);
> -
> -bool generic_fsdax_supported(struct dax_device *dax_dev,
> -               struct block_device *bdev, int blocksize, sector_t start,
> -               sector_t sectors)
> -{
> -       if (blocksize != PAGE_SIZE) {
> -               pr_info("%pg: error: unsupported blocksize for dax\n", bdev);
> -               return false;
> -       }
> -
> -       if (!dax_dev) {
> -               pr_debug("%pg: error: dax unsupported by block device\n", bdev);
> -               return false;
> -       }
> -
> -       return true;
> -}
> -EXPORT_SYMBOL_GPL(generic_fsdax_supported);
> -
> -bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
> -               int blocksize, sector_t start, sector_t len)
> -{
> -       bool ret = false;
> -       int id;
> -
> -       if (!dax_dev)
> -               return false;
> -
> -       id = dax_read_lock();
> -       if (dax_alive(dax_dev) && dax_dev->ops->dax_supported)
> -               ret = dax_dev->ops->dax_supported(dax_dev, bdev, blocksize,
> -                                                 start, len);
> -       dax_read_unlock(id);
> -       return ret;
> -}
> -EXPORT_SYMBOL_GPL(dax_supported);
>  #endif /* CONFIG_BLOCK && CONFIG_FS_DAX */
>
>  enum dax_device_flags {
> diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
> index bcddc5effd155..f4915a7d5dc84 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -806,12 +806,14 @@ void dm_table_set_type(struct dm_table *t, enum dm_queue_mode type)
>  EXPORT_SYMBOL_GPL(dm_table_set_type);
>
>  /* validate the dax capability of the target device span */
> -int device_not_dax_capable(struct dm_target *ti, struct dm_dev *dev,
> +static int device_not_dax_capable(struct dm_target *ti, struct dm_dev *dev,
>                         sector_t start, sector_t len, void *data)
>  {
> -       int blocksize = *(int *) data;
> +       if (dev->dax_dev)
> +               return false;
>
> -       return !dax_supported(dev->dax_dev, dev->bdev, blocksize, start, len);
> +       DMDEBUG("%pg: error: dax unsupported by block device", dev->bdev);
> +       return true;
>  }
>
>  /* Check devices support synchronous DAX */
> @@ -821,8 +823,8 @@ static int device_not_dax_synchronous_capable(struct dm_target *ti, struct dm_de
>         return !dev->dax_dev || !dax_synchronous(dev->dax_dev);
>  }
>
> -bool dm_table_supports_dax(struct dm_table *t,
> -                          iterate_devices_callout_fn iterate_fn, int *blocksize)
> +static bool dm_table_supports_dax(struct dm_table *t,
> +                          iterate_devices_callout_fn iterate_fn)
>  {
>         struct dm_target *ti;
>         unsigned i;
> @@ -835,7 +837,7 @@ bool dm_table_supports_dax(struct dm_table *t,
>                         return false;
>
>                 if (!ti->type->iterate_devices ||
> -                   ti->type->iterate_devices(ti, iterate_fn, blocksize))
> +                   ti->type->iterate_devices(ti, iterate_fn, NULL))
>                         return false;
>         }
>
> @@ -862,7 +864,6 @@ static int dm_table_determine_type(struct dm_table *t)
>         struct dm_target *tgt;
>         struct list_head *devices = dm_table_get_devices(t);
>         enum dm_queue_mode live_md_type = dm_get_md_type(t->md);
> -       int page_size = PAGE_SIZE;
>
>         if (t->type != DM_TYPE_NONE) {
>                 /* target already set the table's type */
> @@ -906,7 +907,7 @@ static int dm_table_determine_type(struct dm_table *t)
>  verify_bio_based:
>                 /* We must use this table as bio-based */
>                 t->type = DM_TYPE_BIO_BASED;
> -               if (dm_table_supports_dax(t, device_not_dax_capable, &page_size) ||
> +               if (dm_table_supports_dax(t, device_not_dax_capable) ||
>                     (list_empty(devices) && live_md_type == DM_TYPE_DAX_BIO_BASED)) {
>                         t->type = DM_TYPE_DAX_BIO_BASED;
>                 }
> @@ -1976,7 +1977,6 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
>                               struct queue_limits *limits)
>  {
>         bool wc = false, fua = false;
> -       int page_size = PAGE_SIZE;
>         int r;
>
>         /*
> @@ -2010,9 +2010,9 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
>         }
>         blk_queue_write_cache(q, wc, fua);
>
> -       if (dm_table_supports_dax(t, device_not_dax_capable, &page_size)) {
> +       if (dm_table_supports_dax(t, device_not_dax_capable)) {
>                 blk_queue_flag_set(QUEUE_FLAG_DAX, q);
> -               if (dm_table_supports_dax(t, device_not_dax_synchronous_capable, NULL))
> +               if (dm_table_supports_dax(t, device_not_dax_synchronous_capable))
>                         set_dax_synchronous(t->md->dax_dev);
>         }
>         else
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 782a076f61f81..282008afc465f 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1027,26 +1027,6 @@ static long dm_dax_direct_access(struct dax_device *dax_dev, pgoff_t pgoff,
>         return ret;
>  }
>
> -static bool dm_dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
> -               int blocksize, sector_t start, sector_t len)
> -{
> -       struct mapped_device *md = dax_get_private(dax_dev);
> -       struct dm_table *map;
> -       bool ret = false;
> -       int srcu_idx;
> -
> -       map = dm_get_live_table(md, &srcu_idx);
> -       if (!map)
> -               goto out;
> -
> -       ret = dm_table_supports_dax(map, device_not_dax_capable, &blocksize);
> -
> -out:
> -       dm_put_live_table(md, srcu_idx);
> -
> -       return ret;
> -}
> -
>  static size_t dm_dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff,
>                                     void *addr, size_t bytes, struct iov_iter *i)
>  {
> @@ -3052,7 +3032,6 @@ static const struct block_device_operations dm_rq_blk_dops = {
>
>  static const struct dax_operations dm_dax_ops = {
>         .direct_access = dm_dax_direct_access,
> -       .dax_supported = dm_dax_supported,
>         .copy_from_iter = dm_dax_copy_from_iter,
>         .copy_to_iter = dm_dax_copy_to_iter,
>         .zero_page_range = dm_dax_zero_page_range,
> diff --git a/drivers/md/dm.h b/drivers/md/dm.h
> index 742d9c80efe19..9013dc1a7b002 100644
> --- a/drivers/md/dm.h
> +++ b/drivers/md/dm.h
> @@ -73,10 +73,6 @@ bool dm_table_bio_based(struct dm_table *t);
>  bool dm_table_request_based(struct dm_table *t);
>  void dm_table_free_md_mempools(struct dm_table *t);
>  struct dm_md_mempools *dm_table_get_md_mempools(struct dm_table *t);
> -bool dm_table_supports_dax(struct dm_table *t, iterate_devices_callout_fn fn,
> -                          int *blocksize);
> -int device_not_dax_capable(struct dm_target *ti, struct dm_dev *dev,
> -                          sector_t start, sector_t len, void *data);
>
>  void dm_lock_md_type(struct mapped_device *md);
>  void dm_unlock_md_type(struct mapped_device *md);
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 8783ad7370856..0d66339875523 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -321,7 +321,6 @@ static size_t pmem_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff,
>
>  static const struct dax_operations pmem_dax_ops = {
>         .direct_access = pmem_dax_direct_access,
> -       .dax_supported = generic_fsdax_supported,
>         .copy_from_iter = pmem_copy_from_iter,
>         .copy_to_iter = pmem_copy_to_iter,
>         .zero_page_range = pmem_dax_zero_page_range,
> diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
> index 657e492f2bc26..e65e83764d1ce 100644
> --- a/drivers/s390/block/dcssblk.c
> +++ b/drivers/s390/block/dcssblk.c
> @@ -72,7 +72,6 @@ static int dcssblk_dax_zero_page_range(struct dax_device *dax_dev,
>
>  static const struct dax_operations dcssblk_dax_ops = {
>         .direct_access = dcssblk_dax_direct_access,
> -       .dax_supported = generic_fsdax_supported,
>         .copy_from_iter = dcssblk_dax_copy_from_iter,
>         .copy_to_iter = dcssblk_dax_copy_to_iter,
>         .zero_page_range = dcssblk_dax_zero_page_range,
> diff --git a/fs/erofs/super.c b/fs/erofs/super.c
> index 6a969b1e0ee6b..0aed886473c8d 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -652,10 +652,13 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
>         if (err)
>                 return err;
>
> -       if (test_opt(&sbi->opt, DAX_ALWAYS) &&
> -           !dax_supported(sbi->dax_dev, sb->s_bdev, EROFS_BLKSIZ, 0, bdev_nr_sectors(sb->s_bdev))) {
> -               errorfc(fc, "DAX unsupported by block device. Turning off DAX.");
> -               clear_opt(&sbi->opt, DAX_ALWAYS);
> +       if (test_opt(&sbi->opt, DAX_ALWAYS)) {
> +               BUILD_BUG_ON(EROFS_BLKSIZ != PAGE_SIZE);
> +
> +               if (!sbi->dax_dev) {
> +                       errorfc(fc, "DAX unsupported by block device. Turning off DAX.");
> +                       clear_opt(&sbi->opt, DAX_ALWAYS);
> +               }
>         }
>         sb->s_flags |= SB_RDONLY | SB_NOATIME;
>         sb->s_maxbytes = MAX_LFS_FILESIZE;
> diff --git a/fs/ext2/super.c b/fs/ext2/super.c
> index d8d580b609baa..a964066a80aa7 100644
> --- a/fs/ext2/super.c
> +++ b/fs/ext2/super.c
> @@ -946,11 +946,13 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
>         blocksize = BLOCK_SIZE << le32_to_cpu(sbi->s_es->s_log_block_size);
>
>         if (test_opt(sb, DAX)) {
> -               if (!dax_supported(dax_dev, sb->s_bdev, blocksize, 0,
> -                               bdev_nr_sectors(sb->s_bdev))) {
> +               if (!dax_dev) {
>                         ext2_msg(sb, KERN_ERR,
>                                 "DAX unsupported by block device. Turning off DAX.");
>                         clear_opt(sbi->s_mount_opt, DAX);
> +               } else if (blocksize != PAGE_SIZE) {
> +                       ext2_msg(sb, KERN_ERR, "unsupported blocksize for DAX\n");

Per Darrick, drop the '\n".

> +                       clear_opt(sbi->s_mount_opt, DAX);
>                 }
>         }
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index a320c54202d95..eb4df43abd76e 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4300,9 +4300,12 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
>                 goto failed_mount;
>         }
>
> -       if (dax_supported(dax_dev, sb->s_bdev, blocksize, 0,
> -                       bdev_nr_sectors(sb->s_bdev)))
> -               set_bit(EXT4_FLAGS_BDEV_IS_DAX, &sbi->s_ext4_flags);
> +       if (dax_dev) {
> +               if (blocksize == PAGE_SIZE)
> +                       set_bit(EXT4_FLAGS_BDEV_IS_DAX, &sbi->s_ext4_flags);
> +               else
> +                       ext4_msg(sb, KERN_ERR, "unsupported blocksize for DAX\n");

...another one.

> +       }
>
>         if (sbi->s_mount_opt & EXT4_MOUNT_DAX_ALWAYS) {
>                 if (ext4_has_feature_inline_data(sb)) {
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index 875fd3151d6c9..3a45d5caa28d5 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -331,28 +331,23 @@ xfs_set_inode_alloc(
>         return xfs_is_inode32(mp) ? maxagi : agcount;
>  }
>
> -static bool
> -xfs_buftarg_is_dax(
> -       struct super_block      *sb,
> -       struct xfs_buftarg      *bt)
> -{
> -       return dax_supported(bt->bt_daxdev, bt->bt_bdev, sb->s_blocksize, 0,
> -                       bdev_nr_sectors(bt->bt_bdev));
> -}
> -
>  static int
>  xfs_setup_dax_always(
>         struct xfs_mount        *mp)
>  {
> -       struct super_block      *sb = mp->m_super;
> -
> -       if (!xfs_buftarg_is_dax(sb, mp->m_ddev_targp) &&
> -          (!mp->m_rtdev_targp || !xfs_buftarg_is_dax(sb, mp->m_rtdev_targp))) {
> +       if (!mp->m_ddev_targp->bt_daxdev &&
> +          (!mp->m_rtdev_targp || !mp->m_rtdev_targp->bt_daxdev)) {
>                 xfs_alert(mp,
>                         "DAX unsupported by block device. Turning off DAX.");
>                 goto disable_dax;
>         }
>
> +       if (mp->m_super->s_blocksize != PAGE_SIZE) {
> +               xfs_alert(mp,
> +                       "DAX not supported for blocksize. Turning off DAX.\n");

...and one more


> +               goto disable_dax;
> +       }
> +
>         if (xfs_has_reflink(mp)) {
>                 xfs_alert(mp, "DAX and reflink cannot be used together!");
>                 return -EINVAL;
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index e2e9a67004cbd..439c3c70e347b 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -111,12 +111,6 @@ int bdev_dax_pgoff(struct block_device *, sector_t, size_t, pgoff_t *pgoff);
>  #if IS_ENABLED(CONFIG_FS_DAX)
>  int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk);
>  void dax_remove_host(struct gendisk *disk);
> -bool generic_fsdax_supported(struct dax_device *dax_dev,
> -               struct block_device *bdev, int blocksize, sector_t start,
> -               sector_t sectors);
> -
> -bool dax_supported(struct dax_device *dax_dev, struct block_device *bdev,
> -               int blocksize, sector_t start, sector_t len);
>
>  static inline void fs_put_dax(struct dax_device *dax_dev)
>  {
> @@ -139,14 +133,6 @@ static inline int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk)
>  static inline void dax_remove_host(struct gendisk *disk)
>  {
>  }
> -#define generic_fsdax_supported                NULL
> -
> -static inline bool dax_supported(struct dax_device *dax_dev,
> -               struct block_device *bdev, int blocksize, sector_t start,
> -               sector_t len)
> -{
> -       return false;
> -}
>
>  static inline void fs_put_dax(struct dax_device *dax_dev)
>  {
> --
> 2.30.2
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
