Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B000974D165
	for <lists.virtualization@lfdr.de>; Mon, 10 Jul 2023 11:28:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB2BB40953;
	Mon, 10 Jul 2023 09:28:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB2BB40953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEpzJg2SJkzy; Mon, 10 Jul 2023 09:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 6E784409A3;
	Mon, 10 Jul 2023 09:28:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E784409A3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2AC8C008D;
	Mon, 10 Jul 2023 09:28:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B017C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 09:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6881D81461
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 09:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6881D81461
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aatYJsg84BsO
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 09:27:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1EB8781458
Received: from out30-113.freemail.mail.aliyun.com
 (out30-113.freemail.mail.aliyun.com [115.124.30.113])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1EB8781458
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Jul 2023 09:27:54 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=19; SR=0;
 TI=SMTPD_---0Vn0blpX_1688981263; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vn0blpX_1688981263) by smtp.aliyun-inc.com;
 Mon, 10 Jul 2023 17:27:44 +0800
Message-ID: <1688981109.6377137-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net-next V1 0/4] virtio_net: add per queue interrupt
 coalescing support
Date: Mon, 10 Jul 2023 17:25:09 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Gavin Li <gavinl@nvidia.com>
References: <20230710092005.5062-1-gavinl@nvidia.com>
In-Reply-To: <20230710092005.5062-1-gavinl@nvidia.com>
Cc: xuanzhuo@linux.alibaba.com, ast@kernel.org, hawk@kernel.org,
 daniel@iogearbox.net, mst@redhat.com, netdev@vger.kernel.org,
 john.fastabend@gmail.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, edumazet@google.com,
 Heng Qi <hengqi@linux.alibaba.com>, jiri@nvidia.com, kuba@kernel.org,
 bpf@vger.kernel.org, pabeni@redhat.com, davem@davemloft.net
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

On Mon, 10 Jul 2023 12:20:01 +0300, Gavin Li <gavinl@nvidia.com> wrote:

As far as I know, Heng Qi does that. I'm not sure, it's the same piece.

cc @Heng Qi

Thanks.


> Currently, coalescing parameters are grouped for all transmit and receive
> virtqueues. This patch series add support to set or get the parameters for
> a specified virtqueue.
>
> When the traffic between virtqueues is unbalanced, for example, one virtqueue
> is busy and another virtqueue is idle, then it will be very useful to
> control coalescing parameters at the virtqueue granularity.
>
> Example command:
> $ ethtool -Q eth5 queue_mask 0x1 --coalesce tx-packets 10
> Would set max_packets=10 to VQ 1.
> $ ethtool -Q eth5 queue_mask 0x1 --coalesce rx-packets 10
> Would set max_packets=10 to VQ 0.
> $ ethtool -Q eth5 queue_mask 0x1 --show-coalesce
>  Queue: 0
>  Adaptive RX: off  TX: off
>  stats-block-usecs: 0
>  sample-interval: 0
>  pkt-rate-low: 0
>  pkt-rate-high: 0
>
>  rx-usecs: 222
>  rx-frames: 0
>  rx-usecs-irq: 0
>  rx-frames-irq: 256
>
>  tx-usecs: 222
>  tx-frames: 0
>  tx-usecs-irq: 0
>  tx-frames-irq: 256
>
>  rx-usecs-low: 0
>  rx-frame-low: 0
>  tx-usecs-low: 0
>  tx-frame-low: 0
>
>  rx-usecs-high: 0
>  rx-frame-high: 0
>  tx-usecs-high: 0
>  tx-frame-high: 0
>
> In this patch series:
> Patch-1: Extract interrupt coalescing settings to a structure.
> Patch-2: Extract get/set interrupt coalesce to a function.
> Patch-3: Support per queue interrupt coalesce command.
> Patch-4: Enable per queue interrupt coalesce feature.
>
> Gavin Li (4):
>   virtio_net: extract interrupt coalescing settings to a structure
>   virtio_net: extract get/set interrupt coalesce to a function
>   virtio_net: support per queue interrupt coalesce command
>   virtio_net: enable per queue interrupt coalesce feature
>
>  drivers/net/virtio_net.c        | 169 ++++++++++++++++++++++++++------
>  include/uapi/linux/virtio_net.h |  14 +++
>  2 files changed, 154 insertions(+), 29 deletions(-)
>
> --
> 2.39.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
