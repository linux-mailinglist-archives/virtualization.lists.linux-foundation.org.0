Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F5745AE95
	for <lists.virtualization@lfdr.de>; Tue, 23 Nov 2021 22:46:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D6A6402EE;
	Tue, 23 Nov 2021 21:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9q2qNlACMfI; Tue, 23 Nov 2021 21:46:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id BD720402F8;
	Tue, 23 Nov 2021 21:46:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B6A2C0036;
	Tue, 23 Nov 2021 21:46:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A65F1C0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80BBC80D4A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sKMDIYxw03l6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:46:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B8E280CFA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 21:46:46 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 j6-20020a17090a588600b001a78a5ce46aso3259746pji.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Nov 2021 13:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IocG8TBulukDu9SjRxn8/4US7KH9kbedvt0a5PmxQv4=;
 b=e9bx4Kdo7I8ZUavJsyxsvU7II4UPysuYF1XHDALMVPKJXAOc/1HKibhwKn6zYiyyH2
 RzYhTkpVmzKjgYSXCxowfOO1tIpA97XEkSgj5sxdBD2rNwfxMZluX7Z3sIGYciYU6ogd
 ljTGFeV41L1PwjS3M0oGZcQzOS7HD/9q+lneTWJUTUlsrF1iQun9GNGHJHKiBEjHoaH7
 VF+7yXa8YUT3VIvlW6HfBrq4oSJCQYp+sWbnZhjUtVARWol5WTyHD5zAz213Rk2aIiZR
 KdTB0N54eXCKSFqzGMeu3tfOHYo1rlmF+MafxxcMzskESR21ZtpuTZoOQuZzNnz3/Z04
 qmkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IocG8TBulukDu9SjRxn8/4US7KH9kbedvt0a5PmxQv4=;
 b=UxNN0yZUC6PbHGipAqITWwdllQgvwpiot3ixHHbEg8wMT4Oew9JWiVZvfuDnSO63y1
 7l/4YT1qExS0gq13/QLxc6AMOtelmatrih5zsbiJTNpfqpcHedaV7u31EVTZ/gWOkZdz
 5S0eMGUpvpuRT+HzDs38QlPXQTiZZ9eI1xTNZyssFkbwMD8fo+9tCNGMFyeMMv/vZcOG
 +TpKv9QudsimhYhNpN/TRUt8f7e6RDWhdM5VuC/yOUdGe7YITP1JlfySOId3If720yR6
 2e/x27HQcHQ69dEM2NAt6qEHMfxPGXy9Ekuctasi1ERZOEPmR6kJ/fDDYMAqeUnuaMiP
 3N5g==
X-Gm-Message-State: AOAM531j1xYi8xAcZj/5aYjgnv5OPLgYvqhMNxvBk7wXmeGvqrxRUQnW
 yZkoa8Y7XiTqE1n99evG1Qr83zB8SNnH/Us0lCgcUA==
X-Google-Smtp-Source: ABdhPJwtZaW+gMisb+Y0jgoHIg9GiWXk7YMizh+6qlrWxc1s5dOr//0YU5uLfuPStXFLmi95oQ+oVAG4VVG3WhAjY3g=
X-Received: by 2002:a17:90a:e7ca:: with SMTP id
 kb10mr7419326pjb.8.1637704005856; 
 Tue, 23 Nov 2021 13:46:45 -0800 (PST)
MIME-Version: 1.0
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-19-hch@lst.de>
In-Reply-To: <20211109083309.584081-19-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 23 Nov 2021 13:46:35 -0800
Message-ID: <CAPcyv4hDG9-BQHjuJnQUQLJhq=xmrNi+w-uiu6TnV4Rcf0VDfQ@mail.gmail.com>
Subject: Re: [PATCH 18/29] fsdax: decouple zeroing from the iomap buffered I/O
 code
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
> Unshare the DAX and iomap buffered I/O page zeroing code.  This code
> previously did a IS_DAX check deep inside the iomap code, which in
> fact was the only DAX check in the code.  Instead move these checks
> into the callers.  Most callers already have DAX special casing anyway
> and XFS will need it for reflink support as well.

