Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id E63CE43D7F7
	for <lists.virtualization@lfdr.de>; Thu, 28 Oct 2021 02:16:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5318340150;
	Thu, 28 Oct 2021 00:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c80pXnoN06Q4; Thu, 28 Oct 2021 00:16:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6610C4010E;
	Thu, 28 Oct 2021 00:16:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA51CC000E;
	Thu, 28 Oct 2021 00:16:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91472C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 00:16:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CCD840585
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 00:16:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vCmwRfyq7yjd
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 00:16:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DFEE40584
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Oct 2021 00:16:40 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 v1-20020a17090a088100b001a21156830bso6529237pjc.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 17:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0E4BpRpjs/M/gK6a+jicfhiPBW8Ae/oThxlHrTQt/rw=;
 b=WrZIAvpQZQncV7eQjcCtjjyS9gqG7gZ48Ev9wCsFT0fGTPNhXJo13y5Mn//YN+aulK
 UEQ8dp780xWCBwydrMtE0wsekq+z/JPuD4DTFqxRqDeh9YtT0aRqORm+brpxtsjcgUVu
 t1E0qG5+pATg8GE7GzuglAUsONL03qRmRSsL+dltsM7LyxFxOL3bvwwzrnWI4xty25Yf
 E7t/aqTkTg7ooYQZTevFhYgR7YXpBIQbkt2CeR3dQ6Hjq3qoOC+xwgIOAWWEMh3F4dUv
 ZIc+hW3MrfNscMBcs4NQ6x/3+VQY+Xgrz6h42Shjtc7YrMfKuuzh7+A1dIXiPLL6RUg7
 Ixeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0E4BpRpjs/M/gK6a+jicfhiPBW8Ae/oThxlHrTQt/rw=;
 b=xKIgg/3bmjl3cChxoN7ETkt+I9iWDCQ9KRYHV99PjRvWDDeaki8YdxBFMtT2k6jtOr
 SHa+COlZx+FETMfqLy8wbZmyP562g9vSHvvt+cUcvX9tNWUAU73GzkLqohDrbKTeV1+V
 4SiIIdWI+1EXzLEvYIOKbwxRjtNSN1/DcVVMBeHsoqa4xCbnZp/i13qAXhn9c21QOYFN
 Xyfy/y4WoQiNF4qN/cs/gPgBe75o1usR/rC9XRzha4oKD526DjGnNfJy9r/DFxFxHOj0
 bnd/nD+gCwGqIEemCA0qIzhhxYLRaM5g04u9Q4D+YJlmOnCUd3tlbH88acJpkTIH657B
 M5eA==
X-Gm-Message-State: AOAM530MMdsoKepchzBGApWQsdszHcF+wwKTwqDhReQjk9fz5zs+A8Dt
 baTU4MIiPA69HzMp7cgnIKFyejNHiVXCnc2Db/Ni/A==
X-Google-Smtp-Source: ABdhPJzKSXgxh0a6rVOQmPcrzGRXCPfiEIhi4pupFlSH6p8yGJN3yu7iAfODuzF916+jsY35QmaZS6Wo08IvhH6LCTk=
X-Received: by 2002:a17:902:ab50:b0:13f:4c70:9322 with SMTP id
 ij16-20020a170902ab5000b0013f4c709322mr677618plb.89.1635380199559; Wed, 27
 Oct 2021 17:16:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211018044054.1779424-1-hch@lst.de>
 <20211018044054.1779424-8-hch@lst.de>
In-Reply-To: <20211018044054.1779424-8-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 27 Oct 2021 17:16:28 -0700
Message-ID: <CAPcyv4gE8UXjQAe_6=BKFRCyLWNP_9CNxKFH---RpPnYfmBQLg@mail.gmail.com>
Subject: Re: [PATCH 07/11] dax: remove dax_capable
To: Christoph Hellwig <hch@lst.de>, Mike Snitzer <snitzer@redhat.com>
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
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

I am going to change the subject of this patch to:

dax: remove ->dax_supported()

On Sun, Oct 17, 2021 at 9:41 PM Christoph Hellwig <hch@lst.de> wrote:
>

