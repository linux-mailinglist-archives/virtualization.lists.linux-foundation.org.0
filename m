Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id D9735459A89
	for <lists.virtualization@lfdr.de>; Tue, 23 Nov 2021 04:33:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 565D040243;
	Tue, 23 Nov 2021 03:33:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPcZj1imF5fV; Tue, 23 Nov 2021 03:33:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DD39E40284;
	Tue, 23 Nov 2021 03:33:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41F2EC0036;
	Tue, 23 Nov 2021 03:33:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5BA5DC0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3572C80DFE
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:33:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTaq5in9ttCx
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:33:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F17480D89
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 03:33:18 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id n8so15866690plf.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Nov 2021 19:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhgQ7czSE1Lq+CmIt/Sl6kBWgPmrsfmrZ2GMLRnt6y0=;
 b=pcgDg7ZtPOCrcOjSFmkZxFkVzvSNeyc+cGUidWmem3y5EKGE0uocGRQZi2QVp3gGUm
 DF6Y8jZ6Q/4Ok9ih3sMTZP7yQc/kpDGEB5nQvWrVfQp5cTbYf/mm5+243GunpSVn0jnQ
 5+dRHUt0kPaXBxklhrXOFZUSwu44fGncGuaTMTFJgD/NsrdJmezzc4jkvlsAXfdlsmby
 tYsAmayhFF8UsIb6fwc9orMhQSLhOS9cJbwFL97nokBo5jvdEigV0sUKJ8AF94nHcC07
 o3Bm8OVexx/RK6Av7GYbyvLjAOj1Uj5EvIN9weJ2GVSOF+qYTG2RhwQ+ZNGqLPlEL1lk
 dlNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhgQ7czSE1Lq+CmIt/Sl6kBWgPmrsfmrZ2GMLRnt6y0=;
 b=gCxmbAcMx5BmcypgtCCq33gH4cIeQakU0UT0Qr9f8Ax9ibVb+hRAnxtLmndul/9K5R
 IGKI7FOK+KkaoMqra7X6D251CWfi2R8iIMK7unVqxGRlBxHgf52hOZ4W+I8qebVGHrXM
 3aJQ4Vjmc1A/dMaJcuHfFThxyqfj0AiVe1Zcgw8Ac5TOJcOjyhQx1DfRGuNqh9Cz+JPV
 frebRjZI6a/Xy3yelgwl8SsP99ppUDD9yAV/S6mZkAtv1lHgxEmiJ3BTQwMDaOrkIo+C
 DtlnQk3/Sw4CFKuXFKb2oy0p6yQ7SoDPMxjNKgEtyA3+uLt/Xh2vMnsPXfL8xAoLHF10
 Zeog==
X-Gm-Message-State: AOAM530YUrwySA/VsXV0fxfQNRFTOth/EphL2Q6vUda6EQkqdT7hVXPO
 G7zooCwYbTjzSZC2lFdlqAT+Rw0GXJRSme1IX0PspA==
X-Google-Smtp-Source: ABdhPJwSX6o1ywwd7i6ubbvxO4itU91QEc8s2ElqkPwbMAhk/otMoGYctawBxPbraxqGJFWQoRGe0G+cpZSGfuMReDY=
X-Received: by 2002:a17:90b:1e07:: with SMTP id
 pg7mr2476137pjb.93.1637638398122; 
 Mon, 22 Nov 2021 19:33:18 -0800 (PST)
