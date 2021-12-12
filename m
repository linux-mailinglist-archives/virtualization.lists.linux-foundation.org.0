Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB43471AA7
	for <lists.virtualization@lfdr.de>; Sun, 12 Dec 2021 15:22:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5F4E429F7;
	Sun, 12 Dec 2021 14:22:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OchGqSi6nk3H; Sun, 12 Dec 2021 14:22:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6B855429FE;
	Sun, 12 Dec 2021 14:22:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4CAEC0039;
	Sun, 12 Dec 2021 14:22:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03AD1C0012
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Dec 2021 14:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1FBE429FE
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Dec 2021 14:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SS3_lixhhbs9
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Dec 2021 14:22:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CC0A429F7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Dec 2021 14:22:30 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id p13so12776256pfw.2
 for <virtualization@lists.linux-foundation.org>;
 Sun, 12 Dec 2021 06:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DZjYIL5Meh9WPTLeEH+cczxaNrQ4dGhT95FlbuKwOdM=;
 b=InloMfMHit9I2BP2ZAxscR4m8S0WqeQXb/3EdrF9Humvvh2KWl+DC597jSlAGabELB
 DKTerSvnwB6GzWYotS0B9i033X/RFINibj/zOD0xrbstT+NhnIidusj/k7Ta2k1KwAr+
 EG4TvrpQJgRKRNS+j8HgfWmKEn0+BAHbJ+kjXAkWBw/H2S7Ll4HSeVLamvPnZ0Gv8yyl
 TLlpEyqP9KcyM139lWFcqovUaohDL62uyQPIquf1zd1gLEhLHxB1hln6xdDrM6LbhG63
 WHJWWDnlHRBcfJYMi86Gvpdgy5byWgeSLzaPT/b6VuOcGwSqgKTbI7648s4ZDB3zrsX3
 7FTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DZjYIL5Meh9WPTLeEH+cczxaNrQ4dGhT95FlbuKwOdM=;
 b=niRWfhrofTbGnqLGK5BLZfe6YKoUcAbZubk9WfO1QHRFAbBwj+MbaVetnjnPTaIEvT
 KQatlFPCYvFR44d3+3Nw7TkPoYMYaYJeK6aVXUWQf8seXBUSddpGc0rHLuQAfWTmiWBo
 I21n8c+cARCGQJ11WjF97aYwYxsaAoIcfSVyNObUGEiepoTNtS1TaOVbMKWEVwdsikBX
 tJHKxnISFG4FUHYgr/myDzSm8ChxIuAqhXBZwjhvNTnLP+/adL9GNDXPKZL5Fb0M6tvq
 jUYFUWQSzx8viUWBbRhEQl4IE5VkuHTiZiZcVcLtKLwyXP4W34ojuFtAU4+EhefZcUbZ
 oheg==
X-Gm-Message-State: AOAM531/98d2u1M+J0X3Y6FE+344/sm0QENpP6vkQYWLu9Mo8EvvN8PI
 n9Z8kdEY3QC8vMrjmFAe0HiAhKB8/cwCpTkCj3376g==
X-Google-Smtp-Source: ABdhPJyxbhOi5AL5eM6jiu7484TwbdU5pKz4nFxYJvBebbsi3mSjMdfP5DTSAeCbzo51p2wcGaag8JGjamOTAXCXkd0=
X-Received: by 2002:a62:7ec4:0:b0:4a3:219b:7008 with SMTP id
 z187-20020a627ec4000000b004a3219b7008mr28747585pfc.3.1639318950463; Sun, 12
 Dec 2021 06:22:30 -0800 (PST)
MIME-Version: 1.0
References: <20211209063828.18944-1-hch@lst.de>
 <20211209063828.18944-2-hch@lst.de>
In-Reply-To: <20211209063828.18944-2-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 12 Dec 2021 06:22:20 -0800
Message-ID: <CAPcyv4gwfVi389e+cES=E6O13+y36OffZPCe+iZguCT_gpjmZA@mail.gmail.com>
Subject: Re: [PATCH 1/5] uio: remove copy_from_iter_flushcache() and
 copy_mc_to_iter()
To: Christoph Hellwig <hch@lst.de>
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>,
 linux-s390 <linux-s390@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Mike Snitzer <snitzer@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Vishal Verma <vishal.l.verma@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 device-mapper development <dm-devel@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>,
 Alasdair Kergon <agk@redhat.com>
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

On Wed, Dec 8, 2021 at 10:38 PM Christoph Hellwig <hch@lst.de> wrote:
>
> These two wrappers are never used.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/nvdimm/pmem.c |  4 ++--
>  include/linux/uio.h   | 20 +-------------------
>  2 files changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
> index 4190c8c46ca88..8294f1c701baa 100644
> --- a/drivers/nvdimm/pmem.c
> +++ b/drivers/nvdimm/pmem.c
> @@ -302,8 +302,8 @@ static long pmem_dax_direct_access(struct dax_device *dax_dev,
>  }
>
>  /*
> - * Use the 'no check' versions of copy_from_iter_flushcache() and
> - * copy_mc_to_iter() to bypass HARDENED_USERCOPY overhead. Bounds
> + * Use the 'no check' versions of _copy_from_iter_flushcache() and
> + * _copy_mc_to_iter() to bypass HARDENED_USERCOPY overhead. Bounds
>   * checking, both file offset and device offset, is handled by
>   * dax_iomap_actor()
>   */

This comment change does not make sense since it is saying why pmem is
using the "_" versions. However, I assume this whole comment goes away
in a later patch.

> diff --git a/include/linux/uio.h b/include/linux/uio.h
> index 6350354f97e90..494d552c1d663 100644
> --- a/include/linux/uio.h
> +++ b/include/linux/uio.h
> @@ -196,7 +196,7 @@ bool copy_from_iter_full_nocache(void *addr, size_t bytes, struct iov_iter *i)
>  #ifdef CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE
>  /*
>   * Note, users like pmem that depend on the stricter semantics of
> - * copy_from_iter_flushcache() than copy_from_iter_nocache() must check for
> + * _copy_from_iter_flushcache() than _copy_from_iter_nocache() must check for
>   * IS_ENABLED(CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE) before assuming that the
>   * destination is flushed from the cache on return.
>   */

Same here.

> @@ -211,24 +211,6 @@ size_t _copy_mc_to_iter(const void *addr, size_t bytes, struct iov_iter *i);
>  #define _copy_mc_to_iter _copy_to_iter
>  #endif
>
> -static __always_inline __must_check
> -size_t copy_from_iter_flushcache(void *addr, size_t bytes, struct iov_iter *i)
> -{
> -       if (unlikely(!check_copy_size(addr, bytes, false)))
> -               return 0;
> -       else
> -               return _copy_from_iter_flushcache(addr, bytes, i);
> -}
> -
> -static __always_inline __must_check
> -size_t copy_mc_to_iter(void *addr, size_t bytes, struct iov_iter *i)
> -{
> -       if (unlikely(!check_copy_size(addr, bytes, true)))
> -               return 0;
> -       else
> -               return _copy_mc_to_iter(addr, bytes, i);
> -}
> -
>  size_t iov_iter_zero(size_t bytes, struct iov_iter *);
>  unsigned long iov_iter_alignment(const struct iov_iter *i);
>  unsigned long iov_iter_gap_alignment(const struct iov_iter *i);
> --
> 2.30.2
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