I'll add a bit more background to help others review this.

The ->dax_supported() operation arranges for a stack of devices to
each answer the question "is dax operational". That request routes to
generic_fsdax_supported() at last level device and that attempted an
actual dax_direct_access() call and did some sanity checks. However,
those sanity checks can be validated in other ways and with those
removed the only question to answer is "has each block device driver
in the stack performed dax_add_host()". That can be validated without
a dax_operation. So, just open code the block size and dax_dev == NULL
checks in the callers, and delete ->dax_supported().

Mike, let me know if you have any concerns.

> Just open code the block size and dax_dev == NULL checks in the callers.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
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
> index 1fa4d5582dca5..4ae671c2168ea 100644
> --- a/drivers/md/dm-table.c
> +++ b/drivers/md/dm-table.c
> @@ -807,12 +807,14 @@ void dm_table_set_type(struct dm_table *t, enum dm_queue_mode type)
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
> +       pr_debug("%pg: error: dax unsupported by block device\n", dev->bdev);
> +       return true;
>  }
>
>  /* Check devices support synchronous DAX */
> @@ -822,8 +824,8 @@ static int device_not_dax_synchronous_capable(struct dm_target *ti, struct dm_de
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
> @@ -836,7 +838,7 @@ bool dm_table_supports_dax(struct dm_table *t,
>                         return false;
>
>                 if (!ti->type->iterate_devices ||
> -                   ti->type->iterate_devices(ti, iterate_fn, blocksize))
> +                   ti->type->iterate_devices(ti, iterate_fn, NULL))
>                         return false;
>         }
>
> @@ -863,7 +865,6 @@ static int dm_table_determine_type(struct dm_table *t)
>         struct dm_target *tgt;
>         struct list_head *devices = dm_table_get_devices(t);
>         enum dm_queue_mode live_md_type = dm_get_md_type(t->md);
> -       int page_size = PAGE_SIZE;
>
>         if (t->type != DM_TYPE_NONE) {
>                 /* target already set the table's type */
> @@ -907,7 +908,7 @@ static int dm_table_determine_type(struct dm_table *t)
>  verify_bio_based:
>                 /* We must use this table as bio-based */
>                 t->type = DM_TYPE_BIO_BASED;
> -               if (dm_table_supports_dax(t, device_not_dax_capable, &page_size) ||
> +               if (dm_table_supports_dax(t, device_not_dax_capable) ||
>                     (list_empty(devices) && live_md_type == DM_TYPE_DAX_BIO_BASED)) {
>                         t->type = DM_TYPE_DAX_BIO_BASED;
>                 }
> @@ -1981,7 +1982,6 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
>                               struct queue_limits *limits)
>  {
>         bool wc = false, fua = false;
> -       int page_size = PAGE_SIZE;
>         int r;
>
>         /*
> @@ -2015,9 +2015,9 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
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
> index a0a4703620650..f896ad29a67a7 100644
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
> @@ -3050,7 +3030,6 @@ static const struct block_device_operations dm_rq_blk_dops = {
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
> index 5628afb808f41..428a485800058 100644
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
> index b8f042c3e7e67..530d7b1e0f138 100644
> --- a/fs/erofs/super.c
> +++ b/fs/erofs/super.c
> @@ -649,10 +649,13 @@ static int erofs_fc_fill_super(struct super_block *sb, struct fs_context *fc)
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
> +                       clear_opt(sbi->s_mount_opt, DAX);
>                 }
>         }
>
> diff --git a/fs/ext4/super.c b/fs/ext4/super.c
> index 6361ea1f97bc5..f571be3a6252b 100644
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -4291,9 +4291,12 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
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
> +       }
>
>         if (sbi->s_mount_opt & EXT4_MOUNT_DAX_ALWAYS) {
>                 if (ext4_has_feature_inline_data(sb)) {
> diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
> index d07020a8eb9e3..163ceafbd8fd2 100644
> --- a/fs/xfs/xfs_super.c
> +++ b/fs/xfs/xfs_super.c
> @@ -330,28 +330,23 @@ xfs_set_inode_alloc(
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
>  xfs_setup_dax(
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
