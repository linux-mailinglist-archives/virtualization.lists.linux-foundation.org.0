Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8966EBE0E
	for <lists.virtualization@lfdr.de>; Sun, 23 Apr 2023 10:39:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D794F41872;
	Sun, 23 Apr 2023 08:39:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D794F41872
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=liUsRgvN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Pai1GLbu7e2; Sun, 23 Apr 2023 08:39:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7A61F410D1;
	Sun, 23 Apr 2023 08:39:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A61F410D1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A195C008A;
	Sun, 23 Apr 2023 08:39:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0E5FC002A
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 08:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8436405F7
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 08:39:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8436405F7
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=liUsRgvN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6E84F8ieVVo8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 08:39:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42A1C403F8
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42A1C403F8
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Apr 2023 08:39:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D0A260C26;
 Sun, 23 Apr 2023 08:39:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B1CC433EF;
 Sun, 23 Apr 2023 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1682239158;
 bh=378pUwS3DVceDjHHU7S0ZeFd9ro9fgPtx6/i4wYo4ew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=liUsRgvN/aRClia3fLfk8J5xEfahmiROU8z35PQxa1jujtb9f7meSAUaBvk6BJUNy
 YY7bXH4LHbiRhyThPH0mpMAk8qUnIzHsORWrRXai1WlFUgnQ/4fvzhiw0OYPcqQDVN
 uvlJDayTxhVzNVMWCHPwrdpkHjLXei1YyLRXDV8s=
Date: Sun, 23 Apr 2023 10:39:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v1] xsk: introduce xsk_dma_cbs
Message-ID: <2023042342-triceps-alias-5084@gregkh>
References: <20230423062546.96880-1-xuanzhuo@linux.alibaba.com>
 <ZETUAMqKc8iLhTk3@kroah.com>
 <1682233116.3679233-3-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1682233116.3679233-3-xuanzhuo@linux.alibaba.com>
Cc: Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Alexei Starovoitov <ast@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
 Guenter Roeck <linux@roeck-us.net>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

On Sun, Apr 23, 2023 at 02:58:36PM +0800, Xuan Zhuo wrote:
> On Sun, 23 Apr 2023 08:45:20 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Sun, Apr 23, 2023 at 02:25:45PM +0800, Xuan Zhuo wrote:
> > > The purpose of this patch is to allow driver pass the own dma callbacks
> > > to xsk.
> > >
> > > This is to cope with the scene of virtio-net. If virtio does not have
> > > VIRTIO_F_ACCESS_PLATFORM, then virtio cannot use DMA API. In this case,
> > > xsk cannot use DMA API directly to achieve DMA address. Based on this
> > > scene, we must let xsk support driver to use the driver's dma callbacks.
> >
> > Why does virtio need to use dma?  That seems to go against the overall
> > goal of virtio's new security restrictions that are being proposed
> > (where they do NOT want it to use dma as it is not secure).
> 
> Sorry, I don't know that, could you give me one link?

Search for the "Confidential Computing" emails on lkml for an example of
this mess.

> But now, virtio-net/virtio will use dma api, when the feature VIRTIO_F_ACCESS_PLATFORM
> is got. If no VIRTIO_F_ACCESS_PLATFORM, the virtio(virtio-net) will not use DMA
> API.
> 
> >
> > And why is virtio special here?
> 
> The problem is that xsk always get dma by DMA APIs, but sometimes the
> virtio-net can not work with DMA APIs.
> 
> > If you have access to a device, it
> > should have all of the needed dma hooks already set up based on the
> > bus it is on.  Or is the issue you don't have a real bus set up?  If so,
> > why not fix that?
> 
> We tried, but that seams we can not.
> More:
>    https://lore.kernel.org/virtualization/1681265026.6082013-1-xuanzhuo@linux.alibaba.com/

So you are assuming a random virtual device with no dma backing bus is
allowed to do dma operations?  This feels wrong and should be fixed
somewhere so that the bus involved (you do have hardware here), is
properly exposed.

Please work with Christoph and others to solve this, don't try to route
around the issue.  Your patches are assuming that you have a device
pointer anyway, and that's on a bus, so it does have access somehow,
right?

