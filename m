Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id E207059803D
	for <lists.virtualization@lfdr.de>; Thu, 18 Aug 2022 10:40:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7557541BA5;
	Thu, 18 Aug 2022 08:40:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7557541BA5
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vh0CGT9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxxHkVQDKgrl; Thu, 18 Aug 2022 08:40:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E49C041B9B;
	Thu, 18 Aug 2022 08:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E49C041B9B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1313CC0078;
	Thu, 18 Aug 2022 08:40:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2E76CC002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7B0741B9B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7B0741B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RxNMDGc48s0h
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:40:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D20AB41B9A
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D20AB41B9A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660812038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BddMtzQ7YDB5LYS1LM7BFd04BQB1b9C2SmXxj1ub0tQ=;
 b=Vh0CGT9AzGQQ32mGhRRsRoeyRb9gElCGTzUARF+NHp/tU9h3/vzW/AUgaaXZjWvdqNnSi+
 7S+0OvKYbTnA4qi2ABYnVTZCDyAiv+RgmMzJ5vFHp0B9UGLIkaXZb1yz9/xQ04SiGythzL
 K+L1Svmhflrc4PbkRdk3bYzY4MyD+DQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-QX9nkUDOPIqDVNwZ2c4zJg-1; Thu, 18 Aug 2022 04:40:37 -0400
X-MC-Unique: QX9nkUDOPIqDVNwZ2c4zJg-1
Received: by mail-lj1-f197.google.com with SMTP id
 be32-20020a05651c172000b00261b5eae43eso68577ljb.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 18 Aug 2022 01:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=BddMtzQ7YDB5LYS1LM7BFd04BQB1b9C2SmXxj1ub0tQ=;
 b=j7+T2fHYf99psCDtQv3qkQ97vMrZ9hH78Dc6cm5gxGfT/C2F93MFFp5sYyV2ty//D9
 wAGr0tYi2y6VcoSkfZbfPJpfaxTknb3p28mTlBingSjuRlgUOFDvFhBUeQFUZTjS2iRp
 McUoxmU8buFamWdeYl7sUF1yfkgegG5kOXbz/S352kWHJ1KQy1P6bVOF8r8DroWz69sz
 NecLpy8nR+eFlw5OEO4ykttoCkIimfoToe5f7Ze9IcO3AMJnai/c7nw6YtnyS0NW3HQC
 HrDDmLfmefGHGuOceidgVR8nRHO5edpZqNXLbeyOlutzSFgNcg0xItNed8J4sjX+TbWx
 SDLw==
X-Gm-Message-State: ACgBeo0B8AW4CkPyyApP1nVu/bfiUzh2mQ4TaZEZihIr59WEbeSPeE6/
 7Wyg1wBhTt/ZnF6FIQ9iHH1tJgaq6DN4Ig1qbAHc4jv1tFzyFjC5bGwBAtnTH1lu9c0T5W4jJV5
 Tuyu+Z1c2+0l0Dqsbubl2wJgiNwjpxbLeeBniP0gnJ0tN9JQly7RnKGtWWQ==
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr572120ljq.496.1660812035795; 
 Thu, 18 Aug 2022 01:40:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5OlDy8T2pqnoAPqbbArF+E09iv1n3yHiaM2dVJpJEGsr69Ez7FJId0ZiKLXkmKbGAQYnzquMOSyYEQjbs0tr8=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr572116ljq.496.1660812035603; Thu, 18 Aug
 2022 01:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220818030404.128597-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvTPLf=Lg_43jSHFuq12xZdYP_c21tsot3ns7sP=Yreag@mail.gmail.com>
 <1660810363.7875404-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1660810363.7875404-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 18 Aug 2022 16:40:23 +0800
Message-ID: <CACGkMEsrjwQO=jkfZFzChh9aA_A=d41wHGYM05KQhiNyDtga7g@mail.gmail.com>
Subject: Re: [PATCH v2] virtio/virtio_pci_legacy: debug checking for queue size
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
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

On Thu, Aug 18, 2022 at 4:13 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> On Thu, 18 Aug 2022 16:10:45 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > On Thu, Aug 18, 2022 at 11:04 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > Legacy virtio pci has no way to communicate a change in vq size to
> > > the hypervisor. If ring sizes don't match hypervisor will happily
> > > corrupt memory.
> > >
> > > We add a check to vring size before calling
> > > vp_legacy_set_queue_address(). Checking the memory range directly is a
> > > bit cumbersome.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >
> > > v2: replace BUG_ON with WARN_ON_ONCE. @Linus
> > >
> > >  drivers/virtio/virtio_pci_legacy.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> > > index 2257f1b3d8ae..091e73d74e94 100644
> > > --- a/drivers/virtio/virtio_pci_legacy.c
> > > +++ b/drivers/virtio/virtio_pci_legacy.c
> > > @@ -146,6 +146,15 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
> > >                 goto out_del_vq;
> > >         }
> > >
> > > +       /* Legacy virtio pci has no way to communicate a change in vq size to
> > > +        * the hypervisor. If ring sizes don't match hypervisor will happily
> > > +        * corrupt memory.
> > > +        */
> > > +       if (WARN_ON_ONCE(num != virtqueue_get_vring_size(vq))) {
> > > +               err = -EPERM;
> > > +               goto out_del_vq;
> > > +       }
> >
> > I wonder if it's better to have a num_min instead.
>
>
> num_min?
>
> What is that?

minimux size of a virtqueue since we had:

      if (num > vq->vq.num_max)
              return -E2BIG;

in virtqueue_resize()

we can then simply add

     if (num < vq->vq.num_min)
              return -EINVAL;

etc?

Thanks

>
> Thanks.
>
> >
> > Thanks
> >
> > > +
> > >         /* activate the queue */
> > >         vp_legacy_set_queue_address(&vp_dev->ldev, index, q_pfn);
> > >
> > > --
> > > 2.31.0
> > >
> >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
