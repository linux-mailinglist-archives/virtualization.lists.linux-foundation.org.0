Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C09564E26
	for <lists.virtualization@lfdr.de>; Mon,  4 Jul 2022 09:03:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 958A981CA7;
	Mon,  4 Jul 2022 07:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 958A981CA7
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYYgvlAJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wweuGBlRvqdB; Mon,  4 Jul 2022 07:03:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E9F2582456;
	Mon,  4 Jul 2022 07:03:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F2582456
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39A17C007C;
	Mon,  4 Jul 2022 07:03:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FDD8C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 07:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A01640112
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 07:03:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A01640112
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYYgvlAJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y75V3Kxu5GKu
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 07:03:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ECA2400F6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ECA2400F6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 Jul 2022 07:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656918195;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbMjjAZXWJpAVIpo7B4exIkMNlsj/klWOact/FA3tfw=;
 b=TYYgvlAJgd41Enya8aHRjuN3yNufc56+uTZb5p1bgdme5amP5Uz/HOG8ggTJcMX6zRL/Ac
 9EQyqU++XJ+p9j4xH7wNonQyNik/XYpsckgZAIm7FXRpG8j3jPc7jSB1imVdggW6S2nobP
 YfcRkayIRFAB6fSEV91/b/MjCWOiHkw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329--mtq31yXMNyzCVi39Y0ELA-1; Mon, 04 Jul 2022 03:03:14 -0400
X-MC-Unique: -mtq31yXMNyzCVi39Y0ELA-1
Received: by mail-ej1-f70.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso1666807ejj.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 04 Jul 2022 00:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dbMjjAZXWJpAVIpo7B4exIkMNlsj/klWOact/FA3tfw=;
 b=3962efRY8qTZlwcAXFA/Cpibt3+/NG3dDwH9T1fEBO/YrCWl0sbzOasEJa3A9u+Yw8
 T6a7x2hVBU4KWDUwmfl42W3pys7+J1nZ2h3rZJkIy6krqI5bkH42JkkinvPl7wTQyR56
 lWOnaQmh8y7BaL6wehb6h5Hg+2BPqEOFiUiJ8XfC6HCj9asGvt/LyIgNCML1PYSGrPgr
 hu/oG8SXeticXdhWKyo20fOPVRoyvqtoxzcsPR4D/xWmCr7+OVRMl71KhTMpW3HBr6Yq
 aX2vgKUj6XcI1pSKatpMDdYOiEPvXczHrlgoCjsijtPu0jvPqD4PbC2M857Yy1rmroEp
 SnEw==
X-Gm-Message-State: AJIora9Im4fN2IPHGuE5mc5KZrw3wLvrnpkZ7Oq5e1EuRFVYtquQqGCQ
 MFtV+p5s+diuNa5Jca6jqinYBBGXUR6mNfL5mNp4XPTzY/Y0jL/bCG+QS86opRkVElrmIp4CzLH
 hDqGyvq2J9XnbHDOijUQqAo6uH9pk2t94sbCKtB4iww==
X-Received: by 2002:a17:906:cc47:b0:72a:95bf:2749 with SMTP id
 mm7-20020a170906cc4700b0072a95bf2749mr13345725ejb.204.1656918193215; 
 Mon, 04 Jul 2022 00:03:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uFUbcMqG+3NKA/v47zZ900Hz/GxevZvwo2m/XCrH9k9CLGuwfFOxSS6CtmlxQvaIN3VxGa7Q==
X-Received: by 2002:a17:906:cc47:b0:72a:95bf:2749 with SMTP id
 mm7-20020a170906cc4700b0072a95bf2749mr13345706ejb.204.1656918192899; 
 Mon, 04 Jul 2022 00:03:12 -0700 (PDT)
Received: from redhat.com ([2.55.3.188]) by smtp.gmail.com with ESMTPSA id
 u6-20020a170906780600b006fef557bb7asm13791488ejm.80.2022.07.04.00.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jul 2022 00:03:12 -0700 (PDT)
