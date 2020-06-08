Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC41F15AB
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:42:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7387586B33;
	Mon,  8 Jun 2020 09:41:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDtMaMTKJ8vD; Mon,  8 Jun 2020 09:41:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3A23B86B43;
	Mon,  8 Jun 2020 09:41:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11AE1C016F;
	Mon,  8 Jun 2020 09:41:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 224D8C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 10F8085EC4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:41:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fqs1_R8IkqlX
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:41:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3719A80CDD
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eH4Nj/mEDxjXnJZydIL7THbb14TLlM743flISB4xVNo=;
 b=f/8DTza52PbFLVXFh74DusqZONt+7rXa1o3hP+EIeVmO5AWnAsQiXBIqzc1CmHLbMt+t9n
 H4v6OhLhXJqYbKJ6PZpzr8PHg2SXGLPRs5KlLx2+JWGONEEM4Aa7c+i9GqQxd+Tgb+ENJa
 N2F9PFIuM1PgMWEn7eFNyXBRWDycEw0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-hbS1GyynMZ2g2A0GBqR50g-1; Mon, 08 Jun 2020 05:41:51 -0400
X-MC-Unique: hbS1GyynMZ2g2A0GBqR50g-1
Received: by mail-wr1-f70.google.com with SMTP id r5so6940282wrt.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eH4Nj/mEDxjXnJZydIL7THbb14TLlM743flISB4xVNo=;
 b=KGogeS5DXbXBzyxY+7kf7Rww1GzTFi6XbVeufWBJhLLVksGreVhbT2Kf9A98n+2ZfN
 xEckaoBlGgNBOp4kYdRiZYZGq/EtoBsH26CY5R1SBJNz5XloGIl6IApx2IgBRTpXHpE4
 u9nJwg7CTKkM1FBK+1TWrN3omsVD843emFyVeDSbaX9ZlH5T2Y85EOZCpBUTTz1xqsAD
 2rTSiB4BB1mOSnmiMyvRcmgQctj3zP0A+XIowyks5p8TPtIkAZvFIPwkXlXEtsN7mZym
 8pmR2Dyu3NoygrcXH3Gdw/PjePnH3IhQ511Ot2ke444Xob5vRsoBjcXWW3+vlll8ERSO
 kMJw==
X-Gm-Message-State: AOAM530ptgt0B+r6ZGbX9GQ2ln3gZTfLeK5X2kzC8a6hn5MAp2EVMsZu
 VwoPfvuYD2TDaFdiq83bhmcrTP7MTWxuKdRTkUhaaZwnECjmC/6hUcTfoKi9wD5VjBhb+HbR9gd
 wHiivVqbNiGimzwG3l9GVyJ3aFwkE4A33JSDdEg1xDw==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr24245128wrv.392.1591609310077; 
 Mon, 08 Jun 2020 02:41:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYIMMXmu8GESaNXodyPnwn38PxVgpU501X6dYPU1Y3LfCjdYX5cV5ZynextIUdAL24kIrlKg==
X-Received: by 2002:a5d:6550:: with SMTP id z16mr24245102wrv.392.1591609309872; 
 Mon, 08 Jun 2020 02:41:49 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 w17sm23341647wra.71.2020.06.08.02.41.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:41:48 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:41:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] virtio_mem: prevent overflow with subblock size
Message-ID: <20200608053807-mutt-send-email-mst@kernel.org>
References: <20200608061406.709211-1-mst@redhat.com>
 <0930c9d0-0708-c079-29bd-b80d4e3ce446@redhat.com>
 <20200608030423-mutt-send-email-mst@kernel.org>
 <d10e9515-8408-037c-385a-d69259ce70ee@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d10e9515-8408-037c-385a-d69259ce70ee@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 teawater <teawaterz@linux.alibaba.com>, linux-kernel@vger.kernel.org,
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

On Mon, Jun 08, 2020 at 09:17:45AM +0200, David Hildenbrand wrote:
> On 08.06.20 09:08, Michael S. Tsirkin wrote:
> > On Mon, Jun 08, 2020 at 08:58:31AM +0200, David Hildenbrand wrote:
> >> On 08.06.20 08:14, Michael S. Tsirkin wrote:
> >>> If subblock size is large (e.g. 1G) 32 bit math involving it
> >>> can overflow. Rather than try to catch all instances of that,
> >>> let's tweak block size to 64 bit.
> >>
> >> I fail to see where we could actually trigger an overflow. The reported
> >> warning looked like a false positive to me.
> > 
> > 
> > So
> > 
> >     const uint64_t size = count * vm->subblock_size;
> > 
> > is it unreasonable for count to be 4K with subblock_size being 1M?
> 
> virtio_mem_mb_plug_sb() and friends are only called on subblocks
> residing within a single Linux memory block. (currently, 128MB .. 2G on
> x86-64). A subblock on x86-64 is currently at least 4MB.
> 
> So "count * vm->subblock_size" can currently not exceed the Linux memory
> block size (in practice, it is max 128MB).
> 
> > 
> >>>
> >>> It ripples through UAPI which is an ABI change, but it's not too late to
> >>> make it, and it will allow supporting >4Gbyte blocks while might
> >>> become necessary down the road.
> >>>
> >>
> >> This might break cloud-hypervisor, who's already implementing this
> >> protocol upstream (ccing Hui).
> >> https://github.com/cloud-hypervisor/cloud-hypervisor/blob/master/vm-virtio/src/mem.rs
> >>
> >> (blocks in the gigabyte range were never the original intention of
> >> virtio-mem, but I am not completely opposed to that)
> > 
> > 
> > So in that case, can you code up validation in the probe function?
> 
> If we would currently have a "block_size" > Linux memory block size, we
> bail out.
> 
> virtio_mem_init():
> 
> if (vm->device_block_size > memory_block_size_bytes()) {
> 	dev_err(&vm->vdev->dev,
> 		"The block size is not supported (too big).\n");
> 	return -EINVAL;
> }

Sounds good.

> So what's reported can currently not happen. Having that said, changing
> "subblock_size" to be an uint64_t is a good cleanup, especially for the
> future.

OK, no need to argue about it then. I tweaked the subject as you
suggested and queued it then.

> 
> 
> 
> -- 
> Thanks,
> 
> David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
