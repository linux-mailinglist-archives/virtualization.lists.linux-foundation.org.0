Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5E15210E4
	for <lists.virtualization@lfdr.de>; Tue, 10 May 2022 11:29:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 558C140223;
	Tue, 10 May 2022 09:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcb_mo_psr-o; Tue, 10 May 2022 09:29:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 10AB540408;
	Tue, 10 May 2022 09:29:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 967B0C0081;
	Tue, 10 May 2022 09:29:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48C11C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 09:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A0E060E6A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 09:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GEdIFT-rxOEs
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 09:29:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12DFC60701
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 May 2022 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652174975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dBN8OqT32wAVA1vLxVE8MyhBep8hnWJXY92euzRr0/k=;
 b=aiAL0sWeJKgsBAlOF7ambXALMaqT4oORnbxXWO2Ie7nrnQIL3lNrK9uw1PQFKRoYJRpxk0
 okscp+SNPaVybNXgcGU2UHEmLz7GrzoQIlLSy1cjZaHyN/9AmruROSU+IgexX8B5mV6+DN
 b5dSf8VifTZP26DcLIuhmDLKCgOn9TM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-XbCL79E6MJadEnJwsh7nzw-1; Tue, 10 May 2022 05:29:32 -0400
X-MC-Unique: XbCL79E6MJadEnJwsh7nzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 50B301C06EC0;
 Tue, 10 May 2022 09:29:32 +0000 (UTC)
