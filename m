Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB7B689456
	for <lists.virtualization@lfdr.de>; Fri,  3 Feb 2023 10:49:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67E52429F7;
	Fri,  3 Feb 2023 09:49:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67E52429F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hORHDtde-QZL; Fri,  3 Feb 2023 09:49:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id EC71E429ED;
	Fri,  3 Feb 2023 09:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC71E429ED
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41CD9C007C;
	Fri,  3 Feb 2023 09:49:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 233D7C002B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE683429ED
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:49:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE683429ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N9EfobixARLd
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:49:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FC92429E2
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2FC92429E2
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:49:40 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R181e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046056;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=18; SR=0;
 TI=SMTPD_---0VaoUwBD_1675417773; 
Received: from 30.221.129.149(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VaoUwBD_1675417773) by smtp.aliyun-inc.com;
 Fri, 03 Feb 2023 17:49:35 +0800
Message-ID: <160b9e99-bff6-e37c-5f16-00157766535e@linux.alibaba.com>
Date: Fri, 3 Feb 2023 17:49:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: make alloc_anon_inode more useful
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20210309155348.974875-1-hch@lst.de>
From: Jingbo Xu <jefflexu@linux.alibaba.com>
In-Reply-To: <20210309155348.974875-1-hch@lst.de>
Cc: Jason Gunthorpe <jgg@nvidia.com>, "VMware, Inc." <pv-drivers@vmware.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Minchan Kim <minchan@kernel.org>,
 Nadav Amit <namit@vmware.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Nitin Gupta <ngupta@vflare.org>
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

Hi,

Sorry for digging...

This patch series seems useful for fs developers.  I'm not sure its
current status and why it doesn't get merged.


On 3/9/21 11:53 PM, Christoph Hellwig wrote:
> Hi all,
> 
> this series first renames the existing alloc_anon_inode to
> alloc_anon_inode_sb to clearly mark it as requiring a superblock.
> 
> It then adds a new alloc_anon_inode that works on the anon_inode
> file system super block, thus removing tons of boilerplate code.
> 
> The few remainig callers of alloc_anon_inode_sb all use alloc_file_pseudo
> later, but might also be ripe for some cleanup.
> 
> Diffstat:
>  arch/powerpc/platforms/pseries/cmm.c |   27 +-------------
>  drivers/dma-buf/dma-buf.c            |    2 -
>  drivers/gpu/drm/drm_drv.c            |   64 +----------------------------------
>  drivers/misc/cxl/api.c               |    2 -
>  drivers/misc/vmw_balloon.c           |   24 +------------
>  drivers/scsi/cxlflash/ocxl_hw.c      |    2 -
>  drivers/virtio/virtio_balloon.c      |   30 +---------------
>  fs/aio.c                             |    2 -
>  fs/anon_inodes.c                     |   15 +++++++-
>  fs/libfs.c                           |    2 -
>  include/linux/anon_inodes.h          |    1 
>  include/linux/fs.h                   |    2 -
>  kernel/resource.c                    |   30 ++--------------
>  mm/z3fold.c                          |   38 +-------------------
>  mm/zsmalloc.c                        |   48 +-------------------------
>  15 files changed, 39 insertions(+), 250 deletions(-)
> 

-- 
Thanks,
Jingbo
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
