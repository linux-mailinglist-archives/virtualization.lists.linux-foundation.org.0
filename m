Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9E1594ED4
	for <lists.virtualization@lfdr.de>; Tue, 16 Aug 2022 04:48:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70D7A608B7;
	Tue, 16 Aug 2022 02:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70D7A608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k67pHdUZSH4e; Tue, 16 Aug 2022 02:48:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id BD12660E3B;
	Tue, 16 Aug 2022 02:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD12660E3B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3F02C0078;
	Tue, 16 Aug 2022 02:48:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57340C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Aug 2022 02:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1E4A0403ED
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Aug 2022 02:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E4A0403ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFWt7vwfwhCI
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Aug 2022 02:48:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB7C9404AA
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB7C9404AA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Aug 2022 02:48:20 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R491e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0VMOLX7E_1660618094; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VMOLX7E_1660618094) by smtp.aliyun-inc.com;
 Tue, 16 Aug 2022 10:48:15 +0800
Message-ID: <1660617956.233549-1-xuanzhuo@linux.alibaba.com>
Subject: Re: upstream kernel crashes
Date: Tue, 16 Aug 2022 10:45:56 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20220815113729-mutt-send-email-mst@kernel.org>
 <20220815164503.jsoezxcm6q4u2b6j@awork3.anarazel.de>
 <20220815124748-mutt-send-email-mst@kernel.org>
 <20220815174617.z4chnftzcbv6frqr@awork3.anarazel.de>
 <20220815161423-mutt-send-email-mst@kernel.org>
 <20220815205330.m54g7vcs77r6owd6@awork3.anarazel.de>
 <20220815170444-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220815170444-mutt-send-email-mst@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Eric Dumazet <edumazet@google.com>, Andres Freund <andres@anarazel.de>,
 Greg KH <gregkh@linuxfoundation.org>, c@redhat.com,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>, Guenter Roeck <linux@roeck-us.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, 15 Aug 2022 17:32:06 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Mon, Aug 15, 2022 at 01:53:30PM -0700, Andres Freund wrote:
> > Hi,
> >
> > On 2022-08-15 16:21:51 -0400, Michael S. Tsirkin wrote:
> > > On Mon, Aug 15, 2022 at 10:46:17AM -0700, Andres Freund wrote:
> > > > Hi,
> > > >
> > > > On 2022-08-15 12:50:52 -0400, Michael S. Tsirkin wrote:
> > > > > On Mon, Aug 15, 2022 at 09:45:03AM -0700, Andres Freund wrote:
> > > > > > Hi,
> > > > > >
> > > > > > On 2022-08-15 11:40:59 -0400, Michael S. Tsirkin wrote:
> > > > > > > OK so this gives us a quick revert as a solution for now.
> > > > > > > Next, I would appreciate it if you just try this simple hack.
> > > > > > > If it crashes we either have a long standing problem in virtio
> > > > > > > code or more likely a gcp bug where it can't handle smaller
> > > > > > > rings than what device requestes.
> > > > > > > Thanks!
> > > > > >
> > > > > > I applied the below and the problem persists.
> > > > > >
> > > > > > [...]
> > > > >
> > > > > Okay!
> > > >
> > > > Just checking - I applied and tested this atop 6.0-rc1, correct? Or did you
> > > > want me to test it with the 762faee5a267 reverted? I guess what you're trying
> > > > to test if a smaller queue than what's requested you'd want to do so without
> > > > the problematic patch applied...
> > > >
> > > >
> > > > Either way, I did this, and there are no issues that I could observe. No
> > > > oopses, no broken networking. But:
> > > >
> > > > To make sure it does something I added a debugging printk - which doesn't show
> > > > up. I assume this is at a point at least earlyprintk should work (which I see
> > > > getting enabled via serial)?
> > > >
> >
> > > Sorry if I was unclear.  I wanted to know whether the change somehow
> > > exposes a driver bug or a GCP bug. So what I wanted to do is to test
> > > this patch on top of *5.19*, not on top of the revert.
> >
> > Right, the 5.19 part was clear, just the earlier test:
> >
> > > > > > On 2022-08-15 11:40:59 -0400, Michael S. Tsirkin wrote:
> > > > > > > OK so this gives us a quick revert as a solution for now.
> > > > > > > Next, I would appreciate it if you just try this simple hack.
> > > > > > > If it crashes we either have a long standing problem in virtio
> > > > > > > code or more likely a gcp bug where it can't handle smaller
> > > > > > > Thanks!
> >
> > I wasn't sure about.
> >
> > After I didn't see any effect on 5.19 + your patch, I grew a bit suspicious
> > and added the printks.
> >
> >
> > > Yes I think printk should work here.
> >
> > The reason the debug patch didn't change anything, and that my debug printk
> > didn't show, is that gcp uses the legacy paths...
>
> Wait a second. Eureka I think!
>
> So I think GCP is not broken.
> I think what's broken is this patch:
>
> commit cdb44806fca2d0ad29ca644cbf1505433902ee0c
> Author: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Date:   Mon Aug 1 14:38:54 2022 +0800
>
>     virtio_pci: support the arg sizes of find_vqs()
>
>
> Specifically:
>
> diff --git a/drivers/virtio/virtio_pci_legacy.c b/drivers/virtio/virtio_pci_legacy.c
> index 2257f1b3d8ae..d75e5c4e637f 100644
> --- a/drivers/virtio/virtio_pci_legacy.c
> +++ b/drivers/virtio/virtio_pci_legacy.c
> @@ -112,6 +112,7 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
>                                   unsigned int index,
>                                   void (*callback)(struct virtqueue *vq),
>                                   const char *name,
> +                                 u32 size,
>                                   bool ctx,
>                                   u16 msix_vec)
>  {
> @@ -125,10 +126,13 @@ static struct virtqueue *setup_vq(struct virtio_pci_device *vp_dev,
>         if (!num || vp_legacy_get_queue_enable(&vp_dev->ldev, index))
>                 return ERR_PTR(-ENOENT);
>
> +       if (!size || size > num)
> +               size = num;
> +
>         info->msix_vector = msix_vec;
>
>         /* create the vring */
> -       vq = vring_create_virtqueue(index, num,
> +       vq = vring_create_virtqueue(index, size,
>                                     VIRTIO_PCI_VRING_ALIGN, &vp_dev->vdev,
>                                     true, false, ctx,
>                                     vp_notify, callback, name);
>
>
>
> So if you pass the size parameter for a legacy device it will
> try to make the ring smaller and that is not legal with
> legacy at all. But the driver treats legacy and modern
> the same, it allocates a smaller queue anyway.
>
>
> Lo and behold, I pass disable-modern=on to qemu and it happily
> corrupts memory exactly the same as GCP does.

Yes, I think you are right.

Thank you very much.

>
>
> So the new find_vqs API is actually completely broken, it can not work for
> legacy at all and for added fun there's no way to find out
> that it's legacy. Maybe we should interpret the patch
>
> So I think I will also revert
>
> 04ca0b0b16f11faf74fa92468dab51b8372586cd..fe3dc04e31aa51f91dc7f741a5f76cc4817eb5b4
>
>
>
>
>
>
>
> > If there were a bug in the legacy path, it'd explain why the problem only
> > shows on gcp, and not in other situations.
> >
> > I'll queue testing the legacy path with the equivalent change.
> >
> > - Andres
> >
> >
> > Greetings,
> >
> > Andres Freund
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
