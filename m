Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4240768930E
	for <lists.virtualization@lfdr.de>; Fri,  3 Feb 2023 10:06:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C120781EC8;
	Fri,  3 Feb 2023 09:06:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C120781EC8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRdtcGOjXa_M; Fri,  3 Feb 2023 09:06:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E42AA81232;
	Fri,  3 Feb 2023 09:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E42AA81232
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0FF3CC007C;
	Fri,  3 Feb 2023 09:06:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A4DB3C002B
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C45E81EA3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C45E81EA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AJonuAlWkW6M
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DF4F81232
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DF4F81232
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 09:06:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=21; SR=0;
 TI=SMTPD_---0VaoM5Gq_1675415203; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VaoM5Gq_1675415203) by smtp.aliyun-inc.com;
 Fri, 03 Feb 2023 17:06:44 +0800
Message-ID: <1675415082.88957-7-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH 15/33] virtio_net: move to virtio_net.h
Date: Fri, 3 Feb 2023 17:04:42 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20230202110058.130695-1-xuanzhuo@linux.alibaba.com>
 <20230202110058.130695-16-xuanzhuo@linux.alibaba.com>
 <20230203035028-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230203035028-mutt-send-email-mst@kernel.org>
Cc: Petr Machata <petrm@nvidia.com>, Menglong Dong <imagedong@tencent.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>,
 =?utf-8?b?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Kuniyuki Iwashima <kuniyu@amazon.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 virtualization@lists.linux-foundation.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Fri, 3 Feb 2023 03:53:12 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Thu, Feb 02, 2023 at 07:00:40PM +0800, Xuan Zhuo wrote:
> > Move some structure definitions and inline functions into the
> > virtio_net.h file.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >  drivers/net/virtio/main.c       | 247 +----------------------------
> >  drivers/net/virtio/virtio_net.h | 265 ++++++++++++++++++++++++++++++++
> >  2 files changed, 267 insertions(+), 245 deletions(-)
> >  create mode 100644 drivers/net/virtio/virtio_net.h
> >
> > diff --git a/drivers/net/virtio/main.c b/drivers/net/virtio/main.c
> > index eb7f00194b5c..5683cb576474 100644
> > --- a/drivers/net/virtio/main.c
> > +++ b/drivers/net/virtio/main.c
> > @@ -4,24 +4,8 @@
> >   * Copyright 2007 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
> >   */
> >  //#define DEBUG
> > -#include <linux/netdevice.h>
> > -#include <linux/etherdevice.h>
> > -#include <linux/ethtool.h>
> > -#include <linux/module.h>
> > -#include <linux/virtio.h>
> > -#include <linux/virtio_net.h>
> > -#include <linux/bpf.h>
> > -#include <linux/bpf_trace.h>
> > -#include <linux/scatterlist.h>
> > -#include <linux/if_vlan.h>
> > -#include <linux/slab.h>
> > -#include <linux/cpu.h>
> > -#include <linux/average.h>
> > -#include <linux/filter.h>
> > -#include <linux/kernel.h>
> > -#include <net/route.h>
> > -#include <net/xdp.h>
> > -#include <net/net_failover.h>
> > +
> > +#include "virtio_net.h"
> >
> >  static int napi_weight = NAPI_POLL_WEIGHT;
> >  module_param(napi_weight, int, 0444);
>
>
> You should only move the headers that are actually needed not
> everything.

You mean the "include".

I think it is a simple way to concentrate "Include" into a header file, and
other .c files reference this header file.

Do you agree?

Thanks.

