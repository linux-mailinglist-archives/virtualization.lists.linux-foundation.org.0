Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D311696B5
	for <lists.virtualization@lfdr.de>; Sun, 23 Feb 2020 09:05:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9750585CA1;
	Sun, 23 Feb 2020 08:05:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wA8Jdvo7EAjh; Sun, 23 Feb 2020 08:05:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 66DD285C57;
	Sun, 23 Feb 2020 08:05:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3F94CC0177;
	Sun, 23 Feb 2020 08:05:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6282AC0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 08:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5895985CA1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 08:05:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17RO+oyYqIex
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 08:05:39 +0000 (UTC)
X-Greylist: delayed 00:05:23 by SQLgrey-1.7.6
Received: from r3-23.sinamail.sina.com.cn (r3-23.sinamail.sina.com.cn
 [202.108.3.23])
 by whitealder.osuosl.org (Postfix) with SMTP id 5501A85C57
 for <virtualization@lists.linux-foundation.org>;
 Sun, 23 Feb 2020 08:05:38 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([124.64.0.152])
 by sina.com with ESMTP
 id 5E522ECB000287A1; Sun, 23 Feb 2020 15:50:36 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 94391054919460
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com>
Subject: Re: INFO: task hung in lock_sock_nested (2)
Date: Sun, 23 Feb 2020 15:50:25 +0800
Message-Id: <20200223075025.9068-1-hdanton@sina.com>
In-Reply-To: <0000000000004241ff059f2eb8a4@google.com>
References: 
MIME-Version: 1.0
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, stefanha@redhat.com,
 kuba@kernel.org, davem@davemloft.net, jhansen@vmware.com
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


