Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C9C4047B8
	for <lists.virtualization@lfdr.de>; Thu,  9 Sep 2021 11:28:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DCAB40564;
	Thu,  9 Sep 2021 09:28:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhuQwJCpHKnh; Thu,  9 Sep 2021 09:28:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A34BA40563;
	Thu,  9 Sep 2021 09:28:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C330C0022;
	Thu,  9 Sep 2021 09:28:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1C89EC000D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 044CE40563
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:28:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A70BneWtanuv
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:28:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52F9040185
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Sep 2021 09:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631179720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7MPTrkICD3dS44O34dSkNV5ikqasNKbp3eO9uY/CQQ=;
 b=fE9tS3WrbBpAr2AccDZV/eBWI2x0RZFrKHJZaJH5q4y7TO9N2170EH8n6VIMDQQg0k5DZ8
 Cef8BxVVnlTPikbZKvBktFLW2p30mYPUIxu3TbjrSy/5/93RVrZGprj7pSolM9uJJ3mTRq
 yiQr1F0G11cczxTjZS2opzKHibc8nhw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-aNxvDqChPmmXvDkWxk0uqA-1; Thu, 09 Sep 2021 05:28:38 -0400
X-MC-Unique: aNxvDqChPmmXvDkWxk0uqA-1
Received: by mail-lf1-f71.google.com with SMTP id
 p3-20020a0565121383b0290384997a48fcso470323lfa.21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Sep 2021 02:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E7MPTrkICD3dS44O34dSkNV5ikqasNKbp3eO9uY/CQQ=;
 b=K2T3fHUh57IHYm7/6d4VSaF5SvU2EV6XDDPJTVavLP74mag3nZo032/KszFlxqkOzJ
 GUDhrDxTHCv+QiDr/TTSk67O9suSS8liHLReOjD46JykgidaAtS/eSxCf6mxSPfFxlin
 Umk6bru4UtDRqh1JDvR+i/6whaE4iwD3KKvYGt3pBuJOyWOtJH8cl/PDcSCo7TXiw9vo
 NXtxJ+tH9i35h38UP1mD0sPT79rSq6CJsx3rA7sksJAHwwlX54o0wcbd+2+otkwgTQJ7
 tC3VJ0YUPna1Q5eXJTZ86t8u1yKXS4zwB06VKgPYkoODyMRHp3SNw5v4bRGYLKYA3oTo
 woKw==
X-Gm-Message-State: AOAM532fxLAdAmgzwQblMe3LWyccveIWn3wVIEb+jPD4FL9D21gkZ+yq
 c29HIaII3knFZ3uvavUkyxe83HA+fn/++NvIPslXcOSZfhAsUMuFF3Z6gmk+zVW6vf8qUwMubic
 N9EeIvPMEvdxVMW9fg0IhaVgiUlMKXq3SQHVBOgr0WrCgtxADAYCyxexO5w==
X-Received: by 2002:a2e:7018:: with SMTP id l24mr1461012ljc.277.1631179717365; 
 Thu, 09 Sep 2021 02:28:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLAOA1/iZcBisp3OLHAaKuMI0vEZbcNqkyc6keR8qfvNJe7AcgB6OhwNXQTHhZBv1eG9RSF60gT08XaJ8Bxf4=
X-Received: by 2002:a2e:7018:: with SMTP id l24mr1460994ljc.277.1631179717047; 
 Thu, 09 Sep 2021 02:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631101392.git.wuzongyong@linux.alibaba.com>
 <ebd83066e3897aae63e4b02f8729a73dd09931c6.1631101392.git.wuzongyong@linux.alibaba.com>
 <CACGkMEtAZg+Nkx_1WJAP2=xQ6o6G9Vd=xYvFmR6YRp8vBg2Tqg@mail.gmail.com>
 <20210909080157.GA17383@L-PF27918B-1352.localdomain>
In-Reply-To: <20210909080157.GA17383@L-PF27918B-1352.localdomain>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 9 Sep 2021 17:28:26 +0800
Message-ID: <CACGkMEsnp7-axbZWuB_w7ZkSWKa0Y+Ej-Kq0QSfO2-DNN=ShVA@mail.gmail.com>
Subject: Re: [PATCH 5/6] vdpa: add get_vq_num_unchangeable callback in
 vdpa_config_ops
To: Wu Zongyong <wuzongyong@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: wei.yang1@linux.alibaba.com, mst <mst@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>
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

On Thu, Sep 9, 2021 at 4:02 PM Wu Zongyong <wuzongyong@linux.alibaba.com> wrote:
>
> On Thu, Sep 09, 2021 at 10:55:03AM +0800, Jason Wang wrote:
> > On Wed, Sep 8, 2021 at 8:23 PM Wu Zongyong <wuzongyong@linux.alibaba.com> wrote:
> > >
> > > This new callback is used to indicate whether the vring size can be
> > > change or not. It is useful when we have a legacy virtio pci device as
> > > the vdpa device for there is no way to negotiate the vring num by the
> > > specification.
> >
> > So I'm not sure it's worth bothering. E.g what if we just fail
> > VHOST_SET_VRING_NUM it the value doesn't match what hardware has?
> >
> > Thanks
> >
> I think we should not call VHOST_SET_VRING_NUM in that case.
>
> If the hardware reports that the virtqueue size cannot be changed, we
> should call VHOST_GET_VRING_NUM to get the static virtqueue size
> firstly, then allocate the same size memory for the virtqueues and write
> the address to hardware finally.
>
> For QEMU, we will ignore the properties rx/tx_queue_size and just get it
> from the hardware if this new callback return true.

