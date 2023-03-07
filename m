Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CE86ADCD7
	for <lists.virtualization@lfdr.de>; Tue,  7 Mar 2023 12:08:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4439B408A9;
	Tue,  7 Mar 2023 11:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4439B408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YR43gTngLc1l; Tue,  7 Mar 2023 11:08:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B59E4408DB;
	Tue,  7 Mar 2023 11:08:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B59E4408DB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8977C0089;
	Tue,  7 Mar 2023 11:08:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7D3BC0032
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 11:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 871A6408A9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 11:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 871A6408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Src2R47KvUEU
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 11:08:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 244B2408A8
Received: from out30-97.freemail.mail.aliyun.com
 (out30-97.freemail.mail.aliyun.com [115.124.30.97])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 244B2408A8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Mar 2023 11:08:36 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R171e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046051;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VdLD6tx_1678187309; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VdLD6tx_1678187309) by smtp.aliyun-inc.com;
 Tue, 07 Mar 2023 19:08:30 +0800
Message-ID: <1678187301.913421-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH net 0/2] add checking sq is full inside xdp xmit
Date: Tue, 7 Mar 2023 19:08:21 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Paolo Abeni <pabeni@redhat.com>
References: <20230306041535.73319-1-xuanzhuo@linux.alibaba.com>
 <20230306125742-mutt-send-email-mst@kernel.org>
 <1678153770.8281553-2-xuanzhuo@linux.alibaba.com>
 <27a06a7d79fef3446ae1167612808a2af09922be.camel@redhat.com>
In-Reply-To: <27a06a7d79fef3446ae1167612808a2af09922be.camel@redhat.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, "David S.  Miller" <davem@davemloft.net>
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

On Tue, 07 Mar 2023 10:53:41 +0100, Paolo Abeni <pabeni@redhat.com> wrote:
> Hi,
> On Tue, 2023-03-07 at 09:49 +0800, Xuan Zhuo wrote:
> > On Mon, 6 Mar 2023 12:58:22 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Mon, Mar 06, 2023 at 12:15:33PM +0800, Xuan Zhuo wrote:
> > > > If the queue of xdp xmit is not an independent queue, then when the xdp
> > > > xmit used all the desc, the xmit from the __dev_queue_xmit() may encounter
> > > > the following error.
> > > >
> > > > net ens4: Unexpected TXQ (0) queue failure: -28
> > > >
> > > > This patch adds a check whether sq is full in XDP Xmit.
> > > >
> > > > Thanks.
> > >
> > > Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> > > needed for stable?
> >
> > Yes i think.
>
> Could you please re-post including a suitable 'Fixes' tag? That would
> address stable, too. Additionally you could rename check_sq_full() in
> patch 1, perhaps 'check_disable_sq_full()' would do.
>
> You can retain the already collected tags.

OK

Thanks.


>
> Thanks!
>
> Paolo
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