Date: Mon, 4 Jul 2022 03:03:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net V4] virtio-net: fix the race between refill work and
 close
Message-ID: <20220704030124-mutt-send-email-mst@kernel.org>
References: <20220704041948.13212-1-jasowang@redhat.com>
 <20220704021656-mutt-send-email-mst@kernel.org>
 <CACGkMEsOy6kgaj+Q0vYxDBy7JEd=DUm7KLKo7AjGCi2ay5ciKQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsOy6kgaj+Q0vYxDBy7JEd=DUm7KLKo7AjGCi2ay5ciKQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev <netdev@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, davem <davem@davemloft.net>
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

On Mon, Jul 04, 2022 at 02:32:45PM +0800, Jason Wang wrote:
> On Mon, Jul 4, 2022 at 2:19 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Mon, Jul 04, 2022 at 12:19:48PM +0800, Jason Wang wrote:
> > > We try using cancel_delayed_work_sync() to prevent the work from
> > > enabling NAPI. This is insufficient since we don't disable the source
> > > of the refill work scheduling. This means an NAPI poll callback after
> > > cancel_delayed_work_sync() can schedule the refill work then can
> > > re-enable the NAPI that leads to use-after-free [1].
> > >
> > > Since the work can enable NAPI, we can't simply disable NAPI before
> > > calling cancel_delayed_work_sync(). So fix this by introducing a
> > > dedicated boolean to control whether or not the work could be
> > > scheduled from NAPI.
> > >
> > > [1]
> > > ==================================================================
> > > BUG: KASAN: use-after-free in refill_work+0x43/0xd4
> > > Read of size 2 at addr ffff88810562c92e by task kworker/2:1/42
> > >
> > > CPU: 2 PID: 42 Comm: kworker/2:1 Not tainted 5.19.0-rc1+ #480
> > > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.qemu.org 04/01/2014
> > > Workqueue: events refill_work
> > > Call Trace:
> > >  <TASK>
> > >  dump_stack_lvl+0x34/0x44
> > >  print_report.cold+0xbb/0x6ac
> > >  ? _printk+0xad/0xde
> > >  ? refill_work+0x43/0xd4
> > >  kasan_report+0xa8/0x130
> > >  ? refill_work+0x43/0xd4
> > >  refill_work+0x43/0xd4
> > >  process_one_work+0x43d/0x780
> > >  worker_thread+0x2a0/0x6f0
> > >  ? process_one_work+0x780/0x780
> > >  kthread+0x167/0x1a0
> > >  ? kthread_exit+0x50/0x50
> > >  ret_from_fork+0x22/0x30
> > >  </TASK>
> > > ...
> > >
> > > Fixes: b2baed69e605c ("virtio_net: set/cancel work on ndo_open/ndo_stop")
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > > Changes since V3:
> > > - rebase to -net
> > > Changes since V2:
> > > - use spin_unlock()/lock_bh() in open/stop to synchronize with bh
> > > Changes since V1:
> > > - Tweak the changelog
> > > ---
> > >  drivers/net/virtio_net.c | 35 +++++++++++++++++++++++++++++++++--
> > >  1 file changed, 33 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > index 356cf8dd4164..68430d7923ac 100644
> > > --- a/drivers/net/virtio_net.c
> > > +++ b/drivers/net/virtio_net.c
> > > @@ -251,6 +251,12 @@ struct virtnet_info {
> > >       /* Does the affinity hint is set for virtqueues? */
> > >       bool affinity_hint_set;
> > >
> > > +     /* Is refill work enabled? */
> >
> > refilling enabled
> 
> I think it should be reill work, we try refill first, if fail we
> schedule the work:
> 
>                 if (!try_fill_recv(vi, rq, GFP_ATOMIC))
>                         schedule_delayed_work(&vi->refill, 0);
> 
> Thanks

maybe "delayed refill"? It's not "work" it's a work struct.
I'm trying to be consistent with:
        /* Work struct for refilling if we run low on memory. */
        struct delayed_work refill;


> >
> > > +     bool refill_work_enabled;
> >
> >
> > refill_work -> refill?
> >
> > > +
> > > +     /* The lock to synchronize the access to refill_work_enabled */
> >
> > .. and refill
> >
> > And maybe put these field near the refill field.
> >
> > > +     spinlock_t refill_lock;
> > > +
> > >       /* CPU hotplug instances for online & dead */
> > >       struct hlist_node node;
> > >       struct hlist_node node_dead;
> > > @@ -348,6 +354,20 @@ static struct page *get_a_page(struct receive_queue *rq, gfp_t gfp_mask)
> > >       return p;
> > >  }
> > >
> > > +static void enable_refill_work(struct virtnet_info *vi)
> > > +{
> > > +     spin_lock_bh(&vi->refill_lock);
> > > +     vi->refill_work_enabled = true;
> > > +     spin_unlock_bh(&vi->refill_lock);
> > > +}
> > > +
> > > +static void disable_refill_work(struct virtnet_info *vi)
> > > +{
> > > +     spin_lock_bh(&vi->refill_lock);
> > > +     vi->refill_work_enabled = false;
> > > +     spin_unlock_bh(&vi->refill_lock);
> > > +}
> > > +
> > >  static void virtqueue_napi_schedule(struct napi_struct *napi,
> > >                                   struct virtqueue *vq)
> > >  {
> > > @@ -1527,8 +1547,12 @@ static int virtnet_receive(struct receive_queue *rq, int budget,
> > >       }
> > >
> > >       if (rq->vq->num_free > min((unsigned int)budget, virtqueue_get_vring_size(rq->vq)) / 2) {
> > > -             if (!try_fill_recv(vi, rq, GFP_ATOMIC))
> > > -                     schedule_delayed_work(&vi->refill, 0);
> > > +             if (!try_fill_recv(vi, rq, GFP_ATOMIC)) {
> > > +                     spin_lock(&vi->refill_lock);
> > > +                     if (vi->refill_work_enabled)
> > > +                             schedule_delayed_work(&vi->refill, 0);
> > > +                     spin_unlock(&vi->refill_lock);
> > > +             }
> > >       }
> > >
> > >       u64_stats_update_begin(&rq->stats.syncp);
> > > @@ -1651,6 +1675,8 @@ static int virtnet_open(struct net_device *dev)
> > >       struct virtnet_info *vi = netdev_priv(dev);
> > >       int i, err;
> > >
> > > +     enable_refill_work(vi);
> > > +
> > >       for (i = 0; i < vi->max_queue_pairs; i++) {
> > >               if (i < vi->curr_queue_pairs)
> > >                       /* Make sure we have some buffers: if oom use wq. */
> > > @@ -2033,6 +2059,8 @@ static int virtnet_close(struct net_device *dev)
> > >       struct virtnet_info *vi = netdev_priv(dev);
> > >       int i;
> > >
> > > +     /* Make sure NAPI doesn't schedule refill work */
> > > +     disable_refill_work(vi);
> > >       /* Make sure refill_work doesn't re-enable napi! */
> > >       cancel_delayed_work_sync(&vi->refill);
> > >
> > > @@ -2792,6 +2820,8 @@ static int virtnet_restore_up(struct virtio_device *vdev)
> > >
> > >       virtio_device_ready(vdev);
> > >
> > > +     enable_refill_work(vi);
> > > +
> > >       if (netif_running(vi->dev)) {
> > >               err = virtnet_open(vi->dev);
> > >               if (err)
> > > @@ -3535,6 +3565,7 @@ static int virtnet_probe(struct virtio_device *vdev)
> > >       vdev->priv = vi;
> > >
> > >       INIT_WORK(&vi->config_work, virtnet_config_changed_work);
> > > +     spin_lock_init(&vi->refill_lock);
> > >
> > >       /* If we can receive ANY GSO packets, we must allocate large ones. */
> > >       if (virtio_has_feature(vdev, VIRTIO_NET_F_GUEST_TSO4) ||
> > > --
> > > 2.25.1
> >

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