>
>
> > @@ -44,15 +28,6 @@ module_param(napi_tx, bool, 0644);
> >  #define VIRTIO_XDP_TX		BIT(0)
> >  #define VIRTIO_XDP_REDIR	BIT(1)
> >
> > -#define VIRTIO_XDP_FLAG	BIT(0)
> > -
> > -/* RX packet size EWMA. The average packet size is used to determine the packet
> > - * buffer size when refilling RX rings. As the entire RX ring may be refilled
> > - * at once, the weight is chosen so that the EWMA will be insensitive to short-
> > - * term, transient changes in packet size.
> > - */
> > -DECLARE_EWMA(pkt_len, 0, 64)
> > -
> >  #define VIRTNET_DRIVER_VERSION "1.0.0"
> >
> >  static const unsigned long guest_offloads[] = {
> > @@ -72,36 +47,6 @@ static const unsigned long guest_offloads[] = {
> >  				(1ULL << VIRTIO_NET_F_GUEST_USO4) | \
> >  				(1ULL << VIRTIO_NET_F_GUEST_USO6))
> >
> > -struct virtnet_stat_desc {
> > -	char desc[ETH_GSTRING_LEN];
> > -	size_t offset;
> > -};
> > -
> > -struct virtnet_sq_stats {
> > -	struct u64_stats_sync syncp;
> > -	u64 packets;
> > -	u64 bytes;
> > -	u64 xdp_tx;
> > -	u64 xdp_tx_drops;
> > -	u64 kicks;
> > -	u64 tx_timeouts;
> > -};
> > -
> > -struct virtnet_rq_stats {
> > -	struct u64_stats_sync syncp;
> > -	u64 packets;
> > -	u64 bytes;
> > -	u64 drops;
> > -	u64 xdp_packets;
> > -	u64 xdp_tx;
> > -	u64 xdp_redirects;
> > -	u64 xdp_drops;
> > -	u64 kicks;
> > -};
> > -
> > -#define VIRTNET_SQ_STAT(m)	offsetof(struct virtnet_sq_stats, m)
> > -#define VIRTNET_RQ_STAT(m)	offsetof(struct virtnet_rq_stats, m)
> > -
> >  static const struct virtnet_stat_desc virtnet_sq_stats_desc[] = {
> >  	{ "packets",		VIRTNET_SQ_STAT(packets) },
> >  	{ "bytes",		VIRTNET_SQ_STAT(bytes) },
> > @@ -125,57 +70,6 @@ static const struct virtnet_stat_desc virtnet_rq_stats_desc[] = {
> >  #define VIRTNET_SQ_STATS_LEN	ARRAY_SIZE(virtnet_sq_stats_desc)
> >  #define VIRTNET_RQ_STATS_LEN	ARRAY_SIZE(virtnet_rq_stats_desc)
> >
> > -/* Internal representation of a send virtqueue */
> > -struct send_queue {
> > -	/* Virtqueue associated with this send _queue */
> > -	struct virtqueue *vq;
> > -
> > -	/* TX: fragments + linear part + virtio header */
> > -	struct scatterlist sg[MAX_SKB_FRAGS + 2];
> > -
> > -	/* Name of the send queue: output.$index */
> > -	char name[16];
> > -
> > -	struct virtnet_sq_stats stats;
> > -
> > -	struct napi_struct napi;
> > -
> > -	/* Record whether sq is in reset state. */
> > -	bool reset;
> > -};
> > -
> > -/* Internal representation of a receive virtqueue */
> > -struct receive_queue {
> > -	/* Virtqueue associated with this receive_queue */
> > -	struct virtqueue *vq;
> > -
> > -	struct napi_struct napi;
> > -
> > -	struct bpf_prog __rcu *xdp_prog;
> > -
> > -	struct virtnet_rq_stats stats;
> > -
> > -	/* Chain pages by the private ptr. */
> > -	struct page *pages;
> > -
> > -	/* Average packet length for mergeable receive buffers. */
> > -	struct ewma_pkt_len mrg_avg_pkt_len;
> > -
> > -	/* Page frag for packet buffer allocation. */
> > -	struct page_frag alloc_frag;
> > -
> > -	/* RX: fragments + linear part + virtio header */
> > -	struct scatterlist sg[MAX_SKB_FRAGS + 2];
> > -
> > -	/* Min single buffer size for mergeable buffers case. */
> > -	unsigned int min_buf_len;
> > -
> > -	/* Name of this receive queue: input.$index */
> > -	char name[16];
> > -
> > -	struct xdp_rxq_info xdp_rxq;
> > -};
> > -
> >  /* This structure can contain rss message with maximum settings for indirection table and keysize
> >   * Note, that default structure that describes RSS configuration virtio_net_rss_config
> >   * contains same info but can't handle table values.
> > @@ -206,90 +100,6 @@ struct control_buf {
> >  	struct virtio_net_ctrl_rss rss;
> >  };
> >
> > -struct virtnet_info {
> > -	struct virtio_device *vdev;
> > -	struct virtqueue *cvq;
> > -	struct net_device *dev;
> > -	struct send_queue *sq;
> > -	struct receive_queue *rq;
> > -	unsigned int status;
> > -
> > -	/* Max # of queue pairs supported by the device */
> > -	u16 max_queue_pairs;
> > -
> > -	/* # of queue pairs currently used by the driver */
> > -	u16 curr_queue_pairs;
> > -
> > -	/* # of XDP queue pairs currently used by the driver */
> > -	u16 xdp_queue_pairs;
> > -
> > -	/* xdp_queue_pairs may be 0, when xdp is already loaded. So add this. */
> > -	bool xdp_enabled;
> > -
> > -	/* I like... big packets and I cannot lie! */
> > -	bool big_packets;
> > -
> > -	/* number of sg entries allocated for big packets */
> > -	unsigned int big_packets_num_skbfrags;
> > -
> > -	/* Host will merge rx buffers for big packets (shake it! shake it!) */
> > -	bool mergeable_rx_bufs;
> > -
> > -	/* Host supports rss and/or hash report */
> > -	bool has_rss;
> > -	bool has_rss_hash_report;
> > -	u8 rss_key_size;
> > -	u16 rss_indir_table_size;
> > -	u32 rss_hash_types_supported;
> > -	u32 rss_hash_types_saved;
> > -
> > -	/* Has control virtqueue */
> > -	bool has_cvq;
> > -
> > -	/* Host can handle any s/g split between our header and packet data */
> > -	bool any_header_sg;
> > -
> > -	/* Packet virtio header size */
> > -	u8 hdr_len;
> > -
> > -	/* Work struct for delayed refilling if we run low on memory. */
> > -	struct delayed_work refill;
> > -
> > -	/* Is delayed refill enabled? */
> > -	bool refill_enabled;
> > -
> > -	/* The lock to synchronize the access to refill_enabled */
> > -	spinlock_t refill_lock;
> > -
> > -	/* Work struct for config space updates */
> > -	struct work_struct config_work;
> > -
> > -	/* Does the affinity hint is set for virtqueues? */
> > -	bool affinity_hint_set;
> > -
> > -	/* CPU hotplug instances for online & dead */
> > -	struct hlist_node node;
> > -	struct hlist_node node_dead;
> > -
> > -	struct control_buf *ctrl;
> > -
> > -	/* Ethtool settings */
> > -	u8 duplex;
> > -	u32 speed;
> > -
> > -	/* Interrupt coalescing settings */
> > -	u32 tx_usecs;
> > -	u32 rx_usecs;
> > -	u32 tx_max_packets;
> > -	u32 rx_max_packets;
> > -
> > -	unsigned long guest_offloads;
> > -	unsigned long guest_offloads_capable;
> > -
> > -	/* failover when STANDBY feature enabled */
> > -	struct failover *failover;
> > -};
> > -
> >  struct padded_vnet_hdr {
> >  	struct virtio_net_hdr_v1_hash hdr;
> >  	/*
> > @@ -303,45 +113,11 @@ struct padded_vnet_hdr {
> >  static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *buf);
> >  static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *buf);
> >
> > -static bool is_xdp_frame(void *ptr)
> > -{
> > -	return (unsigned long)ptr & VIRTIO_XDP_FLAG;
> > -}
> > -
> >  static void *xdp_to_ptr(struct xdp_frame *ptr)
> >  {
> >  	return (void *)((unsigned long)ptr | VIRTIO_XDP_FLAG);
> >  }
> >
> > -static struct xdp_frame *ptr_to_xdp(void *ptr)
> > -{
> > -	return (struct xdp_frame *)((unsigned long)ptr & ~VIRTIO_XDP_FLAG);
> > -}
> > -
> > -static void __free_old_xmit(struct send_queue *sq, bool in_napi,
> > -			    struct virtnet_sq_stats *stats)
> > -{
> > -	unsigned int len;
> > -	void *ptr;
> > -
> > -	while ((ptr = virtqueue_get_buf(sq->vq, &len)) != NULL) {
> > -		if (!is_xdp_frame(ptr)) {
> > -			struct sk_buff *skb = ptr;
> > -
> > -			pr_debug("Sent skb %p\n", skb);
> > -
> > -			stats->bytes += skb->len;
> > -			napi_consume_skb(skb, in_napi);
> > -		} else {
> > -			struct xdp_frame *frame = ptr_to_xdp(ptr);
> > -
> > -			stats->bytes += xdp_get_frame_len(frame);
> > -			xdp_return_frame(frame);
> > -		}
> > -		stats->packets++;
> > -	}
> > -}
> > -
> >  /* Converting between virtqueue no. and kernel tx/rx queue no.
> >   * 0:rx0 1:tx0 2:rx1 3:tx1 ... 2N:rxN 2N+1:txN 2N+2:cvq
> >   */
> > @@ -411,15 +187,6 @@ static void disable_delayed_refill(struct virtnet_info *vi)
> >  	spin_unlock_bh(&vi->refill_lock);
> >  }
> >
> > -static void virtqueue_napi_schedule(struct napi_struct *napi,
> > -				    struct virtqueue *vq)
> > -{
> > -	if (napi_schedule_prep(napi)) {
> > -		virtqueue_disable_cb(vq);
> > -		__napi_schedule(napi);
> > -	}
> > -}
> > -
> >  static void virtqueue_napi_complete(struct napi_struct *napi,
> >  				    struct virtqueue *vq, int processed)
> >  {
> > @@ -1740,16 +1507,6 @@ static void free_old_xmit(struct send_queue *sq, bool in_napi)
> >  	u64_stats_update_end(&sq->stats.syncp);
> >  }
> >
> > -static bool is_xdp_raw_buffer_queue(struct virtnet_info *vi, int q)
> > -{
> > -	if (q < (vi->curr_queue_pairs - vi->xdp_queue_pairs))
> > -		return false;
> > -	else if (q < vi->curr_queue_pairs)
> > -		return true;
> > -	else
> > -		return false;
> > -}
> > -
> >  static void virtnet_poll_cleantx(struct receive_queue *rq)
> >  {
> >  	struct virtnet_info *vi = rq->vq->vdev->priv;
> > diff --git a/drivers/net/virtio/virtio_net.h b/drivers/net/virtio/virtio_net.h
> > new file mode 100644
> > index 000000000000..8bf31429ae28
> > --- /dev/null
> > +++ b/drivers/net/virtio/virtio_net.h
> > @@ -0,0 +1,265 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +
> > +#ifndef __VIRTIO_NET_H__
> > +#define __VIRTIO_NET_H__
> > +#include <linux/netdevice.h>
> > +#include <linux/etherdevice.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/module.h>
> > +#include <linux/virtio.h>
> > +#include <linux/virtio_net.h>
> > +#include <linux/bpf.h>
> > +#include <linux/bpf_trace.h>
> > +#include <linux/scatterlist.h>
> > +#include <linux/if_vlan.h>
> > +#include <linux/slab.h>
> > +#include <linux/cpu.h>
> > +#include <linux/average.h>
> > +#include <linux/filter.h>
> > +#include <linux/kernel.h>
> > +#include <net/route.h>
> > +#include <net/xdp.h>
> > +#include <net/net_failover.h>
> > +#include <net/xdp_sock_drv.h>
> > +
> > +#define VIRTIO_XDP_FLAG	BIT(0)
> > +
> > +struct virtnet_info {
> > +	struct virtio_device *vdev;
> > +	struct virtqueue *cvq;
> > +	struct net_device *dev;
> > +	struct send_queue *sq;
> > +	struct receive_queue *rq;
> > +	unsigned int status;
> > +
> > +	/* Max # of queue pairs supported by the device */
> > +	u16 max_queue_pairs;
> > +
> > +	/* # of queue pairs currently used by the driver */
> > +	u16 curr_queue_pairs;
> > +
> > +	/* # of XDP queue pairs currently used by the driver */
> > +	u16 xdp_queue_pairs;
> > +
> > +	/* xdp_queue_pairs may be 0, when xdp is already loaded. So add this. */
> > +	bool xdp_enabled;
> > +
> > +	/* I like... big packets and I cannot lie! */
> > +	bool big_packets;
> > +
> > +	/* number of sg entries allocated for big packets */
> > +	unsigned int big_packets_num_skbfrags;
> > +
> > +	/* Host will merge rx buffers for big packets (shake it! shake it!) */
> > +	bool mergeable_rx_bufs;
> > +
> > +	/* Host supports rss and/or hash report */
> > +	bool has_rss;
> > +	bool has_rss_hash_report;
> > +	u8 rss_key_size;
> > +	u16 rss_indir_table_size;
> > +	u32 rss_hash_types_supported;
> > +	u32 rss_hash_types_saved;
> > +
> > +	/* Has control virtqueue */
> > +	bool has_cvq;
> > +
> > +	/* Host can handle any s/g split between our header and packet data */
> > +	bool any_header_sg;
> > +
> > +	/* Packet virtio header size */
> > +	u8 hdr_len;
> > +
> > +	/* Work struct for delayed refilling if we run low on memory. */
> > +	struct delayed_work refill;
> > +
> > +	/* Is delayed refill enabled? */
> > +	bool refill_enabled;
> > +
> > +	/* The lock to synchronize the access to refill_enabled */
> > +	spinlock_t refill_lock;
> > +
> > +	/* Work struct for config space updates */
> > +	struct work_struct config_work;
> > +
> > +	/* Does the affinity hint is set for virtqueues? */
> > +	bool affinity_hint_set;
> > +
> > +	/* CPU hotplug instances for online & dead */
> > +	struct hlist_node node;
> > +	struct hlist_node node_dead;
> > +
> > +	struct control_buf *ctrl;
> > +
> > +	/* Ethtool settings */
> > +	u8 duplex;
> > +	u32 speed;
> > +
> > +	/* Interrupt coalescing settings */
> > +	u32 tx_usecs;
> > +	u32 rx_usecs;
> > +	u32 tx_max_packets;
> > +	u32 rx_max_packets;
> > +
> > +	unsigned long guest_offloads;
> > +	unsigned long guest_offloads_capable;
> > +
> > +	/* failover when STANDBY feature enabled */
> > +	struct failover *failover;
> > +};
> > +
> > +/* RX packet size EWMA. The average packet size is used to determine the packet
> > + * buffer size when refilling RX rings. As the entire RX ring may be refilled
> > + * at once, the weight is chosen so that the EWMA will be insensitive to short-
> > + * term, transient changes in packet size.
> > + */
> > +DECLARE_EWMA(pkt_len, 0, 64)
> > +
> > +struct virtnet_stat_desc {
> > +	char desc[ETH_GSTRING_LEN];
> > +	size_t offset;
> > +};
> > +
> > +struct virtnet_sq_stats {
> > +	struct u64_stats_sync syncp;
> > +	u64 packets;
> > +	u64 bytes;
> > +	u64 xdp_tx;
> > +	u64 xdp_tx_drops;
> > +	u64 kicks;
> > +	u64 tx_timeouts;
> > +};
> > +
> > +struct virtnet_rq_stats {
> > +	struct u64_stats_sync syncp;
> > +	u64 packets;
> > +	u64 bytes;
> > +	u64 drops;
> > +	u64 xdp_packets;
> > +	u64 xdp_tx;
> > +	u64 xdp_redirects;
> > +	u64 xdp_drops;
> > +	u64 kicks;
> > +};
> > +
> > +#define VIRTNET_SQ_STAT(m)	offsetof(struct virtnet_sq_stats, m)
> > +#define VIRTNET_RQ_STAT(m)	offsetof(struct virtnet_rq_stats, m)
> > +
> > +/* Internal representation of a send virtqueue */
> > +struct send_queue {
> > +	/* Virtqueue associated with this send _queue */
> > +	struct virtqueue *vq;
> > +
> > +	/* TX: fragments + linear part + virtio header */
> > +	struct scatterlist sg[MAX_SKB_FRAGS + 2];
> > +
> > +	/* Name of the send queue: output.$index */
> > +	char name[16];
> > +
> > +	struct virtnet_sq_stats stats;
> > +
> > +	struct napi_struct napi;
> > +
> > +	/* Record whether sq is in reset state. */
> > +	bool reset;
> > +};
> > +
> > +/* Internal representation of a receive virtqueue */
> > +struct receive_queue {
> > +	/* Virtqueue associated with this receive_queue */
> > +	struct virtqueue *vq;
> > +
> > +	struct napi_struct napi;
> > +
> > +	struct bpf_prog __rcu *xdp_prog;
> > +
> > +	struct virtnet_rq_stats stats;
> > +
> > +	/* Chain pages by the private ptr. */
> > +	struct page *pages;
> > +
> > +	/* Average packet length for mergeable receive buffers. */
> > +	struct ewma_pkt_len mrg_avg_pkt_len;
> > +
> > +	/* Page frag for packet buffer allocation. */
> > +	struct page_frag alloc_frag;
> > +
> > +	/* RX: fragments + linear part + virtio header */
> > +	struct scatterlist sg[MAX_SKB_FRAGS + 2];
> > +
> > +	/* Min single buffer size for mergeable buffers case. */
> > +	unsigned int min_buf_len;
> > +
> > +	/* Name of this receive queue: input.$index */
> > +	char name[16];
> > +
> > +	struct xdp_rxq_info xdp_rxq;
> > +};
> > +
> > +static inline bool is_xdp_raw_buffer_queue(struct virtnet_info *vi, int q)
> > +{
> > +	if (q < (vi->curr_queue_pairs - vi->xdp_queue_pairs))
> > +		return false;
> > +	else if (q < vi->curr_queue_pairs)
> > +		return true;
> > +	else
> > +		return false;
> > +}
> > +
> > +static inline void virtnet_return_xdp_frame(struct send_queue *sq,
> > +					    struct xdp_frame *frame)
> > +{
> > +	struct virtnet_info *vi = sq->vq->vdev->priv;
> > +	dma_addr_t *p_addr, addr;
> > +
> > +	p_addr = frame->data - sizeof(*p_addr);
> > +	addr = *p_addr;
> > +
> > +	virtio_dma_unmap(&vi->vdev->dev, addr, frame->len, DMA_TO_DEVICE);
> > +
> > +	xdp_return_frame(frame);
> > +}
> > +
> > +static inline void virtqueue_napi_schedule(struct napi_struct *napi,
> > +					   struct virtqueue *vq)
> > +{
> > +	if (napi_schedule_prep(napi)) {
> > +		virtqueue_disable_cb(vq);
> > +		__napi_schedule(napi);
> > +	}
> > +}
> > +
> > +static inline bool is_xdp_frame(void *ptr)
> > +{
> > +	return (unsigned long)ptr & VIRTIO_XDP_FLAG;
> > +}
> > +
> > +static struct xdp_frame *ptr_to_xdp(void *ptr)
> > +{
> > +	return (struct xdp_frame *)((unsigned long)ptr & ~VIRTIO_XDP_FLAG);
> > +}
> > +
> > +static void __free_old_xmit(struct send_queue *sq, bool in_napi,
> > +			    struct virtnet_sq_stats *stats)
> > +{
> > +	unsigned int len;
> > +	void *ptr;
> > +
> > +	while ((ptr = virtqueue_get_buf(sq->vq, &len)) != NULL) {
> > +		if (!is_xdp_frame(ptr)) {
> > +			struct sk_buff *skb = ptr;
> > +
> > +			pr_debug("Sent skb %p\n", skb);
> > +
> > +			stats->bytes += skb->len;
> > +			napi_consume_skb(skb, in_napi);
> > +		} else {
> > +			struct xdp_frame *frame = ptr_to_xdp(ptr);
> > +
> > +			stats->bytes += xdp_get_frame_len(frame);
> > +			xdp_return_frame(frame);
> > +		}
> > +		stats->packets++;
> > +	}
> > +}
> > +#endif
>
> All these APIs not prefixed with virtnet were ok as internal
> static functions. No longer ok in a header.

I agree. Will fix.

Thanks.

>
>
> > --
> > 2.32.0.3.g01195cf9f
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