On Sat, 22 Feb 2020 10:58:12 -0800
> syzbot found the following crash on:
> 
> HEAD commit:    2bb07f4e tc-testing: updated tdc tests for basic filter
> git tree:       net-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=122efdede00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=768cc3d3e277cc16
> dashboard link: https://syzkaller.appspot.com/bug?extid=731710996d79d0d58fbc
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14887de9e00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149eec81e00000
> 
> The bug was bisected to:
> 
> commit 408624af4c89989117bb2c6517bd50b7708a2fcd
> Author: Stefano Garzarella <sgarzare@redhat.com>
> Date:   Tue Dec 10 10:43:06 2019 +0000
> 
>     vsock: use local transport when it is loaded
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1011e27ee00000
> final crash:    https://syzkaller.appspot.com/x/report.txt?x=1211e27ee00000
> console output: https://syzkaller.appspot.com/x/log.txt?x=1411e27ee00000
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+731710996d79d0d58fbc@syzkaller.appspotmail.com
> Fixes: 408624af4c89 ("vsock: use local transport when it is loaded")
> 
> INFO: task syz-executor280:9768 blocked for more than 143 seconds.
>       Not tainted 5.6.0-rc1-syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> syz-executor280 D27912  9768   9766 0x00000000
> Call Trace:
>  context_switch kernel/sched/core.c:3386 [inline]
>  __schedule+0x934/0x1f90 kernel/sched/core.c:4082
>  schedule+0xdc/0x2b0 kernel/sched/core.c:4156
>  __lock_sock+0x165/0x290 net/core/sock.c:2413
>  lock_sock_nested+0xfe/0x120 net/core/sock.c:2938
>  virtio_transport_release+0xc4/0xd60 net/vmw_vsock/virtio_transport_common.c:832
>  vsock_assign_transport+0xf3/0x3b0 net/vmw_vsock/af_vsock.c:454
>  vsock_stream_connect+0x2b3/0xc70 net/vmw_vsock/af_vsock.c:1288
>  __sys_connect_file+0x161/0x1c0 net/socket.c:1857
>  __sys_connect+0x174/0x1b0 net/socket.c:1874
>  __do_sys_connect net/socket.c:1885 [inline]
>  __se_sys_connect net/socket.c:1882 [inline]
>  __x64_sys_connect+0x73/0xb0 net/socket.c:1882
>  do_syscall_64+0xfa/0x790 arch/x86/entry/common.c:294
>  entry_SYSCALL_64_after_hwframe+0x49/0xbe
> RIP: 0033:0x440209
> Code: Bad RIP value.
> RSP: 002b:00007ffdb9f67718 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
> RAX: ffffffffffffffda RBX: 00000000004002c8 RCX: 0000000000440209
> RDX: 0000000000000010 RSI: 0000000020000440 RDI: 0000000000000003
> RBP: 00000000006ca018 R08: 00000000004002c8 R09: 00000000004002c8
> R10: 00000000004002c8 R11: 0000000000000246 R12: 0000000000401a90
> R13: 0000000000401b20 R14: 0000000000000000 R15: 0000000000000000
> 
> Showing all locks held in the system:
> 1 lock held by khungtaskd/951:
>  #0: ffffffff89bac240 (rcu_read_lock){....}, at: debug_show_all_locks+0x5f/0x279 kernel/locking/lockdep.c:5333
> 1 lock held by rsyslogd/9652:
>  #0: ffff8880a6533120 (&f->f_pos_lock){+.+.}, at: __fdget_pos+0xee/0x110 fs/file.c:821
> 2 locks held by getty/9742:
>  #0: ffff8880a693f090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900061bb2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9743:
>  #0: ffff88809f7a1090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900061b72e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9744:
>  #0: ffff88809be3e090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900061632e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9745:
>  #0: ffff88808eb1e090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900061bf2e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9746:
>  #0: ffff88808d33a090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900061732e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9747:
>  #0: ffff8880a6a0c090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900061c32e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 2 locks held by getty/9748:
>  #0: ffff8880a6e4d090 (&tty->ldisc_sem){++++}, at: ldsem_down_read+0x33/0x40 drivers/tty/tty_ldsem.c:340
>  #1: ffffc900061332e0 (&ldata->atomic_read_lock){+.+.}, at: n_tty_read+0x220/0x1bf0 drivers/tty/n_tty.c:2156
> 1 lock held by syz-executor280/9768:
>  #0: ffff8880987cb8d0 (sk_lock-AF_VSOCK){+.+.}, at: lock_sock include/net/sock.h:1516 [inline]
>  #0: ffff8880987cb8d0 (sk_lock-AF_VSOCK){+.+.}, at: vsock_stream_connect+0xfb/0xc70 net/vmw_vsock/af_vsock.c:1258
> 
> =============================================
> 
> NMI backtrace for cpu 1
> CPU: 1 PID: 951 Comm: khungtaskd Not tainted 5.6.0-rc1-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  __dump_stack lib/dump_stack.c:77 [inline]
>  dump_stack+0x197/0x210 lib/dump_stack.c:118
>  nmi_cpu_backtrace.cold+0x70/0xb2 lib/nmi_backtrace.c:101
>  nmi_trigger_cpumask_backtrace+0x23b/0x28b lib/nmi_backtrace.c:62
>  arch_trigger_cpumask_backtrace+0x14/0x20 arch/x86/kernel/apic/hw_nmi.c:38
>  trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
>  check_hung_uninterruptible_tasks kernel/hung_task.c:205 [inline]
>  watchdog+0xb11/0x10c0 kernel/hung_task.c:289
>  kthread+0x361/0x430 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.6.0-rc1-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:group_is_overloaded kernel/sched/fair.c:7929 [inline]
> RIP: 0010:group_classify kernel/sched/fair.c:7964 [inline]
> RIP: 0010:update_sg_lb_stats kernel/sched/fair.c:8077 [inline]
> RIP: 0010:update_sd_lb_stats kernel/sched/fair.c:8565 [inline]
> RIP: 0010:find_busiest_group+0xa33/0x3250 kernel/sched/fair.c:8793
> Code: 89 f8 83 e0 07 83 c0 03 40 38 f0 7c 09 40 84 f6 0f 85 f7 1f 00 00 48 8b b5 c0 fd ff ff 41 8b 41 2c 48 c1 ee 03 42 0f b6 34 26 <40> 84 f6 74 0a 40 80 fe 03 0f 8e 8f 1f 00 00 44 8b 6b 20 44 39 ea
> RSP: 0018:ffffc90000007850 EFLAGS: 00000a06
> RAX: 000000000000006e RBX: ffffc90000007938 RCX: 00000000000003fa
> RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff8880a9a8282c
> RBP: ffffc90000007af0 R08: ffffffff89a7a440 R09: ffff8880a9a82800
> R10: 0000000000000000 R11: ffff8880a9a83f27 R12: dffffc0000000000
> R13: ffff8880a9a83e80 R14: ffffc90000007ac8 R15: ffffc90000007c08
> FS:  0000000000000000(0000) GS:ffff8880ae800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffff600400 CR3: 000000009fde0000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <IRQ>
>  load_balance+0x38c/0x2b50 kernel/sched/fair.c:9161
>  rebalance_domains+0x739/0x1000 kernel/sched/fair.c:9588
>  _nohz_idle_balance+0x336/0x3f0 kernel/sched/fair.c:10002
>  nohz_idle_balance kernel/sched/fair.c:10048 [inline]
>  run_rebalance_domains+0x1c6/0x2d0 kernel/sched/fair.c:10237
>  __do_softirq+0x262/0x98c kernel/softirq.c:292
>  invoke_softirq kernel/softirq.c:373 [inline]
>  irq_exit+0x19b/0x1e0 kernel/softirq.c:413
>  scheduler_ipi+0x38c/0x610 kernel/sched/core.c:2349
>  smp_reschedule_interrupt+0x78/0x4c0 arch/x86/kernel/smp.c:244
>  reschedule_interrupt+0xf/0x20 arch/x86/entry/entry_64.S:853
>  </IRQ>
> RIP: 0010:native_safe_halt+0xe/0x10 arch/x86/include/asm/irqflags.h:61
> Code: 58 f5 c3 f9 eb 8a cc cc cc cc cc cc e9 07 00 00 00 0f 00 2d 74 40 58 00 f4 c3 66 90 e9 07 00 00 00 0f 00 2d 64 40 58 00 fb f4 <c3> cc 55 48 89 e5 41 57 41 56 41 55 41 54 53 e8 ce ac 72 f9 e8 e9
> RSP: 0018:ffffffff89a07ce8 EFLAGS: 00000286 ORIG_RAX: ffffffffffffff02
> RAX: 1ffffffff136761a RBX: ffffffff89a7a440 RCX: 0000000000000000
> RDX: dffffc0000000000 RSI: 0000000000000006 RDI: ffffffff89a7acd4
> RBP: ffffffff89a07d18 R08: ffffffff89a7a440 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: dffffc0000000000
> R13: ffffffff8aa5ab80 R14: 0000000000000000 R15: 0000000000000000
>  arch_cpu_idle+0xa/0x10 arch/x86/kernel/process.c:686
>  default_idle_call+0x84/0xb0 kernel/sched/idle.c:94
>  cpuidle_idle_call kernel/sched/idle.c:154 [inline]
>  do_idle+0x3c8/0x6e0 kernel/sched/idle.c:269
>  cpu_startup_entry+0x1b/0x20 kernel/sched/idle.c:361
>  rest_init+0x23b/0x371 init/main.c:654
>  arch_call_rest_init+0xe/0x1b
>  start_kernel+0x886/0x8c5 init/main.c:992
>  x86_64_start_reservations+0x29/0x2b arch/x86/kernel/head64.c:490
>  x86_64_start_kernel+0x77/0x7b arch/x86/kernel/head64.c:471
>  secondary_startup_64+0xa4/0xb0 arch/x86/kernel/head_64.S:242
> 
> 
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> syzbot can test patches for this bug, for details see:
> https://goo.gl/tpsmEJ#testing-patches


