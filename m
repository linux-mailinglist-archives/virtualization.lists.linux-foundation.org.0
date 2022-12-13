Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EED64AE4E
	for <lists.virtualization@lfdr.de>; Tue, 13 Dec 2022 04:39:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19699416BF;
	Tue, 13 Dec 2022 03:38:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19699416BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJOMh2VLbZV2; Tue, 13 Dec 2022 03:38:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7FABF416BA;
	Tue, 13 Dec 2022 03:38:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FABF416BA
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7C29C0078;
	Tue, 13 Dec 2022 03:38:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2AC0C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 03:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A683D60E86
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 03:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A683D60E86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clWc3CSzfFpR
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 03:38:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7EAC60BC1
Received: from out30-1.freemail.mail.aliyun.com
 (out30-1.freemail.mail.aliyun.com [115.124.30.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7EAC60BC1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Dec 2022 03:38:51 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046060;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
 TI=SMTPD_---0VXC4qCa_1670902725; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VXC4qCa_1670902725) by smtp.aliyun-inc.com;
 Tue, 13 Dec 2022 11:38:46 +0800
Message-ID: <1670902391.9610498-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net] virtio-net: correctly enable callback during
 start_xmit
Date: Tue, 13 Dec 2022 11:33:11 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20221212091029.54390-1-jasowang@redhat.com>
 <20221212042144-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221212042144-mutt-send-email-mst@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, davem@davemloft.net
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

On Mon, 12 Dec 2022 04:25:22 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Mon, Dec 12, 2022 at 05:10:29PM +0800, Jason Wang wrote:
> > Commit a7766ef18b33("virtio_net: disable cb aggressively") enables
> > virtqueue callback via the following statement:
> >
> >         do {
> >            ......
> > 	} while (use_napi && kick &&
> >                unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
> >
> > This will cause a missing call to virtqueue_enable_cb_delayed() when
> > kick is false. Fixing this by removing the checking of the kick from
> > the condition to make sure callback is enabled correctly.
> >
> > Fixes: a7766ef18b33 ("virtio_net: disable cb aggressively")
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> > The patch is needed for -stable.
>
> stable rules don't allow for theoretical fixes. Was a problem observed?
>
> > ---
> >  drivers/net/virtio_net.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 86e52454b5b5..44d7daf0267b 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -1834,8 +1834,8 @@ static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
> >
> >  		free_old_xmit_skbs(sq, false);
> >
> > -	} while (use_napi && kick &&
> > -	       unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
> > +	} while (use_napi &&
> > +		 unlikely(!virtqueue_enable_cb_delayed(sq->vq)));
> >
>
> A bit more explanation pls.  kick simply means !netdev_xmit_more -
> if it's false we know there will be another packet, then transmissing
> that packet will invoke virtqueue_enable_cb_delayed. No?

It's just that there may be a next packet, but in fact there may not be.
For example, the vq is full, and the driver stops the queue.

Thanks.

>
>
>
>
>
> >  	/* timestamp packet in software */
> >  	skb_tx_timestamp(skb);
> > --
> > 2.25.1
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
