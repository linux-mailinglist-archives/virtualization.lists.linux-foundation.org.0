Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2470471884F
	for <lists.virtualization@lfdr.de>; Wed, 31 May 2023 19:18:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A32B54046B;
	Wed, 31 May 2023 17:18:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A32B54046B
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gootzen.net header.i=@gootzen.net header.a=rsa-sha256 header.s=aw2020113001 header.b=XeEQy4VF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zzsrKRfYdpJU; Wed, 31 May 2023 17:18:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 05C87400DC;
	Wed, 31 May 2023 17:18:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05C87400DC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CBC2C008C;
	Wed, 31 May 2023 17:18:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C912C0037
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 17:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A1B4818CD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 17:18:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A1B4818CD
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gootzen.net header.i=@gootzen.net
 header.a=rsa-sha256 header.s=aw2020113001 header.b=XeEQy4VF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fa7TP6BIU5sv
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 17:18:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9388C817A4
Received: from arg-plspam-c1n3.mailshover.nl (arg-plspam-c1n3.mailshover.nl
 [145.131.15.37])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9388C817A4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 17:18:44 +0000 (UTC)
Received: from gw.mailshover.nl ([2001:678:76c:1:3996::58]
 helo=arg-plsmtp-c1n2.argewebhosting.nl)
 by arg-plspam-c1n3.mailshover.nl with esmtp (Exim 4.92)
 (envelope-from <peter-jan@gootzen.net>)
 id 1q4PT5-00CZDC-6a; Wed, 31 May 2023 19:18:40 +0200
Received: from flex01.zurich.ibm.com (pat.zurich.ibm.com [195.176.20.45])
 (Authenticated sender: peter-jan@gootzen.net)
 by arg-plsmtp-c1n2.argewebhosting.nl (Postfix) with ESMTPA id 704CE2043332;
 Wed, 31 May 2023 19:18:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 arg-plsmtp-c1n2.argewebhosting.nl
 704CE2043332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gootzen.net;
 s=aw2020113001; t=1685553517;
 bh=3NhBml1y1HeW8d6Zo/t1vksqrDGirXMNvpuVtGeL17I=;
 h=From:To:Cc:Subject:Date:From;
 b=XeEQy4VFzFn9dNxcmUTEUwOvJJtXE0KKTegJo9P7uo1xGnPKPFmrpCxS9wVuLPn79
 sNebR6J1ZaReIBbf8UITFNOp8FARv2aNEpYrfD+Bp6illiOFN7OZEGbFaU1Os2CuvT
 u7JKScIE3lKy07ZZ8VWwLFnWkNKKI9GDx1gs9lnGVjFLc6HZ109bjevNNXc4a91F/s
 dVvO52DNJAIxGnQY9EJDC9r7kaPLvVKcKM8FfVi/kqpidvH9DyX6AL7ihgej4zvPzZ
 J9DY1yub90j2YjLeM6Q7aArqrSp5/gX3Dj4TleNiOvz3bPlqbLBr5seBPqgDu+s7EM
 yr8MUgw6OwDZA==
To: virtualization@lists.linux-foundation.org
Subject: [PATCH V2] virtio-fs: Improved request latencies when Virtio queue is
 full
