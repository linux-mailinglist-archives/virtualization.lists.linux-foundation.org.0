Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5401E6EDDBE
	for <lists.virtualization@lfdr.de>; Tue, 25 Apr 2023 10:13:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FC27404C8;
	Tue, 25 Apr 2023 08:13:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FC27404C8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PSOA0jk3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IBW_FoapZXLg; Tue, 25 Apr 2023 08:13:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EDD9F404EC;
	Tue, 25 Apr 2023 08:13:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDD9F404EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B6ACC007C;
	Tue, 25 Apr 2023 08:13:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7960C002A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 08:13:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8057060AE4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 08:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8057060AE4
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PSOA0jk3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6zmVAeTSVgTM
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 08:13:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AD3F60739
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AD3F60739
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 08:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682410396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VxPkn25GHy91ynRR1pV4ar8WeNHXuOj3gGwdlgSRE94=;
 b=PSOA0jk3wHQmeKGIYABBr4DtCG3Dxrc/kCq7mNOsTPvyWM3yzJ7IUE7rr3xHGuF6NN/yT0
 BAZEEAvxvQ4Ip4ZbnYxGI05QRZg0wgk+BWelvnPVKpm1knPcrzj4Sg9KrIapZhcHUvLfZv
 SW6a48XDhxyScY6UNGRFQZP4Vf96VgU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-TiC-JUFRMXOZNZb4IQur3A-1; Tue, 25 Apr 2023 04:13:15 -0400
X-MC-Unique: TiC-JUFRMXOZNZb4IQur3A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f195c06507so52028695e9.1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Apr 2023 01:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682410393; x=1685002393;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VxPkn25GHy91ynRR1pV4ar8WeNHXuOj3gGwdlgSRE94=;
 b=AgBsJ7ygXPYyLVWTMx8fnG2zmpLhbJ42YRhH5xaZAOx/anZbPWoG1TuSNvsmxLMMQa
 ZBwQk9+RkZ43ygUyigYGE+0+5ZPCkZPzrHKfti4e2uf2hr675DAeSkpQr6ywWKiMcXl9
 WI+6ew7nDWF6L7mDLQ+vxGQb5Ww8lKaFv2luu6B+kDgx8xX7n8OvnqL7mSAuLITCjMFW
 3U3zMGnTkdBeWVV9dYctedKj3mcnSVjEiKzd+QEg06elLNRmtc0C8ajpPhvCm3Cf0d0H
 6qWue6xXjSLHZnLVM6Cg35PX0XpEAB6umGTSGLHi5hFTnDT1FL8B4i8oFt91+RFnOXiq
 IA8Q==
X-Gm-Message-State: AAQBX9d8W8efnRGHlz8IG6OKh5QlfkwyYJiI0XKAhCKXVcp5468tv5SD
 4ZH2UV13fvuu3Y7IyCfjZD7mxHaxhRIEJrzDgIc6yfUUHdNQs+Tmn1gZo572oRcpCNgfrTgQumi
 u2VXJp1d46HRQ6vWGyBr3Iyk9qyYdvuAdyPjgPyknbw==
X-Received: by 2002:a5d:510f:0:b0:2ef:eb45:2317 with SMTP id
 s15-20020a5d510f000000b002efeb452317mr15060913wrt.9.1682410393649; 
 Tue, 25 Apr 2023 01:13:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ajHtwCWQqjJiChIqdMNdH/aE1wrDRmNDbH28Xb0UQ//qoWFBM8yYYzpsbB1/PMN+SVAaB+og==
X-Received: by 2002:a5d:510f:0:b0:2ef:eb45:2317 with SMTP id
 s15-20020a5d510f000000b002efeb452317mr15060891wrt.9.1682410393266; 
 Tue, 25 Apr 2023 01:13:13 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 o3-20020a05600c378300b003ef5f77901dsm14131859wmr.45.2023.04.25.01.13.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 01:13:12 -0700 (PDT)
Date: Tue, 25 Apr 2023 04:13:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH vhost v7 00/11] virtio core prepares for AF_XDP
Message-ID: <20230425041246-mutt-send-email-mst@kernel.org>
References: <20230425073613.8839-1-xuanzhuo@linux.alibaba.com>
 <20230425034700-mutt-send-email-mst@kernel.org>
 <1682409903.8734658-2-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1682409903.8734658-2-xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>
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