Received: from localhost (dhcp-192-194.str.redhat.com [10.33.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D8E3E146894F;
 Tue, 10 May 2022 09:29:31 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Jason Wang <jasowang@redhat.com>, jasowang@redhat.com, mst@redhat.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 0/9] rework on the IRQ hardening of virtio
In-Reply-To: <20220507071954.14455-1-jasowang@redhat.com>
Organization: Red Hat GmbH
References: <20220507071954.14455-1-jasowang@redhat.com>
User-Agent: Notmuch/0.34 (https://notmuchmail.org)
Date: Tue, 10 May 2022 11:29:30 +0200
Message-ID: <875ymd3fd1.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Cc: lulu@redhat.com, paulmck@kernel.org, peterz@infradead.org, maz@kernel.org,
 pasic@linux.ibm.com, eperezma@redhat.com, tglx@linutronix.de
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

On Sat, May 07 2022, Jason Wang <jasowang@redhat.com> wrote:

> Hi All:
>
> This is a rework on the IRQ hardening for virtio which is done
> previously by the following commits are reverted:
>
> 9e35276a5344 ("virtio_pci: harden MSI-X interrupts")
> 080cd7c3ac87 ("virtio-pci: harden INTX interrupts")
>
> The reason is that it depends on the IRQF_NO_AUTOEN which may conflict
> with the assumption of the affinity managed IRQ that is used by some
> virtio drivers. And what's more, it is only done for virtio-pci but
> not other transports.
>
> In this rework, I try to implement a general virtio solution which
> borrows the idea of the INTX hardening by re-using per virtqueue
> boolean vq->broken and toggle it in virtio_device_ready() and
> virtio_reset_device(). Then we can simply reuse the existing checks in
> the vring_interrupt() and return early if the driver is not ready.
>
> Note that, I only did compile test on ccw and MMIO transport.

Lockdep is unhappy with the ccw parts:

================================
WARNING: inconsistent lock state
5.18.0-rc6+ #191 Not tainted
--------------------------------
inconsistent {IN-HARDIRQ-R} -> {HARDIRQ-ON-W} usage.
kworker/u4:0/9 [HC0[0]:SC0[0]:HE1:SE1] takes:
00000000058e9618 (&vcdev->irq_lock){+-..}-{2:2}, at: virtio_ccw_synchronize_cbs+0x4e/0x60
{IN-HARDIRQ-R} state was registered at:
  __lock_acquire+0x442/0xc20
  lock_acquire.part.0+0xdc/0x228
  lock_acquire+0xa6/0x1b0
  _raw_read_lock_irqsave+0x72/0x100
  virtio_ccw_int_handler+0x84/0x238
  ccw_device_call_handler+0x72/0xd0
  ccw_device_irq+0x7a/0x198
  do_cio_interrupt+0x11c/0x1d0
  __handle_irq_event_percpu+0xc2/0x318
  handle_irq_event_percpu+0x26/0x68
  handle_percpu_irq+0x64/0x88
  generic_handle_irq+0x40/0x58
  do_irq_async+0x56/0xb0
  do_io_irq+0x82/0x160
  io_int_handler+0xe6/0x120
  rcu_read_lock_sched_held+0x3e/0xb0
  lock_acquired+0x12e/0x208
  new_inode+0x3e/0xd0
  debugfs_get_inode+0x22/0x68
  __debugfs_create_file+0x78/0x1c0
  debugfs_create_file_unsafe+0x36/0x58
  debugfs_create_u32+0x38/0x68
  sched_init_debug+0xb0/0x1c0
  do_one_initcall+0x108/0x280
  do_initcalls+0x124/0x148
  kernel_init_freeable+0x242/0x280
  kernel_init+0x2e/0x158
  __ret_from_fork+0x3c/0x50
  ret_from_fork+0xa/0x40
irq event stamp: 539789
hardirqs last  enabled at (539789): [<0000000000d9c632>] _raw_spin_unlock_irqrestore+0x72/0x88
hardirqs last disabled at (539788): [<0000000000d9c2b6>] _raw_spin_lock_irqsave+0x96/0xd0
softirqs last  enabled at (539568): [<0000000000d9e0d4>] __do_softirq+0x434/0x588
softirqs last disabled at (539503): [<000000000018cd66>] __irq_exit_rcu+0x146/0x170

other info that might help us debug this:
 Possible unsafe locking scenario:

       CPU0
       ----
  lock(&vcdev->irq_lock);
  <Interrupt>
    lock(&vcdev->irq_lock);

 *** DEADLOCK ***

2 locks held by kworker/u4:0/9:
 #0: 000000000288d948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1ea/0x658
 #1: 000003800004bdc8 ((work_completion)(&entry->work)){+.+.}-{0:0}, at: process_one_work+0x1ea/0x658

stack backtrace:
CPU: 1 PID: 9 Comm: kworker/u4:0 Not tainted 5.18.0-rc6+ #191
Hardware name: QEMU 8561 QEMU (KVM/Linux)
Workqueue: events_unbound async_run_entry_fn
Call Trace:
 [<0000000000d8af22>] dump_stack_lvl+0x92/0xd0 
 [<00000000002032ac>] mark_lock_irq+0x864/0x968 
 [<0000000000203670>] mark_lock.part.0+0x2c0/0x790 
 [<0000000000203cea>] mark_usage+0x10a/0x178 
 [<000000000020692a>] __lock_acquire+0x442/0xc20 
 [<0000000000207cc4>] lock_acquire.part.0+0xdc/0x228 
 [<0000000000207eb6>] lock_acquire+0xa6/0x1b0 
 [<0000000000d9c774>] _raw_write_lock+0x54/0xa8 
 [<0000000000d5a1f6>] virtio_ccw_synchronize_cbs+0x4e/0x60 
 [<00000000008eec04>] register_virtio_device+0xdc/0x1b0 
 [<0000000000d5aabe>] virtio_ccw_online+0x246/0x2e8 
 [<0000000000c9fecc>] ccw_device_set_online+0x1c4/0x540 
 [<0000000000d5a05e>] virtio_ccw_auto_online+0x26/0x50 
 [<00000000001ba2b0>] async_run_entry_fn+0x40/0x108 
 [<00000000001ab9b4>] process_one_work+0x2a4/0x658 
 [<00000000001abdd0>] worker_thread+0x68/0x440 
 [<00000000001b4668>] kthread+0x128/0x130 
 [<0000000000102fac>] __ret_from_fork+0x3c/0x50 
 [<0000000000d9d3aa>] ret_from_fork+0xa/0x40 
INFO: lockdep is turned off.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