Looks ok, a tangential question below about iomap_truncate_page(), but
you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/dax.c               | 77 ++++++++++++++++++++++++++++++++++--------
>  fs/ext2/inode.c        |  6 ++--
>  fs/ext4/inode.c        |  4 +--
>  fs/iomap/buffered-io.c | 35 +++++++------------
>  fs/xfs/xfs_iomap.c     |  6 ++++
>  include/linux/dax.h    |  6 +++-
>  6 files changed, 91 insertions(+), 43 deletions(-)
>
> diff --git a/fs/dax.c b/fs/dax.c
> index dc9ebeff850ab..5b52b878124ac 100644
> --- a/fs/dax.c
> +++ b/fs/dax.c
> @@ -1135,24 +1135,73 @@ static int dax_memzero(struct dax_device *dax_dev, pgoff_t pgoff,
>         return rc;
>  }
>
> -s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap)
> +static loff_t dax_zero_iter(struct iomap_iter *iter, bool *did_zero)
>  {
> -       pgoff_t pgoff = dax_iomap_pgoff(iomap, pos);
> -       long rc, id;
> -       unsigned offset = offset_in_page(pos);
> -       unsigned size = min_t(u64, PAGE_SIZE - offset, length);
> +       const struct iomap *iomap = &iter->iomap;
> +       const struct iomap *srcmap = iomap_iter_srcmap(iter);
> +       loff_t pos = iter->pos;
> +       loff_t length = iomap_length(iter);
> +       loff_t written = 0;
> +
> +       /* already zeroed?  we're done. */
> +       if (srcmap->type == IOMAP_HOLE || srcmap->type == IOMAP_UNWRITTEN)
> +               return length;
> +
> +       do {
> +               unsigned offset = offset_in_page(pos);
> +               unsigned size = min_t(u64, PAGE_SIZE - offset, length);
> +               pgoff_t pgoff = dax_iomap_pgoff(iomap, pos);
> +               long rc;
> +               int id;
>
> -       id = dax_read_lock();
> -       if (IS_ALIGNED(pos, PAGE_SIZE) && size == PAGE_SIZE)
> -               rc = dax_zero_page_range(iomap->dax_dev, pgoff, 1);
> -       else
> -               rc = dax_memzero(iomap->dax_dev, pgoff, offset, size);
> -       dax_read_unlock(id);
> +               id = dax_read_lock();
> +               if (IS_ALIGNED(pos, PAGE_SIZE) && size == PAGE_SIZE)
> +                       rc = dax_zero_page_range(iomap->dax_dev, pgoff, 1);
> +               else
> +                       rc = dax_memzero(iomap->dax_dev, pgoff, offset, size);
> +               dax_read_unlock(id);
>
> -       if (rc < 0)
> -               return rc;
> -       return size;
> +               if (rc < 0)
> +                       return rc;
> +               pos += size;
> +               length -= size;
> +               written += size;
> +               if (did_zero)
> +                       *did_zero = true;
> +       } while (length > 0);
> +
> +       return written;
> +}
> +
> +int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
> +               const struct iomap_ops *ops)
> +{
> +       struct iomap_iter iter = {
> +               .inode          = inode,
> +               .pos            = pos,
> +               .len            = len,
> +               .flags          = IOMAP_ZERO,
> +       };
> +       int ret;
> +
> +       while ((ret = iomap_iter(&iter, ops)) > 0)
> +               iter.processed = dax_zero_iter(&iter, did_zero);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(dax_zero_range);
> +
> +int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
> +               const struct iomap_ops *ops)
> +{
> +       unsigned int blocksize = i_blocksize(inode);
> +       unsigned int off = pos & (blocksize - 1);
> +
> +       /* Block boundary? Nothing to do */
> +       if (!off)
> +               return 0;

It took me a moment to figure out why this was correct. I see it was
also copied from iomap_truncate_page(). It makes sense for DAX where
blocksize >= PAGE_SIZE so it's always the case that the amount of
capacity to zero relative to a page is from @pos to the end of the
block. Is there something else that protects the blocksize < PAGE_SIZE
case outside of DAX?

Nothing to change for this patch, just a question I had while reviewing.

> +       return dax_zero_range(inode, pos, blocksize - off, did_zero, ops);
>  }
> +EXPORT_SYMBOL_GPL(dax_truncate_page);
>
>  static loff_t dax_iomap_iter(const struct iomap_iter *iomi,
>                 struct iov_iter *iter)
> diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
> index 333fa62661d56..ae9993018a015 100644
> --- a/fs/ext2/inode.c
> +++ b/fs/ext2/inode.c
> @@ -1297,9 +1297,9 @@ static int ext2_setsize(struct inode *inode, loff_t newsize)
>         inode_dio_wait(inode);
>
>         if (IS_DAX(inode)) {
> -               error = iomap_zero_range(inode, newsize,
> -                                        PAGE_ALIGN(newsize) - newsize, NULL,
> -                                        &ext2_iomap_ops);
> +               error = dax_zero_range(inode, newsize,
> +                                      PAGE_ALIGN(newsize) - newsize, NULL,
> +                                      &ext2_iomap_ops);
>         } else if (test_opt(inode->i_sb, NOBH))
>                 error = nobh_truncate_page(inode->i_mapping,
>                                 newsize, ext2_get_block);
> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
> index 0f06305167d5a..8c443b753b815 100644
> --- a/fs/ext4/inode.c
> +++ b/fs/ext4/inode.c
> @@ -3783,8 +3783,8 @@ static int ext4_block_zero_page_range(handle_t *handle,
>                 length = max;
>
>         if (IS_DAX(inode)) {
> -               return iomap_zero_range(inode, from, length, NULL,
> -                                       &ext4_iomap_ops);
> +               return dax_zero_range(inode, from, length, NULL,
> +                                     &ext4_iomap_ops);
>         }
>         return __ext4_block_zero_page_range(handle, mapping, from, length);
>  }
> diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
> index 1753c26c8e76e..b1511255b4df8 100644
> --- a/fs/iomap/buffered-io.c
> +++ b/fs/iomap/buffered-io.c
> @@ -870,26 +870,8 @@ iomap_file_unshare(struct inode *inode, loff_t pos, loff_t len,
>  }
>  EXPORT_SYMBOL_GPL(iomap_file_unshare);
>
> -static s64 __iomap_zero_iter(struct iomap_iter *iter, loff_t pos, u64 length)
> -{
> -       struct page *page;
> -       int status;
> -       unsigned offset = offset_in_page(pos);
> -       unsigned bytes = min_t(u64, PAGE_SIZE - offset, length);
> -
> -       status = iomap_write_begin(iter, pos, bytes, &page);
> -       if (status)
> -               return status;
> -
> -       zero_user(page, offset, bytes);
> -       mark_page_accessed(page);
> -
> -       return iomap_write_end(iter, pos, bytes, bytes, page);
> -}
> -
>  static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
>  {
> -       struct iomap *iomap = &iter->iomap;
>         const struct iomap *srcmap = iomap_iter_srcmap(iter);
>         loff_t pos = iter->pos;
>         loff_t length = iomap_length(iter);
> @@ -900,12 +882,19 @@ static loff_t iomap_zero_iter(struct iomap_iter *iter, bool *did_zero)
>                 return length;
>
>         do {
> -               s64 bytes;
> +               unsigned offset = offset_in_page(pos);
> +               size_t bytes = min_t(u64, PAGE_SIZE - offset, length);
> +               struct page *page;
> +               int status;
>
> -               if (IS_DAX(iter->inode))
> -                       bytes = dax_iomap_zero(pos, length, iomap);
> -               else
> -                       bytes = __iomap_zero_iter(iter, pos, length);
> +               status = iomap_write_begin(iter, pos, bytes, &page);
> +               if (status)
> +                       return status;
> +
> +               zero_user(page, offset, bytes);
> +               mark_page_accessed(page);
> +
> +               bytes = iomap_write_end(iter, pos, bytes, bytes, page);
>                 if (bytes < 0)
>                         return bytes;
>
> diff --git a/fs/xfs/xfs_iomap.c b/fs/xfs/xfs_iomap.c
> index d6d71ae9f2ae4..604000b6243ec 100644
> --- a/fs/xfs/xfs_iomap.c
> +++ b/fs/xfs/xfs_iomap.c
> @@ -1321,6 +1321,9 @@ xfs_zero_range(
>  {
>         struct inode            *inode = VFS_I(ip);
>
> +       if (IS_DAX(inode))
> +               return dax_zero_range(inode, pos, len, did_zero,
> +                                     &xfs_buffered_write_iomap_ops);
>         return iomap_zero_range(inode, pos, len, did_zero,
>                                 &xfs_buffered_write_iomap_ops);
>  }
> @@ -1333,6 +1336,9 @@ xfs_truncate_page(
>  {
>         struct inode            *inode = VFS_I(ip);
>
> +       if (IS_DAX(inode))
> +               return dax_truncate_page(inode, pos, did_zero,
> +                                       &xfs_buffered_write_iomap_ops);
>         return iomap_truncate_page(inode, pos, did_zero,
>                                    &xfs_buffered_write_iomap_ops);
>  }
> diff --git a/include/linux/dax.h b/include/linux/dax.h
> index 324363b798ecd..a5cc2f1aa840e 100644
> --- a/include/linux/dax.h
> +++ b/include/linux/dax.h
> @@ -14,6 +14,7 @@ typedef unsigned long dax_entry_t;
>  struct dax_device;
>  struct gendisk;
>  struct iomap_ops;
> +struct iomap_iter;
>  struct iomap;
>
>  struct dax_operations {
> @@ -124,6 +125,10 @@ struct page *dax_layout_busy_page(struct address_space *mapping);
>  struct page *dax_layout_busy_page_range(struct address_space *mapping, loff_t start, loff_t end);
>  dax_entry_t dax_lock_page(struct page *page);
>  void dax_unlock_page(struct page *page, dax_entry_t cookie);
> +int dax_zero_range(struct inode *inode, loff_t pos, loff_t len, bool *did_zero,
> +               const struct iomap_ops *ops);
> +int dax_truncate_page(struct inode *inode, loff_t pos, bool *did_zero,
> +               const struct iomap_ops *ops);
>  #else
>  static inline int dax_add_host(struct dax_device *dax_dev, struct gendisk *disk)
>  {
> @@ -204,7 +209,6 @@ vm_fault_t dax_finish_sync_fault(struct vm_fault *vmf,
>  int dax_delete_mapping_entry(struct address_space *mapping, pgoff_t index);
>  int dax_invalidate_mapping_entry_sync(struct address_space *mapping,
>                                       pgoff_t index);
> -s64 dax_iomap_zero(loff_t pos, u64 length, struct iomap *iomap);
>  static inline bool dax_mapping(struct address_space *mapping)
>  {
>         return mapping->host && IS_DAX(mapping->host);
> --
> 2.30.2
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
