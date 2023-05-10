Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8DE6FE4E2
	for <lists.virtualization@lfdr.de>; Wed, 10 May 2023 22:15:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA6A581FA0;
	Wed, 10 May 2023 20:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA6A581FA0
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BIh/Z7jh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VyYlg4ZzFn48; Wed, 10 May 2023 20:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 944A181F81;
	Wed, 10 May 2023 20:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 944A181F81
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD364C0089;
	Wed, 10 May 2023 20:15:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAB1DC002A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 May 2023 20:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B473340412
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 May 2023 20:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B473340412
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=BIh/Z7jh
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z98i9qR6pp_v
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 May 2023 20:15:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD4F7403A2
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD4F7403A2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 May 2023 20:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683749699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tfsK2yFYcauaq/Kob2svvb9XT2LMlLifPGyY56gbQYk=;
 b=BIh/Z7jhqB3Oyfc+5xCh36dOCwar6x8/aqkyHm6c+dghEqvwwzu5o0qvllKjjZqTaubN5h
 p8jQk42HYkuYyNANQ4Q+leAtrMNoQzu0UvI/wRPBdwIX5ekNYVlG0tWMShNWqYFHMw6+qs
 yU1rUzLoHJjWOriibDLMHfA9ohlIXH4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-345-pQNVYJrgNu-GU-yal5aZsw-1; Wed, 10 May 2023 16:14:58 -0400
X-MC-Unique: pQNVYJrgNu-GU-yal5aZsw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-30633999815so2923806f8f.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 May 2023 13:14:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683749697; x=1686341697;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tfsK2yFYcauaq/Kob2svvb9XT2LMlLifPGyY56gbQYk=;
 b=jIx54xVUiOLbBy1w8JnRFndqCt1p+8+KwRUinuzOlmtwfKfIfS+lMbVO7ZSvUVCxtb
 Q639pzUCCeISQ4oOQaU/xMK+YkKffijamoG5ys14dPIk7wpBg/82Oj5Ac/pVQEeQ0fht
 pJ+xsE3zGSO4SAVE7ZaL208doto4B72RsE8Bo4BrbRkYDQnwM3rf+tmJlVeFUVsQoVt3
 D2k3UnGCelCvT4SruqGXolgWy/mLZZKcUepB58U3ydnuo+iGpggmu7PBQ4whwkpo16CE
 JZpQTZbOKfg7Hn6iRHW7w9EUoX8f4Ht8LnpGBsoDVm4bgvsF+dEeNZ5RNBikMlJudeA+
 H86w==
X-Gm-Message-State: AC+VfDySi22kfVHlYkAA/Vk3DeyZ483gU+CfUbHPnaFA+Tmmz/SGQMO+
 OBBM/xNiLI9dpMLoeZwpg0MLrsbo1cGvct9isudguNuWAeSPseDmIwYtnrpbT43kbQF0yvGxUCw
 ZFsuk7p+Zgf7+kzhg5/+wVUBq0An7RmDVcPeTcflnlw==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id
 g12-20020a5d46cc000000b003071bbaea61mr12964298wrs.44.1683749697428; 
 Wed, 10 May 2023 13:14:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6nArb47shpuQrNqjz9H3I8yBD/XpXzKkgXB8nTLFpLIl2qlN2WjGoLWMWGwpTTFBJfG4ckpA==
X-Received: by 2002:a5d:46cc:0:b0:307:1bba:ea61 with SMTP id
 g12-20020a5d46cc000000b003071bbaea61mr12964289wrs.44.1683749697090; 
 Wed, 10 May 2023 13:14:57 -0700 (PDT)
Received: from redhat.com ([31.187.78.71]) by smtp.gmail.com with ESMTPSA id
 i11-20020adff30b000000b0030644bdefd8sm18246294wro.52.2023.05.10.13.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 13:14:56 -0700 (PDT)
Date: Wed, 10 May 2023 16:14:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Horman <horms@kernel.org>
Subject: Re: [PATCH] virtio: Add missing documentation for structure fields
Message-ID: <20230510161442-mutt-send-email-mst@kernel.org>
References: <20230510-virtio-kdoc-v1-1-d2b1824a9a2b@kernel.org>
 <20230510120332-mutt-send-email-mst@kernel.org>
 <ZFv4DfUcipQAII5R@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ZFv4DfUcipQAII5R@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, linux-kernel@vger.kernel.org,
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

On Wed, May 10, 2023 at 10:01:17PM +0200, Simon Horman wrote:
> On Wed, May 10, 2023 at 12:04:21PM -0400, Michael S. Tsirkin wrote:
> > On Wed, May 10, 2023 at 02:23:12PM +0200, Simon Horman wrote:
> > > Add missing documentation for the vqs_list_lock field of struct virtio_device,
> > > and the validate field of struct virtio_driver.
> > > 
> > > ./scripts/kernel-doc says:
> > > 
> > >  .../virtio.h:131: warning: Function parameter or member 'vqs_list_lock' not described in 'virtio_device'
> > >  .../virtio.h:192: warning: Function parameter or member 'validate' not described in 'virtio_driver'
> > >  2 warnings as Errors
> > > 
> > > No functional changes intended.
> > > 
> > > Signed-off-by: Simon Horman <horms@kernel.org>
> > > ---
> > >  include/linux/virtio.h | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > > index b93238db94e3..0b2b82ee3220 100644
> > > --- a/include/linux/virtio.h
> > > +++ b/include/linux/virtio.h
> > > @@ -103,6 +103,7 @@ int virtqueue_resize(struct virtqueue *vq, u32 num,
> > >   * @config_enabled: configuration change reporting enabled
> > >   * @config_change_pending: configuration change reported while disabled
> > >   * @config_lock: protects configuration change reporting
> > > + * @vqs_list_lock: protects @vqs.
> > >   * @dev: underlying device.
> > >   * @id: the device type identification (used to match it with a driver).
> > >   * @config: the configuration ops for this device.
> > > @@ -160,6 +161,7 @@ size_t virtio_max_dma_size(const struct virtio_device *vdev);
> > >   * @feature_table_size: number of entries in the feature table array.
> > >   * @feature_table_legacy: same as feature_table but when working in legacy mode.
> > >   * @feature_table_size_legacy: number of entries in feature table legacy array.
> > > + * @validate: the function to call to vaidate features at probe time.
> > 
> > typo
> > 
> > and this is called before probe actually not at probe time
> 
> Thanks, how about the following?
> 
> * @validate: the function to call to validate features

... and config space

> > >   * @probe: the function to call when a device is found.  Returns 0 or -errno.
> > >   * @scan: optional function to call after successful probe; intended
> > >   *    for virtio-scsi to invoke a scan.
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
