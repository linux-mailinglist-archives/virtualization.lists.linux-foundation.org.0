Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC9440C133
	for <lists.virtualization@lfdr.de>; Wed, 15 Sep 2021 10:07:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9B5E4011C;
	Wed, 15 Sep 2021 08:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E9PFC-1jh3UO; Wed, 15 Sep 2021 08:07:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4FB49401D9;
	Wed, 15 Sep 2021 08:07:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD1ECC000D;
	Wed, 15 Sep 2021 08:07:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11F85C000D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 08:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CEE140171
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 08:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NEo265MBbf78
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 08:07:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B9B6400EE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 08:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631693231;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=REa2ii1CgATX4qofCdJXzydjNOc3NGDdxA/mk8tbeG0=;
 b=LJcV7uOzTS9b9CNzXIY4W+CUvKhAii3pV3/SE3J0088OR3LQhZCmOEPsu/xZjuAh2+nV3j
 Ay2LlAH5ycRXol0sJkCUMeUhWsBI8juVlgUFBSl2ankI4Gfm7gzv5xgFlXgz50qKL2u2zm
 PVRkdn8kII1tsbAhBSwhg0tG6JIQJhQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-UoWa13m4PhqruXEazXebqA-1; Wed, 15 Sep 2021 04:07:10 -0400
X-MC-Unique: UoWa13m4PhqruXEazXebqA-1
Received: by mail-lj1-f199.google.com with SMTP id
 r16-20020a2eb610000000b001c78e82ce96so1118466ljn.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Sep 2021 01:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=REa2ii1CgATX4qofCdJXzydjNOc3NGDdxA/mk8tbeG0=;
 b=kyqTnUsEv0mlsUzkbafEnBE42nj6O0o0GO24YD3dOS9oXxeCkIO6F1KlGmZ5zXIrzD
 X8V3xFrF9MZG6Au8RICdpk6p93m0+J69Dd6r+IiSrf19CSajHgrhfuZBN0VcM2kWvjRV
 RXSvKTpTOsJWsv53YSeAzmM4jMt4OwM/wSGIYzitppAvzlu/heg2IkO6Oa/zGuBS3XCm
 mKmG9JLbo4msgeSTDaxm9Oe0xzqctVhYjn1YcyjWRxrNOLsoTv3Zop6/GPehwtb39uE0
 sNlqOQ/ATcqO6bMhGUDdyuZqK/2crLfu+9Tkie6odgSUfIE0l3XGMS5+Q7A3RS6JvRyZ
 EHtA==
X-Gm-Message-State: AOAM532Zok/bM/BoKZnjUbv0OuMofLp6MQRdcJsWineS7da6LmplWrVh
 DRq3qFbIE7h2gGAsvTMu13dWRSDKrsFFVf6ZxwGK1qX7OOv1aqyg/qlCnOtyMp0ERlm0UfdxISG
 8C43/y9Zx7/Utd5BtfQ8Ga4YV9XN/1r4DVbjIT+Xq9rBHNI9wn9ahjBPzYQ==
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr19055210ljj.217.1631693228417; 
 Wed, 15 Sep 2021 01:07:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/OTUaDJF8XN2oUz89CKGTmQEFX5ibNZhI74uDJYWh5xAbHguepl0KsOPKIoIoMojm7CM61bhf8Sgnfbc3LTc=
X-Received: by 2002:a2e:99d9:: with SMTP id l25mr19055189ljj.217.1631693228204; 
 Wed, 15 Sep 2021 01:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631101392.git.wuzongyong@linux.alibaba.com>
 <cover.1631621507.git.wuzongyong@linux.alibaba.com>
 <834528d24c839080215b2e077f100e9ed5073edc.1631621507.git.wuzongyong@linux.alibaba.com>
 <20210914085711-mutt-send-email-mst@kernel.org>
 <CACGkMEu3RUGpe74Vh-FAZD3MwOC3gqU0OEf8A1ULvq7GSMm6Jg@mail.gmail.com>
 <20210915033756-mutt-send-email-mst@kernel.org>
In-Reply-To: <20210915033756-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 15 Sep 2021 16:06:57 +0800
Message-ID: <CACGkMEtN0Z=rgMhaWNO=6h-KXGdosBuOdqoWoND-=Tf+afyUYw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] vdpa: add new vdpa attribute
 VDPA_ATTR_DEV_F_VERSION_1
To: "Michael S. Tsirkin" <mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: wei.yang1@linux.alibaba.com, Wu Zongyong <wuzongyong@linux.alibaba.com>,
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

On Wed, Sep 15, 2021 at 3:38 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Sep 15, 2021 at 11:18:06AM +0800, Jason Wang wrote:
> > On Tue, Sep 14, 2021 at 8:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Tue, Sep 14, 2021 at 08:24:51PM +0800, Wu Zongyong wrote:
> > > > This new attribute advertises whether the vdpa device is legacy or not.
> > > > Users can pick right virtqueue size if the vdpa device is legacy which
> > > > doesn't support to change virtqueue size.
> > > >
> > > > Signed-off-by: Wu Zongyong <wuzongyong@linux.alibaba.com>
> > >
> > > So if we are bothering with legacy,
> >
> > I think we'd better not. I guess the following may work:
> >
> > 1) disable the driver on BE host
> > 2) present VERSION_1 with ACCESS_PLATFORM in get_features()
> > 3) extend the management to advertise max_queue_size and
> > min_queue_size, for ENI they are the same so management layer knows it
> > needs to set the queue_size correctly during launching qemu
> >
> > Thoughts?
> >
> > Thanks
>
> There are other subtle differences such as header size without
> mergeable buffers for net.

