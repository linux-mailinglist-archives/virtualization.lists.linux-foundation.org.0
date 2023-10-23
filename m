Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699A7D2886
	for <lists.virtualization@lfdr.de>; Mon, 23 Oct 2023 04:28:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0A2141B08;
	Mon, 23 Oct 2023 02:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0A2141B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACGWBgYOiP76; Mon, 23 Oct 2023 02:28:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A3C3E41B14;
	Mon, 23 Oct 2023 02:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C3E41B14
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CB3CBC0DD3;
	Mon, 23 Oct 2023 02:28:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E111BC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA429820FE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA429820FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id btOKJNKBT2K4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:28:12 +0000 (UTC)
Received: from out30-101.freemail.mail.aliyun.com
 (out30-101.freemail.mail.aliyun.com [115.124.30.101])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8D1A820F9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Oct 2023 02:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D1A820F9
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
 TI=SMTPD_---0Vud6gWk_1698028084; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0Vud6gWk_1698028084) by smtp.aliyun-inc.com;
 Mon, 23 Oct 2023 10:28:05 +0800
Message-ID: <1698028017.8052797-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH] virtio_ring: add an error code check in virtqueue_resize
Date: Mon, 23 Oct 2023 10:26:57 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20231020092320.209234-1-suhui@nfschina.com>
 <20231020053047-mutt-send-email-mst@kernel.org>
 <1697794601.5857713-2-xuanzhuo@linux.alibaba.com>
 <20231020054140-mutt-send-email-mst@kernel.org>
 <1697795422.0986886-1-xuanzhuo@linux.alibaba.com>
 <20231020055943-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231020055943-mutt-send-email-mst@kernel.org>
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 Su Hui <suhui@nfschina.com>, linux-kernel@vger.kernel.org
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

On Fri, 20 Oct 2023 06:08:06 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Fri, Oct 20, 2023 at 05:50:22PM +0800, Xuan Zhuo wrote:
> > On Fri, 20 Oct 2023 05:42:14 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Fri, Oct 20, 2023 at 05:36:41PM +0800, Xuan Zhuo wrote:
> > > > On Fri, 20 Oct 2023 05:34:32 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > On Fri, Oct 20, 2023 at 05:23:21PM +0800, Su Hui wrote:
> > > > > > virtqueue_resize_packed() or virtqueue_resize_split() can return
> > > > > > error code if failed, so add a check for this.
> > > > > >
> > > > > > Signed-off-by: Su Hui <suhui@nfschina.com>
> > > > > > ---
> > > > > >
> > > > > > I'm not sure that return directly is right or not,
> > > > > > maybe there are some process should do before return.
> > > > >
> > > > > yes - presizely what virtqueue_enable_after_reset does.
> > > > >
> > > > > Error handling in virtqueue_enable_after_reset is really weird BTW.
> > > > > For some reason it overrides the error code returned.
> > > > >
> > > > >
> > > > >
> > > > >
> > > > >
> > > > > >  drivers/virtio/virtio_ring.c | 3 +++
> > > > > >  1 file changed, 3 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > > index 51d8f3299c10..cf662c3a755b 100644
> > > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > > @@ -2759,6 +2759,9 @@ int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > > > > >  	else
> > > > > >  		err = virtqueue_resize_split(_vq, num);
> > > > > >
> > > > > > +	if (err)
> > > > > > +		return err;
> > > > > > +
> > > > > >  	return virtqueue_enable_after_reset(_vq);
> > > > >
> > > > > So I think it should be something like:
> > > > >
> > > > > 	int err_reset = virtqueue_enable_after_reset(_vq);
> > > > > 	BUG_ON(err_reset);
> > > > >
> > > > > 	return err;
> > > > >
> > > >
> > > > How about WARN and vq->broken?
> > > >
> > > > Thanks.
> > >
> > > Well, what are the cases where it can happen practically?
> >
> > Device error. Such as vp_active_vq()
> >
> > Thanks.
>
> Hmm interesting. OK. But do callers know to recover?


No.

So I think WARN + broken is suitable.

Thanks.


>
> >
> > >
> > > >
> > > > >
> > > > >
> > > > > >  }
> > > > > >  EXPORT_SYMBOL_GPL(virtqueue_resize);
> > > > > > --
> > > > > > 2.30.2
> > > > >
> > >
>
> _______________________________________________
> Virtualization mailing list
> Virtualization@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/virtualization
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
