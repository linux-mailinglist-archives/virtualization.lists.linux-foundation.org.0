Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B642E47DE8D
	for <lists.virtualization@lfdr.de>; Thu, 23 Dec 2021 06:19:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ACBA408CB;
	Thu, 23 Dec 2021 05:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-G-4dJIYiS8; Thu, 23 Dec 2021 05:19:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CF7D5408D8;
	Thu, 23 Dec 2021 05:19:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BCA6C006E;
	Thu, 23 Dec 2021 05:19:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 35F44C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Dec 2021 05:19:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2ACC6408CA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Dec 2021 05:19:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nhQPNRnRtLl1
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Dec 2021 05:19:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 265AD408C2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Dec 2021 05:19:21 +0000 (UTC)
Received: from in01.mta.xmission.com ([166.70.13.51]:52660)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n0GVa-008s6y-V9; Wed, 22 Dec 2021 22:19:19 -0700
Received: from ip68-110-24-146.om.om.cox.net ([68.110.24.146]:48308
 helo=email.froward.int.ebiederm.org.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1n0GVZ-006UxB-M1; Wed, 22 Dec 2021 22:19:18 -0700
From: ebiederm@xmission.com (Eric W. Biederman)
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <87a6ha4zsd.fsf@email.froward.int.ebiederm.org>
 <20211208202532.16409-9-ebiederm@xmission.com>
 <YcNsG0Lp94V13whH@archlinux-ax161>
 <87zgoswkym.fsf@email.froward.int.ebiederm.org>
 <YcNyjxac3wlKPywk@archlinux-ax161>
 <87pmpow7ga.fsf@email.froward.int.ebiederm.org>
 <CAHk-=wgtFAA9SbVYg0gR1tqPMC17-NYcs0GQkaYg1bGhh1uJQQ@mail.gmail.com>
 <87o858uh80.fsf@email.froward.int.ebiederm.org>
Date: Wed, 22 Dec 2021 23:19:11 -0600
In-Reply-To: <87o858uh80.fsf@email.froward.int.ebiederm.org> (Eric
 W. Biederman's message of "Wed, 22 Dec 2021 21:34:39 -0600")
Message-ID: <87a6grvqy8.fsf_-_@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-XM-SPF: eid=1n0GVZ-006UxB-M1; ; ;
 mid=<87a6grvqy8.fsf_-_@email.froward.int.ebiederm.org>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.110.24.146; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+HFx38QTkf+5DclzITyFX/fVSaoUkHAVM=
X-SA-Exim-Connect-IP: 68.110.24.146
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: *;Linus Torvalds <torvalds@linux-foundation.org>
X-Spam-Relay-Country: 
X-Spam-Timing: total 685 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 18 (2.6%), b_tie_ro: 16 (2.3%), parse: 2.4 (0.4%),
 extract_message_metadata: 22 (3.2%), get_uri_detail_list: 4.3 (0.6%),
 tests_pri_-1000: 18 (2.7%), tests_pri_-950: 1.48 (0.2%),
 tests_pri_-900: 1.18 (0.2%), tests_pri_-90: 72 (10.5%), check_bayes:
 70 (10.2%), b_tokenize: 16 (2.4%), b_tok_get_all: 13 (1.9%),
 b_comp_prob: 4.0 (0.6%), b_tok_touch_all: 32 (4.7%), b_finish: 1.14
 (0.2%), tests_pri_0: 528 (77.1%), check_dkim_signature: 0.77 (0.1%),
 check_dkim_adsp: 2.4 (0.4%), poll_dns_idle: 0.81 (0.1%), tests_pri_10:
 3.1 (0.4%), tests_pri_500: 14 (2.0%), rewrite_mail: 0.00 (0.0%)
Subject: [PATCH] kthread: Generalize pf_io_worker so it can point to struct
 kthread
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
Cc: linux-arch <linux-arch@vger.kernel.org>, axboe@kernel.dk,
 Kees Cook <keescook@chromium.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Nathan Chancellor <nathan@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Kyle Huey <me@kylehuey.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 virtualization@lists.linux-foundation.org, Alexey Gladkov <legion@kernel.org>,
 christian.brauner@ubuntu.com
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


The point of using set_child_tid to hold the kthread pointer was that
it already did what is necessary.  There are now restrictions on when
set_child_tid can be initialized and when set_child_tid can be used in
schedule_tail.  Which indicates that continuing to use set_child_tid
to hold the kthread pointer is a bad idea.

Instead of continuing to use the set_child_tid field of task_struct
generalize the pf_io_worker field of task_struct and use it to hold
the kthread pointer.

Rename pf_io_worker (which is a void * pointer) to worker_private so
it can be used to store kthreads struct kthread pointer.  Update the
kthread code to store the kthread pointer in the worker_private field.
Remove the places where set_child_tid had to be dealt with carefully
because kthreads also used it.

Link: https://lkml.kernel.org/r/CAHk-=wgtFAA9SbVYg0gR1tqPMC17-NYcs0GQkaYg1bGhh1uJQQ@mail.gmail.com
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
---

I looked again and the vhost_worker changes do not generalize
pf_io_worker, and as pf_io_worker is already a void * it is easy to
generalize.  So I just did that.

Unless someone spots a problem I will add this to my signal-for-v5.17
branch in linux-next, as this seems much less error prone than using
set_child_tid.

 fs/io-wq.c            |  6 +++---
 fs/io-wq.h            |  2 +-
 include/linux/sched.h |  4 ++--
 kernel/fork.c         |  8 +-------
 kernel/kthread.c      | 14 +++++---------
 kernel/sched/core.c   |  2 +-
 6 files changed, 13 insertions(+), 23 deletions(-)

diff --git a/fs/io-wq.c b/fs/io-wq.c
index 88202de519f6..e4fc7384b40c 100644
--- a/fs/io-wq.c
+++ b/fs/io-wq.c
@@ -657,7 +657,7 @@ static int io_wqe_worker(void *data)
  */
 void io_wq_worker_running(struct task_struct *tsk)
 {
-	struct io_worker *worker = tsk->pf_io_worker;
+	struct io_worker *worker = tsk->worker_private;
 
 	if (!worker)
 		return;
@@ -675,7 +675,7 @@ void io_wq_worker_running(struct task_struct *tsk)
  */
 void io_wq_worker_sleeping(struct task_struct *tsk)
 {
-	struct io_worker *worker = tsk->pf_io_worker;
+	struct io_worker *worker = tsk->worker_private;
 
 	if (!worker)
 		return;
@@ -694,7 +694,7 @@ void io_wq_worker_sleeping(struct task_struct *tsk)
 static void io_init_new_worker(struct io_wqe *wqe, struct io_worker *worker,
 			       struct task_struct *tsk)
 {
-	tsk->pf_io_worker = worker;
+	tsk->worker_private = worker;
 	worker->task = tsk;
 	set_cpus_allowed_ptr(tsk, wqe->cpu_mask);
 	tsk->flags |= PF_NO_SETAFFINITY;
diff --git a/fs/io-wq.h b/fs/io-wq.h
index 41bf37674a49..c7c23947cbcd 100644
--- a/fs/io-wq.h
+++ b/fs/io-wq.h
@@ -200,6 +200,6 @@ static inline void io_wq_worker_running(struct task_struct *tsk)
 static inline bool io_wq_current_is_worker(void)
 {
 	return in_task() && (current->flags & PF_IO_WORKER) &&
-		current->pf_io_worker;
+		current->worker_private;
 }
 #endif
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 78c351e35fec..52f2fdffa3ab 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -987,8 +987,8 @@ struct task_struct {
 	/* CLONE_CHILD_CLEARTID: */
 	int __user			*clear_child_tid;
 
-	/* PF_IO_WORKER */
-	void				*pf_io_worker;
+	/* PF_KTHREAD | PF_IO_WORKER */
+	void				*worker_private;
 
 	u64				utime;
 	u64				stime;
diff --git a/kernel/fork.c b/kernel/fork.c
index 0816be1bb044..6f0293cb29c9 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -950,7 +950,7 @@ static struct task_struct *dup_task_struct(struct task_struct *orig, int node)
 	tsk->splice_pipe = NULL;
 	tsk->task_frag.page = NULL;
 	tsk->wake_q.next = NULL;
-	tsk->pf_io_worker = NULL;
+	tsk->worker_private = NULL;
 
 	account_kernel_stack(tsk, 1);
 
@@ -2032,12 +2032,6 @@ static __latent_entropy struct task_struct *copy_process(
 		siginitsetinv(&p->blocked, sigmask(SIGKILL)|sigmask(SIGSTOP));
 	}
 
-	/*
-	 * This _must_ happen before we call free_task(), i.e. before we jump
-	 * to any of the bad_fork_* labels. This is to avoid freeing
-	 * p->set_child_tid which is (ab)used as a kthread's data pointer for
-	 * kernel threads (PF_KTHREAD).
-	 */
 	p->set_child_tid = (clone_flags & CLONE_CHILD_SETTID) ? args->child_tid : NULL;
 	/*
 	 * Clear TID on mm_release()?
diff --git a/kernel/kthread.c b/kernel/kthread.c
index c14707d15341..261a3c3b9c6c 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -72,7 +72,7 @@ enum KTHREAD_BITS {
 static inline struct kthread *to_kthread(struct task_struct *k)
 {
 	WARN_ON(!(k->flags & PF_KTHREAD));
-	return (__force void *)k->set_child_tid;
+	return k->worker_private;
 }
 
 /*
@@ -80,7 +80,7 @@ static inline struct kthread *to_kthread(struct task_struct *k)
  *
  * Per construction; when:
  *
- *   (p->flags & PF_KTHREAD) && p->set_child_tid
+ *   (p->flags & PF_KTHREAD) && p->worker_private
  *
  * the task is both a kthread and struct kthread is persistent. However
  * PF_KTHREAD on it's own is not, kernel_thread() can exec() (See umh.c and
@@ -88,7 +88,7 @@ static inline struct kthread *to_kthread(struct task_struct *k)
  */
 static inline struct kthread *__to_kthread(struct task_struct *p)
 {
-	void *kthread = (__force void *)p->set_child_tid;
+	void *kthread = p->worker_private;
 	if (kthread && !(p->flags & PF_KTHREAD))
 		kthread = NULL;
 	return kthread;
@@ -109,11 +109,7 @@ bool set_kthread_struct(struct task_struct *p)
 	init_completion(&kthread->parked);
 	p->vfork_done = &kthread->exited;
 
-	/*
-	 * We abuse ->set_child_tid to avoid the new member and because it
-	 * can't be wrongly copied by copy_process().
-	 */
-	p->set_child_tid = (__force void __user *)kthread;
+	p->worker_private = kthread;
 	return true;
 }
 
@@ -128,7 +124,7 @@ void free_kthread_struct(struct task_struct *k)
 #ifdef CONFIG_BLK_CGROUP
 	WARN_ON_ONCE(kthread && kthread->blkcg_css);
 #endif
-	k->set_child_tid = (__force void __user *)NULL;
+	k->worker_private = NULL;
 	kfree(kthread);
 }
 
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d8adbea77be1..ee222b89c692 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4908,7 +4908,7 @@ asmlinkage __visible void schedule_tail(struct task_struct *prev)
 	finish_task_switch(prev);
 	preempt_enable();
 
-	if (!(current->flags & PF_KTHREAD) && current->set_child_tid)
+	if (current->set_child_tid)
 		put_user(task_pid_vnr(current), current->set_child_tid);
 
 	calculate_sigpending();
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
