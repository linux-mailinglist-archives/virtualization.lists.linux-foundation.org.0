Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D648960D8FC
	for <lists.virtualization@lfdr.de>; Wed, 26 Oct 2022 03:55:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649B640268;
	Wed, 26 Oct 2022 01:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 649B640268
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FFjFOOZN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ocxMCErwl3M; Wed, 26 Oct 2022 01:55:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9FC944025F;
	Wed, 26 Oct 2022 01:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FC944025F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9B011C007C;
	Wed, 26 Oct 2022 01:55:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BB54EC002D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Oct 2022 01:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 831B760BA9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Oct 2022 01:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 831B760BA9
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=FFjFOOZN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DZd12vebxLYn
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Oct 2022 01:55:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E77E60BA3
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E77E60BA3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 26 Oct 2022 01:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666749337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=2EDjchvmjf00iNLBovCyHeFNyEF7P/IGFuFfySEU2XY=;
 b=FFjFOOZNjIlSrBeN49SUr7g7xZMTAa4my4KE/bCIcVHf5ZVJV+v6cAc0ZHa3S3oRjy9EPp
 4TO5sBLPz34GC9HV/xy9QixU3lzMm9tLt/XmIAMNfLplQ/h4nPvg2WeMKvV2ZCDcuGj9sy
 HY/q3EH0FHz7jGn480mPj0aTYD+Ad5s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-62-j0eVUhwmNX2UwWejdozCog-1; Tue, 25 Oct 2022 21:55:33 -0400
X-MC-Unique: j0eVUhwmNX2UwWejdozCog-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5218B833A09;
 Wed, 26 Oct 2022 01:55:33 +0000 (UTC)
Received: from localhost (ovpn-8-17.pek2.redhat.com [10.72.8.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8B3472166B2B;
 Wed, 26 Oct 2022 01:55:30 +0000 (UTC)
From: Ming Lei <ming.lei@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH V2 1/1] blk-mq: avoid double ->queue_rq() because of early
 timeout
Date: Wed, 26 Oct 2022 09:55:21 +0800
Message-Id: <20221026015521.347973-1-ming.lei@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Cc: David Jeffery <djeffery@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>,
 Ming Lei <ming.lei@redhat.com>
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

From: David Jeffery <djeffery@redhat.com>

David Jeffery found one double ->queue_rq() issue, so far it can
be triggered in VM use case because of long vmexit latency or preempt
latency of vCPU pthread or long page fault in vCPU pthread, then block
IO req could be timed out before queuing the request to hardware but after
calling blk_mq_start_request() during ->queue_rq(), then timeout handler
may handle it by requeue, then double ->queue_rq() is caused, and kernel
panic.

So far, it is driver's responsibility to cover the race between timeout
and completion, so it seems supposed to be solved in driver in theory,
given driver has enough knowledge.

But it is really one common problem, lots of driver could have similar
issue, and could be hard to fix all affected drivers, even it isn't easy
for driver to handle the race. So David suggests this patch by draining
in-progress ->queue_rq() for solving this issue.

Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Keith Busch <kbusch@kernel.org>
Cc: virtualization@lists.linux-foundation.org
Cc: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: David Jeffery <djeffery@redhat.com>
Signed-off-by: Ming Lei <ming.lei@redhat.com>
---
V2:
	- follow Jens's suggestion to run sync rcu only if there is timeout
	- rename 'now' as 'start_timeout'

 block/blk-mq.c | 53 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 33292c01875d..431e71af0e06 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1523,7 +1523,14 @@ static void blk_mq_rq_timed_out(struct request *req)
 	blk_add_timer(req);
 }
 
-static bool blk_mq_req_expired(struct request *rq, unsigned long *next)
+struct blk_expired_data {
+	bool check_only;
+	bool has_timedout_rq;
+	unsigned long next;
+	unsigned long timeout_start;
+};
+
+static bool blk_mq_req_expired(struct request *rq, struct blk_expired_data *expired)
 {
 	unsigned long deadline;
 
@@ -1533,13 +1540,13 @@ static bool blk_mq_req_expired(struct request *rq, unsigned long *next)
 		return false;
 
 	deadline = READ_ONCE(rq->deadline);
-	if (time_after_eq(jiffies, deadline))
+	if (time_after_eq(expired->timeout_start, deadline))
 		return true;
 
-	if (*next == 0)
-		*next = deadline;
-	else if (time_after(*next, deadline))
-		*next = deadline;
+	if (expired->next == 0)
+		expired->next = deadline;
+	else if (time_after(expired->next, deadline))
+		expired->next = deadline;
 	return false;
 }
 
@@ -1555,7 +1562,7 @@ void blk_mq_put_rq_ref(struct request *rq)
 
 static bool blk_mq_check_expired(struct request *rq, void *priv)
 {
-	unsigned long *next = priv;
+	struct blk_expired_data *expired = priv;
 
 	/*
 	 * blk_mq_queue_tag_busy_iter() has locked the request, so it cannot
@@ -1564,8 +1571,13 @@ static bool blk_mq_check_expired(struct request *rq, void *priv)
 	 * it was completed and reallocated as a new request after returning
 	 * from blk_mq_check_expired().
 	 */
-	if (blk_mq_req_expired(rq, next))
+	if (blk_mq_req_expired(rq, expired)) {
+		if (expired->check_only) {
+			expired->has_timedout_rq = true;
+			return false;
+		}
 		blk_mq_rq_timed_out(rq);
+	}
 	return true;
 }
 
@@ -1573,7 +1585,10 @@ static void blk_mq_timeout_work(struct work_struct *work)
 {
 	struct request_queue *q =
 		container_of(work, struct request_queue, timeout_work);
-	unsigned long next = 0;
+	struct blk_expired_data expired = {
+		.check_only = true,
+		.timeout_start = jiffies,
+	};
 	struct blk_mq_hw_ctx *hctx;
 	unsigned long i;
 
@@ -1593,10 +1608,24 @@ static void blk_mq_timeout_work(struct work_struct *work)
 	if (!percpu_ref_tryget(&q->q_usage_counter))
 		return;
 
-	blk_mq_queue_tag_busy_iter(q, blk_mq_check_expired, &next);
+	/* check if there is any timed-out request */
+	blk_mq_queue_tag_busy_iter(q, blk_mq_check_expired, &expired);
+	if (expired.has_timedout_rq) {
+		/*
+		 * Before walking tags, we must ensure any submit started
+		 * before the current time has finished. Since the submit
+		 * uses srcu or rcu, wait for a synchronization point to
+		 * ensure all running submits have finished
+		 */
+		blk_mq_wait_quiesce_done(q);
+
+		expired.check_only = false;
+		expired.next = 0;
+		blk_mq_queue_tag_busy_iter(q, blk_mq_check_expired, &expired);
+	}
 
-	if (next != 0) {
-		mod_timer(&q->timeout, next);
+	if (expired.next != 0) {
+		mod_timer(&q->timeout, expired.next);
 	} else {
 		/*
 		 * Request timeouts are handled as a forward rolling timer. If
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
