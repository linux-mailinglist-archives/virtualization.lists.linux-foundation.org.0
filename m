Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D961705E6D
	for <lists.virtualization@lfdr.de>; Wed, 17 May 2023 05:57:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF5841E72;
	Wed, 17 May 2023 03:57:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF5841E72
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c16hTDaD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id opI8-SB4IjZd; Wed, 17 May 2023 03:57:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D5E6B41F95;
	Wed, 17 May 2023 03:57:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5E6B41F95
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D4A5C008A;
	Wed, 17 May 2023 03:57:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B809CC002A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 03:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 838A441EED
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 03:57:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 838A441EED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZbGPwDuxyIMi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 03:57:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 436FC41E72
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 436FC41E72
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 May 2023 03:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684295831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SF1C6Ii/3dDFs+yLRzrDuFD5U/ERayv1kcGi9vPuHdM=;
 b=c16hTDaDamc1SQ4NsoADP6aasTLL/2sxQyHXMsrYxDGIHY6BjA0BvvYFb6PXHiYv7uFVLR
 ueNSu05BxQtEKAYPL5KS5F6Wo2Eci6fSgunQoTl+guzRzqOkwWLchVGAAccUblJWlFnnsY
 X7grDypXicyyyuPV94C2C5Xh+zLPCOA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-Oy3rrPy2N-yff5ZRMpiCiA-1; Tue, 16 May 2023 23:57:09 -0400
X-MC-Unique: Oy3rrPy2N-yff5ZRMpiCiA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3078b9943d6so68645f8f.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 May 2023 20:57:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684295828; x=1686887828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SF1C6Ii/3dDFs+yLRzrDuFD5U/ERayv1kcGi9vPuHdM=;
 b=hDGJ2OXpV8UqddRTSwiV11bdPyAm5xUMLk9TTvzXpO9yzmk3Wwn6ReYb0I+dOWaKI5
 xMzM9o6TapFHKmm6KCgniT8tzDn/g0ZIOovN5mosRjHVxOeTtqsDL6REEEU1mnLuJheA
 ZvhTbx3lvYkUwcf28pnrcdGBr8mROtxbGv+TsFmrt49q4LDUPjIeKv5JuutkOro36PqJ
 aDkq9B1wkyZQYl1QYvYzelrL7SbasV6Jxy11hxbXa3/Ky7hjlPsNGBaT8IrCGh4dqHov
 GfPJK+JwKTuc4HPi9YVj2qqYuUC/m9u4k3/17sC1hQf6mOUQy08DOhaLzhNLJ20W04fe
 HL/w==
X-Gm-Message-State: AC+VfDxBB7yt+Tqv7BR76bvOPF322xYtxL/jpDXPUoqbdBI+sDo6ecoc
 mexQTm6dKG3iuoD/mu7Q1NVvbKroqWYRaphcxcyVvHC1645YK8oBZXC8Gd112Vcb+ZcQOzSWtWC
 fy9ZEbHwhXir75fADeiPLkmeC5CMTFvpVPWCZzEHz6Q==
X-Received: by 2002:adf:fe05:0:b0:306:f6c:1063 with SMTP id
 n5-20020adffe05000000b003060f6c1063mr27718185wrr.38.1684295827943; 
 Tue, 16 May 2023 20:57:07 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6tMdwniV2/Yl2o/aQZF/VVc4cBdt1RKQYwGpF5htMgQeuGGC6Mzgt027tn3iFNOt3EKaEyjA==
X-Received: by 2002:adf:fe05:0:b0:306:f6c:1063 with SMTP id
 n5-20020adffe05000000b003060f6c1063mr27718177wrr.38.1684295827638; 
 Tue, 16 May 2023 20:57:07 -0700 (PDT)
Received: from redhat.com ([2.52.6.43]) by smtp.gmail.com with ESMTPSA id
 l7-20020a5d5267000000b002fe96f0b3acsm1409753wrc.63.2023.05.16.20.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 20:57:07 -0700 (PDT)