Date: Wed, 31 May 2023 19:10:32 +0200
Message-Id: <20230531171031.1424338-1-peter-jan@gootzen.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: 2001:678:76c:1:3996::58
X-SpamExperts-Domain: out.mailshover.nl
X-SpamExperts-Username: 2001:678:76c:1:3996::58
Authentication-Results: mailshover.nl; auth=pass
 smtp.auth=2001:678:76c:1:3996::58@out.mailshover.nl
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.50)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT90jVzTLJt3vj6cAu5S4eQ0PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xzOoHxWscew68UvLJqW/V1opzyoDuAP4C0aaz3STa5zA+i
 +LgxjoYkXCbk6qYg3TLiBCq0YCJmjpNMbRTU3wgrC0Y3u/qphs34dTesYrpa6tiW8BKfyIS6EHTV
 hG8std+lEPHKAzuJoUDzV774tvkniFloh3x3CR4Jb2gWRrpPKFGnGIGoHztXsNmb3KziTcGouJYi
 QWxaMB85XLIGw32ggM1FjTV5UXzaWZFiY/IuWRLx/Du65BKz/oEcyvz1uhV1UWVvvdkzh9/Seh7h
 SLJU1ktV7ekmGpxaAJ/k28IIq/fPjylt/HZ8k1j7Ut/7PLZdmEMNeZsamptl2lSfYoV17Ogv5mRk
 S/8bWrZGatZmbSSp6wqBiWgCUvpQC7hp792Kjeyl92hTDJK+4O0vOmkQc1UkGqjsciyILerEw8FX
 FnC9J8Tfx0FDPUDJU5K58QZrH/iEgzfzmnMXBIwMoePog2OkM5zMbrn2rUwXJSugd8VmzzAQ6gJW
 hVbNViZCOWKRNtlfJySsZ2eS9qGTagUdlCnL4IjEaJi/Te03jgZkrrEp5+1QCuHCTUw0ggLUf54P
 bqpDL7OvFc18bWQRihVmn+UCB3F67PeP7Iep2w5lJ/gPneWh5kublaxZVQoA47wpOMQJvQ/Ck3ii
 U+4DQAj3DhYpgwxEDQuH7GNpv2Hu1lWbvKBSWz9JL+ncH+8owBXh81G7jrpdN7mVSzj08dE/spk/
 hCiWnhfUApZOb69D6yGlvdSbGn5mVFvXj2ZlcXuRq3oTg7MWD+ZQoaUmN03jRfRyWTWs40tiYHh/
 OVIkQNEvdUolNl0YNdMUajomuQYN/2oiLQnPnhxk6tgp0mibbPhjo3exrvNYlwUjtixib2avL+YD
 c2YHUzAZPzd03lfeLwwWMKXDYWRmRiEAGsmgMir4QqyEiQ820Rz+zAgdxlz1pRXWhjh9fdbl44I0
 Df3UANye5mij+Mqql8NZoGGE1H07YtaUHC2h22rHSV+m0L6jX0Is2t8eEL3ZqG06ZzoMifa29zXh
 hznXry6IqJnerLfiFNb0FFyRjT8NmcTq0ZsK3TexxWxyube0LJjGSj+jnQa75Jum1feMIVfUDmU/
 w0m9OyPDekvkd3BNWiTFSFOlxsY77ASAZB1sLAji3Opi4pBglvBqtTQxJduSkSzRv5CQHId5vY1x
 DTpc1F/nsvY4ocfmWv3Fe9Iziczdq+A=
X-Report-Abuse-To: spam@arg-plspam-c1n0.mailshover.nl
Cc: stefanha@redhat.com, vgoyal@redhat.com, miklos@szeredi.hu
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
From: Peter-Jan Gootzen via Virtualization
 <virtualization@lists.linux-foundation.org>
Reply-To: Peter-Jan Gootzen <peter-jan@gootzen.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

When the Virtio queue is full, a work item is scheduled
to execute in 1ms that retries adding the request to the queue.
This is a large amount of time on the scale on which a
virtio-fs device can operate. When using a DPU this is around
40us baseline without going to a remote server (4k, QD=1).
This patch queues requests when the Virtio queue is full,
and when a completed request is taken off, immediately fills
it back up with queued requests.

This reduces the 99.9th percentile latencies in our tests by
60x and slightly increases the overall throughput, when using a
queue depth 2x the size of the Virtio queue size, with a
DPU-powered virtio-fs device.

Signed-off-by: Peter-Jan Gootzen <peter-jan@gootzen.net>
---
V1 -> V2: Not scheduling dispatch work anymore when not needed
and changed delayed_work structs to work_struct structs

 fs/fuse/virtio_fs.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
index 4d8d4f16c727..a676297db09b 100644
--- a/fs/fuse/virtio_fs.c
+++ b/fs/fuse/virtio_fs.c
@@ -45,7 +45,7 @@ struct virtio_fs_vq {
 	struct work_struct done_work;
 	struct list_head queued_reqs;
 	struct list_head end_reqs;	/* End these requests */
-	struct delayed_work dispatch_work;
+	struct work_struct dispatch_work;
 	struct fuse_dev *fud;
 	bool connected;
 	long in_flight;
@@ -202,7 +202,7 @@ static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
 	}
 
 	flush_work(&fsvq->done_work);
-	flush_delayed_work(&fsvq->dispatch_work);
+	flush_work(&fsvq->dispatch_work);
 }
 
 static void virtio_fs_drain_all_queues_locked(struct virtio_fs *fs)
