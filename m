Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7066CF3B
	for <lists.virtualization@lfdr.de>; Thu, 18 Jul 2019 15:55:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6CBAF111B;
	Thu, 18 Jul 2019 13:55:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 98543EE1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 13:54:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E25C08B5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 18 Jul 2019 13:54:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECA3430C62AC;
	Thu, 18 Jul 2019 13:54:50 +0000 (UTC)
Received: from redhat.com (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
	by smtp.corp.redhat.com (Postfix) with SMTP id 220381001B18;
	Thu, 18 Jul 2019 13:54:48 +0000 (UTC)
Date: Thu, 18 Jul 2019 09:54:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Wang, Wei W" <wei.w.wang@intel.com>
Subject: Re: [PATCH v3 2/2] balloon: fix up comments
Message-ID: <20190718094840-mutt-send-email-mst@kernel.org>
References: <20190718122324.10552-1-mst@redhat.com>
	<20190718122324.10552-2-mst@redhat.com>
	<286AC319A985734F985F78AFA26841F73E1705ED@shsmsx102.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <286AC319A985734F985F78AFA26841F73E1705ED@shsmsx102.ccr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Jul 2019 13:54:51 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Thu, Jul 18, 2019 at 01:47:40PM +0000, Wang, Wei W wrote:
> On Thursday, July 18, 2019 8:24 PM, Michael S. Tsirkin wrote:
> >  /*
> >   * balloon_page_alloc - allocates a new page for insertion into the balloon
> > - *			  page list.
> > + *			page list.
> >   *
> > - * Driver must call it to properly allocate a new enlisted balloon page.
> > - * Driver must call balloon_page_enqueue before definitively removing it
> > from
> > - * the guest system.  This function returns the page address for the recently
> > - * allocated page or NULL in the case we fail to allocate a new page this turn.
> > + * Driver must call this function to properly allocate a new enlisted balloon
> > page.
> 
> Probably better to say "allocate a new balloon page to enlist" ?
> "enlisted page" implies that the allocated page has been added to the list, which might
> be misleading.


right should be just a new balloon page.
> 
> > + * Driver must call balloon_page_enqueue before definitively removing
> > + the page
> > + * from the guest system.
> > + *
> > + * Returns: struct page address for the allocated page or NULL in case it fails
> > + * 			to allocate a new page.
> >   */
> 
> Returns: pointer to the page struct of the allocated page, or NULL if allocation fails.


ok

> 
> 
> >  struct page *balloon_page_alloc(void)
> >  {
> > @@ -130,19 +133,15 @@ EXPORT_SYMBOL_GPL(balloon_page_alloc);
> >  /*
> >   * balloon_page_enqueue - inserts a new page into the balloon page list.
> >   *
> > - * @b_dev_info: balloon device descriptor where we will insert a new page
> > to
> > + * @b_dev_info: balloon device descriptor where we will insert a new
> > + page
> >   * @page: new page to enqueue - allocated using balloon_page_alloc.
> >   *
> > - * Driver must call it to properly enqueue a new allocated balloon page
> > - * before definitively removing it from the guest system.
> > + * Drivers must call this function to properly enqueue a new allocated
> > + balloon
> > + * page before definitively removing the page from the guest system.
> >   *
> > - * Drivers must not call balloon_page_enqueue on pages that have been
> > - * pushed to a list with balloon_page_push before removing them with
> > - * balloon_page_pop. To all pages on a list, use balloon_page_list_enqueue
> > - * instead.
> > - *
> > - * This function returns the page address for the recently enqueued page or
> > - * NULL in the case we fail to allocate a new page this turn.
> > + * Drivers must not call balloon_page_enqueue on pages that have been
> > + pushed to
> > + * a list with balloon_page_push before removing them with
> > + balloon_page_pop. To
> > + * enqueue all pages on a list, use balloon_page_list_enqueue instead.
> 
> "To enqueue a list of pages" ?

ok

> 
> >   */
> >  void balloon_page_enqueue(struct balloon_dev_info *b_dev_info,
> >  			  struct page *page)
> > @@ -157,14 +156,24 @@ EXPORT_SYMBOL_GPL(balloon_page_enqueue);
> > 
> >  /*
> >   * balloon_page_dequeue - removes a page from balloon's page list and
> > returns
> > - *			  the its address to allow the driver release the page.
> > + *			  its address to allow the driver to release the page.
> >   * @b_dev_info: balloon device decriptor where we will grab a page from.
> >   *
> > - * Driver must call it to properly de-allocate a previous enlisted balloon
> > page
> > - * before definetively releasing it back to the guest system.
> > - * This function returns the page address for the recently dequeued page or
> > - * NULL in the case we find balloon's page list temporarily empty due to
> > - * compaction isolated pages.
> > + * Driver must call this to properly dequeue a previously enqueued page
>  
> "call this function"?

ok

> 
> > + * before definitively releasing it back to the guest system.
> > + *
> > + * Caller must perform its own accounting to ensure that this
> > + * function is called only if some pages are actually enqueued.
> 
> 
> "only when" ?

I think when would be confusing here since this function
is called significantly after pages are first enqueued.

> > + *
> > + * Note that this function may fail to dequeue some pages even if there
> 
> "even when" ?

same

> > + are
> > + * some enqueued pages - since the page list can be temporarily empty
> > + due to
> > + * the compaction of isolated pages.
> > + *
> > + * TODO: remove the caller accounting requirements, and allow caller to
> > + wait
> > + * until all pages can be dequeued.
> > + *
> > + * Returns: struct page address for the dequeued page, or NULL if it fails to
> > + * 			dequeue any pages.
> 
> Returns: pointer to the page struct of the dequeued page, or NULL if no page gets dequeued.
> 

was dequeued.

> >   */
> >  struct page *balloon_page_dequeue(struct balloon_dev_info *b_dev_info)
> > { @@ -177,9 +186,9 @@ struct page *balloon_page_dequeue(struct
> > balloon_dev_info *b_dev_info)
> >  	if (n_pages != 1) {
> >  		/*
> >  		 * If we are unable to dequeue a balloon page because the
> > page
> > -		 * list is empty and there is no isolated pages, then
> > something
> > +		 * list is empty and there are no isolated pages, then
> > something
> >  		 * went out of track and some balloon pages are lost.
> > -		 * BUG() here, otherwise the balloon driver may get stuck
> > into
> > +		 * BUG() here, otherwise the balloon driver may get stuck in
> >  		 * an infinite loop while attempting to release all its pages.
> >  		 */
> >  		spin_lock_irqsave(&b_dev_info->pages_lock, flags); @@ -
> > 230,8 +239,8 @@ int balloon_page_migrate(struct address_space *mapping,
> > 
> >  	/*
> >  	 * We can not easily support the no copy case here so ignore it as it
>  
> "cannot"
> 
> > -	 * is unlikely to be use with ballon pages. See include/linux/hmm.h
> > for
> > -	 * user of the MIGRATE_SYNC_NO_COPY mode.
> > +	 * is unlikely to be used with ballon pages. See include/linux/hmm.h
> 
> 
> "ballon" -> "balloon"

ok

> 
> > for
> > +	 * a user of the MIGRATE_SYNC_NO_COPY mode.
> 
> "for the usage of" ?

Not really I think, it's an example user but does not document usage.

> 
> Other parts look good to me.
> Reviewed-by: Wei Wang <wei.w.wang@intel.com>
> 
> Best,
> Wei
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
