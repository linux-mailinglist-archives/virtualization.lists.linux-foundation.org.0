Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 79902434E48
	for <lists.virtualization@lfdr.de>; Wed, 20 Oct 2021 16:52:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB09840541;
	Wed, 20 Oct 2021 14:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ymkqan2HY69; Wed, 20 Oct 2021 14:52:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 0CF054059F;
	Wed, 20 Oct 2021 14:52:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E70BC0022;
	Wed, 20 Oct 2021 14:52:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E1E3C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 14:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BAD8401B1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 14:52:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jdg6Hpjdo9Pp
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 14:52:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93EC3400B9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 14:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634741552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZTqldUCCZamNQowF+cayGaPOa4cFFy62QPR8TgGjTPk=;
 b=hqatw1y6/yxrfeW4RKi5jPUl6tZwf++Xhqi6aAjapa1hctgHnrY8sDKTtGJkjzkhhcWD5S
 zbDL1IDKZC3xmiLHrN2kDVDtgrhtdo2Ftx3R30b3Ruqy/waKCkzpWq5aMA0hbwWWQthlCK
 5VstaEtUYaxl/phyewafvDkRPlh7hzs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-aZLIMUzUO6O8ZJcgEQ0uVw-1; Wed, 20 Oct 2021 10:52:29 -0400
X-MC-Unique: aZLIMUzUO6O8ZJcgEQ0uVw-1
Received: by mail-wm1-f72.google.com with SMTP id
 b131-20020a1c1b89000000b0030d95485d90so550961wmb.2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 07:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZTqldUCCZamNQowF+cayGaPOa4cFFy62QPR8TgGjTPk=;
 b=jng193bAq63auiDpvAJjsmPlwLtOyQFNspD1V24yNs5YB3w+1K3VBRFbjyHdasjl8P
 I5AaigFtDpyz97Lp7GzTaKrhtus4SMNvuCQyQg/fXXu4HrmwtfDeTMTYhU4fdy9byNfh
 p5T5VbxH2Wl0pAlmiNjzrhHOLaFL7TmMHVCh65XjM5G4jEHzRudJkxSoGN+4juPnQLFu
 iHhxr1r7sgLEmXwAYv/cN4GrjyzAvJ+jWfgsdF6TMYG/ZmeMxB4FawPdJyf8aXjF7w4y
 BQYYRpXPjHLDVdwSJDfszYBpujqRFbwUPfm2Z9sX/ZvGEM8rK45EQTft4mS40lWXf91J
 mFPw==
X-Gm-Message-State: AOAM530Libn+ytGvoJBbqLnl3nPDlK4BGxe38HuT4tgpxPI4KxqQMS7P
 MF47zDAZ+x6mkGCbkJcvD/pOXmoh5PCpgcRVk5gIaGucVvHefqKkvFoCMerQIOUVfTQLuSuS6Sq
 qX3VLNbvOm5oNkVlmIC3iqP7RvEL0f0CZww0N95hmjg==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr167231wry.273.1634741548275; 
 Wed, 20 Oct 2021 07:52:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjVfmw5iu9f9tZ6QJX3ooTne/QIp1o9POK+AcI/cJ+mLdjH2Pde2dxgRfItr95d735OTsUMA==
X-Received: by 2002:a05:6000:1541:: with SMTP id
 1mr167207wry.273.1634741548025; 
 Wed, 20 Oct 2021 07:52:28 -0700 (PDT)
Received: from redhat.com ([2.55.24.172])
 by smtp.gmail.com with ESMTPSA id x21sm5174078wmc.14.2021.10.20.07.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 07:52:27 -0700 (PDT)
Date: Wed, 20 Oct 2021 10:52:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v4 2/2] virtio_ring: check desc == NULL when using
 indirect with packed
Message-ID: <20211020105106-mutt-send-email-mst@kernel.org>
References: <20211020042350-mutt-send-email-mst@kernel.org>
 <1634728063.4671392-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1634728063.4671392-2-xuanzhuo@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "David S. Miller" <davem@davemloft.net>, Tiwei Bie <tiwei.bie@intel.com>,
 virtualization@lists.linux-foundation.org
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

