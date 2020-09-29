Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4B27BD86
	for <lists.virtualization@lfdr.de>; Tue, 29 Sep 2020 09:01:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 404CD20481;
	Tue, 29 Sep 2020 07:01:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dA9MEdG1Mfvt; Tue, 29 Sep 2020 07:01:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 357AF20507;
	Tue, 29 Sep 2020 07:01:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E9247C0051;
	Tue, 29 Sep 2020 07:01:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45640C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 28A37204FA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5V1PACd+rTv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:01:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by silver.osuosl.org (Postfix) with ESMTPS id D982920481
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 07:01:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id n22so5162753edt.4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Sep 2020 00:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6FpQU46O4XX7PspnZBfr4+krtVC3YDEqV8ZUznNkTjc=;
 b=ArrwmDOzWhdNaRIIKFZGLmvvV6ddxJx+/n+apInuYhOBMWokidaGcy6mfM75qIYZxv
 b3zGbovXJ4c9eXJu9zZTt9SqP5tSt4gX5UlvcNTzHjMHL2M1RJZ0iJ0RHoKrJfXdKemr
 HCO1R32v7BrUoJahWAaFOUwi3yq12tAMHzcl20evrO424qEBpHy3kKWMn74CALVma/mb
 cNyJrlEKtHjMZyvNDjn6mBUxKSpR2JqheO/FuG2ScROpboVzv3FvGVtf0tK9Jxa8pf6K
 a8Xo6wxFgPo06oEbKmrYNUxc0JLNmCnrDAOckI1fPG6/Rvwzv5gzb4As/oMmLljvGrGy
 Dk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6FpQU46O4XX7PspnZBfr4+krtVC3YDEqV8ZUznNkTjc=;
 b=XCGKeiKR7m3ahKky/h7ifyV+AqUzwFG9B+6+zYWAbrT8919C0ual6hFYz/2rTV+/9H
 jpZGXaiaXH7haW9cxgY2M1xiZvA5Y+FevTLfcyK4lD24EDB9lOO5j2cmYiddQWcKdQeX
 ovfRkr6KRwMMGpzt7qht2bcb/MppFlLqHQhWunYqUEHRc90N+EBVaCf4v4HxBlv3Brg1
 eh/AnzGl9wq0UHHZ/h4VX6zI500MK7waFUYBMEW/X65AGjICatXrg9Dehjl1HxDuSJRH
 NW9ur0tF6jbPFx4/vn45ogEcRSp9ebJ1BSF6hB0q454M9H70SLI3EF4J4fAuIdnkjjmq
 tHrw==
X-Gm-Message-State: AOAM532N6ZBm4Q3EITCvGaQ4Ev/sOq+kHygVQFQ4rQKha+xJIHKj6aej
 PK48xbuXV3d6ha6M+Q8vrNMhXQTrIaybuPqr/50=
X-Google-Smtp-Source: ABdhPJxqaoenk2GDSZXo79HFW8w9lqiOFaaEUGWp51velKCS1oFo9BKRf0EZoyxqGb7U74b/LTi+rTr4odyU7ckH5j4=
X-Received: by 2002:a05:6402:304f:: with SMTP id
 bu15mr1700728edb.201.1601362888358; 
 Tue, 29 Sep 2020 00:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200929015806.19171-1-xiangxia.m.yue@gmail.com>
 <20200929022246-mutt-send-email-mst@kernel.org>
In-Reply-To: <20200929022246-mutt-send-email-mst@kernel.org>
From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
Date: Tue, 29 Sep 2020 14:59:03 +0800
Message-ID: <CAMDZJNWM7eBkrYk9nkEvPyHW7=kt_hTHGQCDB1CPRz=EV6vJcQ@mail.gmail.com>
Subject: Re: [PATCH net v2] virtio-net: don't disable guest csum when disable
 LRO
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>,
 Willem de Bruijn <willemb@google.com>,
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

On Tue, Sep 29, 2020 at 2:23 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Sep 29, 2020 at 09:58:06AM +0800, xiangxia.m.yue@gmail.com wrote:
> > From: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> >
> > Open vSwitch and Linux bridge will disable LRO of the interface
> > when this interface added to them. Now when disable the LRO, the
> > virtio-net csum is disable too. That drops the forwarding performance.
> >
> > Fixes: a02e8964eaf9 ("virtio-net: ethtool configurable LRO")
> > Cc: Michael S. Tsirkin <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: Willem de Bruijn <willemb@google.com>
> > Signed-off-by: Tonghao Zhang <xiangxia.m.yue@gmail.com>
> > ---
> > v2:
> > * change the fix-tag
> > ---
> >  drivers/net/virtio_net.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > index 7145c83c6c8c..21b71148c532 100644
> > --- a/drivers/net/virtio_net.c
> > +++ b/drivers/net/virtio_net.c
> > @@ -63,6 +63,11 @@ static const unsigned long guest_offloads[] = {
> >       VIRTIO_NET_F_GUEST_CSUM
> >  };
> >
> > +#define GUEST_OFFLOAD_LRO_MASK ((1ULL << VIRTIO_NET_F_GUEST_TSO4) | \
> > +                             (1ULL << VIRTIO_NET_F_GUEST_TSO6) | \
> > +                             (1ULL << VIRTIO_NET_F_GUEST_ECN)  | \
> > +                             (1ULL << VIRTIO_NET_F_GUEST_UFO))
> > +
>
> I think I'd rather we open-coded this, the macro is only
> used in one place ...
Yes, in this patch, it is used only in one place. But in next patch
[1], we use it twice and that make the code look a bit nicer.
Would we open-coded this in this patch ?

[1] - http://patchwork.ozlabs.org/project/netdev/patch/20200928033915.82810-2-xiangxia.m.yue@gmail.com/

> >  struct virtnet_stat_desc {
> >       char desc[ETH_GSTRING_LEN];
> >       size_t offset;
> > @@ -2531,7 +2536,8 @@ static int virtnet_set_features(struct net_device *dev,
> >               if (features & NETIF_F_LRO)
> >                       offloads = vi->guest_offloads_capable;
> >               else
> > -                     offloads = 0;
> > +                     offloads = vi->guest_offloads_capable &
> > +                                ~GUEST_OFFLOAD_LRO_MASK;
> >
> >               err = virtnet_set_guest_offloads(vi, offloads);
> >               if (err)
>
> > --
> > 2.23.0
>


-- 
Best regards, Tonghao
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
