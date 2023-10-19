Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 494617CF0DD
	for <lists.virtualization@lfdr.de>; Thu, 19 Oct 2023 09:15:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD02583925;
	Thu, 19 Oct 2023 07:15:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD02583925
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cgMOWm1Zkqd; Thu, 19 Oct 2023 07:15:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 92107834E8;
	Thu, 19 Oct 2023 07:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92107834E8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2997C0DD3;
	Thu, 19 Oct 2023 07:15:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20835C0032
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 07:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 045046F7B0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 07:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 045046F7B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1jgVPQGuAOk8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 07:15:23 +0000 (UTC)
Received: from out30-99.freemail.mail.aliyun.com
 (out30-99.freemail.mail.aliyun.com [115.124.30.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7F4EA614A3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Oct 2023 07:15:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F4EA614A3
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VuT9Ext_1697699715; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VuT9Ext_1697699715) by smtp.aliyun-inc.com;
 Thu, 19 Oct 2023 15:15:16 +0800
Message-ID: <1697699628.4189832-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v1 13/19] virtio_net: xsk: tx:
 virtnet_free_old_xmit() distinguishes xsk buffer
Date: Thu, 19 Oct 2023 15:13:48 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20231016120033.26933-1-xuanzhuo@linux.alibaba.com>
 <20231016120033.26933-14-xuanzhuo@linux.alibaba.com>
 <20231016164434.3a1a51e1@kernel.org>
 <1697508125.07194-1-xuanzhuo@linux.alibaba.com>
 <20231019023739-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231019023739-mutt-send-email-mst@kernel.org>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

On Thu, 19 Oct 2023 02:38:16 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Oct 17, 2023 at 10:02:05AM +0800, Xuan Zhuo wrote:
> > On Mon, 16 Oct 2023 16:44:34 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> > > On Mon, 16 Oct 2023 20:00:27 +0800 Xuan Zhuo wrote:
> > > > @@ -305,9 +311,15 @@ static inline void virtnet_free_old_xmit(struct virtnet_sq *sq, bool in_napi,
> > > >
> > > >  			stats->bytes += xdp_get_frame_len(frame);
> > > >  			xdp_return_frame(frame);
> > > > +		} else {
> > > > +			stats->bytes += virtnet_ptr_to_xsk(ptr);
> > > > +			++xsknum;
> > > >  		}
> > > >  		stats->packets++;
> > > >  	}
> > > > +
> > > > +	if (xsknum)
> > > > +		xsk_tx_completed(sq->xsk.pool, xsknum);
> > > >  }
> > >
> > > sparse complains:
> > >
> > > drivers/net/virtio/virtio_net.h:322:41: warning: incorrect type in argument 1 (different address spaces)
> > > drivers/net/virtio/virtio_net.h:322:41:    expected struct xsk_buff_pool *pool
> > > drivers/net/virtio/virtio_net.h:322:41:    got struct xsk_buff_pool
> > > [noderef] __rcu *pool
> > >
> > > please build test with W=1 C=1
> >
> > OK. I will add C=1 to may script.
> >
> > Thanks.
>
> And I hope we all understand, rcu has to be used properly it's not just
> about casting the warning away.


Yes. I see. I will use rcu_dereference() and rcu_read_xxx().

Thanks.

>
> --
> MST
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
