Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 738DC7133D5
	for <lists.virtualization@lfdr.de>; Sat, 27 May 2023 11:49:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 339B28451C;
	Sat, 27 May 2023 09:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 339B28451C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFQGEtAky3eG; Sat, 27 May 2023 09:49:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id F160C84516;
	Sat, 27 May 2023 09:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F160C84516
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1BA3DC0089;
	Sat, 27 May 2023 09:49:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77B70C002A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 27 May 2023 09:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5099A60E72
 for <virtualization@lists.linux-foundation.org>;
 Sat, 27 May 2023 09:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5099A60E72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NxGZ8XsMsTi8
 for <virtualization@lists.linux-foundation.org>;
 Sat, 27 May 2023 09:49:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7783E60B65
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7783E60B65
 for <virtualization@lists.linux-foundation.org>;
 Sat, 27 May 2023 09:49:52 +0000 (UTC)
Received: from in02.mta.xmission.com ([166.70.13.52]:33906)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q2qYX-00CTNs-QC; Sat, 27 May 2023 03:49:49 -0600
Received: from ip68-110-29-46.om.om.cox.net ([68.110.29.46]:50246
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1q2qYW-002KXI-8F; Sat, 27 May 2023 03:49:49 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <20230522025124.5863-1-michael.christie@oracle.com>
 <20230522025124.5863-4-michael.christie@oracle.com>
 <20230522123029.GA22159@redhat.com>
 <cfca7764-d210-6df9-e182-2c093101c6cf@oracle.com>
 <20230522174757.GC22159@redhat.com> <20230523121506.GA6562@redhat.com>
 <87bkib6nxr.fsf@email.froward.int.ebiederm.org>
 <20230524141022.GA19091@redhat.com>
 <87ttw1zt4i.fsf@email.froward.int.ebiederm.org>
 <20230525115512.GA9229@redhat.com>
 <87y1lcxwcj.fsf@email.froward.int.ebiederm.org>
 <CAHk-=wj4DS=2F5mW+K2P7cVqrsuGd3rKE_2k2BqnnPeeYhUCvg@mail.gmail.com>
Date: Sat, 27 May 2023 04:49:19 -0500
In-Reply-To: <CAHk-=wj4DS=2F5mW+K2P7cVqrsuGd3rKE_2k2BqnnPeeYhUCvg@mail.gmail.com>
 (Linus Torvalds's message of "Thu, 25 May 2023 09:20:19 -0700")
Message-ID: <87cz2mrtnk.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1q2qYW-002KXI-8F; ; ;
 mid=<87cz2mrtnk.fsf@email.froward.int.ebiederm.org>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.110.29.46; ; ; frm=ebiederm@xmission.com;
 ; ; spf=pass
X-XM-AID: U2FsdGVkX18QenzTYil61g5nAIUyy0kOBdxjsMy5svs=
X-SA-Exim-Connect-IP: 68.110.29.46
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Virus: No
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 960 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 4.6 (0.5%), b_tie_ro: 3.2 (0.3%), parse: 1.28
 (0.1%), extract_message_metadata: 12 (1.2%), get_uri_detail_list: 2.0
 (0.2%), tests_pri_-2000: 4.1 (0.4%), tests_pri_-1000: 2.00 (0.2%),
 tests_pri_-950: 1.03 (0.1%), tests_pri_-900: 0.83 (0.1%),
 tests_pri_-200: 0.68 (0.1%), tests_pri_-100: 5 (0.6%), tests_pri_-90:
 82 (8.5%), check_bayes: 80 (8.4%), b_tokenize: 7 (0.7%),
 b_tok_get_all: 8 (0.9%), b_comp_prob: 1.75 (0.2%), b_tok_touch_all: 60
 (6.3%), b_finish: 0.83 (0.1%), tests_pri_0: 339 (35.3%),
 check_dkim_signature: 0.41 (0.0%), check_dkim_adsp: 3.4 (0.4%),
 poll_dns_idle: 492 (51.3%), tests_pri_10: 2.6 (0.3%), tests_pri_500:
 501 (52.2%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH 3/3] fork, vhost: Use CLONE_THREAD to fix freezer/ps
 regression
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
Cc: axboe@kernel.dk, brauner@kernel.org, mst@redhat.com,
 linux-kernel@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 stefanha@redhat.com, linux@leemhuis.info, nicolas.dichtel@6wind.com,
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

Linus Torvalds <torvalds@linux-foundation.org> writes:

> So I'd really like to finish this. Even if we end up with a hack or
> two in signal handling that we can hopefully fix up later by having
> vhost fix up some of its current assumptions.


The real sticky widget for me is how to handle one of these processes
coredumping.  It really looks like it will result in a reliable hang.

Limiting ourselves to changes that will only affect vhost, all I can
see would be allowing the vhost_worker thread to exit as soon as
get_signal reports the process is exiting.  Then vhost_dev_flush
would need to process the pending work.

Something like this:

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index a92af08e7864..fb5ebc50c553 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -234,14 +234,31 @@ EXPORT_SYMBOL_GPL(vhost_poll_stop);
 void vhost_dev_flush(struct vhost_dev *dev)
 {
 	struct vhost_flush_struct flush;
+	struct vhost_worker *worker = dev->worker;
+	struct llist_node *node, *head;
+
+	if (!worker)
+		return;
+
+	init_completion(&flush.wait_event);
+	vhost_work_init(&flush.work, vhost_flush_work);
 
-	if (dev->worker) {
-		init_completion(&flush.wait_event);
-		vhost_work_init(&flush.work, vhost_flush_work);
+	vhost_work_queue(dev, &flush.work);
 
-		vhost_work_queue(dev, &flush.work);
-		wait_for_completion(&flush.wait_event);
+	/* Either vhost_worker runs the pending work or we do */
+	node = llist_del_all(&worker->work_list);
+	if (node) {
+		node = llist_reverse_order(node);
+		/* make sure flag is seen after deletion */
+		smp_wmb();
+		llist_for_each_entry_safe(work, work_next, node, node) {
+			clear_bit(VHOST_WORK_QUEUED, &work->flags);
+			work->fn(work);
+			cond_resched();
+		}
 	}
+
+	wait_for_completion(&flush.wait_event);
 }
 EXPORT_SYMBOL_GPL(vhost_dev_flush);
 
@@ -338,6 +355,7 @@ static int vhost_worker(void *data)
 	struct vhost_worker *worker = data;
 	struct vhost_work *work, *work_next;
 	struct llist_node *node;
+	struct ksignal ksig;
 
 	for (;;) {
 		/* mb paired w/ kthread_stop */
@@ -348,6 +366,9 @@ static int vhost_worker(void *data)
 			break;
 		}
 
+		if (get_signal(&ksig))
+			break;
+
 		node = llist_del_all(&worker->work_list);
 		if (!node)
 			schedule();
diff --git a/kernel/vhost_task.c b/kernel/vhost_task.c
index b7cbd66f889e..613d52f01c07 100644
--- a/kernel/vhost_task.c
+++ b/kernel/vhost_task.c
@@ -47,6 +47,7 @@ void vhost_task_stop(struct vhost_task *vtsk)
 	 * not exiting then reap the task.
 	 */
 	kernel_wait4(pid, NULL, __WCLONE, NULL);
+	put_task_struct(vtsk->task);
 	kfree(vtsk);
 }
 EXPORT_SYMBOL_GPL(vhost_task_stop);
@@ -101,7 +102,7 @@ struct vhost_task *vhost_task_create(int (*fn)(void *), void *arg,
 		return NULL;
 	}
 
-	vtsk->task = tsk;
+	vtsk->task = get_task_struct(tsk);
 	return vtsk;
 }
 EXPORT_SYMBOL_GPL(vhost_task_create);

Eric

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
