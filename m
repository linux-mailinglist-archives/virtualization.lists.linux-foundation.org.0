Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8197CB838
	for <lists.virtualization@lfdr.de>; Tue, 17 Oct 2023 04:02:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC7D840467;
	Tue, 17 Oct 2023 02:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC7D840467
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zdt1k4XSXx32; Tue, 17 Oct 2023 02:02:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 55F4040235;
	Tue, 17 Oct 2023 02:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55F4040235
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 776A1C008C;
	Tue, 17 Oct 2023 02:02:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF60FC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 02:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B1E40194
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 02:02:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B1E40194
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1_PcjtgE82tn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 02:02:38 +0000 (UTC)
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA3DE400EA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Oct 2023 02:02:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA3DE400EA
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046059;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VuL7N1T_1697508151; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VuL7N1T_1697508151) by smtp.aliyun-inc.com;
 Tue, 17 Oct 2023 10:02:31 +0800
Message-ID: <1697508125.07194-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next v1 13/19] virtio_net: xsk: tx:
 virtnet_free_old_xmit() distinguishes xsk buffer
Date: Tue, 17 Oct 2023 10:02:05 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Jakub Kicinski <kuba@kernel.org>
References: <20231016120033.26933-1-xuanzhuo@linux.alibaba.com>
 <20231016120033.26933-14-xuanzhuo@linux.alibaba.com>
 <20231016164434.3a1a51e1@kernel.org>
In-Reply-To: <20231016164434.3a1a51e1@kernel.org>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S.  Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, bpf@vger.kernel.org,
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

On Mon, 16 Oct 2023 16:44:34 -0700, Jakub Kicinski <kuba@kernel.org> wrote:
> On Mon, 16 Oct 2023 20:00:27 +0800 Xuan Zhuo wrote:
> > @@ -305,9 +311,15 @@ static inline void virtnet_free_old_xmit(struct virtnet_sq *sq, bool in_napi,
> >
> >  			stats->bytes += xdp_get_frame_len(frame);
> >  			xdp_return_frame(frame);
> > +		} else {
> > +			stats->bytes += virtnet_ptr_to_xsk(ptr);
> > +			++xsknum;
> >  		}
> >  		stats->packets++;
> >  	}
> > +
> > +	if (xsknum)
> > +		xsk_tx_completed(sq->xsk.pool, xsknum);
> >  }
>
> sparse complains:
>
> drivers/net/virtio/virtio_net.h:322:41: warning: incorrect type in argument 1 (different address spaces)
> drivers/net/virtio/virtio_net.h:322:41:    expected struct xsk_buff_pool *pool
> drivers/net/virtio/virtio_net.h:322:41:    got struct xsk_buff_pool
> [noderef] __rcu *pool
>
> please build test with W=1 C=1

OK. I will add C=1 to may script.

Thanks.


> --
> pw-bot: cr
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