MIME-Version: 1.0
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-5-hch@lst.de>
In-Reply-To: <20211109083309.584081-5-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 22 Nov 2021 19:33:06 -0800
Message-ID: <CAPcyv4ic=Mz_nr5biEoBikTBySJA947ZK3QQ9Mn=KhVb_HiwAA@mail.gmail.com>
Subject: Re: [PATCH 04/29] dax: simplify the dax_device <-> gendisk association
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
> Replace the dax_host_hash with an xarray indexed by the pointer value
> of the gendisk, and require explicitly calls from the block drivers that
> want to associate their gendisk with a dax_device.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Mike Snitzer <snitzer@redhat.com>
> ---
>  drivers/dax/bus.c            |   6 +-
>  drivers/dax/super.c          | 106 +++++++++--------------------------
>  drivers/md/dm.c              |   6 +-
>  drivers/nvdimm/pmem.c        |   8 ++-
>  drivers/s390/block/dcssblk.c |  11 +++-
>  fs/fuse/virtio_fs.c          |   2 +-
>  include/linux/dax.h          |  19 +++++--
>  7 files changed, 62 insertions(+), 96 deletions(-)
>
> diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> index 6cc4da4c713d9..bd7af2f7c5b0a 100644
> --- a/drivers/dax/bus.c
> +++ b/drivers/dax/bus.c
> @@ -1323,10 +1323,10 @@ struct dev_dax *devm_create_dev_dax(struct dev_dax_data *data)
>         }
>
>         /*
> -        * No 'host' or dax_operations since there is no access to this
> -        * device outside of mmap of the resulting character device.
> +        * No dax_operations since there is no access to this device outside of
> +        * mmap of the resulting character device.
>          */
> -       dax_dev = alloc_dax(dev_dax, NULL, NULL, DAXDEV_F_SYNC);
> +       dax_dev = alloc_dax(dev_dax, NULL, DAXDEV_F_SYNC);
>         if (IS_ERR(dax_dev)) {
>                 rc = PTR_ERR(dax_dev);
>                 goto err_alloc_dax;
> diff --git a/drivers/dax/super.c b/drivers/dax/super.c
> index e20d0cef10a18..9383c11b21853 100644
> --- a/drivers/dax/super.c
> +++ b/drivers/dax/super.c
> @@ -7,10 +7,8 @@
>  #include <linux/mount.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/magic.h>
> -#include <linux/genhd.h>
>  #include <linux/pfn_t.h>
>  #include <linux/cdev.h>
> -#include <linux/hash.h>
>  #include <linux/slab.h>
>  #include <linux/uio.h>
>  #include <linux/dax.h>
> @@ -26,10 +24,8 @@
>   * @flags: state and boolean properties
>   */
>  struct dax_device {
> -       struct hlist_node list;
>         struct inode inode;
>         struct cdev cdev;
> -       const char *host;
>         void *private;
>         unsigned long flags;
>         const struct dax_operations *ops;
> @@ -42,10 +38,6 @@ static DEFINE_IDA(dax_minor_ida);
>  static struct kmem_cache *dax_cache __read_mostly;
>  static struct super_block *dax_superblock __read_mostly;
>
> -#define DAX_HASH_SIZE (PAGE_SIZE / sizeof(struct hlist_head))
> -static struct hlist_head dax_host_list[DAX_HASH_SIZE];
> -static DEFINE_SPINLOCK(dax_host_lock);
> -
>  int dax_read_lock(void)
>  {
>         return srcu_read_lock(&dax_srcu);
> @@ -58,13 +50,22 @@ void dax_read_unlock(int id)
>  }
>  EXPORT_SYMBOL_GPL(dax_read_unlock);
>
> -static int dax_host_hash(const char *host)
> +#if defined(CONFIG_BLOCK) && defined(CONFIG_FS_DAX)
> +#include <linux/blkdev.h>
> +
> +static DEFINE_XARRAY(dax_hosts);
> +
> +int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk)
>  {
> -       return hashlen_hash(hashlen_string("DAX", host)) % DAX_HASH_SIZE;
> +       return xa_insert(&dax_hosts, (unsigned long)disk, dax_dev, GFP_KERNEL);
>  }
> +EXPORT_SYMBOL_GPL(dax_add_host);

Is it time to add a "DAX" symbol namespace?

>
> -#if defined(CONFIG_BLOCK) && defined(CONFIG_FS_DAX)
> -#include <linux/blkdev.h>
> +void dax_remove_host(struct gendisk *disk)
> +{
> +       xa_erase(&dax_hosts, (unsigned long)disk);
> +}
> +EXPORT_SYMBOL_GPL(dax_remove_host);
>
>  int bdev_dax_pgoff(struct block_device *bdev, sector_t sector, size_t size,
>                 pgoff_t *pgoff)
> @@ -82,40 +83,23 @@ EXPORT_SYMBOL(bdev_dax_pgoff);
>
>  /**
>   * dax_get_by_host() - temporary lookup mechanism for filesystem-dax
> - * @host: alternate name for the device registered by a dax driver
> + * @bdev: block device to find a dax_device for
>   */
> -static struct dax_device *dax_get_by_host(const char *host)
> +struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
>  {
> -       struct dax_device *dax_dev, *found = NULL;
> -       int hash, id;
> +       struct dax_device *dax_dev;
> +       int id;
>
> -       if (!host)
> +       if (!blk_queue_dax(bdev->bd_disk->queue))
>                 return NULL;
>
> -       hash = dax_host_hash(host);
> -
>         id = dax_read_lock();
> -       spin_lock(&dax_host_lock);
> -       hlist_for_each_entry(dax_dev, &dax_host_list[hash], list) {
> -               if (!dax_alive(dax_dev)
> -                               || strcmp(host, dax_dev->host) != 0)
> -                       continue;
> -
> -               if (igrab(&dax_dev->inode))
> -                       found = dax_dev;
> -               break;
> -       }
> -       spin_unlock(&dax_host_lock);
> +       dax_dev = xa_load(&dax_hosts, (unsigned long)bdev->bd_disk);
> +       if (!dax_dev || !dax_alive(dax_dev) || !igrab(&dax_dev->inode))
> +               dax_dev = NULL;
>         dax_read_unlock(id);
>
> -       return found;
> -}
> -
> -struct dax_device *fs_dax_get_by_bdev(struct block_device *bdev)
> -{
> -       if (!blk_queue_dax(bdev->bd_disk->queue))
> -               return NULL;
> -       return dax_get_by_host(bdev->bd_disk->disk_name);
> +       return dax_dev;
>  }
>  EXPORT_SYMBOL_GPL(fs_dax_get_by_bdev);
>
> @@ -361,12 +345,7 @@ void kill_dax(struct dax_device *dax_dev)
>                 return;
>
>         clear_bit(DAXDEV_ALIVE, &dax_dev->flags);
> -
>         synchronize_srcu(&dax_srcu);
> -
> -       spin_lock(&dax_host_lock);
> -       hlist_del_init(&dax_dev->list);
> -       spin_unlock(&dax_host_lock);
>  }
>  EXPORT_SYMBOL_GPL(kill_dax);
>
> @@ -398,8 +377,6 @@ static struct dax_device *to_dax_dev(struct inode *inode)
>  static void dax_free_inode(struct inode *inode)
>  {
>         struct dax_device *dax_dev = to_dax_dev(inode);
> -       kfree(dax_dev->host);
> -       dax_dev->host = NULL;
>         if (inode->i_rdev)
>                 ida_simple_remove(&dax_minor_ida, iminor(inode));
>         kmem_cache_free(dax_cache, dax_dev);
> @@ -474,54 +451,25 @@ static struct dax_device *dax_dev_get(dev_t devt)
>         return dax_dev;
>  }
>
> -static void dax_add_host(struct dax_device *dax_dev, const char *host)
> -{
> -       int hash;
> -
> -       /*
> -        * Unconditionally init dax_dev since it's coming from a
> -        * non-zeroed slab cache
> -        */
> -       INIT_HLIST_NODE(&dax_dev->list);
> -       dax_dev->host = host;
> -       if (!host)
> -               return;
> -
> -       hash = dax_host_hash(host);
> -       spin_lock(&dax_host_lock);
> -       hlist_add_head(&dax_dev->list, &dax_host_list[hash]);
> -       spin_unlock(&dax_host_lock);
> -}
> -
> -struct dax_device *alloc_dax(void *private, const char *__host,
> -               const struct dax_operations *ops, unsigned long flags)
> +struct dax_device *alloc_dax(void *private, const struct dax_operations *ops,
> +               unsigned long flags)
>  {
>         struct dax_device *dax_dev;
> -       const char *host;
>         dev_t devt;
>         int minor;
>
> -       if (ops && !ops->zero_page_range) {
> -               pr_debug("%s: error: device does not provide dax"
> -                        " operation zero_page_range()\n",
> -                        __host ? __host : "Unknown");
> +       if (WARN_ON_ONCE(ops && !ops->zero_page_range))
>                 return ERR_PTR(-EINVAL);
> -       }
> -
> -       host = kstrdup(__host, GFP_KERNEL);
> -       if (__host && !host)
> -               return ERR_PTR(-ENOMEM);
>
>         minor = ida_simple_get(&dax_minor_ida, 0, MINORMASK+1, GFP_KERNEL);
>         if (minor < 0)
> -               goto err_minor;
> +               return ERR_PTR(-ENOMEM);
>
>         devt = MKDEV(MAJOR(dax_devt), minor);
>         dax_dev = dax_dev_get(devt);
>         if (!dax_dev)
>                 goto err_dev;
>
> -       dax_add_host(dax_dev, host);
>         dax_dev->ops = ops;
>         dax_dev->private = private;
>         if (flags & DAXDEV_F_SYNC)
> @@ -531,8 +479,6 @@ struct dax_device *alloc_dax(void *private, const char *__host,
>
>   err_dev:
>         ida_simple_remove(&dax_minor_ida, minor);
> - err_minor:
> -       kfree(host);
>         return ERR_PTR(-ENOMEM);
>  }
>  EXPORT_SYMBOL_GPL(alloc_dax);
> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
> index 893fca738a3d8..782a076f61f81 100644
> --- a/drivers/md/dm.c
> +++ b/drivers/md/dm.c
> @@ -1683,6 +1683,7 @@ static void cleanup_mapped_device(struct mapped_device *md)
>         bioset_exit(&md->io_bs);
>
>         if (md->dax_dev) {

Not a problem introduced by this patch, but this needs to be:

if (!IS_ERR_OR_NULL(md->dax_dev)))

...as alloc_dev() calls this after md->dax_dev allocation might have failed.


> +               dax_remove_host(md->disk);

>                 kill_dax(md->dax_dev);
>                 put_dax(md->dax_dev);
>                 md->dax_dev = NULL;
> @@ -1784,10 +1785,11 @@ static struct mapped_device *alloc_dev(int minor)
>         sprintf(md->disk->disk_name, "dm-%d", minor);
>
>         if (IS_ENABLED(CONFIG_FS_DAX)) {
> -               md->dax_dev = alloc_dax(md, md->disk->disk_name,
> -                                       &dm_dax_ops, 0);
> +               md->dax_dev = alloc_dax(md, &dm_dax_ops, 0);
>                 if (IS_ERR(md->dax_dev))
>                         goto bad;
> +               if (dax_add_host(md->dax_dev, md->disk))
> +                       goto bad;
>         }
>
>         format_dev_t(md->name, MKDEV(_major, minor));
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 9cc0d0ebfad16..8783ad7370856 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -379,6 +379,7 @@ static void pmem_release_disk(void *__pmem)
>  {
>         struct pmem_device *pmem = __pmem;
>
> +       dax_remove_host(pmem->disk);
>         kill_dax(pmem->dax_dev);
>         put_dax(pmem->dax_dev);
>         del_gendisk(pmem->disk);
> @@ -495,10 +496,11 @@ static int pmem_attach_disk(struct device *dev,
>
>         if (is_nvdimm_sync(nd_region))
>                 flags = DAXDEV_F_SYNC;
> -       dax_dev = alloc_dax(pmem, disk->disk_name, &pmem_dax_ops, flags);
> -       if (IS_ERR(dax_dev)) {
> +       dax_dev = alloc_dax(pmem, &pmem_dax_ops, flags);
> +       if (IS_ERR(dax_dev))
>                 return PTR_ERR(dax_dev);
> -       }
> +       if (dax_add_host(dax_dev, disk))
> +               return -ENOMEM;

This leaks the dax_dev. Perhaps this wants devm_alloc_dax() and
devm_dax_add_host() rather than piggybacking on the pmem_release_disk
devm action.

Other changes look good.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