> > > More is here:
> > >     https://lore.kernel.org/virtualization/1681265026.6082013-1-xuanzhuo@linux.alibaba.com/
> > >     https://lore.kernel.org/all/20230421065059.1bc78133@kernel.org
> >
> > Am I missing the user of this new api?  Don't you need to submit that at
> > the same time so we can at least see if this new api works properly?
> 
> The user will is the virtio-net with supporting to AF_XDP.
> 
> That is a huge patch set. Some is in virtio core, some is in net-dev.
> An earlier version was [1] with some differences but not much.
> 
> 	[1] http://lore.kernel.org/all/20230202110058.130695-1-xuanzhuo@linux.alibaba.com
> 
> I tried to split to multi patch-set.
> 
> Currently I plan to have several parts like this:
> 
> 1. virtio core support premapped-dma, vq reset, expose dma device (virtio vhost branch)
> 2. virtio-net: refactor xdp (netdev branch)
> 3. virtio-net: support af-xdp (netdev branch)
> 
> But now, #1 is block by this dma question.
> 
> So, I want to complete this patch first.

As you know, we can never take apis without a real user for them,
because obviously those apis could be instantly removed from the system
because no one is using them.  We also do not know that the api is even
correct at all, without being able to see all of the users.

So make this a larger patch set please.  What would you do if you had to
review this without any prior information?  Make it easy for reviewers
please.

