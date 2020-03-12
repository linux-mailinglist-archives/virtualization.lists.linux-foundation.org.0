Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CE7182B65
	for <lists.virtualization@lfdr.de>; Thu, 12 Mar 2020 09:38:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 56983886B2;
	Thu, 12 Mar 2020 08:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjAwSukE8E1Q; Thu, 12 Mar 2020 08:38:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CB1EA88AB4;
	Thu, 12 Mar 2020 08:38:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8CFDC0177;
	Thu, 12 Mar 2020 08:38:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0139C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BE2B9886B2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:38:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4nD4gP4sqHOp
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:38:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 476D5886A4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 12 Mar 2020 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584002280;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Mx1leOjTNR8FYx8qJWBeI/9aTN1gnOw5M28KCVuuEBo=;
 b=Y0kHYrU4tUbu6SivPkVOtRSICVXyiSCXkPxhtHMkRuh9QQOb0h5x/OZBPyUlpeOwylCGqi
 3Hh0eOLaTCJ49jrjBjkJK/xMHfygIxh4xnM8O92x97yowWpb7lW/pawinZbeTN6wtCmKTF
 X5yTHUrm2cr+ed5g2iaEfMJGlhMZUB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-RG2gu1JiNFe3x6howx2dtw-1; Thu, 12 Mar 2020 04:37:55 -0400
X-MC-Unique: RG2gu1JiNFe3x6howx2dtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C181913F5;
 Thu, 12 Mar 2020 08:37:53 +0000 (UTC)
