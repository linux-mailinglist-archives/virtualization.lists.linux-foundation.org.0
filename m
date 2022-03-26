Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A474E7E54
	for <lists.virtualization@lfdr.de>; Sat, 26 Mar 2022 02:03:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 199C260BEC;
	Sat, 26 Mar 2022 01:02:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 626dx1vhScU6; Sat, 26 Mar 2022 01:02:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A9A6160BEA;
	Sat, 26 Mar 2022 01:02:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D273DC0073;
	Sat, 26 Mar 2022 01:02:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E800C0012
 for <virtualization@lists.linux-foundation.org>;
 Sat, 26 Mar 2022 01:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 55CC441996
 for <virtualization@lists.linux-foundation.org>;
 Sat, 26 Mar 2022 01:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATOLyd32EZT5
 for <virtualization@lists.linux-foundation.org>;
 Sat, 26 Mar 2022 01:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24F6F41990
 for <virtualization@lists.linux-foundation.org>;
 Sat, 26 Mar 2022 01:02:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 685EFB82A9B;
 Sat, 26 Mar 2022 01:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65D6DC2BBE4;
 Sat, 26 Mar 2022 01:02:49 +0000 (UTC)
Date: Fri, 25 Mar 2022 21:02:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] virtio: Workaround fix for hard hang on guest using fifos
Message-ID: <20220325210247.0d695ab6@gandalf.local.home>
In-Reply-To: <CAHk-=wjTL=vz2PC7=dFZVrT=9nuBtZ21j_qT8e=yHvVuXvhCdg@mail.gmail.com>
References: <20220325172036.3f8f619e@gandalf.local.home>
 <CAHk-=wjTL=vz2PC7=dFZVrT=9nuBtZ21j_qT8e=yHvVuXvhCdg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 virtualization@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>
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

On Fri, 25 Mar 2022 17:36:27 -0700
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Fri, Mar 25, 2022 at 2:20 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > With the updates to change the size being passed in the splice from
> > page_size to pipe_size, this never finished (it would copy around a meg or
> > so). And stopped. When I killed the agent-fifo task on the guest, the guest
> > hung hard.  
> 
> Without knowing (or really caring) at all how virtqueue works, this
> sounds very much like the classic pipe deadlock where two processes
> communicate over a pair of pipes, sending each other commands, and
> replying to each other with status updates.

It does look like this. Note, this is not due to my application, since it
flows in one direction, but I think the way virtio pipes are implemented
can cause this to occur.

A virtio pipe on the guest looks like a normal bidirectional char device.
You open it, read it, write to it. No problem. On the host, there are two
FIFOs that are attached to the guest. One for each direction. That is, the
host is using two pipes that convert to a character device on the guest.

> 
> And you absolutely cannot do that if one side can possibly want to up
> fill the whole pipe.
> 
> Deadlock:
> 
>  - process A is trying to send data to process B (on 'pipe_A'), and
> blocks because the pipe is full
> 
>  - process B is reads the data and everything is fine, and A gets to continue
> 

I think you left out a step here, where A is blocked again.

>  - but then process B sends some stratus update the other way (on
> 'pipe_B' - you can't use the same pipe for bidirectional, it's why you
> use a pair of pipes or a socketpair) and waits for the result.
> 
>  - now A and B are both waiting for each other - A is waiting for B to
> empty the big bunch of data it's sending, and B is waiting for the
> result for the (small) command it sent.
> 
> and neither makes any progress.
> 
> You can find several mentions of these kinds of problems by just
> googling for "bidirectional pipe deadlock" or similar.
> 
> The solution is invariably to either
> 
>  (a) make sure that nobody writes even remotely close to enough data
> to fill a pipe before reading the other pipe (you can still fill up a
> pipe, but at least somebody is always going to succeed and make
> progress and do the read to make progress).
> 
>  (b) make sure everybody who writes to a pipe will use nonblocking IO
> (and is willing to do reads in between to satisfy the other end).
> 
> That first case is basically what one of the PIPE_BUF guarantees is
> all about (the other one is the atomicity it guarantees, ie you can
> write a "command packet" and be guaranteed that readers will see it
> without data mixed in from other writes).
> 
> I have no idea what your client/agent does and how it interacts with
> the virtio pipes, but it really _sounds_ like a very similar issue,
> where it used to work (because PIPE_BUF) and now no longer does
> (because pipe filled).

