Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3B3A0E20
	for <lists.virtualization@lfdr.de>; Wed,  9 Jun 2021 09:54:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86DCC404C6;
	Wed,  9 Jun 2021 07:54:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7OTxJgxNQTl; Wed,  9 Jun 2021 07:54:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 26702404BA;
	Wed,  9 Jun 2021 07:54:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98447C000B;
	Wed,  9 Jun 2021 07:54:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1830EC000B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10BA2402E7
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:54:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x8eUo0oYAUKo
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:54:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out30-44.freemail.mail.aliyun.com
 (out30-44.freemail.mail.aliyun.com [115.124.30.44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E90A402AF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  9 Jun 2021 07:54:08 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R571e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=xuanzhuo@linux.alibaba.com;
 NM=1; PH=DS; RN=8; SR=0; TI=SMTPD_---0UbqxYUt_1623225245; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0UbqxYUt_1623225245) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 09 Jun 2021 15:54:05 +0800
MIME-Version: 1.0
Message-Id: <1623225080.4793522-1-xuanzhuo@linux.alibaba.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Date: Wed, 09 Jun 2021 15:51:20 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Greg KH <gregkh@linuxfoundation.org>
In-Reply-To: <YMBelFMOAhEqWoc+@kroah.com>
Cc: regressions@lists.linux.dev, "Michael S.Tsirkin" <mst@redhat.com>,
 =?utf-8?q?Corentin_No=C3=ABl?= <corentin.noel@collabora.com>,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Eric Dumazet <edumazet@google.com>
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

On Wed, 9 Jun 2021 08:24:20 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Jun 09, 2021 at 02:08:17PM +0800, Xuan Zhuo wrote:
> > On Wed, 9 Jun 2021 06:50:10 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > On Wed, Jun 09, 2021 at 09:48:33AM +0800, Xuan Zhuo wrote:
> > > > > > With this patch and the latest net branch I no longer get crashes.
> > > > >
> > > > > Did this ever get properly submitted to the networking tree to get into
> > > > > 5.13-final?
> > > >
> > > > The patch has been submitted.
> > > >
> > > > 	[PATCH net] virtio-net: fix for skb_over_panic inside big mode
> > >
> > > Submitted where?  Do you have a lore.kernel.org link somewhere?
> >
> >
> > https://lore.kernel.org/netdev/20210603170901.66504-1-xuanzhuo@linux.alibaba.com/
>
> So this is commit 1a8024239dac ("virtio-net: fix for skb_over_panic
> inside big mode") in Linus's tree, right?

YES.

>
> But why is that referencing:
> 	Fixes: fb32856b16ad ("virtio-net: page_to_skb() use build_skb when there's sufficient tailroom")

This problem was indeed introduced in fb32856b16ad.

I confirmed that this commit fb32856b16ad was first entered in 5.13-rc1, and the
previous 5.12 did not have this commit fb32856b16ad.

I'm not sure if it helped you.

Thanks.

>
> when this problem was seen in stable kernels that had a different commit
> backported to it?
>
> Is there nothing needed to be done for the stable kernel trees?
>
> confused,
>
> greg k-h
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