Received: from [10.36.117.247] (ovpn-117-247.ams2.redhat.com [10.36.117.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D090D10013A1;
 Thu, 12 Mar 2020 08:37:34 +0000 (UTC)
Subject: Re: [RFC for Linux] virtio_balloon: Add VIRTIO_BALLOON_F_THP_ORDER to
 handle THP spilt issue
To: Hui Zhu <teawater@gmail.com>, mst@redhat.com, jasowang@redhat.com,
 akpm@linux-foundation.org, pagupta@redhat.com, mojha@codeaurora.org,
 namit@vmware.com, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
References: <1583999395-9131-1-git-send-email-teawater@gmail.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat GmbH
Message-ID: <3e1373f4-6ade-c651-ddde-6f04e78382f9@redhat.com>
Date: Thu, 12 Mar 2020 09:37:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1583999395-9131-1-git-send-email-teawater@gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Hui Zhu <teawaterz@linux.alibaba.com>
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

On 12.03.20 08:49, Hui Zhu wrote:
> If the guest kernel has many fragmentation pages, use virtio_balloon
> will split THP of QEMU when it calls MADV_DONTNEED madvise to release
> the balloon pages.
> This is an example in a VM with 1G memory 1CPU:
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:         0 kB
> 
> usemem --punch-holes -s -1 800m &
> 
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    976896 kB
> 
> (qemu) device_add virtio-balloon-pci,id=balloon1
> (qemu) info balloon
> balloon: actual=1024
> (qemu) balloon 624
> (qemu) info balloon
> balloon: actual=624
> 
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    153600 kB
> 
> THP number decreased more than 800M.
> The reason is usemem with punch-holes option will free every other page
> after allocation.  Then 400M free memory inside the guest kernel is
> fragmentation pages.
> The guest kernel will use them to inflate the balloon.  When these
> fragmentation pages are freed, THP will be split.
> 
> This commit tries to handle this with add a new flag
> VIRTIO_BALLOON_F_THP_ORDER.
> When this flag is set, the balloon page order will be set to the THP order.
> Then THP pages will be freed together in the host.
> This is an example in a VM with 1G memory 1CPU:
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:         0 kB
> 
> usemem --punch-holes -s -1 800m &
> 
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    976896 kB
> 
> (qemu) device_add virtio-balloon-pci,id=balloon1,thp-order=on
> (qemu) info balloon
> balloon: actual=1024
> (qemu) balloon 624
> (qemu) info balloon
> balloon: actual=624
> 
> cat /proc/meminfo | grep AnonHugePages:
> AnonHugePages:    583680 kB
> 
> The THP number decreases 384M.  This shows that VIRTIO_BALLOON_F_THP_ORDER
> can help handle the THP split issue.


Multiple things:

I recently had a similar discussion with Alex [1] and I think this needs
more thought.

My thoughts:

1. You most certainly want to fallback to allocating pages in a smaller
granularity once you run out of bigger allocations. Sacrifice
performance for memory inflation, which has always been the case and
which is what people expect to happen. (e.g., to shrink the page cache
properly)

2. You are essentially stealing THPs in the guest. So the fastest
mapping (THP in guest and host) is gone. The guest won't be able to make
use of THP where it previously was able to. I can imagine this implies a
performance degradation for some workloads. This needs a proper
performance evaluation.

3. The pages you allocate are not migrateable, e.g., for memory
offlining or alloc_contig_range() users like gigantic pages or soon
virtio-mem. I strongly dislike that. This is IMHO a step backwards. We
want to be able to migrate or even split-up and migrate such pages.

Assume the guest could make good use of a THP somewhere. Who says it
wouldn't be better to sacrifice a huge balloon page to be able to use
THP both in the guest and the host for that mapping? I am not convinced
stealing possible THPs in the guest and not being able to split them up
is really what we want performance wise.


4. I think we also want a better mechanism to directly inflate/deflate
higher/order pages and not reuse the 4k inflate/deflate queues.

5. I think we don't want to hard code such THP values but let the host
tell us the THP size instead, which can easily differ between guest and
host.

Also, I do wonder if balloon compaction in the guest will already result
in more THP getting used again long term. Assume the guest compacts
balloon pages into a single THP again. This will result in a bunch of
DONTNEED/WILLNEED in the hypervisor due to inflation/deflation. I wonder
if the WILLNEED on the sub-pages of a candidate THP in the host will
allow to use a THP in the host again.


[1]
https://lore.kernel.org/linux-mm/939de9de-d82a-aed2-6a51-57a55d81cbff@redhat.com/

> 
> Signed-off-by: Hui Zhu <teawaterz@linux.alibaba.com>
> ---
>  drivers/virtio/virtio_balloon.c     | 57 ++++++++++++++++++++++++++-----------
>  include/linux/balloon_compaction.h  | 14 ++++++---
>  include/uapi/linux/virtio_balloon.h |  4 +++
>  3 files changed, 54 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 7bfe365..1e1dc76 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -175,18 +175,31 @@ static unsigned fill_balloon(struct virtio_balloon *vb, size_t num)
>  	unsigned num_pfns;
>  	struct page *page;
>  	LIST_HEAD(pages);
> +	int page_order = 0;
>  
>  	/* We can only do one array worth at a time. */
>  	num = min(num, ARRAY_SIZE(vb->pfns));
>  
> +	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_THP_ORDER))
> +		page_order = VIRTIO_BALLOON_THP_ORDER;
> +
>  	for (num_pfns = 0; num_pfns < num;
>  	     num_pfns += VIRTIO_BALLOON_PAGES_PER_PAGE) {
> -		struct page *page = balloon_page_alloc();
> +		struct page *page;
> +
> +		if (page_order)
> +			page = alloc_pages(__GFP_HIGHMEM |
> +					   __GFP_KSWAPD_RECLAIM |
> +					   __GFP_RETRY_MAYFAIL |
> +					   __GFP_NOWARN | __GFP_NOMEMALLOC,
> +					   page_order);
> +		else
> +			page = balloon_page_alloc();
>  
>  		if (!page) {
>  			dev_info_ratelimited(&vb->vdev->dev,
> -					     "Out of puff! Can't get %u pages\n",
> -					     VIRTIO_BALLOON_PAGES_PER_PAGE);
> +				"Out of puff! Can't get %u pages\n",
> +				VIRTIO_BALLOON_PAGES_PER_PAGE << page_order);
>  			/* Sleep for at least 1/5 of a second before retry. */
>  			msleep(200);
>  			break;
> @@ -206,7 +219,7 @@ static unsigned fill_balloon(struct virtio_balloon *vb, size_t num)
>  		vb->num_pages += VIRTIO_BALLOON_PAGES_PER_PAGE;
>  		if (!virtio_has_feature(vb->vdev,
>  					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> -			adjust_managed_page_count(page, -1);
> +			adjust_managed_page_count(page, -(1 << page_order));
>  		vb->num_pfns += VIRTIO_BALLOON_PAGES_PER_PAGE;
>  	}
>  
> @@ -223,13 +236,20 @@ static void release_pages_balloon(struct virtio_balloon *vb,
>  				 struct list_head *pages)
>  {
>  	struct page *page, *next;
> +	int page_order = 0;
> +
> +	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_THP_ORDER))
> +		page_order = VIRTIO_BALLOON_THP_ORDER;
>  
>  	list_for_each_entry_safe(page, next, pages, lru) {
>  		if (!virtio_has_feature(vb->vdev,
>  					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> -			adjust_managed_page_count(page, 1);
> +			adjust_managed_page_count(page, 1 << page_order);
>  		list_del(&page->lru);
> -		put_page(page); /* balloon reference */
> +		if (page_order)
> +			__free_pages(page, page_order);
> +		else
> +			put_page(page); /* balloon reference */
>  	}
>  }
>  
> @@ -893,19 +913,21 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  		goto out_free_vb;
>  
>  #ifdef CONFIG_BALLOON_COMPACTION
> -	balloon_mnt = kern_mount(&balloon_fs);
> -	if (IS_ERR(balloon_mnt)) {
> -		err = PTR_ERR(balloon_mnt);
> -		goto out_del_vqs;
> -	}
> +	if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_THP_ORDER)) {
> +		balloon_mnt = kern_mount(&balloon_fs);
> +		if (IS_ERR(balloon_mnt)) {
> +			err = PTR_ERR(balloon_mnt);
> +			goto out_del_vqs;
> +		}
>  
> -	vb->vb_dev_info.migratepage = virtballoon_migratepage;
> -	vb->vb_dev_info.inode = alloc_anon_inode(balloon_mnt->mnt_sb);
> -	if (IS_ERR(vb->vb_dev_info.inode)) {
> -		err = PTR_ERR(vb->vb_dev_info.inode);
> -		goto out_kern_unmount;
> +		vb->vb_dev_info.migratepage = virtballoon_migratepage;
> +		vb->vb_dev_info.inode = alloc_anon_inode(balloon_mnt->mnt_sb);
> +		if (IS_ERR(vb->vb_dev_info.inode)) {
> +			err = PTR_ERR(vb->vb_dev_info.inode);
> +			goto out_kern_unmount;
> +		}
> +		vb->vb_dev_info.inode->i_mapping->a_ops = &balloon_aops;
>  	}
> -	vb->vb_dev_info.inode->i_mapping->a_ops = &balloon_aops;
>  #endif
>  	if (virtio_has_feature(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
>  		/*
> @@ -1058,6 +1080,7 @@ static unsigned int features[] = {
>  	VIRTIO_BALLOON_F_DEFLATE_ON_OOM,
>  	VIRTIO_BALLOON_F_FREE_PAGE_HINT,
>  	VIRTIO_BALLOON_F_PAGE_POISON,
> +	VIRTIO_BALLOON_F_THP_ORDER,
>  };
>  
>  static struct virtio_driver virtio_balloon_driver = {
> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
> index 338aa27..4c9164e 100644
> --- a/include/linux/balloon_compaction.h
> +++ b/include/linux/balloon_compaction.h
> @@ -100,8 +100,12 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>  				       struct page *page)
>  {
>  	__SetPageOffline(page);
> -	__SetPageMovable(page, balloon->inode->i_mapping);
> -	set_page_private(page, (unsigned long)balloon);
> +	if (balloon->inode) {
> +		__SetPageMovable(page, balloon->inode->i_mapping);
> +		set_page_private(page, (unsigned long)balloon);
> +	} else {
> +		set_page_private(page, 0);
> +	}
>  	list_add(&page->lru, &balloon->pages);
>  }
>  
> @@ -116,8 +120,10 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>  static inline void balloon_page_delete(struct page *page)
>  {
>  	__ClearPageOffline(page);
> -	__ClearPageMovable(page);
> -	set_page_private(page, 0);
> +	if (page_private(page)) {
> +		__ClearPageMovable(page);
> +		set_page_private(page, 0);
> +	}
>  	/*
>  	 * No touch page.lru field once @page has been isolated
>  	 * because VM is using the field.
> diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
> index a1966cd7..a2998a9 100644
> --- a/include/uapi/linux/virtio_balloon.h
> +++ b/include/uapi/linux/virtio_balloon.h
> @@ -36,10 +36,14 @@
>  #define VIRTIO_BALLOON_F_DEFLATE_ON_OOM	2 /* Deflate balloon on OOM */
>  #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
>  #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
> +#define VIRTIO_BALLOON_F_THP_ORDER	5 /* Balloon page order to thp order */
>  
>  /* Size of a PFN in the balloon interface. */
>  #define VIRTIO_BALLOON_PFN_SHIFT 12
>  
> +/* The order of the balloon page */
> +#define VIRTIO_BALLOON_THP_ORDER 9
> +
>  #define VIRTIO_BALLOON_CMD_ID_STOP	0
>  #define VIRTIO_BALLOON_CMD_ID_DONE	1
>  struct virtio_balloon_config {
> 


-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
