Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD784BDA15
	for <lists.virtualization@lfdr.de>; Mon, 21 Feb 2022 15:13:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82B4A813B4;
	Mon, 21 Feb 2022 14:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hPA0UtbPb10T; Mon, 21 Feb 2022 14:12:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E2F4D81441;
	Mon, 21 Feb 2022 14:12:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4CB03C0036;
	Mon, 21 Feb 2022 14:12:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E20B5C0011
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 14:12:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C13FC60E65
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 14:12:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jcf-3dUasKBW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 14:12:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C97F860AEB
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 14:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645452770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E+hAVN5CM0T2gBIzHBOMbt4iCAKMyITnPdGuS06Ch6E=;
 b=NXCiGVw3uKqBAsgcSThTIUiSxX4/EEm5JsTsgYtH0gvlmq1Djq+H+24BF0HQbp3GJLsegp
 usjV/Mx/RnK4JnuFd5IGBTEtGgBHhMwyAhN6wMVlHWoIlmIhZEAbfIapILltuivGk9hFiI
 Emgcr+ApuT4ZSP6qQT6PhrGvE8/atZc=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-lABngzkjMvid8jbvuPnQtg-1; Mon, 21 Feb 2022 09:12:47 -0500
X-MC-Unique: lABngzkjMvid8jbvuPnQtg-1
Received: by mail-lj1-f199.google.com with SMTP id
 q17-20020a2e7511000000b0023c95987502so4114603ljc.16
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Feb 2022 06:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+hAVN5CM0T2gBIzHBOMbt4iCAKMyITnPdGuS06Ch6E=;
 b=gYQEXJSvyRdpNVTckPNcSDCeWNyTTRkWyB8fS1jtcowARkxPxuLS7qfk4g2yrJOtiE
 iWrSxUvB8aq4sRf0BiE2r74r4TGH4CHeVEs3Z8yCmUyP39B/M11a+BpwWDeeYHqHCyba
 Mn17vCk+eRQ7/gSJ5qqTO2N3aJPKQzqZG9+UB06q6ZEaHOIgQL2VYMIfMPJDwoxenIIk
 ociVv2nLXFPJW1rIsldmRiz+kTFbg8+j8rOEnLdt3qxbKeBnd1b4s8yn4zJA9vluticQ
 iV1TC/8LNnbmJ/5gOiDwjgag9UhDy+mNyry0n0bDkXtPV4SgyNGS0ABNaknUEIGRh6h+
 6CBg==
X-Gm-Message-State: AOAM532FUJbLCvunU+qjuxRMhdGPwng9grWmgAgw3bWCs3qxZCX5oHFr
 OYK54mibNc1PLugNbN06F/C5it8milVvYtWlKA+mgjhSy722f53cA5N4mcrQFU4/Tsp7o0hqkE/
 msnzdcR2bPmDQbMbGa2lZOnWUQK0bmLzx1mhI2WlSF4ZCOQ8fDMR8z1+/Nw==
X-Received: by 2002:a05:6512:3b0f:b0:42d:1ebb:dcbf with SMTP id
 f15-20020a0565123b0f00b0042d1ebbdcbfmr13883637lfv.275.1645452765624; 
 Mon, 21 Feb 2022 06:12:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxkEEJ5cVPwE5zW++DSN/39BjkoLuCd16QNqlrgbTcCA3uhOjLVl4e3eTFNJo6Ud6AwlprLDFkDo5IlVi5kV38=
X-Received: by 2002:a05:6512:3b0f:b0:42d:1ebb:dcbf with SMTP id
 f15-20020a0565123b0f00b0042d1ebbdcbfmr13883621lfv.275.1645452765365; Mon, 21
 Feb 2022 06:12:45 -0800 (PST)