So the agent writes to the virtio char device on the guest, while the
client is reading the guest's FIFO on the host.

One directional.


> 
> And that virtio_console __send_control_msg() pattern very much sounds
> like a "send data and wait for ACK" behavior of "process B".

Something happens where data stops transferring (the virtio system waiting
for status?) This mostly happens when I run the agent under gdb. Which it
stops transferring data. Everything is still fine. I hit Ctrl^C twice to
get back to the gdb command prompt, and then I kill the process with the
gdb "kill" command. It asks me if I'm sure, I type "y", and then boom! The
system is hung. The guest locks up.

And printk()s show that the exit of the agent is in that loop.

 watchdog: BUG: soft lockup - CPU#0 stuck for 26s! [agent-test:1165]
 Modules linked in: ip6table_filter ip6_tables ebtable_nat ebtables bnep bluetooth ecdh_generic ecc cfg80211 rfkill cirrus drm_shmem_helper drm_kms_helper vmw_vsock_virtio_transport vmw_vsock_virtio_transport_common pcspkr joydev serio_raw vsock virtio_console drm virtio_balloon 8139too i2c_piix4 floppy nfsd auth_rpcgss nfs_acl lockd grace sunrpc virtio_net net_failover failover virtio_pci virtio virtio_pci_legacy_dev virtio_pci_modern_dev virtio_ring 8139cp mii ata_generic pata_acpi
 CPU: 0 PID: 1165 Comm: agent-test Not tainted 5.17.0-test+ #41
 Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011
 RIP: 0010:virtqueue_get_buf_ctx_split+0x0/0xd0 [virtio_ring]
 Code: 75 a6 45 31 e4 39 45 2c 74 e6 0f 0b 83 c6 01 48 83 c2 10 39 c6 75 b4 45 31 e4 39 45 2c 74 d1 0f 0b 66 0f 1f 84 00 00 00 00 00 <0f> 1f 44 00 00 41 54 53 80 7f 3b 00 0f 85 9a 00 00 00 48 8b 47 68
 RSP: 0018:ffffb85c012e7c68 EFLAGS: 00000246
 RAX: 0000000000000000 RBX: ffff951705171300 RCX: 0000000000000000
 RDX: 0000000000000000 RSI: ffffb85c012e7c74 RDI: ffff951705171e40
 RBP: ffff951705171e40 R08: ffffffffae733288 R09: 0000000000009ffb
 R10: 00000000000002a1 R11: ffffffffae7032a0 R12: ffff951705171388
 R13: ffff951705171368 R14: 0000000000000006 R15: 0000000000000001
 FS:  0000000000000000(0000) GS:ffff95173d400000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00007f0c8aa2f000 CR3: 000000000e60a000 CR4: 00000000000006f0
 Call Trace:
  <TASK>
  __send_control_msg.part.0+0xdd/0xf0 [virtio_console]
  port_fops_release+0x10e/0x130 [virtio_console]
  __fput+0x8c/0x240
  task_work_run+0x5c/0x90
  do_exit+0x32a/0xb20
  do_group_exit+0x2d/0x90
  get_signal+0x10e/0xa40
  arch_do_signal_or_restart+0x109/0x740
  ? kick_process+0x46/0x70
  ? __send_signal+0x2b2/0x400
  ? send_signal+0x3f/0x130
  exit_to_user_mode_prepare+0xf0/0x1c0
  syscall_exit_to_user_mode+0x17/0x30
  do_syscall_64+0x48/0x90
  entry_SYSCALL_64_after_hwframe+0x44/0xae
 RIP: 0033:0x35878f5603
 Code: Unable to access opcode bytes at RIP 0x35878f55d9.
 RSP: 002b:00007fffffffe878 EFLAGS: 00000246 ORIG_RAX: 0000000000000113
 RAX: fffffffffffffe00 RBX: 0000000000000000 RCX: 00000035878f5603
 RDX: 0000000000000006 RSI: 0000000000000000 RDI: 0000000000000004
 RBP: 00007fffffffe9c0 R08: 0000000000007fff R09: 0000000000000003
 R10: 0000000000000000 R11: 0000000000000346 R12: 0000000000400df0
 R13: 00007fffffffeaa0 R14: 0000000000000000 R15: 0000000000000000

-- Steve
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
