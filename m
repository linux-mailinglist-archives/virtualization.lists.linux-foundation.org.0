Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF4658953
	for <lists.virtualization@lfdr.de>; Thu, 29 Dec 2022 05:08:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2EFE60AC9;
	Thu, 29 Dec 2022 04:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2EFE60AC9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/blzro4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UDETaigJXrG; Thu, 29 Dec 2022 04:08:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 436FF60C31;
	Thu, 29 Dec 2022 04:08:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 436FF60C31
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79418C0071;
	Thu, 29 Dec 2022 04:08:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13FB6C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Dec 2022 04:08:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD7554035D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Dec 2022 04:08:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7554035D
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=b/blzro4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UK4NHn8wDK9u
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Dec 2022 04:08:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D640402EF
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3D640402EF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Dec 2022 04:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672286917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z01BL5bMB7RYnKPBfK6zlYcNUBcynjBlLSUbgL2WGro=;
 b=b/blzro4QJmDdDWWqoE2k55HEwftzuGUk92QmOu/OQ6L5QW2yzujfirr9wowYQo7Q8hbsj
 J+Y+9f7k4h9hHn67SjqukHI4vKVcFZmDsp0WfxUAgD1Xg1oJUV7LGCnr1SMcGIG/LPsx1F
 HWqbyaqfNZzZ1BVt8ZdxtmFi29kdV+M=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-R63JoSyFM9uay4YULfLogg-1; Wed, 28 Dec 2022 23:08:35 -0500
X-MC-Unique: R63JoSyFM9uay4YULfLogg-1
Received: by mail-oi1-f198.google.com with SMTP id
 bh17-20020a056808181100b003633ad83115so1828076oib.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Dec 2022 20:08:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z01BL5bMB7RYnKPBfK6zlYcNUBcynjBlLSUbgL2WGro=;
 b=cq3cmPqagLmPsEhl6kdjVlCIKbOde67SzcHI3A5BLOvzyAx55IFB73H/2XiJLagJgF
 kqpKLqzzS3Dy5lfIIreK4rf/NZRm5OpqcVjG7A9f1KTfumfeqxm3gnyHeSth+wKxeqbj
 UR/Mo4UFES6p59uP5lce32GATRDX0hsAJeCGSIFMomcXKzoFIdMBoBqj8jjs5MHkWYgN
 9ZWG9o5mm6Z9cGcorHX+qjSp1bwJrh7GL3PFke5AIH2d2LnBOM061gNcDZNAGaTKorz7
 G/yJyXg/+LLffyMF++k8z62Qo3pL5f/LCIb2hFpeNxSrNF0DbJHrfilHCD7lq1DfCyTz
 Moeg==
X-Gm-Message-State: AFqh2krdiJbJ1Sgwtpl3PMWhMmCqw7ZqrmOjhR/8gb7zZPp/Ba/8hVDq
 FvlmxW6aaqBpjWHlmdzJvqV6E+KmOUfBcMrSeQ0saY3UsWQHKysvikJGfHijLaF9/8STw/pRRmK
 Ki9WnM6P62QF/Ijm+/g3JpfIy8cTIE+WIm+KXBgT8LMFq6kM6f4MMN3l9VA==
X-Received: by 2002:aca:1111:0:b0:35e:7a42:7ab5 with SMTP id
 17-20020aca1111000000b0035e7a427ab5mr1448932oir.280.1672286914979; 
 Wed, 28 Dec 2022 20:08:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsaWRZQ5+rAi9IeH7lTkZNBcXDfCB7Tz7Djuos0QGbB53xwmMCkUmg6O5An4K+8oKuuMJPP718TvKimp/ofUBk=
X-Received: by 2002:aca:1111:0:b0:35e:7a42:7ab5 with SMTP id
 17-20020aca1111000000b0035e7a427ab5mr1448927oir.280.1672286914639; Wed, 28
 Dec 2022 20:08:34 -0800 (PST)
MIME-Version: 1.0
References: <20221226074908.8154-1-jasowang@redhat.com>
 <20221226074908.8154-5-jasowang@redhat.com>
 <1672107557.0142956-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvzhAFj5HCmP--9DKfCAq_4wPNwsmmg4h0Sbv6ra0+DrQ@mail.gmail.com>
 <20221227014641-mutt-send-email-mst@kernel.org>
 <1672216298.4455094-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEuADspVzge5Q8JdEQssjGg911CaT1u_NQ9s7i-7UMwkhg@mail.gmail.com>
 <1672279792.8628097-2-xuanzhuo@linux.alibaba.com>
 <CACGkMEsET7fKxuKu7NckZX5N8fs+AqZ-adwKFNixJRNNn09GRQ@mail.gmail.com>
 <1672285288.3368185-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1672285288.3368185-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 29 Dec 2022 12:08:23 +0800