MIME-Version: 1.0
References: <00000000000057702a05d8532b18@google.com>
In-Reply-To: <00000000000057702a05d8532b18@google.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 21 Feb 2022 15:12:33 +0100
Message-ID: <CAGxU2F4nGWxG0wymrDZzd8Hwhm2=8syuEB3fLMd+t7bbN7qWrQ@mail.gmail.com>
Subject: Re: [syzbot] INFO: task hung in vhost_work_dev_flush
To: syzbot <syzbot+0abd373e2e50d704db87@syzkaller.appspotmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="00000000000093299305d887d3e9"
Cc: kvm <kvm@vger.kernel.org>, Michael Tsirkin <mst@redhat.com>,
 netdev <netdev@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 kernel list <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

--00000000000093299305d887d3e9
Content-Type: text/plain; charset="UTF-8"

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
f71077a4d84b

Patch sent upstream:
https://lore.kernel.org/virtualization/20220221114916.107045-1-sgarzare@redhat.com/T/#u

On Sat, Feb 19, 2022 at 12:23 AM syzbot
<syzbot+0abd373e2e50d704db87@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    e6251ab4551f Merge tag 'nfs-for-5.17-2' of git://git.linux..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=163caa3c700000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=266de9da75c71a45
> dashboard link: https://syzkaller.appspot.com/bug?extid=0abd373e2e50d704db87
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=108514a4700000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ca671c700000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+0abd373e2e50d704db87@syzkaller.appspotmail.com
>
> INFO: task syz-executor117:3632 blocked for more than 143 seconds.
>       Not tainted 5.17.0-rc3-syzkaller-00029-ge6251ab4551f #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz-executor117 state:D stack:27512 pid: 3632 ppid:  3631 flags:0x00004002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:4986 [inline]
>  __schedule+0xab2/0x4db0 kernel/sched/core.c:6295
>  schedule+0xd2/0x260 kernel/sched/core.c:6368
>  schedule_timeout+0x1db/0x2a0 kernel/time/timer.c:1857
>  do_wait_for_common kernel/sched/completion.c:85 [inline]
>  __wait_for_common kernel/sched/completion.c:106 [inline]
>  wait_for_common kernel/sched/completion.c:117 [inline]
>  wait_for_completion+0x174/0x270 kernel/sched/completion.c:138
>  vhost_work_dev_flush.part.0+0xbb/0xf0 drivers/vhost/vhost.c:243
>  vhost_work_dev_flush drivers/vhost/vhost.c:238 [inline]
>  vhost_poll_flush+0x5e/0x80 drivers/vhost/vhost.c:252
>  vhost_vsock_flush drivers/vhost/vsock.c:710 [inline]
>  vhost_vsock_dev_release+0x1be/0x4b0 drivers/vhost/vsock.c:757
>  __fput+0x286/0x9f0 fs/file_table.c:311
>  task_work_run+0xdd/0x1a0 kernel/task_work.c:164
>  exit_task_work include/linux/task_work.h:32 [inline]
>  do_exit+0xb29/0x2a30 kernel/exit.c:806
>  do_group_exit+0xd2/0x2f0 kernel/exit.c:935
>  __do_sys_exit_group kernel/exit.c:946 [inline]
>  __se_sys_exit_group kernel/exit.c:944 [inline]
>  __x64_sys_exit_group+0x3a/0x50 kernel/exit.c:944
>  do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>  do_syscall_64+0x35/0xb0 arch/x86/entry/common.c:80
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7fbf04b83b89
> RSP: 002b:00007fff5bc9ca18 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> RAX: ffffffffffffffda RBX: 00007fbf04bf8330 RCX: 00007fbf04b83b89
> RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffffffffffc0 R09: 00007fff5bc9cc08
> R10: 00007fff5bc9cc08 R11: 0000000000000246 R12: 00007fbf04bf8330
> R13: 0000000000000001 R14: 0000000000000000 R15: 0000000000000001
>  </TASK>
>
> Showing all locks held in the system:
> 1 lock held by khungtaskd/26:
>  #0: ffffffff8bb83c20 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:6460
> 2 locks held by getty/3275:
>  #0: ffff88807f0db098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:244
>  #1: ffffc90002b662e8 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xcf0/0x1230 drivers/tty/n_tty.c:2077
> 1 lock held by vhost-3632/3633:
>
> =============================================
>
> NMI backtrace for cpu 0
> CPU: 0 PID: 26 Comm: khungtaskd Not tainted 5.17.0-rc3-syzkaller-00029-ge6251ab4551f #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:88 [inline]
>  dump_stack_lvl+0xcd/0x134 lib/dump_stack.c:106
>  nmi_cpu_backtrace.cold+0x47/0x144 lib/nmi_backtrace.c:111
>  nmi_trigger_cpumask_backtrace+0x1b3/0x230 lib/nmi_backtrace.c:62
>  trigger_all_cpu_backtrace include/linux/nmi.h:146 [inline]
>  check_hung_uninterruptible_tasks kernel/hung_task.c:212 [inline]
>  watchdog+0xc1d/0xf50 kernel/hung_task.c:369
>  kthread+0x2e9/0x3a0 kernel/kthread.c:377
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
>  </TASK>
> Sending NMI from CPU 0 to CPUs 1:
> NMI backtrace for cpu 1
> CPU: 1 PID: 3633 Comm: vhost-3632 Not tainted 5.17.0-rc3-syzkaller-00029-ge6251ab4551f #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:check_kcov_mode kernel/kcov.c:166 [inline]
> RIP: 0010:__sanitizer_cov_trace_pc+0xd/0x60 kernel/kcov.c:200
> Code: 00 00 e9 c6 41 66 02 66 0f 1f 44 00 00 48 8b be b0 01 00 00 e8 b4 ff ff ff 31 c0 c3 90 65 8b 05 29 f7 89 7e 89 c1 48 8b 34 24 <81> e1 00 01 00 00 65 48 8b 14 25 00 70 02 00 a9 00 01 ff 00 74 0e
> RSP: 0018:ffffc90000cd7c78 EFLAGS: 00000246
> RAX: 0000000080000000 RBX: ffff888079ca8a80 RCX: 0000000080000000
> RDX: 0000000000000000 RSI: ffffffff86d3f8fb RDI: 0000000000000003
> RBP: 0000000000000000 R08: 0000000000000000 R09: ffffc90000cd7c77
> R10: ffffffff86d3f8ed R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000000
> FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ffdf716a3b8 CR3: 00000000235b6000 CR4: 00000000003506e0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  iotlb_access_ok+0x21b/0x3e0 drivers/vhost/vhost.c:1340
>  vq_meta_prefetch+0xbc/0x280 drivers/vhost/vhost.c:1366
>  vhost_transport_do_send_pkt+0xe0/0xfd0 drivers/vhost/vsock.c:104
>  vhost_worker+0x23d/0x3d0 drivers/vhost/vhost.c:372
>  kthread+0x2e9/0x3a0 kernel/kthread.c:377
>  ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
>  </TASK>
> ----------------
> Code disassembly (best guess):
>    0:   00 00                   add    %al,(%rax)
>    2:   e9 c6 41 66 02          jmpq   0x26641cd
>    7:   66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
>    d:   48 8b be b0 01 00 00    mov    0x1b0(%rsi),%rdi
>   14:   e8 b4 ff ff ff          callq  0xffffffcd
>   19:   31 c0                   xor    %eax,%eax
>   1b:   c3                      retq
>   1c:   90                      nop
>   1d:   65 8b 05 29 f7 89 7e    mov    %gs:0x7e89f729(%rip),%eax        # 0x7e89f74d
>   24:   89 c1                   mov    %eax,%ecx
>   26:   48 8b 34 24             mov    (%rsp),%rsi
> * 2a:   81 e1 00 01 00 00       and    $0x100,%ecx <-- trapping instruction
>   30:   65 48 8b 14 25 00 70    mov    %gs:0x27000,%rdx
>   37:   02 00
>   39:   a9 00 01 ff 00          test   $0xff0100,%eax
>   3e:   74 0e                   je     0x4e
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> syzbot can test patches for this issue, for details see:
> https://goo.gl/tpsmEJ#testing-patches
>