This will break live migration. My understanding is that we can
advertise those capability/limitation via the netlink management
protocol then management layer can choose to use the correct queue
size.

Thanks

>
> What do you think?
> > >
> > > Signed-off-by: Wu Zongyong <wuzongyong@linux.alibaba.com>
> > > ---
> > >  drivers/vhost/vdpa.c         | 19 +++++++++++++++++++
> > >  drivers/virtio/virtio_vdpa.c |  5 ++++-
> > >  include/linux/vdpa.h         |  4 ++++
> > >  include/uapi/linux/vhost.h   |  2 ++
> > >  4 files changed, 29 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> > > index 9479f7f79217..2204d27d1e5d 100644
> > > --- a/drivers/vhost/vdpa.c
> > > +++ b/drivers/vhost/vdpa.c
> > > @@ -350,6 +350,22 @@ static long vhost_vdpa_get_iova_range(struct vhost_vdpa *v, u32 __user *argp)
> > >         return 0;
> > >  }
> > >
> > > +static long vhost_vdpa_get_vring_num_unchangeable(struct vhost_vdpa *v,
> > > +                                                 u32 __user *argp)
> > > +{
> > > +       struct vdpa_device *vdpa = v->vdpa;
> > > +       const struct vdpa_config_ops *ops = vdpa->config;
> > > +       bool unchangeable = false;
> > > +
> > > +       if (ops->get_vq_num_unchangeable)
> > > +               unchangeable = ops->get_vq_num_unchangeable(vdpa);
> > > +
> > > +       if (copy_to_user(argp, &unchangeable, sizeof(unchangeable)))
> > > +               return -EFAULT;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >  static long vhost_vdpa_vring_ioctl(struct vhost_vdpa *v, unsigned int cmd,
> > >                                    void __user *argp)
> > >  {
> > > @@ -487,6 +503,9 @@ static long vhost_vdpa_unlocked_ioctl(struct file *filep,
> > >         case VHOST_VDPA_GET_IOVA_RANGE:
> > >                 r = vhost_vdpa_get_iova_range(v, argp);
> > >                 break;
> > > +       case VHOST_VDPA_GET_VRING_NUM_UNCHANGEABLE:
> > > +               r = vhost_vdpa_get_vring_num_unchangeable(v, argp);
> > > +               break;
> > >         default:
> > >                 r = vhost_dev_ioctl(&v->vdev, cmd, argp);
> > >                 if (r == -ENOIOCTLCMD)
> > > diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> > > index 72eaef2caeb1..afb47465307a 100644
> > > --- a/drivers/virtio/virtio_vdpa.c
> > > +++ b/drivers/virtio/virtio_vdpa.c
> > > @@ -146,6 +146,7 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
> > >         struct vdpa_vq_state state = {0};
> > >         unsigned long flags;
> > >         u32 align, num;
> > > +       bool may_reduce_num = true;
> > >         int err;
> > >
> > >         if (!name)
> > > @@ -171,8 +172,10 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
> > >
> > >         /* Create the vring */
> > >         align = ops->get_vq_align(vdpa);
> > > +       if (ops->get_vq_num_unchangeable)
> > > +               may_reduce_num = !ops->get_vq_num_unchangeable(vdpa);
> > >         vq = vring_create_virtqueue(index, num, align, vdev,
> > > -                                   true, true, ctx,
> > > +                                   true, may_reduce_num, ctx,
> > >                                     virtio_vdpa_notify, callback, name);
> > >         if (!vq) {
> > >                 err = -ENOMEM;
> > > diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
> > > index 35648c11e312..f809b7ada00d 100644
> > > --- a/include/linux/vdpa.h
> > > +++ b/include/linux/vdpa.h
> > > @@ -195,6 +195,9 @@ struct vdpa_iova_range {
> > >   *                             @vdev: vdpa device
> > >   *                             Returns the iova range supported by
> > >   *                             the device.
> > > + * @get_vq_num_unchangeable    Check if size of virtqueue is unchangeable (optional)
> > > + *                             @vdev: vdpa device
> > > + *                             Returns boolean: unchangeable (true) or not (false)
> > >   * @set_map:                   Set device memory mapping (optional)
> > >   *                             Needed for device that using device
> > >   *                             specific DMA translation (on-chip IOMMU)
> > > @@ -262,6 +265,7 @@ struct vdpa_config_ops {
> > >                            const void *buf, unsigned int len);
> > >         u32 (*get_generation)(struct vdpa_device *vdev);
> > >         struct vdpa_iova_range (*get_iova_range)(struct vdpa_device *vdev);
> > > +       bool (*get_vq_num_unchangeable)(struct vdpa_device *vdev);
> > >
> > >         /* DMA ops */
> > >         int (*set_map)(struct vdpa_device *vdev, struct vhost_iotlb *iotlb);
> > > diff --git a/include/uapi/linux/vhost.h b/include/uapi/linux/vhost.h
> > > index c998860d7bbc..184f1f7f8498 100644
> > > --- a/include/uapi/linux/vhost.h
> > > +++ b/include/uapi/linux/vhost.h
> > > @@ -150,4 +150,6 @@
> > >  /* Get the valid iova range */
> > >  #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
> > >                                              struct vhost_vdpa_iova_range)
> > > +/* Check if the vring size can be change */
> > > +#define VHOST_VDPA_GET_VRING_NUM_UNCHANGEABLE _IOR(VHOST_VIRTIO, 0X79, bool)
> > >  #endif
> > > --
> > > 2.31.1
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
