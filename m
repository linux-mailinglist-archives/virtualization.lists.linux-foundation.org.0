Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB3C41CE8C
	for <lists.virtualization@lfdr.de>; Wed, 29 Sep 2021 23:53:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A25040210;
	Wed, 29 Sep 2021 21:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a0RST5PQIGv2; Wed, 29 Sep 2021 21:53:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1C89D400DA;
	Wed, 29 Sep 2021 21:53:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7C3EC000D;
	Wed, 29 Sep 2021 21:53:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 176CDC000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 21:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F2F3440210
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 21:53:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pq-ps0MupwVH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 21:53:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7A22400DA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 21:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632952426;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qvINF4SM68Prl3kIR+W3XWzCfR13nCs67wMsp78hZS0=;
 b=aXBHzwBOre57pWxA3k9cnoz64ZwRSDOSYdT8WoQ0GvoK44KHLUFlY8UJOPtCyPjf+z5L2w
 +0bBTNm6ax5BmZy5I8eMPQA5qgXVMZtIHrkpPRcj/fxLYcZK2quo2HcrvEWQBb6MtFedvt
 aBCIG+B2JqqlKiZHjPx4dQqsqyj/y0I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-rV6QxTR4N8ufXEuJS-VviA-1; Wed, 29 Sep 2021 17:53:44 -0400
X-MC-Unique: rV6QxTR4N8ufXEuJS-VviA-1
Received: by mail-ed1-f69.google.com with SMTP id
 b7-20020a50e787000000b003d59cb1a923so3974023edn.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Sep 2021 14:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qvINF4SM68Prl3kIR+W3XWzCfR13nCs67wMsp78hZS0=;
 b=tK35rredA9wzTM7dbF55NDSc4INqyjVR/UDOAdMHjxFKZUcraqVT/AWwZyGhUiCV9U
 j2lgi8RHDqKdqzOMknhBpvRF2YzSKGRGnQAsEv1O3jpDV1xWpJpM9JaOVHT46qVSBEzV
 hDCUAQv145+Ax9iyQ/lrtVvc0Meop90ffRoGhUNdf1XcsCljPKVNZLkBO5IgX/6XLhl4
 Ur5b9H6CJxYWI5/OJPMs4kE++sCnBmbkAF0NJrcFjOg6VDn1Gp8S0eoElZq2khLUN/yP
 T5JdWC/xnMDecBNcWxq1Mh72qd2XBDnWXbg0zrrwXCy726+nuN7o3dFjZ/T+4r3LO320
 HulQ==
X-Gm-Message-State: AOAM532Scq5pJH1ezcW1oe31HMF/moBkME59tDbAsgiYVdNOXs1C6+it
 34aZkQMIb8rX3XJ6tMllxuyeHePtEmSNTOQB/37bwn+QXJBoSDgO8y5VXYvSuiy27SpJLMQ9b0I
 6xc8uhTYBLxrqf7ZUPllGxRJJ3vLbbn1LCjgsmSRnDw==
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr2489622ejk.411.1632952422831; 
 Wed, 29 Sep 2021 14:53:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8hV//adJejY4GUcQ3+niP0HFMpgIe2i1Dyx1Z3LZOmlwml5NPIBUJ9Ydgj2rmwhxrTWyQsQ==
X-Received: by 2002:a17:906:63ca:: with SMTP id
 u10mr2489587ejk.411.1632952422518; 
 Wed, 29 Sep 2021 14:53:42 -0700 (PDT)
Received: from redhat.com ([2.55.134.220])
 by smtp.gmail.com with ESMTPSA id ec19sm558649edb.72.2021.09.29.14.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 14:53:41 -0700 (PDT)
Date: Wed, 29 Sep 2021 17:53:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wei Wang <weiwan@google.com>
Subject: Re: [PATCH net] virtio-net: suppress bad irq warning for tx napi
Message-ID: <20210929175118-mutt-send-email-mst@kernel.org>
References: <CA+FuTSe-6MSpB4hwwvwPgDqHkxYJoxMZMDbOusNqiq0Gwa1eiQ@mail.gmail.com>
 <CA+FuTSdkJcj_ikNnJmGadBZ1fa7q26MZ1g3ERf8Ax+YbXvgcng@mail.gmail.com>
 <20210203052924-mutt-send-email-mst@kernel.org>
 <CAF=yD-J8rsr9JWdMGBSc-muFGMG2=YCWYwWOiQBQZuryioBUoA@mail.gmail.com>
 <20210203175837-mutt-send-email-mst@kernel.org>
 <CAEA6p_BqKECAU=C55TpJedG9gkZDakiiN27dcWOTJYH0YOFA_w@mail.gmail.com>
 <CA+FuTSf-uWyK6Jz=G67p+ep693oTczF55EUzrH9fXzBqTnoMQA@mail.gmail.com>
 <CAEA6p_DGgErG6oa1T9zJr+K6CosxoMb-TA=f2kQ_1bFdeMWAcg@mail.gmail.com>
 <20210413011508-mutt-send-email-mst@kernel.org>
 <CAEA6p_CCsfOrJO8CUcvmt0hg2bDE36UjJqeqKPOEBx0+ieJ2uA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEA6p_CCsfOrJO8CUcvmt0hg2bDE36UjJqeqKPOEBx0+ieJ2uA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Linux Kernel Network Developers <netdev@vger.kernel.org>,
 Willem de Bruijn <willemb@google.com>,
 virtualization@lists.linux-foundation.org, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>
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

