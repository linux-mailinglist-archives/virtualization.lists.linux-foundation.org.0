Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2894427BED8
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 10:07:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BAD9D85DF5;
	Tue, 29 Sep 2020 08:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LQSkAFsyrWN1; Tue, 29 Sep 2020 08:07:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F3CA85DF9;
	Tue, 29 Sep 2020 08:07:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E942BC016F;
	Tue, 29 Sep 2020 08:07:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 096A1C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0547D86D5A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:07:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d5gskHwtY80f
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:07:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A1A5C85BC4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 08:07:04 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id z23so13626253ejr.13
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 01:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wKUZCTImfjOR/eCFpUIhQQDoAr5/BSnFjk/PYyLLEwQ=;
 b=tKvYONgoxw23A5ClKktE+kVo/sCFq3snOh1FLDTs4ZwcIuvdhjsD8ZTlBj0NY3BIP6
 /aL63omXW8xWw8kDegYI7EG8JnCZ58sM56eGmIe1GrOn45CrJ7GYjFzSMVqsQuhG28ZW
 whmx0gmuGkbGPzHrAIX/aw7O+sEq7vK5Lb70BCZNX7n5YpJx9oXYjICOL04JGAuO90m8
 p+Uagie8O97x6JlcocVP+gFXGNFajM1I7fVrdwNdmVyTNaVfPLaZRzOC/hFt9TgI4YI7
 SLFK3tKvACq7aLVbK+T9Ay0rQMpf5bww37EvWuN0TDclcvYx3WQiF7KI8z0Wmv60DhQZ
 cC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wKUZCTImfjOR/eCFpUIhQQDoAr5/BSnFjk/PYyLLEwQ=;
 b=X+zTuDPqCdaUqLtC/cIcyg/Vu3/6dNYIjdroTmotzl0crv9zizb5Sc0E6Rp+Ri99yu
 DfsJgLXS51kZkQvwShTHbPB0yIBxvC5eeZ6uxRglfY1GP8r+wrIxkVHhuOAstRvyEqvg
 jUGZdXefUXf+H5uWcB36Dxrk9silXRGcsC6Dr7I3qV3oZMnH813TKMhc7plLMzuH8NdG
 ssF4YQWpEmn5PlyEWLUOVFfq1yitcHXpei14Dx2slQquhFtRI94HjuUFVpuxr1Hd5orV
 GFLwi7+j66nbEzoCFnfyBBRfVvJQ0LULRs4dG3GYbzazhCRwo8CXxmCpLYUxn68F0keC
 RKUw==
X-Gm-Message-State: AOAM533BgDnDUiN6TABTdvggpSC9IN7QjmNvAQeG+H/sr/XzIbNIIsyq
 2iI6eXPjkaR3EjZ/rVk32BfvBT6d+yiwn0FLmOU=
X-Google-Smtp-Source: ABdhPJwwayGI9GutwxN+MWHVcC/c+y0GpciMYodRrApE4g0JLS3nckigvhb/RoPOjP/4rNANbIUVWeKPAaL0JLybaw0=
X-Received: by 2002:a17:906:c191:: with SMTP id
 g17mr2731475ejz.117.1601366823170; 
 Tue, 29 Sep 2020 01:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200929015806.19171-1-xiangxia.m.yue@gmail.com>
 <20200929022246-mutt-send-email-mst@kernel.org>
 <CAMDZJNWM7eBkrYk9nkEvPyHW7=kt_hTHGQCDB1CPRz=EV6vJcQ@mail.gmail.com>
 <20200929031754-mutt-send-email-mst@kernel.org>
 <CA+FuTScinzrURHx_jQge9jN0mJU7oM2d9AJ9ckkXm3SxBHGNvQ@mail.gmail.com>
In-Reply-To: <CA+FuTScinzrURHx_jQge9jN0mJU7oM2d9AJ9ckkXm3SxBHGNvQ@mail.gmail.com>
From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Date: Tue, 29 Sep 2020 16:04:38 +0800
Message-ID: <CAMDZJNWLr1MK718DWzaZR1GRktQwcTpt8-B3xtAJn_qSiKc5AQ@mail.gmail.com>
Subject: Re: [PATCH net v2] virtio-net: don't disable guest csum when disable
 LRO
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>,
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

On Tue, Sep 29, 2020 at 3:29 PM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> On Tue, Sep 29, 2020 at 9:23 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Sep 29, 2020 at 02:59:03PM +0800, Tonghao Zhang wrote:
> > > On Tue, Sep 29, 2020 at 2:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Tue, Sep 29, 2020 at 09:58:06AM +0800, xiangxia.m.yue@gmail.com wrote:
> > > > > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > > >
> > > > > Open vSwitch and Linux bridge will disable LRO of the interface
> > > > > when this interface added to them. Now when disable the LRO, the
> > > > > virtio-net csum is disable too. That drops the forwarding performance.
> > > > >
> > > > > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > > > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > > > Cc: Jason Wang <jasowang@redhat.com>
> > > > > Cc: Willem de Bruijn <willemb@google.com>
> > > > > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > > > > ---
> > > > > v2:
> > > > > * change the fix-tag
> > > > > ---
> > > > >  drivers/net/virtio_net.c | 8 +++++++-
> > > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > > index 7145c83c6c8c..21b71148c532 100644
> > > > > --- a/drivers/net/virtio_net.c
> > > > > +++ b/drivers/net/virtio_net.c
> > > > > @@ -63,6 +63,11 @@ static const unsigned long guest_offloads[] = {
> > > > >       VIRTIO_NET_F_GUEST_CSUM
> > > > >  };
> > > > >
> > > > > +#define GUEST_OFFLOAD_LRO_MASK ((1ULL << VIRTIO_NET_F_GUEST_TSO4) | \
> > > > > +                             (1ULL << VIRTIO_NET_F_GUEST_TSO6) | \
> > > > > +                             (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> > > > > +                             (1ULL << VIRTIO_NET_F_GUEST_UFO))
> > > > > +
> > > >
> > > > I think I'd rather we open-coded this, the macro is only
> > > > used in one place ...
> > > Yes, in this patch, it is used only in one place. But in next patch
> > > [1], we use it twice and that make the code look a bit nicer.
> > > Would we open-coded this in this patch ?
> > >
> > > [1] - http://patchwork.ozlabs.org/project/netdev/patch/20200928033915.82810-2-xiangxia.m.yue@gmail.com/
> >
> > OK then maybe keep this in a series like you did with v1.
>
> If this is a fix it has to target net, unlike the other patch.
Hi Willem, Michael
The first patch v2 is for -net, can we apply it?
and second patch will be sent for -net-next after discussion ? That is ok?

-- 
Best regards, Tonghao
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