On Wed, Oct 20, 2021 at 07:07:43PM +0800, Xuan Zhuo wrote:
> On Wed, 20 Oct 2021 04:24:33 -0400, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Wed, Oct 20, 2021 at 10:19:46AM +0800, Xuan Zhuo wrote:
> > > On Tue, 19 Oct 2021 09:21:51 -0400, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > On Tue, Oct 19, 2021 at 07:52:35PM +0800, Xuan Zhuo wrote:
> > > > > When using indirect with packed, we don't check for allocation failures.
> > > > > This patch checks that and fall back on direct.
> > > > >
> > > > > Fixes: 1ce9e6055fa ("virtio_ring: introduce packed ring support")
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > ---
> > > > >  drivers/virtio/virtio_ring.c | 13 ++++++++++---
> > > > >  1 file changed, 10 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > > > > index 91a46c4da87d..44a03b6e4dc4 100644
> > > > > --- a/drivers/virtio/virtio_ring.c
> > > > > +++ b/drivers/virtio/virtio_ring.c
> > > > > @@ -1065,6 +1065,9 @@ static int virtqueue_add_indirect_packed(struct vring_virtqueue *vq,
> > > > >
> > > > >  	head = vq->packed.next_avail_idx;
> > > > >  	desc = alloc_indirect_packed(total_sg, gfp);
> > > > > +	if (!desc)
> > > > > +		/* fall back on direct */
> > > >
> > > > this comment belongs in virtqueue_add_packed right after
> > > > return.
> > > >
> > > > > +		return -EAGAIN;
> > > > >
> > > >
> > > > -ENOMEM surely?
> > >
> > > virtqueue_add_indirect_packed() will return -ENOMEM when dma mmap fails, so we
> > > have to choose a different error code.
> > >
> > > Thanks.
> >
> > That's exactly the point.  Why would we want to recover from allocation
> > failure but not DMA map failure?
> 
> >From indirect to direct mode, there is no need to allocate memory, so if we
> encounter memory allocation failure, we can fall back from indirect to direct
> mode. Memory allocation failure is a temporary problem.
> 
> And if you encounter a dma mmap error, this situation should be notified to the
> upper layer.
> 
> Thanks.

Why did dma map fail?
A common reason is precisely that we are running
out of buffer space. Using direct which does not
need extra buffer space thus has a chance to work.


> >
> > > >
> > > > >  	if (unlikely(vq->vq.num_free < 1)) {
> > > > >  		pr_debug("Can't add buf len 1 - avail = 0\n");
> > > > > @@ -1176,6 +1179,7 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> > > > >  	unsigned int i, n, c, descs_used, err_idx;
> > > > >  	__le16 head_flags, flags;
> > > > >  	u16 head, id, prev, curr, avail_used_flags;
> > > > > +	int err;
> > > > >
> > > > >  	START_USE(vq);
> > > > >
> > > > > @@ -1191,9 +1195,12 @@ static inline int virtqueue_add_packed(struct virtqueue *_vq,
> > > > >
> > > > >  	BUG_ON(total_sg == 0);
> > > > >
> > > > > -	if (virtqueue_use_indirect(_vq, total_sg))
> > > > > -		return virtqueue_add_indirect_packed(vq, sgs, total_sg,
> > > > > -				out_sgs, in_sgs, data, gfp);
> > > > > +	if (virtqueue_use_indirect(_vq, total_sg)) {
> > > > > +		err = virtqueue_add_indirect_packed(vq, sgs, total_sg, out_sgs,
> > > > > +						    in_sgs, data, gfp);
> > > > > +		if (err != -EAGAIN)
> > > > > +			return err;
> > > > > +	}
> > > > >
> > > > >  	head = vq->packed.next_avail_idx;
> > > > >  	avail_used_flags = vq->packed.avail_used_flags;
> > > > > --
> > > > > 2.31.0
> > > >
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