On Tue, Apr 25, 2023 at 04:05:03PM +0800, Xuan Zhuo wrote:
> On Tue, 25 Apr 2023 03:51:47 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Tue, Apr 25, 2023 at 03:36:02PM +0800, Xuan Zhuo wrote:
> > > ## About DMA APIs
> > >
> > > Now, virtio may can not work with DMA APIs when virtio features do not have
> > > VIRTIO_F_ACCESS_PLATFORM.
> > >
> > > 1. I tried to let DMA APIs return phy address by virtio-device. But DMA APIs just
> > >    work with the "real" devices.
> > > 2. I tried to let xsk support callballs to get phy address from virtio-net
> > >    driver as the dma address. But the maintainers of xsk may want to use dma-buf
> > >    to replace the DMA APIs. I think that may be a larger effort. We will wait
> > >    too long.
> > >
> > > So rethinking this, firstly, we can support premapped-dma only for devices with
> > > VIRTIO_F_ACCESS_PLATFORM. In the case of af-xdp, if the users want to use it,
> > > they have to update the device to support VIRTIO_F_RING_RESET, and they can also
> > > enable the device's VIRTIO_F_ACCESS_PLATFORM feature by the way.
> >
> > I don't understand this last sentence. If you think ring
> > reset can change device features then the answer is no, it can't.
> 
> 
> Sorry, I should remove "by the way".
> 
> 
> >
> > If you are saying device has to set VIRTIO_F_ACCESS_PLATFORM to
> > benefit from this work, that's fine at least as a first approach.
> > Note that setting VIRTIO_F_ACCESS_PLATFORM breaks old guests
> > (it's a secirity boundary), e.g. it is not available for
> > transitional devices.
> > So to support transitional devices, we might want to find another way to
> > address this down the road,
> 
> Maybe dma-buf is a way. I'll look into it, especially some practice on xsk.
> 
> > but as a first step, I agree just going with
> > DMA is fine.
> 
> 
> Thanks.

Pls do make sure to disable the feature when !VIRTIO_F_ACCESS_PLATFORM
though.

> 
> >
> >
> > > Thanks for the help from Christoph.
> > >
> > > =================
> > >
> > > XDP socket(AF_XDP) is an excellent bypass kernel network framework. The zero
> > > copy feature of xsk (XDP socket) needs to be supported by the driver. The
> > > performance of zero copy is very good.
> > >
> > > ENV: Qemu with vhost.
> > >
> > >                    vhost cpu | Guest APP CPU |Guest Softirq CPU | PPS
> > > -----------------------------|---------------|------------------|------------
> > > xmit by sockperf:     90%    |   100%        |                  |  318967
> > > xmit by xsk:          100%   |   30%         |   33%            | 1192064
> > > recv by sockperf:     100%   |   68%         |   100%           |  692288
> > > recv by xsk:          100%   |   33%         |   43%            |  771670
> > >
> > > Before achieving the function of Virtio-Net, we also have to let virtio core
> > > support these features:
> > >
> > > 1. virtio core support premapped
> > > 2. virtio core support reset per-queue
> > > 3. introduce DMA APIs to virtio core
> > >
> > > Please review.
> > >
> > > Thanks.
> > >
> > > v7:
> > >  1. virtqueue_dma_dev() return NULL when virtio is without DMA API.
> > >
> > > v6:
> > >  1. change the size of the flags to u32.
> > >
> > > v5:
> > >  1. fix for error handler
> > >  2. add flags to record internal dma mapping
> > >
> > > v4:
> > >  1. rename map_inter to dma_map_internal
> > >  2. fix: Excess function parameter 'vq' description in 'virtqueue_dma_dev'
> > >
> > > v3:
> > >  1. add map_inter to struct desc state to reocrd whether virtio core do dma map
> > >
> > > v2:
> > >  1. based on sgs[0]->dma_address to judgment is premapped
> > >  2. based on extra.addr to judgment to do unmap for no-indirect desc
> > >  3. based on indir_desc to judgment to do unmap for indirect desc
> > >  4. rename virtqueue_get_dma_dev to virtqueue_dma_dev
> > >
> > > v1:
> > >  1. expose dma device. NO introduce the api for dma and sync
> > >  2. split some commit for review.
> > >
> > > Xuan Zhuo (11):
> > >   virtio_ring: split: separate dma codes
> > >   virtio_ring: packed: separate dma codes
> > >   virtio_ring: packed-indirect: separate dma codes
> > >   virtio_ring: split: support premapped
> > >   virtio_ring: packed: support premapped
> > >   virtio_ring: packed-indirect: support premapped
> > >   virtio_ring: update document for virtqueue_add_*
> > >   virtio_ring: introduce virtqueue_dma_dev()
> > >   virtio_ring: correct the expression of the description of
> > >     virtqueue_resize()
> > >   virtio_ring: separate the logic of reset/enable from virtqueue_resize
> > >   virtio_ring: introduce virtqueue_reset()
> > >
> > >  drivers/virtio/virtio_ring.c | 352 +++++++++++++++++++++++++----------
> > >  include/linux/virtio.h       |   4 +
> > >  2 files changed, 259 insertions(+), 97 deletions(-)
> > >
> > > --
> > > 2.32.0.3.g01195cf9f
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