Message-ID: <CACGkMEtp7ee_Tv21SZXh+a5Y6TsT31SUABECbOwRk=Hk3xRcWw@mail.gmail.com>
Subject: Re: [PATCH 4/4] virtio-net: sleep instead of busy waiting for cvq
 command
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, edumazet@google.com, kuba@kernel.org,
 maxime.coquelin@redhat.com, pabeni@redhat.com, davem@davemloft.net
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

On Thu, Dec 29, 2022 at 11:49 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> On Thu, 29 Dec 2022 11:22:13 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > On Thu, Dec 29, 2022 at 10:10 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > On Wed, 28 Dec 2022 19:41:13 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > On Wed, Dec 28, 2022 at 4:34 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > >
> > > > > On Tue, 27 Dec 2022 01:58:22 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > > > On Tue, Dec 27, 2022 at 12:33:53PM +0800, Jason Wang wrote:
> > > > > > > On Tue, Dec 27, 2022 at 10:25 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, 26 Dec 2022 15:49:08 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > > > > > > We used to busy waiting on the cvq command this tends to be
> > > > > > > > > problematic since:
> > > > > > > > >
> > > > > > > > > 1) CPU could wait for ever on a buggy/malicous device
> > > > > > > > > 2) There's no wait to terminate the process that triggers the cvq
> > > > > > > > >    command
> > > > > > > > >
> > > > > > > > > So this patch switch to use virtqueue_wait_for_used() to sleep with a
> > > > > > > > > timeout (1s) instead of busy polling for the cvq command forever. This
> > > > > > > >
> > > > > > > > I don't think that a fixed 1S is a good choice.
> > > > > > >
> > > > > > > Well, it could be tweaked to be a little bit longer.
> > > > > > >
> > > > > > > One way, as discussed, is to let the device advertise a timeout then
> > > > > > > the driver can validate if it's valid and use that timeout. But it
> > > > > > > needs extension to the spec.
> > > > > >
> > > > > > Controlling timeout from device is a good idea, e.g. hardware devices
> > > > > > would benefit from a shorter timeout, hypervisor devices from a longer
> > > > > > timeout or no timeout.
> > > > >
> > > > > Yes. That is good.
> > > > >
> > > > > Before introducing this feature, I personally like to use "wait", rather than
> > > > > define a timeout.
> > > >
> > > > Note that the driver still needs to validate what device advertises to
> > > > avoid infinite wait.
> > >
> > > Sorry, I didn't understand what you mean.
> >
> > I meant the interface needs to carefully designed to
> >
> > 1) avoid device to advertise a infinite (or very long) timeout
> > 2) driver need to have its own max timeout regardless what device advertises
>
>
> I see.
>
> As far as I know, different operations will take different time.
> For example, the queues are initialized one by one when performing
> VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET commands. If the number of queues is large, then
> this time will be very long.

I see. This is the case even for the software backends.

>
> So we should set different timeouts for different commands.

Probably but it would result in a very complex interface, the device
can just choose to advertise the maximum timeout of all the commands
in this case. As discussed, I think we can start a very long timeout.
Is 1 minutes sufficient in this case?

Thanks

