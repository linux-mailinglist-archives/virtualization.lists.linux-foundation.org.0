Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id EB04C35D31F
	for <lists.virtualization@lfdr.de>; Tue, 13 Apr 2021 00:31:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BA8D83D9D;
	Mon, 12 Apr 2021 22:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dBIdZaTCV8IV; Mon, 12 Apr 2021 22:31:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B0883DAB;
	Mon, 12 Apr 2021 22:31:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCC8FC000A;
	Mon, 12 Apr 2021 22:31:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB7FFC000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 22:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A550404DB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 22:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qaoI5So8dL3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 22:31:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5DBA40298
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618266686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J26gMmbBw0UxvXXlKNhvMDXDyH8tUfV66Uq547e3Fuw=;
 b=MasAErvxMFBgoGquiQ+i4gnwKmWvOZLm5LOcSXZOXPgRZyPBehDlQ+5MjTr2jUVNu9HRnW
 JvsuWoiSSvELHjYAWVu41WQOapuUfnqRUg7I6tTc6PwvZ93qX5hQ9njL4/Wzdj1Tt0rTcD
 XPv7GCy+HXWoDQk4ho83yaqkqgqFSQc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-3qldmUqCMVqXNk2OIMqhyQ-1; Mon, 12 Apr 2021 18:31:24 -0400
X-MC-Unique: 3qldmUqCMVqXNk2OIMqhyQ-1
Received: by mail-wr1-f69.google.com with SMTP id m5so2359355wrr.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 15:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J26gMmbBw0UxvXXlKNhvMDXDyH8tUfV66Uq547e3Fuw=;
 b=CYc6/vOOpky+00o09zYpqIj2prVNSdQ9SYKZC/kWMRt/a1l56uTtRu40Yg1/kqOTia
 IuGF3yTTB2IOf2lKA0tmg52OJjvdH2xzHSB8zH19yL7AIeZOfI0ITXoy16ViUofEeJO9
 +a0szDfcXF6suxcq3n68sgp71oYzVlXkV0bRf8bB4Ore/wCUCCy3mLPEIP6O9at1Al8F
 2L1PQMbMOFylxA1IoU925B9dGt4NQn/sz0XRBcy1ePpwli2zpZPzOYpNmibsvEceSOe8
 dEAOqsMVzJmr46JL4XgHXWDvq02VRYbALeUh5TTPDmx1tXYk/oV2Q2u03Nm0k0K05IgB
 QDUg==
X-Gm-Message-State: AOAM5314MO8OcoygK74Vb518SkLBUZZjz/yHfumGK4QaQL7ObPdyePGf
 Lp6EVQujb08qglE7+StS2OWmNynWV9/kC+wmSPgdKv9ZBImNMDgk2YO89+Moq4WghK02ek5xAHq
 44OD9NCoovzz8zJhvUoUnFdHCIBrTFsHwhNjYeSnWDQ==
X-Received: by 2002:a05:600c:1887:: with SMTP id
 x7mr1130489wmp.21.1618266683670; 
 Mon, 12 Apr 2021 15:31:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLaPW/ypt30ANHAqIKkPHv7MN92DG0lww6f4SumgJIOxen7hKFhpjoE6sHxsnGApK/xLJdxA==
X-Received: by 2002:a05:600c:1887:: with SMTP id
 x7mr1130480wmp.21.1618266683467; 
 Mon, 12 Apr 2021 15:31:23 -0700 (PDT)
Received: from redhat.com ([2a10:8006:2281:0:1994:c627:9eac:1825])
 by smtp.gmail.com with ESMTPSA id z66sm639203wmc.4.2021.04.12.15.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 15:31:22 -0700 (PDT)
Date: Mon, 12 Apr 2021 18:31:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: virtio-net: locking in tx napi
Message-ID: <20210412183054-mutt-send-email-mst@kernel.org>
References: <20210412175341-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210412175341-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Willem de Bruijn <willemb@google.com>,
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

On Mon, Apr 12, 2021 at 06:03:50PM -0400, Michael S. Tsirkin wrote:
> I was working on the spurios interrupt problem and
> I noticed something weird.
> 
> static int virtnet_poll_tx(struct napi_struct *napi, int budget)
> {       
>         struct send_queue *sq = container_of(napi, struct send_queue, napi);
>         struct virtnet_info *vi = sq->vq->vdev->priv;
>         unsigned int index = vq2txq(sq->vq);
>         struct netdev_queue *txq;
> 
>         if (unlikely(is_xdp_raw_buffer_queue(vi, index))) {
>                 /* We don't need to enable cb for XDP */
>                 napi_complete_done(napi, 0);
>                 return 0;
>         }
> 
>         txq = netdev_get_tx_queue(vi->dev, index);
>         __netif_tx_lock(txq, raw_smp_processor_id());
>         free_old_xmit_skbs(sq, true);
>         __netif_tx_unlock(txq);
>         
>         virtqueue_napi_complete(napi, sq->vq, 0);
>         
>         if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS)
>                 netif_tx_wake_queue(txq);
>         
>         return 0;
> }       
> 
> So virtqueue_napi_complete is called when txq is not locked,
> thinkably start_xmit can happen right?
> 
> Now virtqueue_napi_complete
> 
> static void virtqueue_napi_complete(struct napi_struct *napi,
>                                     struct virtqueue *vq, int processed)
> {
>         int opaque;
> 
>         opaque = virtqueue_enable_cb_prepare(vq);
>         if (napi_complete_done(napi, processed)) {
>                 if (unlikely(virtqueue_poll(vq, opaque)))
>                         virtqueue_napi_schedule(napi, vq);
>         } else {
>                 virtqueue_disable_cb(vq);
>         }
> }
> 
> 
> So it is calling virtqueue_enable_cb_prepare but tx queue
> could be running and can process things in parallel ...
> What gives? I suspect this corrupts the ring, and explains
> why we are seeing weird hangs with vhost packed ring ...
> 
> Jason?
> 
> 
> -- 
> MST

and wouldn't the following untested patch make sense then?


diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 82e520d2cb12..c23341b18eb5 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1504,6 +1505,8 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	struct virtnet_info *vi = sq->vq->vdev->priv;
 	unsigned int index = vq2txq(sq->vq);
 	struct netdev_queue *txq;
+	int opaque;
+	bool done;
 
 	if (unlikely(is_xdp_raw_buffer_queue(vi, index))) {
 		/* We don't need to enable cb for XDP */
@@ -1514,9 +1517,26 @@ static int virtnet_poll_tx(struct napi_struct *napi, int budget)
 	txq = netdev_get_tx_queue(vi->dev, index);
 	__netif_tx_lock(txq, raw_smp_processor_id());
 	free_old_xmit_skbs(sq, true);
+
+	opaque = virtqueue_enable_cb_prepare(sq->vq);
+
+	done = napi_complete_done(napi, 0);
+
+	if (!done)
+		virtqueue_disable_cb(sq->vq);
+
 	__netif_tx_unlock(txq);
 
-	virtqueue_napi_complete(napi, sq->vq, 0);
+	if (done) {
+		if (unlikely(virtqueue_poll(vq, opaque))) {
+			if (napi_schedule_prep(napi)) {
+				__netif_tx_lock(txq, raw_smp_processor_id());
+				virtqueue_disable_cb(sq->vq);
+				__netif_tx_unlock(txq);
+				__napi_schedule(napi);
+			}
+		}
+	}
 
 	if (sq->vq->num_free >= 2 + MAX_SKB_FRAGS)
 		netif_tx_wake_queue(txq);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