--00000000000093299305d887d3e9
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-vhost-vsock-don-t-check-owner-in-vhost_vsock_stop-wh.patch"
Content-Disposition: attachment; 
	filename="0001-vhost-vsock-don-t-check-owner-in-vhost_vsock_stop-wh.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kzws2la30>
X-Attachment-Id: f_kzws2la30

RnJvbSA0OTUxMTEyYmY5OGQzZTEwZDNlOTU1Nzk4NmU1Y2E1NDE5Y2E3MzhmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdGVmYW5vIEdhcnphcmVsbGEgPHNnYXJ6YXJlQHJlZGhhdC5j
b20+CkRhdGU6IE1vbiwgMjEgRmViIDIwMjIgMTE6MDc6NDkgKzAxMDAKU3ViamVjdDogW1BBVENI
XSB2aG9zdC92c29jazogZG9uJ3QgY2hlY2sgb3duZXIgaW4gdmhvc3RfdnNvY2tfc3RvcCgpIHdo
aWxlCiByZWxlYXNpbmcKCnZob3N0X3Zzb2NrX3N0b3AoKSBjYWxscyB2aG9zdF9kZXZfY2hlY2tf
b3duZXIoKSB0byBjaGVjayB0aGUgZGV2aWNlCm93bmVyc2hpcC4gSXQgZXhwZWN0cyBjdXJyZW50
LT5tbSB0byBiZSB2YWxpZC4KCnZob3N0X3Zzb2NrX3N0b3AoKSBpcyBhbHNvIGNhbGxlZCBieSB2
aG9zdF92c29ja19kZXZfcmVsZWFzZSgpIHdoZW4KdGhlIHVzZXIgaGFzIG5vdCBkb25lIGNsb3Nl
KCksIHNvIHdoZW4gd2UgYXJlIGluIGRvX2V4aXQoKS4gSW4gdGhpcwpjYXNlIGN1cnJlbnQtPm1t
IGlzIGludmFsaWQgYW5kIHdlJ3JlIHJlbGVhc2luZyB0aGUgZGV2aWNlLCBzbyB3ZQpzaG91bGQg
Y2xlYW4gaXQgYW55d2F5LgoKTGV0J3MgY2hlY2sgdGhlIG93bmVyIG9ubHkgd2hlbiB2aG9zdF92
c29ja19zdG9wKCkgaXMgY2FsbGVkCmJ5IGFuIGlvY3RsLgoKRml4ZXM6IDQzM2ZjNThlNmJmMiAo
IlZTT0NLOiBJbnRyb2R1Y2Ugdmhvc3RfdnNvY2sua28iKQpDYzogc3RhYmxlQHZnZXIua2VybmVs
Lm9yZwpSZXBvcnRlZC1ieTogc3l6Ym90KzFlM2VhNjNkYjM5ZjJiNDQ0MGUwQHN5emthbGxlci5h
cHBzcG90bWFpbC5jb20KU2lnbmVkLW9mZi1ieTogU3RlZmFubyBHYXJ6YXJlbGxhIDxzZ2FyemFy
ZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvdmhvc3QvdnNvY2suYyB8IDE0ICsrKysrKysrLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmhvc3QvdnNvY2suYyBiL2RyaXZlcnMvdmhvc3QvdnNvY2suYwpp
bmRleCBkNmNhMWM3YWQ1MTMuLmYwMGQyZGZkNzJiNyAxMDA2NDQKLS0tIGEvZHJpdmVycy92aG9z
dC92c29jay5jCisrKyBiL2RyaXZlcnMvdmhvc3QvdnNvY2suYwpAQCAtNjI5LDE2ICs2MjksMTgg
QEAgc3RhdGljIGludCB2aG9zdF92c29ja19zdGFydChzdHJ1Y3Qgdmhvc3RfdnNvY2sgKnZzb2Nr
KQogCXJldHVybiByZXQ7CiB9CiAKLXN0YXRpYyBpbnQgdmhvc3RfdnNvY2tfc3RvcChzdHJ1Y3Qg
dmhvc3RfdnNvY2sgKnZzb2NrKQorc3RhdGljIGludCB2aG9zdF92c29ja19zdG9wKHN0cnVjdCB2
aG9zdF92c29jayAqdnNvY2ssIGJvb2wgY2hlY2tfb3duZXIpCiB7CiAJc2l6ZV90IGk7CiAJaW50
IHJldDsKIAogCW11dGV4X2xvY2soJnZzb2NrLT5kZXYubXV0ZXgpOwogCi0JcmV0ID0gdmhvc3Rf
ZGV2X2NoZWNrX293bmVyKCZ2c29jay0+ZGV2KTsKLQlpZiAocmV0KQotCQlnb3RvIGVycjsKKwlp
ZiAoY2hlY2tfb3duZXIpIHsKKwkJcmV0ID0gdmhvc3RfZGV2X2NoZWNrX293bmVyKCZ2c29jay0+
ZGV2KTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gZXJyOworCX0KIAogCWZvciAoaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKHZzb2NrLT52cXMpOyBpKyspIHsKIAkJc3RydWN0IHZob3N0X3ZpcnRxdWV1ZSAq
dnEgPSAmdnNvY2stPnZxc1tpXTsKQEAgLTc1Myw3ICs3NTUsNyBAQCBzdGF0aWMgaW50IHZob3N0
X3Zzb2NrX2Rldl9yZWxlYXNlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxl
KQogCSAqIGluZWZmaWNpZW50LiAgUm9vbSBmb3IgaW1wcm92ZW1lbnQgaGVyZS4gKi8KIAl2c29j
a19mb3JfZWFjaF9jb25uZWN0ZWRfc29ja2V0KHZob3N0X3Zzb2NrX3Jlc2V0X29ycGhhbnMpOwog
Ci0Jdmhvc3RfdnNvY2tfc3RvcCh2c29jayk7CisJdmhvc3RfdnNvY2tfc3RvcCh2c29jaywgZmFs
c2UpOwogCXZob3N0X3Zzb2NrX2ZsdXNoKHZzb2NrKTsKIAl2aG9zdF9kZXZfc3RvcCgmdnNvY2st
PmRldik7CiAKQEAgLTg2OCw3ICs4NzAsNyBAQCBzdGF0aWMgbG9uZyB2aG9zdF92c29ja19kZXZf
aW9jdGwoc3RydWN0IGZpbGUgKmYsIHVuc2lnbmVkIGludCBpb2N0bCwKIAkJaWYgKHN0YXJ0KQog
CQkJcmV0dXJuIHZob3N0X3Zzb2NrX3N0YXJ0KHZzb2NrKTsKIAkJZWxzZQotCQkJcmV0dXJuIHZo
b3N0X3Zzb2NrX3N0b3AodnNvY2spOworCQkJcmV0dXJuIHZob3N0X3Zzb2NrX3N0b3AodnNvY2ss
IHRydWUpOwogCWNhc2UgVkhPU1RfR0VUX0ZFQVRVUkVTOgogCQlmZWF0dXJlcyA9IFZIT1NUX1ZT
T0NLX0ZFQVRVUkVTOwogCQlpZiAoY29weV90b191c2VyKGFyZ3AsICZmZWF0dXJlcywgc2l6ZW9m
KGZlYXR1cmVzKSkpCi0tIAoyLjM1LjEKCg==
--00000000000093299305d887d3e9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
--00000000000093299305d887d3e9--

