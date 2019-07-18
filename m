Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DE94F73769
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:08:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BC6A11508;
	Wed, 24 Jul 2019 18:59:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 52C1A19CD
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 16:48:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8604388E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 16:48:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5d30a2d80000>; Thu, 18 Jul 2019 09:48:24 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Thu, 18 Jul 2019 09:48:18 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Thu, 18 Jul 2019 09:48:18 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
	(172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 18 Jul 2019 16:48:17 +0000
Subject: Re: [PATCH v4 2/2] balloon: fix up comments
To: "Michael S. Tsirkin" <mst@redhat.com>, <linux-kernel@vger.kernel.org>
References: <20190718140006.15052-1-mst@redhat.com>
	<20190718140006.15052-2-mst@redhat.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <97bc457a-6e9c-50d7-0060-555547e9f65b@nvidia.com>
Date: Thu, 18 Jul 2019 09:48:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190718140006.15052-2-mst@redhat.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
	HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1563468504; bh=71Izg78aTb6CFgbhsKMUIFfFgMMQWVl+aKHWkhvfNQo=;
	h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
	Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	Content-Transfer-Encoding;
	b=r5nlN0qIvjN4cJP5Al6hkRxP7jUFNYjTcfyHHVfqmgbIs1/Tsl7+tJyTBE0eIWCTG
	WIUBKCytgAfXZP2wSvfVP4HNXXKHBf5hS6HeoyXYHbJxC3jPlYW7O2uJx/IrzFo6DE
	c1Um9tRFXbdAjgHXFDw3T+bk6dhsOTLlYnyAtKgxUDwlBbEbLd90zTvLXlCg+76GCr
	Kk3GA7ANtc1fzZFgScV1LOk6tgiVSbLv4trXKthZ7W6aT33OkJ9TAcz/5T9fr6PkWj
	YKlzdNBDImCLxpd9tKC43JgTkfUSWcr3Xcn+BoZR2zptnwA8+dQWIsh+lStf1lYN0T
	hgei965JI1ALw==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: linux-mm@kvack.org, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org


On 7/18/19 7:01 AM, Michael S. Tsirkin wrote:
> Lots of comments bitrotted. Fix them up.
> 
> Fixes: 418a3ab1e778 (mm/balloon_compaction: List interfaces)
> Reviewed-by: Wei Wang <wei.w.wang@intel.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> fixes since v3:
> 	teaks suggested by Wei
> 
>   mm/balloon_compaction.c | 71 ++++++++++++++++++++++-------------------
>   1 file changed, 39 insertions(+), 32 deletions(-)
> 
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index d25664e1857b..7e95d2cd185a 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -32,10 +32,10 @@ static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
>    * @b_dev_info: balloon device descriptor where we will insert a new page to
>    * @pages: pages to enqueue - allocated using balloon_page_alloc.
>    *
> - * Driver must call it to properly enqueue a balloon pages before definitively
> - * removing it from the guest system.
> + * Driver must call this function to properly enqueue balloon pages before
> + * definitively removing them from the guest system.
>    *
> - * Return: number of pages that were enqueued.
> + * Returns: number of pages that were enqueued.

According to Documentation/doc-guide/kernel-doc.rst,
this is going in the wrong direction and "Return:" is correct.
Ditto for other occurrences below.

>    */
>   size_t balloon_page_list_enqueue(struct balloon_dev_info *b_dev_info,
>   				 struct list_head *pages)
> @@ -63,14 +63,15 @@ EXPORT_SYMBOL_GPL(balloon_page_list_enqueue);
>    * @n_req_pages: number of requested pages.
>    *
>    * Driver must call this function to properly de-allocate a previous enlisted
> - * balloon pages before definetively releasing it back to the guest system.
> + * balloon pages before definitively releasing it back to the guest system.
>    * This function tries to remove @n_req_pages from the ballooned pages and
>    * return them to the caller in the @pages list.
>    *
> - * Note that this function may fail to dequeue some pages temporarily empty due
> - * to compaction isolated pages.
> + * Note that this function may fail to dequeue some pages even if the balloon
> + * isn't empty - since the page list can be temporarily empty due to compaction
> + * of isolated pages.
>    *
> - * Return: number of pages that were added to the @pages list.
> + * Returns: number of pages that were added to the @pages list.
>    */
>   size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
>   				 struct list_head *pages, size_t n_req_pages)
> @@ -112,12 +113,13 @@ EXPORT_SYMBOL_GPL(balloon_page_list_dequeue);
>   
>   /*
>    * balloon_page_alloc - allocates a new page for insertion into the balloon
> - *			  page list.
> + *			page list.
>    *
> - * Driver must call it to properly allocate a new enlisted balloon page.
> - * Driver must call balloon_page_enqueue before definitively removing it from
> - * the guest system.  This function returns the page address for the recently
> - * allocated page or NULL in the case we fail to allocate a new page this turn.
> + * Driver must call this function to properly allocate a new balloon page.
> + * Driver must call balloon_page_enqueue before definitively removing the page
> + * from the guest system.
> + *
> + * Returns: struct page for the allocated page or NULL on allocation failure.
>    */
>   struct page *balloon_page_alloc(void)
>   {
> @@ -130,19 +132,15 @@ EXPORT_SYMBOL_GPL(balloon_page_alloc);
>   /*
>    * balloon_page_enqueue - inserts a new page into the balloon page list.
>    *
> - * @b_dev_info: balloon device descriptor where we will insert a new page to
> + * @b_dev_info: balloon device descriptor where we will insert a new page
>    * @page: new page to enqueue - allocated using balloon_page_alloc.
>    *
> - * Driver must call it to properly enqueue a new allocated balloon page
> - * before definitively removing it from the guest system.
> + * Drivers must call this function to properly enqueue a new allocated balloon
> + * page before definitively removing the page from the guest system.
>    *
> - * Drivers must not call balloon_page_enqueue on pages that have been
> - * pushed to a list with balloon_page_push before removing them with
> - * balloon_page_pop. To all pages on a list, use balloon_page_list_enqueue
> - * instead.
> - *
> - * This function returns the page address for the recently enqueued page or
> - * NULL in the case we fail to allocate a new page this turn.
> + * Drivers must not call balloon_page_enqueue on pages that have been pushed to
> + * a list with balloon_page_push before removing them with balloon_page_pop. To
> + * enqueue a list of pages, use balloon_page_list_enqueue instead.
>    */
>   void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
>   			  struct page *page)
> @@ -157,14 +155,23 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
>   
>   /*
>    * balloon_page_dequeue - removes a page from balloon's page list and returns
> - *			  the its address to allow the driver release the page.
> + *			  its address to allow the driver to release the page.
>    * @b_dev_info: balloon device decriptor where we will grab a page from.
>    *
> - * Driver must call it to properly de-allocate a previous enlisted balloon page
> - * before definetively releasing it back to the guest system.
> - * This function returns the page address for the recently dequeued page or
> - * NULL in the case we find balloon's page list temporarily empty due to
> - * compaction isolated pages.
> + * Driver must call this function to properly dequeue a previously enqueued page
> + * before definitively releasing it back to the guest system.
> + *
> + * Caller must perform its own accounting to ensure that this
> + * function is called only if some pages are actually enqueued.
> + *
> + * Note that this function may fail to dequeue some pages even if there are
> + * some enqueued pages - since the page list can be temporarily empty due to
> + * the compaction of isolated pages.
> + *
> + * TODO: remove the caller accounting requirements, and allow caller to wait
> + * until all pages can be dequeued.
> + *
> + * Returns: struct page for the dequeued page, or NULL if no page was dequeued.
>    */
>   struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info)
>   {
> @@ -177,9 +184,9 @@ struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info)
>   	if (n_pages != 1) {
>   		/*
>   		 * If we are unable to dequeue a balloon page because the page
> -		 * list is empty and there is no isolated pages, then something
> +		 * list is empty and there are no isolated pages, then something
>   		 * went out of track and some balloon pages are lost.
> -		 * BUG() here, otherwise the balloon driver may get stuck into
> +		 * BUG() here, otherwise the balloon driver may get stuck in
>   		 * an infinite loop while attempting to release all its pages.
>   		 */
>   		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
> @@ -230,8 +237,8 @@ int balloon_page_migrate(struct address_space *mapping,
>   
>   	/*
>   	 * We can not easily support the no copy case here so ignore it as it
> -	 * is unlikely to be use with ballon pages. See include/linux/hmm.h for
> -	 * user of the MIGRATE_SYNC_NO_COPY mode.
> +	 * is unlikely to be used with balloon pages. See include/linux/hmm.h
> +	 * for a user of the MIGRATE_SYNC_NO_COPY mode.
>   	 */
>   	if (mode == MIGRATE_SYNC_NO_COPY)
>   		return -EINVAL;
> 
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
