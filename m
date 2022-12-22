Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACDC653BFF
	for <lists.virtualization@lfdr.de>; Thu, 22 Dec 2022 07:05:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E416A417D1;
	Thu, 22 Dec 2022 06:05:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E416A417D1
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YanMPPE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bw9aBZhyT3NA; Thu, 22 Dec 2022 06:05:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 711104030D;
	Thu, 22 Dec 2022 06:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 711104030D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5494C007C;
	Thu, 22 Dec 2022 06:05:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E724C0070
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48350417BE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48350417BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QK2K_Q5UU-Bh
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:05:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 582634179D
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 582634179D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 22 Dec 2022 06:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671689107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iq4cHvbMQpVcmBqe5fyUmrngiKVykMmjcTZb1s9VM+M=;
 b=YanMPPE2QLXM7rIzDNdjI3GTxdh3x63T4/rX6MOnP7AlCROCrM7dKmHc1mj1qoUJ8bFTr7
 5Rvxr4TqBwybHcpm7ZUthcyujQmpRXUW4rDE/fLCoHaZj24unDMH0yJcaoQrQcd/ay3bJ7
 81ZVELfsKAh8e3YJCFSEPsMDYJwuclc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-A0Z1sWhoPamSGCtY6shq7w-1; Thu, 22 Dec 2022 01:05:02 -0500
X-MC-Unique: A0Z1sWhoPamSGCtY6shq7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C82F38149BC;
 Thu, 22 Dec 2022 06:05:02 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-179.pek2.redhat.com
 [10.72.13.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC707112132C;
 Thu, 22 Dec 2022 06:04:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [RFC PATCH 4/4] virtio-net: sleep instead of busy waiting for cvq
 command
Date: Thu, 22 Dec 2022 14:04:27 +0800
Message-Id: <20221222060427.21626-5-jasowang@redhat.com>
In-Reply-To: <20221222060427.21626-1-jasowang@redhat.com>
References: <20221222060427.21626-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 edumazet@google.com, maxime.coquelin@redhat.com, kuba@kernel.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

We used to busy waiting on the cvq command this tends to be
problematic since:

1) CPU could wait for ever on a buggy/malicous device
2) There's no wait to terminate the process that triggers the cvq
   command

So this patch switch to use sleep with a timeout (1s) instead of busy
polling for the cvq command forever. This gives the scheduler a breath
and can let the process can respond to a signal.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 8225496ccb1e..69173049371f 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -405,6 +405,7 @@ static void disable_rx_mode_work(struct virtnet_info *vi)
 	vi->rx_mode_work_enabled = false;
 	spin_unlock_bh(&vi->rx_mode_lock);
 
+	virtqueue_wake_up(vi->cvq);
 	flush_work(&vi->rx_mode_work);
 }
 
@@ -1497,6 +1498,11 @@ static bool try_fill_recv(struct virtnet_info *vi, struct receive_queue *rq,
 	return !oom;
 }
 
+static void virtnet_cvq_done(struct virtqueue *cvq)
+{
+	virtqueue_wake_up(cvq);
+}
+
 static void skb_recv_done(struct virtqueue *rvq)
 {
 	struct virtnet_info *vi = rvq->vdev->priv;
@@ -2024,12 +2030,7 @@ static bool virtnet_send_command(struct virtnet_info *vi, u8 class, u8 cmd,
 	if (unlikely(!virtqueue_kick(vi->cvq)))
 		return vi->ctrl->status == VIRTIO_NET_OK;
 
-	/* Spin for a response, the kick causes an ioport write, trapping
-	 * into the hypervisor, so the request should be handled immediately.
-	 */
-	while (!virtqueue_get_buf(vi->cvq, &tmp) &&
-	       !virtqueue_is_broken(vi->cvq))
-		cpu_relax();
+	virtqueue_wait_for_used(vi->cvq, &tmp);
 
 	return vi->ctrl->status == VIRTIO_NET_OK;
 }
@@ -3524,7 +3525,7 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
 
 	/* Parameters for control virtqueue, if any */
 	if (vi->has_cvq) {
-		callbacks[total_vqs - 1] = NULL;
+		callbacks[total_vqs - 1] = virtnet_cvq_done;
 		names[total_vqs - 1] = "control";
 	}
 
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