@@ -346,6 +346,9 @@ static void virtio_fs_hiprio_done_work(struct work_struct *work)
 			dec_in_flight_req(fsvq);
 		}
 	} while (!virtqueue_enable_cb(vq) && likely(!virtqueue_is_broken(vq)));
+
+	if (!list_empty(&fsvq->queued_reqs))
+		schedule_work(&fsvq->dispatch_work);
 	spin_unlock(&fsvq->lock);
 }
 
@@ -353,7 +356,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 {
 	struct fuse_req *req;
 	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
-						 dispatch_work.work);
+						 dispatch_work);
 	int ret;
 
 	pr_debug("virtio-fs: worker %s called.\n", __func__);
@@ -388,8 +391,6 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
 			if (ret == -ENOMEM || ret == -ENOSPC) {
 				spin_lock(&fsvq->lock);
 				list_add_tail(&req->list, &fsvq->queued_reqs);
-				schedule_delayed_work(&fsvq->dispatch_work,
-						      msecs_to_jiffies(1));
 				spin_unlock(&fsvq->lock);
 				return;
 			}
@@ -436,8 +437,6 @@ static int send_forget_request(struct virtio_fs_vq *fsvq,
 			pr_debug("virtio-fs: Could not queue FORGET: err=%d. Will try later\n",
 				 ret);
 			list_add_tail(&forget->list, &fsvq->queued_reqs);
-			schedule_delayed_work(&fsvq->dispatch_work,
-					      msecs_to_jiffies(1));
 			if (!in_flight)
 				inc_in_flight_req(fsvq);
 			/* Queue is full */
@@ -469,7 +468,7 @@ static void virtio_fs_hiprio_dispatch_work(struct work_struct *work)
 {
 	struct virtio_fs_forget *forget;
 	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
-						 dispatch_work.work);
+						 dispatch_work);
 	pr_debug("virtio-fs: worker %s called.\n", __func__);
 	while (1) {
 		spin_lock(&fsvq->lock);
@@ -647,6 +646,11 @@ static void virtio_fs_requests_done_work(struct work_struct *work)
 			virtio_fs_request_complete(req, fsvq);
 		}
 	}
+
+	spin_lock(&fsvq->lock);
+	if (!list_empty(&fsvq->queued_reqs))
+		schedule_work(&fsvq->dispatch_work);
+	spin_unlock(&fsvq->lock);
 }
 
 /* Virtqueue interrupt handler */
@@ -670,12 +674,12 @@ static void virtio_fs_init_vq(struct virtio_fs_vq *fsvq, char *name,
 
 	if (vq_type == VQ_REQUEST) {
 		INIT_WORK(&fsvq->done_work, virtio_fs_requests_done_work);
-		INIT_DELAYED_WORK(&fsvq->dispatch_work,
-				  virtio_fs_request_dispatch_work);
+		INIT_WORK(&fsvq->dispatch_work,
+			  virtio_fs_request_dispatch_work);
 	} else {
 		INIT_WORK(&fsvq->done_work, virtio_fs_hiprio_done_work);
-		INIT_DELAYED_WORK(&fsvq->dispatch_work,
-				  virtio_fs_hiprio_dispatch_work);
+		INIT_WORK(&fsvq->dispatch_work,
+			  virtio_fs_hiprio_dispatch_work);
 	}
 }
 
@@ -1254,8 +1258,6 @@ __releases(fiq->lock)
 			spin_lock(&fsvq->lock);
 			list_add_tail(&req->list, &fsvq->queued_reqs);
 			inc_in_flight_req(fsvq);
-			schedule_delayed_work(&fsvq->dispatch_work,
-						msecs_to_jiffies(1));
 			spin_unlock(&fsvq->lock);
 			return;
 		}
@@ -1265,7 +1267,7 @@ __releases(fiq->lock)
 		/* Can't end request in submission context. Use a worker */
 		spin_lock(&fsvq->lock);
 		list_add_tail(&req->list, &fsvq->end_reqs);
-		schedule_delayed_work(&fsvq->dispatch_work, 0);
+		schedule_work(&fsvq->dispatch_work);
 		spin_unlock(&fsvq->lock);
 		return;
 	}
-- 
2.34.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