On Wed, Sep 29, 2021 at 01:21:58PM -0700, Wei Wang wrote:
> On Mon, Apr 12, 2021 at 10:16 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Feb 05, 2021 at 02:28:33PM -0800, Wei Wang wrote:
> > > On Thu, Feb 4, 2021 at 12:48 PM Willem de Bruijn
> > > <willemdebruijn.kernel@gmail.com> wrote:
> > > >
> > > > On Wed, Feb 3, 2021 at 6:53 PM Wei Wang <weiwan@google.com> wrote:
> > > > >
> > > > > On Wed, Feb 3, 2021 at 3:10 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Feb 03, 2021 at 01:24:08PM -0500, Willem de Bruijn wrote:
> > > > > > > On Wed, Feb 3, 2021 at 5:42 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Tue, Feb 02, 2021 at 07:06:53PM -0500, Willem de Bruijn wrote:
> > > > > > > > > On Tue, Feb 2, 2021 at 6:53 PM Willem de Bruijn <willemb@google.com> wrote:
> > > > > > > > > >
> > > > > > > > > > On Tue, Feb 2, 2021 at 6:47 PM Wei Wang <weiwan@google.com> wrote:
> > > > > > > > > > >
> > > > > > > > > > > On Tue, Feb 2, 2021 at 3:12 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > > > > > > > >
> > > > > > > > > > > > On Thu, Jan 28, 2021 at 04:21:36PM -0800, Wei Wang wrote:
> > > > > > > > > > > > > With the implementation of napi-tx in virtio driver, we clean tx
> > > > > > > > > > > > > descriptors from rx napi handler, for the purpose of reducing tx
> > > > > > > > > > > > > complete interrupts. But this could introduce a race where tx complete
> > > > > > > > > > > > > interrupt has been raised, but the handler found there is no work to do
> > > > > > > > > > > > > because we have done the work in the previous rx interrupt handler.
> > > > > > > > > > > > > This could lead to the following warning msg:
> > > > > > > > > > > > > [ 3588.010778] irq 38: nobody cared (try booting with the
> > > > > > > > > > > > > "irqpoll" option)
> > > > > > > > > > > > > [ 3588.017938] CPU: 4 PID: 0 Comm: swapper/4 Not tainted
> > > > > > > > > > > > > 5.3.0-19-generic #20~18.04.2-Ubuntu
> > > > > > > > > > > > > [ 3588.017940] Call Trace:
> > > > > > > > > > > > > [ 3588.017942]  <IRQ>
> > > > > > > > > > > > > [ 3588.017951]  dump_stack+0x63/0x85
> > > > > > > > > > > > > [ 3588.017953]  __report_bad_irq+0x35/0xc0
> > > > > > > > > > > > > [ 3588.017955]  note_interrupt+0x24b/0x2a0
> > > > > > > > > > > > > [ 3588.017956]  handle_irq_event_percpu+0x54/0x80
> > > > > > > > > > > > > [ 3588.017957]  handle_irq_event+0x3b/0x60
> > > > > > > > > > > > > [ 3588.017958]  handle_edge_irq+0x83/0x1a0
> > > > > > > > > > > > > [ 3588.017961]  handle_irq+0x20/0x30
> > > > > > > > > > > > > [ 3588.017964]  do_IRQ+0x50/0xe0
> > > > > > > > > > > > > [ 3588.017966]  common_interrupt+0xf/0xf
> > > > > > > > > > > > > [ 3588.017966]  </IRQ>
> > > > > > > > > > > > > [ 3588.017989] handlers:
> > > > > > > > > > > > > [ 3588.020374] [<000000001b9f1da8>] vring_interrupt
> > > > > > > > > > > > > [ 3588.025099] Disabling IRQ #38
> > > > > > > > > > > > >
> > > > > > > > > > > > > This patch adds a new param to struct vring_virtqueue, and we set it for
> > > > > > > > > > > > > tx virtqueues if napi-tx is enabled, to suppress the warning in such
> > > > > > > > > > > > > case.
> > > > > > > > > > > > >
> > > > > > > > > > > > > Fixes: 7b0411ef4aa6 ("virtio-net: clean tx descriptors from rx napi")
> > > > > > > > > > > > > Reported-by: Rick Jones <jonesrick@google.com>
> > > > > > > > > > > > > Signed-off-by: Wei Wang <weiwan@google.com>
> > > > > > > > > > > > > Signed-off-by: Willem de Bruijn <willemb@google.com>
> > > > > > > > > > > >
> > > > > > > > > > > >
> > > > > > > > > > > > This description does not make sense to me.
> > > > > > > > > > > >
> > > > > > > > > > > > irq X: nobody cared
> > > > > > > > > > > > only triggers after an interrupt is unhandled repeatedly.
> > > > > > > > > > > >
> > > > > > > > > > > > So something causes a storm of useless tx interrupts here.
> > > > > > > > > > > >
> > > > > > > > > > > > Let's find out what it was please. What you are doing is
> > > > > > > > > > > > just preventing linux from complaining.
> > > > > > > > > > >
> > > > > > > > > > > The traffic that causes this warning is a netperf tcp_stream with at
> > > > > > > > > > > least 128 flows between 2 hosts. And the warning gets triggered on the
> > > > > > > > > > > receiving host, which has a lot of rx interrupts firing on all queues,
> > > > > > > > > > > and a few tx interrupts.
> > > > > > > > > > > And I think the scenario is: when the tx interrupt gets fired, it gets
> > > > > > > > > > > coalesced with the rx interrupt. Basically, the rx and tx interrupts
> > > > > > > > > > > get triggered very close to each other, and gets handled in one round
> > > > > > > > > > > of do_IRQ(). And the rx irq handler gets called first, which calls
> > > > > > > > > > > virtnet_poll(). However, virtnet_poll() calls virtnet_poll_cleantx()
> > > > > > > > > > > to try to do the work on the corresponding tx queue as well. That's
> > > > > > > > > > > why when tx interrupt handler gets called, it sees no work to do.
> > > > > > > > > > > And the reason for the rx handler to handle the tx work is here:
> > > > > > > > > > > https://lists.linuxfoundation.org/pipermail/virtualization/2017-April/034740.html
> > > > > > > > > >
> > > > > > > > > > Indeed. It's not a storm necessarily. The warning occurs after one
> > > > > > > > > > hundred such events, since boot, which is a small number compared real
> > > > > > > > > > interrupt load.
> > > > > > > > >
> > > > > > > > > Sorry, this is wrong. It is the other call to __report_bad_irq from
> > > > > > > > > note_interrupt that applies here.
> > > > > > > > >
> > > > > > > > > > Occasionally seeing an interrupt with no work is expected after
> > > > > > > > > > 7b0411ef4aa6 ("virtio-net: clean tx descriptors from rx napi"). As
> > > > > > > > > > long as this rate of events is very low compared to useful interrupts,
> > > > > > > > > > and total interrupt count is greatly reduced vs not having work
> > > > > > > > > > stealing, it is a net win.
> > > > > > > >
> > > > > > > > Right, but if 99900 out of 100000 interrupts were wasted, then it is
> > > > > > > > surely an even greater win to disable interrupts while polling like
> > > > > > > > this.  Might be tricky to detect, disabling/enabling aggressively every
> > > > > > > > time even if there's nothing in the queue is sure to cause lots of cache
> > > > > > > > line bounces, and we don't want to enable callbacks if they were not
> > > > > > > > enabled e.g. by start_xmit ...  Some kind of counter?
> > > > > > >
> > > > > > > Yes. It was known that the work stealing is more effective in some
> > > > > > > workloads than others. But a 99% spurious rate I had not anticipated.
> > > > > > >
> > > > > > > Most interesting is the number of interrupts suppressed as a result of
> > > > > > > the feature. That is not captured by this statistic.
> > > > > > >
> > > > > > > In any case, we'll take a step back to better understand behavior. And
> > > > > > > especially why this high spurious rate exhibits in this workload with
> > > > > > > many concurrent flows.
> > > > > >
> > > > > >
> > > > > > I've been thinking about it. Imagine work stealing working perfectly.
> > > > > > Each time we xmit a packet, it is stolen and freed.
> > > > > > Since xmit enables callbacks (just in case!) we also
> > > > > > get an interrupt, which is automatically spurious.
> > > > > >
> > > > > > My conclusion is that we shouldn't just work around it but instead
> > > > > > (or additionally?)
> > > > > > reduce the number of interrupts by disabling callbacks e.g. when
> > > > > > a. we are currently stealing packets
> > > > > > or
> > > > > > b. we stole all packets
> > > >
> > > > Agreed. This might prove a significant performance gain at the same time :)
> > > >
> > > > > >
> > > > > Thinking along this line, that probably means, we should disable cb on
> > > > > the tx virtqueue, when scheduling the napi work on the rx side, and
> > > > > reenable it after the rx napi work is done?
> > > > > Also, I wonder if it is too late to disable cb at the point we start
> > > > > to steal pkts or have stolen all pkts.
> > > >
> > > > The earlier the better. I see no benefit to delay until the rx handler
> > > > actually runs.
> > > >
> > >
> > > I've been thinking more on this. I think the fundamental issue here is
> > > that the rx napi handler virtnet_poll() does the tx side work by
> > > calling virtnet_poll_cleantx() without any notification to the tx
> > > side.
> > > I am thinking, in virtnet_poll(), instead of directly call
> > > virtnet_poll_cleantx(), why not do virtqueue_napi_schedule() to
> > > schedule the tx side napi, and let the tx napi handler do the cleaning
> > > work. This way, we automatically call virtqueue_disable_cb() on the tx
> > > vq, and after the tx work is done, virtqueue_napi_complete() is called
> > > to re-enable the cb on the tx side. This way, the tx side knows what
> > > has been done, and will likely reduce the # of spurious tx interrupts?
> > > And I don't think there is much cost in doing that, since
> > > napi_schedule() basically queues the tx napi to the back of its
> > > napi_list, and serves it right after the rx napi handler is done.
> > > What do you guys think? I could quickly test it up to see if it solves
> > > the issue.
> >
> >
> > Sure pls test. I think you will want to disable event index
> > for now to make sure disable cb is not a nop (I am working on
> > fixing that).
> >
> 
> Hi Michael and Jason,
> 
> I'd like to follow up on this issue a bit more.
> I've done some more investigation into this issue:
> 1. With Michael's recent patch: a7766ef18b336 ("virtio_net: disable cb
> aggressively"), we are still seeing this issue with a tcp_stream test
> with 240 flows.
> 2. We've tried with the following patch to suppress cleaning tx queue
> from rx napi handler for 10% of the time:
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 79bd2585ec6b..711768dbc617 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -1510,6 +1510,8 @@ static void virtnet_poll_cleantx(struct receive_queue *rq)
>                 return;
> 
>         if (__netif_tx_trylock(txq)) {
> +               if (virtqueue_more_used(sq->vq) && !prandom_u32_max(10))
> +                       goto unlock;
>                 do {
>                         virtqueue_disable_cb(sq->vq);
>                         free_old_xmit_skbs(sq, true);
> @@ -1518,6 +1520,7 @@ static void virtnet_poll_cleantx(struct receive_queue *rq)
>                 if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS)
>                         netif_tx_wake_queue(txq);
> 
> +unlock:
>                 __netif_tx_unlock(txq);
>         }
>  }
> This also does not help. It turns out skipping 10% is just not enough.
> We have to skip for 50% of the time in order for the warning to be
> suppressed.
> And this does not seem to be a viable solution since how much we skip
> probably will depend on the traffic pattern.
> 
> My questions here:
> 1. Michael mentioned that if we use split queues with event idx, the
> interrupts are not actually being disabled. Is this still the case? If
> so, is that also the cause for so many spurious interrupts?
> 2. Michael also submitted another patch: 8d622d21d248 ("virtio: fix up
> virtio_disable_cb"). I am not quite sure, would that change help
> reduce the # of spurious interrupts we see if we use split queues with
> event idx? From my limited understanding, that patch skips calling
> virtqueue_disable_cb_split() if event_trigger is set for split queues.
> 
> BTW, I have the setup to reproduce this issue easily. So do let me
> know if you have other ideas on how to fix it.
> 
> Thanks.
> Wei

I think that commit is needed to fix the issue, yes.

My suggestion is to try v5.14 in its entirety
rather than cherry-picking.

If you see that the issue is
fixed there I can point you to a list of commit to backport.

> 
> > > > > Because the steal work is done
> > > > > in the napi handler of the rx queue. But the tx interrupt must have
> > > > > been raised before that. Will we come back to process the tx interrupt
> > > > > again after we re-enabled the cb on the tx side?
> > > > >
> > > > > > This should be enough to reduce the chances below 99% ;)
> > > > > >
> > > > > > One annoying thing is that with split and event index, we do not disable
> > > > > > interrupts. Could be worth revisiting, for now maybe just disable the
> > > > > > event index feature? I am not sure it is actually worth it with
> > > > > > stealing.
> > > >
> > > > With event index, we suppress interrupts when another interrupt is
> > > > already pending from a previous packet, right? When the previous
> > > > position of the producer is already beyond the consumer. It doesn't
> > > > matter whether the previous packet triggered a tx interrupt or
> > > > deferred to an already scheduled rx interrupt? From that seems fine to
> > > > leave it out.
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