Seems like vsock needs a word to track lock owner in an attempt to
avoid trying to lock sock while the current is the lock owner.

--- a/include/net/af_vsock.h
+++ b/include/net/af_vsock.h
@@ -41,6 +41,7 @@ struct vsock_sock {
 					 * cached peer?
 					 */
 	u32 cached_peer;  /* Context ID of last dgram destination check. */
+	void *lock_owner;
 	const struct cred *owner;
 	/* Rest are SOCK_STREAM only. */
 	long connect_timeout;
@@ -74,6 +75,13 @@ struct vsock_sock {
 	void *trans;
 };
 
+static inline bool vsock_locked(struct sock *sk)
+{
+	struct vsock_sock *vsk = vsock_sk(sk);
+
+	return vsk->lock_owner == current;
+}
+
 s64 vsock_stream_has_data(struct vsock_sock *vsk);
 s64 vsock_stream_has_space(struct vsock_sock *vsk);
 struct sock *vsock_create_connected(struct sock *parent);
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -1236,6 +1236,7 @@ static int vsock_stream_connect(struct s
 	vsk = vsock_sk(sk);
 
 	lock_sock(sk);
+	vsk->lock_owner = current;
 
 	/* XXX AF_UNSPEC should make us disconnect like AF_INET. */
 	switch (sock->state) {
@@ -1320,9 +1321,11 @@ static int vsock_stream_connect(struct s
 			goto out_wait;
 		}
 
+		vsk->lock_owner = NULL;
 		release_sock(sk);
 		timeout = schedule_timeout(timeout);
 		lock_sock(sk);
+		vsk->lock_owner = current;
 
 		if (signal_pending(current)) {
 			err = sock_intr_errno(timeout);
@@ -1352,6 +1355,7 @@ static int vsock_stream_connect(struct s
 out_wait:
 	finish_wait(sk_sleep(sk), &wait);
 out:
+	vsk->lock_owner = NULL;
 	release_sock(sk);
 	return err;
 }
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -832,7 +832,9 @@ void virtio_transport_release(struct vso
 	struct sock *sk = &vsk->sk;
 	bool remove_sock = true;
 
-	lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
+	if (!vsock_locked(sk))
+		lock_sock_nested(sk, SINGLE_DEPTH_NESTING);
+
 	if (sk->sk_type == SOCK_STREAM)
 		remove_sock = virtio_transport_close(vsk);
 
@@ -840,7 +842,9 @@ void virtio_transport_release(struct vso
 		list_del(&pkt->list);
 		virtio_transport_free_pkt(pkt);
 	}
-	release_sock(sk);
+
+	if (!vsock_locked(sk))
+		release_sock(sk);
 
 	if (remove_sock)
 		vsock_remove_sock(vsk);

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