> >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >  include/net/xdp_sock_drv.h  | 20 ++++++++++-
> > >  include/net/xsk_buff_pool.h | 19 ++++++++++
> > >  net/xdp/xsk_buff_pool.c     | 71 +++++++++++++++++++++++++++----------
> > >  3 files changed, 90 insertions(+), 20 deletions(-)
> > >
> > > diff --git a/include/net/xdp_sock_drv.h b/include/net/xdp_sock_drv.h
> > > index 9c0d860609ba..8b5284b272e4 100644
> > > --- a/include/net/xdp_sock_drv.h
> > > +++ b/include/net/xdp_sock_drv.h
> > > @@ -67,7 +67,17 @@ static inline int xsk_pool_dma_map(struct xsk_buff_pool *pool,
> > >  {
> > >  	struct xdp_umem *umem = pool->umem;
> > >
> > > -	return xp_dma_map(pool, dev, attrs, umem->pgs, umem->npgs);
> > > +	return xp_dma_map(pool, dev, NULL, attrs, umem->pgs, umem->npgs);
> > > +}
> > > +
> > > +static inline int xsk_pool_dma_map_with_cbs(struct xsk_buff_pool *pool,
> > > +					    struct device *dev,
> > > +					    struct xsk_dma_cbs *dma_cbs,
> > > +					    unsigned long attrs)
> > > +{
> > > +	struct xdp_umem *umem = pool->umem;
> > > +
> > > +	return xp_dma_map(pool, dev, dma_cbs, attrs, umem->pgs, umem->npgs);
> > >  }
> > >
> > >  static inline dma_addr_t xsk_buff_xdp_get_dma(struct xdp_buff *xdp)
> > > @@ -226,6 +236,14 @@ static inline int xsk_pool_dma_map(struct xsk_buff_pool *pool,
> > >  	return 0;
> > >  }
> > >
> > > +static inline int xsk_pool_dma_map_with_cbs(struct xsk_buff_pool *pool,
> > > +					    struct device *dev,
> > > +					    struct xsk_dma_cbs *dma_cbs,
> > > +					    unsigned long attrs)
> > > +{
> > > +	return 0;
> > > +}
> > > +
> > >  static inline dma_addr_t xsk_buff_xdp_get_dma(struct xdp_buff *xdp)
> > >  {
> > >  	return 0;
> > > diff --git a/include/net/xsk_buff_pool.h b/include/net/xsk_buff_pool.h
> > > index 3e952e569418..2de88be9188b 100644
> > > --- a/include/net/xsk_buff_pool.h
> > > +++ b/include/net/xsk_buff_pool.h
> > > @@ -43,6 +43,23 @@ struct xsk_dma_map {
> > >  	bool dma_need_sync;
> > >  };
> > >
> > > +struct xsk_dma_cbs {
> > > +	dma_addr_t (*map_page)(struct device *dev, struct page *page,
> >
> > Why are you working on a "raw" struct device here and everywhere else?
> > Are you sure that is ok?  What is it needed for?
> 
> I copy this from DMA APIs. For virtio that is not needed. But is there any
> problems?

See above, where are you getting this random device pointer from?
Eventually it does point to something on a bus with DMA access, right?
So why not use the right pointer for that type of device?

Or are you going to have devices of different types using this api?  If
so, where?  Again, this is hard to review without any real users.

> > > +			       size_t offset, size_t size,
> > > +			       enum dma_data_direction dir, unsigned long attrs);
> > > +	void (*unmap_page)(struct device *dev, dma_addr_t addr,
> > > +			   size_t size, enum dma_data_direction dir,
> > > +			   unsigned long attrs);
> > > +	int (*mapping_error)(struct device *dev, dma_addr_t addr);
> > > +	bool (*need_sync)(struct device *dev, dma_addr_t addr);
> > > +	void (*sync_single_range_for_cpu)(struct device *dev, dma_addr_t addr,
> > > +					  size_t offset, size_t size,
> > > +					  enum dma_data_direction dir);
> > > +	void (*sync_single_range_for_device)(struct device *dev, dma_addr_t addr,
> > > +					     size_t offset, size_t size,
> > > +					     enum dma_data_direction dir);
> > > +};
> >
> > No documentation for any of these callbacks?  Please use kerneldoc so we
> > at least have a clue as to what they should be doing.
> >
> > > +
> > >  struct xsk_buff_pool {
> > >  	/* Members only used in the control path first. */
> > >  	struct device *dev;
> > > @@ -85,6 +102,7 @@ struct xsk_buff_pool {
> > >  	 * sockets share a single cq when the same netdev and queue id is shared.
> > >  	 */
> > >  	spinlock_t cq_lock;
> > > +	struct xsk_dma_cbs *dma_cbs;
> > >  	struct xdp_buff_xsk *free_heads[];
> > >  };
> > >
> > > @@ -131,6 +149,7 @@ static inline void xp_init_xskb_dma(struct xdp_buff_xsk *xskb, struct xsk_buff_p
> > >  /* AF_XDP ZC drivers, via xdp_sock_buff.h */
> > >  void xp_set_rxq_info(struct xsk_buff_pool *pool, struct xdp_rxq_info *rxq);
> > >  int xp_dma_map(struct xsk_buff_pool *pool, struct device *dev,
> > > +	       struct xsk_dma_cbs *dma_cbs,
> > >  	       unsigned long attrs, struct page **pages, u32 nr_pages);
> > >  void xp_dma_unmap(struct xsk_buff_pool *pool, unsigned long attrs);
> > >  struct xdp_buff *xp_alloc(struct xsk_buff_pool *pool);
> > > diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
> > > index b2df1e0f8153..e7e6c91f6e51 100644
> > > --- a/net/xdp/xsk_buff_pool.c
> > > +++ b/net/xdp/xsk_buff_pool.c
> > > @@ -328,7 +328,8 @@ static void xp_destroy_dma_map(struct xsk_dma_map *dma_map)
> > >  	kfree(dma_map);
> > >  }
> > >
> > > -static void __xp_dma_unmap(struct xsk_dma_map *dma_map, unsigned long attrs)
> > > +static void __xp_dma_unmap(struct xsk_dma_map *dma_map,
> > > +			   struct xsk_dma_cbs *dma_cbs, unsigned long attrs)
> > >  {
> > >  	dma_addr_t *dma;
> > >  	u32 i;
> > > @@ -337,8 +338,12 @@ static void __xp_dma_unmap(struct xsk_dma_map *dma_map, unsigned long attrs)
> > >  		dma = &dma_map->dma_pages[i];
> > >  		if (*dma) {
> > >  			*dma &= ~XSK_NEXT_PG_CONTIG_MASK;
> > > -			dma_unmap_page_attrs(dma_map->dev, *dma, PAGE_SIZE,
> > > -					     DMA_BIDIRECTIONAL, attrs);
> > > +			if (unlikely(dma_cbs))
> >
> > If you can not measure the use of likely/unlikely in a benchmark, then
> > you should never use it as the compiler and CPU will work better without
> > it (and will work better over time as hardware and compiler change).
> 
> Because in most cases the dma_cbs is null for xsk. So I use the 'unlikely'.

Again, prove that this is needed, otherwise do not use it.

thanks,

greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
