Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A68D76573F9
	for <lists.virtualization@lfdr.de>; Wed, 28 Dec 2022 09:34:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18DA460A69;
	Wed, 28 Dec 2022 08:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18DA460A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x9TsJHFa09iO; Wed, 28 Dec 2022 08:34:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B99D1607B4;
	Wed, 28 Dec 2022 08:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B99D1607B4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DF14CC0078;
	Wed, 28 Dec 2022 08:34:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A922C002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Dec 2022 08:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 409EA408BC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Dec 2022 08:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 409EA408BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id omm8QrE2mTbD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Dec 2022 08:33:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC112408BB
Received: from out30-42.freemail.mail.aliyun.com
 (out30-42.freemail.mail.aliyun.com [115.124.30.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC112408BB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 28 Dec 2022 08:33:55 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R111e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VYGgWNw_1672216430; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VYGgWNw_1672216430) by smtp.aliyun-inc.com;
 Wed, 28 Dec 2022 16:33:51 +0800
Message-ID: <1672216298.4455094-1-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH 4/4] virtio-net: sleep instead of busy waiting for cvq
 command
Date: Wed, 28 Dec 2022 16:31:38 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20221226074908.8154-1-jasowang@redhat.com>
 <20221226074908.8154-5-jasowang@redhat.com>
 <1672107557.0142956-1-xuanzhuo@linux.alibaba.com>
 <CACGkMEvzhAFj5HCmP--9DKfCAq_4wPNwsmmg4h0Sbv6ra0+DrQ@mail.gmail.com>
 <20221227014641-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221227014641-mutt-send-email-mst@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 edumazet@google.com, kuba@kernel.org, maxime.coquelin@redhat.com,
 pabeni@redhat.com, davem@davemloft.net
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

On Tue, 27 Dec 2022 01:58:22 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> On Tue, Dec 27, 2022 at 12:33:53PM +0800, Jason Wang wrote:
> > On Tue, Dec 27, 2022 at 10:25 AM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > >
> > > On Mon, 26 Dec 2022 15:49:08 +0800, Jason Wang <jasowang@redhat.com> wrote:
> > > > We used to busy waiting on the cvq command this tends to be
> > > > problematic since:
> > > >
> > > > 1) CPU could wait for ever on a buggy/malicous device
> > > > 2) There's no wait to terminate the process that triggers the cvq
> > > >    command
> > > >
> > > > So this patch switch to use virtqueue_wait_for_used() to sleep with a
> > > > timeout (1s) instead of busy polling for the cvq command forever. This
> > >
> > > I don't think that a fixed 1S is a good choice.
> >
> > Well, it could be tweaked to be a little bit longer.
> >
> > One way, as discussed, is to let the device advertise a timeout then
> > the driver can validate if it's valid and use that timeout. But it
> > needs extension to the spec.
>
> Controlling timeout from device is a good idea, e.g. hardware devices
> would benefit from a shorter timeout, hypervisor devices from a longer
> timeout or no timeout.

Yes. That is good.

Before introducing this feature, I personally like to use "wait", rather than
define a timeout.

Thanks.