Date: Tue, 16 May 2023 23:57:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Subject: Re: Re: [PATCH v2 0/2] virtio: abstract virtqueue related methods
Message-ID: <20230516235541-mutt-send-email-mst@kernel.org>
References: <20230517025424.601141-1-pizhenwei@bytedance.com>
 <20230516234444-mutt-send-email-mst@kernel.org>
 <8f3ca136-0276-49ca-d703-715c83cff557@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <8f3ca136-0276-49ca-d703-715c83cff557@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org,
 stefanha@redhat.com, virtualization@lists.linux-foundation.org
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

On Wed, May 17, 2023 at 11:51:03AM +0800, zhenwei pi wrote:
> 
> 
> On 5/17/23 11:46, Michael S. Tsirkin wrote:
> > On Wed, May 17, 2023 at 10:54:22AM +0800, zhenwei pi wrote:
> > > v1 -> v2:
> > > - Suggested by MST, use fast path for vring based performance
> > > sensitive API.
> > > - Reduce changes in tools/virtio.
> > > 
> > > Add test result(no obvious change):
> > > Before:
> > > time ./vringh_test --parallel
> > > Using CPUS 0 and 191
> > > Guest: notified 10036893, pinged 68278
> > > Host: notified 68278, pinged 3093532
> > > 
> > > real	0m14.463s
> > > user	0m6.437s
> > > sys	0m8.010s
> > > 
> > > After:
> > > time ./vringh_test --parallel
> > > Using CPUS 0 and 191
> > > Guest: notified 10036709, pinged 68347
> > > Host: notified 68347, pinged 3085292
> > > 
> > > real	0m14.196s
> > > user	0m6.289s
> > > sys	0m7.885s
> > > 
> > > v1:
> > > Hi,
> > > 
> > > 3 weeks ago, I posted a proposal 'Virtio Over Fabrics':
> > > https://lists.oasis-open.org/archives/virtio-comment/202304/msg00442.html
> > > 
> > > Jason and Stefan pointed out that a non-vring based virtqueue has a
> > > chance to overwrite virtqueue instead of using vring virtqueue.
> > > 
> > > Then I try to abstract virtqueue related methods in this series, the
> > > details changes see the comment of patch 'virtio: abstract virtqueue related methods'.
> > > 
> > > Something is still remained:
> > > - __virtqueue_break/__virtqueue_unbreak is supposed to use by internal
> > >    virtio core, I'd like to rename them to vring_virtqueue_break
> > >    /vring_virtqueue_unbreak. Is this reasonable?
> > 
> > Why? These just set a flag?
> > 
> 
> Rename '__virtqueue_break' to 'vring_virtqueue_break', to make symbols
> exported from virtio_ring.ko have unified prefix 'vring_virtqueue_xxx'.

I just do not see why you need these callbacks at all.

> > > - virtqueue_get_desc_addr/virtqueue_get_avail_addr/virtqueue_get_used_addr
> > >    /virtqueue_get_vring is vring specific, I'd like to rename them like
> > >    vring_virtqueue_get_desc_addr. Is this reasonable?
> > > - there are still some functions in virtio_ring.c with prefix *virtqueue*,
> > >    for example 'virtqueue_add_split', just keep it or rename it to
> > >    'vring_virtqueue_add_split'?
> > > zhenwei pi (2):
> > >    virtio: abstract virtqueue related methods
> > >    tools/virtio: implement virtqueue in test
> > > 
> > >   drivers/virtio/virtio_ring.c | 285 +++++-----------------
> > >   include/linux/virtio.h       | 441 +++++++++++++++++++++++++++++++----
> > >   include/linux/virtio_ring.h  |  26 +++
> > >   tools/virtio/linux/virtio.h  | 355 +++++++++++++++++++++++++---
> > >   4 files changed, 807 insertions(+), 300 deletions(-)
> > > 
> > > -- 
> > > 2.20.1
> > 
> 
> -- 
> zhenwei pi

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