>
> Thanks.
>
> >
> > Thanks
> >
> > >
> > > Thanks.
> > >
> > > >
> > > > Thanks
> > > >
> > > > >
> > > > > Thanks.
> > > > >
> > > > >
> > > > > >
> > > > > > >
> > > > > > > > Some of the DPUs are very
> > > > > > > > lazy for cvq handle.
> > > > > > >
> > > > > > > Such design needs to be revisited, cvq (control path) should have a
> > > > > > > better priority or QOS than datapath.
> > > > > >
> > > > > > Spec says nothing about this, so driver can't assume this either.
> > > > > >
> > > > > > > > In particular, we will also directly break the device.
> > > > > > >
> > > > > > > It's kind of hardening for malicious devices.
> > > > > >
> > > > > > ATM no amount of hardening can prevent a malicious hypervisor from
> > > > > > blocking the guest. Recovering when a hardware device is broken would be
> > > > > > nice but I think if we do bother then we should try harder to recover,
> > > > > > such as by driving device reset.
> > > > > >
> > > > > >
> > > > > > Also, does your patch break surprise removal? There's no callback
> > > > > > in this case ATM.
> > > > > >
> > > > > > > >
> > > > > > > > I think it is necessary to add a Virtio-Net parameter to allow users to define
> > > > > > > > this timeout by themselves. Although I don't think this is a good way.
> > > > > > >
> > > > > > > Very hard and unfriendly to the end users.
> > > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > > >
> > > > > > > > Thanks.
> > > > > > > >
> > > > > > > >
> > > > > > > > > gives the scheduler a breath and can let the process can respond to
> > > > > > > > > asignal. If the device doesn't respond in the timeout, break the
> > > > > > > > > device.
> > > > > > > > >
> > > > > > > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > ---
> > > > > > > > > Changes since V1:
> > > > > > > > > - break the device when timeout
> > > > > > > > > - get buffer manually since the virtio core check more_used() instead
> > > > > > > > > ---
> > > > > > > > >  drivers/net/virtio_net.c | 24 ++++++++++++++++--------
> > > > > > > > >  1 file changed, 16 insertions(+), 8 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > > > > > > index efd9dd55828b..6a2ea64cfcb5 100644
> > > > > > > > > --- a/drivers/net/virtio_net.c
> > > > > > > > > +++ b/drivers/net/virtio_net.c
> > > > > > > > > @@ -405,6 +405,7 @@ static void disable_rx_mode_work(struct virtnet_info *vi)
> > > > > > > > >       vi->rx_mode_work_enabled = false;
> > > > > > > > >       spin_unlock_bh(&vi->rx_mode_lock);
> > > > > > > > >
> > > > > > > > > +     virtqueue_wake_up(vi->cvq);
> > > > > > > > >       flush_work(&vi->rx_mode_work);
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > @@ -1497,6 +1498,11 @@ static bool try_fill_recv(struct virtnet_info *vi, struct receive_queue *rq,
> > > > > > > > >       return !oom;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +static void virtnet_cvq_done(struct virtqueue *cvq)
> > > > > > > > > +{
> > > > > > > > > +     virtqueue_wake_up(cvq);
> > > > > > > > > +}
> > > > > > > > > +
> > > > > > > > >  static void skb_recv_done(struct virtqueue *rvq)
> > > > > > > > >  {
> > > > > > > > >       struct virtnet_info *vi = rvq->vdev->priv;
> > > > > > > > > @@ -1984,6 +1990,8 @@ static int virtnet_tx_resize(struct virtnet_info *vi,
> > > > > > > > >       return err;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > > +static int virtnet_close(struct net_device *dev);
> > > > > > > > > +
> > > > > > > > >  /*
> > > > > > > > >   * Send command via the control virtqueue and check status.  Commands
> > > > > > > > >   * supported by the hypervisor, as indicated by feature bits, should
> > > > > > > > > @@ -2026,14 +2034,14 @@ static bool virtnet_send_command(struct virtnet_info *vi, u8 class, u8 cmd,
> > > > > > > > >       if (unlikely(!virtqueue_kick(vi->cvq)))
> > > > > > > > >               return vi->ctrl->status == VIRTIO_NET_OK;
> > > > > > > > >
> > > > > > > > > -     /* Spin for a response, the kick causes an ioport write, trapping
> > > > > > > > > -      * into the hypervisor, so the request should be handled immediately.
> > > > > > > > > -      */
> > > > > > > > > -     while (!virtqueue_get_buf(vi->cvq, &tmp) &&
> > > > > > > > > -            !virtqueue_is_broken(vi->cvq))
> > > > > > > > > -             cpu_relax();
> > > > > > > > > +     if (virtqueue_wait_for_used(vi->cvq)) {
> > > > > > > > > +             virtqueue_get_buf(vi->cvq, &tmp);
> > > > > > > > > +             return vi->ctrl->status == VIRTIO_NET_OK;
> > > > > > > > > +     }
> > > > > > > > >
> > > > > > > > > -     return vi->ctrl->status == VIRTIO_NET_OK;
> > > > > > > > > +     netdev_err(vi->dev, "CVQ command timeout, break the virtio device.");
> > > > > > > > > +     virtio_break_device(vi->vdev);
> > > > > > > > > +     return VIRTIO_NET_ERR;
> > > > > > > > >  }
> > > > > > > > >
> > > > > > > > >  static int virtnet_set_mac_address(struct net_device *dev, void *p)
> > > > > > > > > @@ -3526,7 +3534,7 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> > > > > > > > >
> > > > > > > > >       /* Parameters for control virtqueue, if any */
> > > > > > > > >       if (vi->has_cvq) {
> > > > > > > > > -             callbacks[total_vqs - 1] = NULL;
> > > > > > > > > +             callbacks[total_vqs - 1] = virtnet_cvq_done;
> > > > > > > > >               names[total_vqs - 1] = "control";
> > > > > > > > >       }
> > > > > > > > >
> > > > > > > > > --
> > > > > > > > > 2.25.1
> > > > > > > > >
> > > > > > > > > _______________________________________________
> > > > > > > > > Virtualization mailing list
> > > > > > > > > Virtualization@lists.linux-foundation.org
> > > > > > > > > https://lists.linuxfoundation.org/mailman/listinfo/virtualization
> > > > > > > >
> > > > > >
> > > > >
> > > >
> > >
> >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