>
> >
> > > Some of the DPUs are very
> > > lazy for cvq handle.
> >
> > Such design needs to be revisited, cvq (control path) should have a
> > better priority or QOS than datapath.
>
> Spec says nothing about this, so driver can't assume this either.
>
> > > In particular, we will also directly break the device.
> >
> > It's kind of hardening for malicious devices.
>
> ATM no amount of hardening can prevent a malicious hypervisor from
> blocking the guest. Recovering when a hardware device is broken would be
> nice but I think if we do bother then we should try harder to recover,
> such as by driving device reset.
>
>
> Also, does your patch break surprise removal? There's no callback
> in this case ATM.
>
> > >
> > > I think it is necessary to add a Virtio-Net parameter to allow users to define
> > > this timeout by themselves. Although I don't think this is a good way.
> >
> > Very hard and unfriendly to the end users.
> >
> > Thanks
> >
> > >
> > > Thanks.
> > >
> > >
> > > > gives the scheduler a breath and can let the process can respond to
> > > > asignal. If the device doesn't respond in the timeout, break the
> > > > device.
> > > >
> > > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > ---
> > > > Changes since V1:
> > > > - break the device when timeout
> > > > - get buffer manually since the virtio core check more_used() instead
> > > > ---
> > > >  drivers/net/virtio_net.c | 24 ++++++++++++++++--------
> > > >  1 file changed, 16 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > index efd9dd55828b..6a2ea64cfcb5 100644
> > > > --- a/drivers/net/virtio_net.c
> > > > +++ b/drivers/net/virtio_net.c
> > > > @@ -405,6 +405,7 @@ static void disable_rx_mode_work(struct virtnet_info *vi)
> > > >       vi->rx_mode_work_enabled = false;
> > > >       spin_unlock_bh(&vi->rx_mode_lock);
> > > >
> > > > +     virtqueue_wake_up(vi->cvq);
> > > >       flush_work(&vi->rx_mode_work);
> > > >  }
> > > >
> > > > @@ -1497,6 +1498,11 @@ static bool try_fill_recv(struct virtnet_info *vi, struct receive_queue *rq,
> > > >       return !oom;
> > > >  }
> > > >
> > > > +static void virtnet_cvq_done(struct virtqueue *cvq)
> > > > +{
> > > > +     virtqueue_wake_up(cvq);
> > > > +}
> > > > +
> > > >  static void skb_recv_done(struct virtqueue *rvq)
> > > >  {
> > > >       struct virtnet_info *vi = rvq->vdev->priv;
> > > > @@ -1984,6 +1990,8 @@ static int virtnet_tx_resize(struct virtnet_info *vi,
> > > >       return err;
> > > >  }
> > > >
> > > > +static int virtnet_close(struct net_device *dev);
> > > > +
> > > >  /*
> > > >   * Send command via the control virtqueue and check status.  Commands
> > > >   * supported by the hypervisor, as indicated by feature bits, should
> > > > @@ -2026,14 +2034,14 @@ static bool virtnet_send_command(struct virtnet_info *vi, u8 class, u8 cmd,
> > > >       if (unlikely(!virtqueue_kick(vi->cvq)))
> > > >               return vi->ctrl->status == VIRTIO_NET_OK;
> > > >
> > > > -     /* Spin for a response, the kick causes an ioport write, trapping
> > > > -      * into the hypervisor, so the request should be handled immediately.
> > > > -      */
> > > > -     while (!virtqueue_get_buf(vi->cvq, &tmp) &&
> > > > -            !virtqueue_is_broken(vi->cvq))
> > > > -             cpu_relax();
> > > > +     if (virtqueue_wait_for_used(vi->cvq)) {
> > > > +             virtqueue_get_buf(vi->cvq, &tmp);
> > > > +             return vi->ctrl->status == VIRTIO_NET_OK;
> > > > +     }
> > > >
> > > > -     return vi->ctrl->status == VIRTIO_NET_OK;
> > > > +     netdev_err(vi->dev, "CVQ command timeout, break the virtio device.");
> > > > +     virtio_break_device(vi->vdev);
> > > > +     return VIRTIO_NET_ERR;
> > > >  }
> > > >
> > > >  static int virtnet_set_mac_address(struct net_device *dev, void *p)
> > > > @@ -3526,7 +3534,7 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> > > >
> > > >       /* Parameters for control virtqueue, if any */
> > > >       if (vi->has_cvq) {
> > > > -             callbacks[total_vqs - 1] = NULL;
> > > > +             callbacks[total_vqs - 1] = virtnet_cvq_done;
> > > >               names[total_vqs - 1] = "control";
> > > >       }
> > > >
> > > > --
> > > > 2.25.1
> > > >
> > > > _______________________________________________
> > > > Virtualization mailing list
> > > > Virtualization@lists.linux-foundation.org
> > > > https://lists.linuxfoundation.org/mailman/listinfo/virtualization
> > >
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
