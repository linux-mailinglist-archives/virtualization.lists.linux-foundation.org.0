Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DD53C7447
	for <lists.virtualization@lfdr.de>; Tue, 13 Jul 2021 18:19:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A5D83B06;
	Tue, 13 Jul 2021 16:19:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CDxotX3rA7e6; Tue, 13 Jul 2021 16:19:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AC2F083AFA;
	Tue, 13 Jul 2021 16:19:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93FE3C0010;
	Tue, 13 Jul 2021 16:19:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F598C0022
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 16:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09D9E82D75
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 16:19:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c8bwApmRv5Zv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 16:19:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4016D83ADC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 13 Jul 2021 16:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626193162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkVbvILKBq40WaEmHLBRSgoHvH/vzwrA0dUxLC2cHSE=;
 b=h4NVAU573xF6cAzB8SuI9BaVEwASb+RKGKVCOETmsdML3QHe8s8FsGt4NzHrPAskGWAbK7
 p8fBOY2ENmIXGh5LXEcHR3/Q2pQMNUxblg7UTRMj7xtCFTVlBsLWoZisZtYS98kQVPOoDu
 vG0qD+imlrDNaM7bcGWu3/VDOcl8h7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-kWE6OaooNECjV1bN-9szzQ-1; Tue, 13 Jul 2021 12:19:21 -0400
X-MC-Unique: kWE6OaooNECjV1bN-9szzQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF48C1009444;
 Tue, 13 Jul 2021 16:19:19 +0000 (UTC)
Received: from localhost (ovpn-112-172.ams2.redhat.com [10.36.112.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 713906091B;
 Tue, 13 Jul 2021 16:19:19 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC 3/3] softirq: participate in cpuidle polling
Date: Tue, 13 Jul 2021 17:19:06 +0100
Message-Id: <20210713161906.457857-4-stefanha@redhat.com>
In-Reply-To: <20210713161906.457857-1-stefanha@redhat.com>
References: <20210713161906.457857-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@infradead.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ming Lei <ming.lei@redhat.com>,
 linux-block@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-pm@vger.kernel.org, virtualization@lists.linux-foundation.org
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

Normally softirqs are invoked when exiting irqs. When polling in the
cpuidle driver there may be no irq. Therefore pending softirqs go
unnoticed and polling continues without invoking them.

Add a softirq_poll() function to explicitly check for and invoke
softirqs.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
This commit is not needed for virtio-blk. I added it when I realized
virtio-net's NAPI scheduling might not be detected by the cpuidle busy
wait loop because it is unaware of softirqs. However, even after doing
this virtio-net's NAPI polling doesn't combine with cpuidle haltpoll.

Perhaps this patch is still desirable for cpuidle poll_state in case a
softirq is raised?
---
 include/linux/interrupt.h     |  2 ++
 drivers/cpuidle/poll_source.c |  3 +++
 kernel/softirq.c              | 14 ++++++++++++++
 3 files changed, 19 insertions(+)

diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index 4777850a6dc7..9bfdcc466ba8 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -573,6 +573,8 @@ struct softirq_action
 asmlinkage void do_softirq(void);
 asmlinkage void __do_softirq(void);
 
+extern void softirq_poll(void);
+
 extern void open_softirq(int nr, void (*action)(struct softirq_action *));
 extern void softirq_init(void);
 extern void __raise_softirq_irqoff(unsigned int nr);
diff --git a/drivers/cpuidle/poll_source.c b/drivers/cpuidle/poll_source.c
index 46100e5a71e4..ed200feb0daa 100644
--- a/drivers/cpuidle/poll_source.c
+++ b/drivers/cpuidle/poll_source.c
@@ -6,6 +6,7 @@
 #include <linux/lockdep.h>
 #include <linux/percpu.h>
 #include <linux/poll_source.h>
+#include <linux/interrupt.h>
 
 /* The per-cpu list of registered poll sources */
 DEFINE_PER_CPU(struct list_head, poll_source_list);
@@ -26,6 +27,8 @@ void poll_source_run_once(void)
 
 	list_for_each_entry(src, this_cpu_ptr(&poll_source_list), node)
 		src->ops->poll(src);
+
+	softirq_poll();
 }
 
 /* Called from idle task with TIF_POLLING_NRFLAG set and irqs enabled */
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 4992853ef53d..f45bf0204218 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -611,6 +611,20 @@ void irq_enter(void)
 	irq_enter_rcu();
 }
 
+/**
+ * softirq_poll() - invoke pending softirqs
+ *
+ * Normally it is not necessary to explicitly poll for softirqs, but in the
+ * cpuidle driver a polling function may have raised a softirq with no irq exit
+ * to invoke it. Therefore it is necessary to poll for pending softirqs and
+ * invoke them explicitly.
+ */
+void softirq_poll(void)
+{
+	if (!in_interrupt() && local_softirq_pending())
+		invoke_softirq();
+}
+
 static inline void tick_irq_exit(void)
 {
 #ifdef CONFIG_NO_HZ_COMMON
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