This can be solved by mandating the feature of a mergeable buffer?

Thanks

>
>
> > > I think there are
> > > several things to do when building the interface
> > > - support transitional devices, that is allow userspace
> > >   to tell device it's in legacy mode
> > > - support reporting/setting supporting endian-ness
> > >
> > > > ---
> > > >  drivers/vdpa/vdpa.c          | 6 ++++++
> > > >  drivers/virtio/virtio_vdpa.c | 7 ++++++-
> > > >  include/uapi/linux/vdpa.h    | 1 +
> > > >  3 files changed, 13 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/vdpa/vdpa.c b/drivers/vdpa/vdpa.c
> > > > index 1dc121a07a93..533d7f589eee 100644
> > > > --- a/drivers/vdpa/vdpa.c
> > > > +++ b/drivers/vdpa/vdpa.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include <linux/slab.h>
> > > >  #include <linux/vdpa.h>
> > > >  #include <uapi/linux/vdpa.h>
> > > > +#include <uapi/linux/virtio_config.h>
> > > >  #include <net/genetlink.h>
> > > >  #include <linux/mod_devicetable.h>
> > > >
> > > > @@ -494,6 +495,7 @@ vdpa_dev_fill(struct vdpa_device *vdev, struct sk_buff *msg, u32 portid, u32 seq
> > > >       u16 max_vq_size;
> > > >       u32 device_id;
> > > >       u32 vendor_id;
> > > > +     u64 features;
> > > >       void *hdr;
> > > >       int err;
> > > >
> > > > @@ -508,6 +510,7 @@ vdpa_dev_fill(struct vdpa_device *vdev, struct sk_buff *msg, u32 portid, u32 seq
> > > >       device_id = vdev->config->get_device_id(vdev);
> > > >       vendor_id = vdev->config->get_vendor_id(vdev);
> > > >       max_vq_size = vdev->config->get_vq_num_max(vdev);
> > > > +     features = vdev->config->get_features(vdev);
> > > >
> > > >       err = -EMSGSIZE;
> > > >       if (nla_put_string(msg, VDPA_ATTR_DEV_NAME, dev_name(&vdev->dev)))
> > > > @@ -520,6 +523,9 @@ vdpa_dev_fill(struct vdpa_device *vdev, struct sk_buff *msg, u32 portid, u32 seq
> > > >               goto msg_err;
> > > >       if (nla_put_u16(msg, VDPA_ATTR_DEV_MAX_VQ_SIZE, max_vq_size))
> > > >               goto msg_err;
> > > > +     if (features & BIT_ULL(VIRTIO_F_VERSION_1) &&
> > > > +         nla_put_flag(msg, VDPA_ATTR_DEV_VERSION_1))
> > > > +             goto msg_err;
> > > >
> > > >       genlmsg_end(msg, hdr);
> > > >       return 0;
> > > > diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
> > > > index 72eaef2caeb1..1cba957c4cdc 100644
> > > > --- a/drivers/virtio/virtio_vdpa.c
> > > > +++ b/drivers/virtio/virtio_vdpa.c
> > > > @@ -7,6 +7,7 @@
> > > >   *
> > > >   */
> > > >
> > > > +#include "linux/virtio_config.h"
> > > >  #include <linux/init.h>
> > > >  #include <linux/module.h>
> > > >  #include <linux/device.h>
> > > > @@ -145,6 +146,7 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
> > > >       /* Assume split virtqueue, switch to packed if necessary */
> > > >       struct vdpa_vq_state state = {0};
> > > >       unsigned long flags;
> > > > +     bool may_reduce_num = false;
> > > >       u32 align, num;
> > > >       int err;
> > > >
> > > > @@ -169,10 +171,13 @@ virtio_vdpa_setup_vq(struct virtio_device *vdev, unsigned int index,
> > > >               goto error_new_virtqueue;
> > > >       }
> > > >
> > > > +     if (ops->get_features(vdpa) & BIT_ULL(VIRTIO_F_VERSION_1))
> > > > +             may_reduce_num = true;
> > > > +
> > > >       /* Create the vring */
> > > >       align = ops->get_vq_align(vdpa);
> > > >       vq = vring_create_virtqueue(index, num, align, vdev,
> > > > -                                 true, true, ctx,
> > > > +                                 true, may_reduce_num, ctx,
> > > >                                   virtio_vdpa_notify, callback, name);
> > > >       if (!vq) {
> > > >               err = -ENOMEM;
> > > > diff --git a/include/uapi/linux/vdpa.h b/include/uapi/linux/vdpa.h
> > > > index 66a41e4ec163..ce0b74276a5b 100644
> > > > --- a/include/uapi/linux/vdpa.h
> > > > +++ b/include/uapi/linux/vdpa.h
> > > > @@ -32,6 +32,7 @@ enum vdpa_attr {
> > > >       VDPA_ATTR_DEV_VENDOR_ID,                /* u32 */
> > > >       VDPA_ATTR_DEV_MAX_VQS,                  /* u32 */
> > > >       VDPA_ATTR_DEV_MAX_VQ_SIZE,              /* u16 */
> > > > +     VDPA_ATTR_DEV_VERSION_1,                /* flag */
> > > >
> > > >       /* new attributes must be added above here */
> > > >       VDPA_ATTR_MAX,
> > > > --
> > > > 2.31.1
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
