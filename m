Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E557267A02A
	for <lists.virtualization@lfdr.de>; Tue, 24 Jan 2023 18:30:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF984186B;
	Tue, 24 Jan 2023 17:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF984186B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AETW0T8A-sPh; Tue, 24 Jan 2023 17:30:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B958041864;
	Tue, 24 Jan 2023 17:30:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B958041864
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E73C7C007C;
	Tue, 24 Jan 2023 17:30:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5EACCC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Jan 2023 17:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E25A820C6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Jan 2023 17:30:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E25A820C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjJ6bq0DZ6Sq
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Jan 2023 17:30:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70B2820B9
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70B2820B9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Jan 2023 17:30:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2BC44B3;
 Tue, 24 Jan 2023 09:31:18 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.11.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B1023F64C;
 Tue, 24 Jan 2023 09:30:32 -0800 (PST)
Date: Tue, 24 Jan 2023 17:30:29 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 0/6] A few cpuidle vs rcu fixes
Message-ID: <Y9AVtUY8bnF3WjQr@FVFF77S0Q05N>
References: <20230123205009.790550642@infradead.org>
 <Y9AIj1s5iPPki3dK@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9AIj1s5iPPki3dK@FVFF77S0Q05N>
Cc: juri.lelli@redhat.com, daniel.lezcano@linaro.org, wanpengli@tencent.com,
 kvm@vger.kernel.org, rafael@kernel.org, pv-drivers@vmware.com,
 dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org,
 bsegall@google.com, amakhalov@vmware.com, will@kernel.org, vschneid@redhat.com,
 hpa@zytor.com, x86@kernel.org, mingo@kernel.org, mgorman@suse.de,
 linux-trace-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 boqun.feng@gmail.com, rostedt@goodmis.org, bp@alien8.de,
 vincent.guittot@linaro.org, boris.ostrovsky@oracle.com,
 dietmar.eggemann@arm.com, jgross@suse.com, seanjc@google.com,
 linux-kernel@vger.kernel.org, tglx@linutronix.de, mhiramat@kernel.org,
 pbonzini@redhat.com, bristot@redhat.com
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

On Tue, Jan 24, 2023 at 04:34:23PM +0000, Mark Rutland wrote:
> Hi Peter,
> 
> On Mon, Jan 23, 2023 at 09:50:09PM +0100, Peter Zijlstra wrote:
> > 0-day robot reported graph-tracing made the cpuidle-vs-rcu rework go splat.
> 
> Do you have a link toe the splat somewhere?
> 
> I'm assuming that this is partially generic, and I'd like to make sure I test
> the right thing on arm64. I'll throw my usual lockdep options at the ftrace
> selftests...

Hmm... with the tip sched/core branch, with or without this series applied atop
I see a couple of splats which I don't see with v6.2-rc1 (which seems to be
entirely clean). I'm not seeing any other splats.

I can trigger those reliably with the 'toplevel-enable.tc' ftrace test:

  ./ftracetest test.d/event/toplevel-enable.tc

Splats below; I'll dig into this a bit more tomorrow.

[   65.729252] ------------[ cut here ]------------
[   65.730397] WARNING: CPU: 3 PID: 1162 at include/trace/events/preemptirq.h:55 trace_preempt_on+0x68/0x70
[   65.732450] Modules linked in:
[   65.733204] CPU: 3 PID: 1162 Comm: ftracetest Not tainted 6.2.0-rc1-00100-g1066815869f5 #2
[   65.735165] Hardware name: linux,dummy-virt (DT)
[   65.736278] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   65.737929] pc : trace_preempt_on+0x68/0x70
[   65.738962] lr : preempt_count_sub+0xb4/0xf0
[   65.739998] sp : ffff80000e03ba70
[   65.740818] x29: ffff80000e03ba70 x28: ffff80000add07e8 x27: ffff800009d0b548
[   65.742531] x26: ffff00000742dd10 x25: ffff00000742dd00 x24: ffff80000ade11d0
[   65.744246] x23: ffff80000e03bb80 x22: ffff80000a99abb0 x21: ffff8000080a5cf4
[   65.745957] x20: ffff8000080a5cf4 x19: 0000000000000001 x18: 0000000000000000
[   65.747677] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   65.749388] x14: 0000000000000028 x13: 00000000000042d7 x12: 000000000000035f
[   65.751105] x11: 000000000000035f x10: 000000000004035f x9 : ffff8000080a5cf4
[   65.752820] x8 : ffff80000ae31a18 x7 : 0000000000000000 x6 : 0000000000000001
[   65.754526] x5 : ffff80000a8e14e8 x4 : 0000000000000003 x3 : 0000000000000000
[   65.756244] x2 : 0000000000000001 x1 : ffff8000080a5cf4 x0 : ffff8000080a5cf4
[   65.757957] Call trace:
[   65.758572]  trace_preempt_on+0x68/0x70
[   65.759520]  preempt_count_sub+0xb4/0xf0
[   65.760477]  percpu_up_read.constprop.0+0xc4/0x180
[   65.761639]  cpus_read_unlock+0x18/0x24
[   65.762579]  static_key_enable+0x2c/0x40
[   65.763572]  tracepoint_add_func+0x330/0x3dc
[   65.764611]  tracepoint_probe_register+0x74/0xc0
[   65.765725]  trace_event_reg+0x8c/0xa0
[   65.766642]  __ftrace_event_enable_disable+0x174/0x4d0
[   65.767884]  __ftrace_set_clr_event_nolock+0xe0/0x150
[   65.769109]  ftrace_set_clr_event+0x90/0x13c
[   65.770143]  ftrace_event_write+0xd4/0x120
[   65.771145]  vfs_write+0xcc/0x2f0
[   65.771964]  ksys_write+0x78/0x110
[   65.772803]  __arm64_sys_write+0x24/0x30
[   65.773763]  invoke_syscall+0x50/0x120
[   65.774681]  el0_svc_common.constprop.0+0x68/0x124
[   65.775848]  do_el0_svc+0x40/0xbc
[   65.776669]  el0_svc+0x48/0xc0
[   65.777426]  el0t_64_sync_handler+0xf4/0x120
[   65.778459]  el0t_64_sync+0x190/0x194
[   65.779365] irq event stamp: 69686
[   65.780199] hardirqs last  enabled at (69685): [<ffff8000092d5664>] _raw_spin_unlock_irqrestore+0x80/0xa0
[   65.782457] hardirqs last disabled at (69686): [<ffff8000092c3fd4>] el1_dbg+0x24/0x90
[   65.784315] softirqs last  enabled at (69622): [<ffff800008010b08>] __do_softirq+0x448/0x5bc
[   65.786309] softirqs last disabled at (69613): [<ffff800008017288>] ____do_softirq+0x18/0x24
[   65.788332] ---[ end trace 0000000000000000 ]---
[   65.789588] ------------[ cut here ]------------
[   65.790622] WARNING: CPU: 3 PID: 1162 at include/trace/events/preemptirq.h:51 trace_preempt_off+0x68/0xb0
[   65.792698] Modules linked in:
[   65.793465] CPU: 3 PID: 1162 Comm: ftracetest Tainted: G        W          6.2.0-rc1-00100-g1066815869f5 #2
[   65.795780] Hardware name: linux,dummy-virt (DT)
[   65.796898] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   65.798555] pc : trace_preempt_off+0x68/0xb0
[   65.799602] lr : preempt_count_add+0xa0/0xc0
[   65.800646] sp : ffff80000e03ba80
[   65.801465] x29: ffff80000e03ba80 x28: ffff80000add07e8 x27: ffff800009d0b558
[   65.803185] x26: ffff00000742dd90 x25: ffff00000742dd80 x24: ffff80000ade1188
[   65.804900] x23: ffff80000e03bb80 x22: ffff80000a99abb0 x21: ffff80000b8b7d18
[   65.806612] x20: ffff8000080a5c68 x19: ffff8000080a5c68 x18: 0000000000000000
[   65.808334] x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
[   65.810041] x14: 0000000000000028 x13: 00000000000042d7 x12: 000000000000035f
[   65.811755] x11: 000000000000035f x10: 000000000004035f x9 : ffff8000080a5c68
[   65.813460] x8 : ffff80000ae31a18 x7 : 0000000000000000 x6 : 0000000000000003
[   65.815174] x5 : 0000000030b5c3ca x4 : 0000000000000003 x3 : 0000000000000000
[   65.816886] x2 : 0000000000000001 x1 : ffff8000080a5c68 x0 : ffff8000080a5c68
[   65.818592] Call trace:
[   65.819216]  trace_preempt_off+0x68/0xb0
[   65.820171]  preempt_count_add+0xa0/0xc0
[   65.821131]  percpu_up_read.constprop.0+0x38/0x180
[   65.822288]  cpus_read_unlock+0x18/0x24
[   65.823236]  static_key_enable+0x2c/0x40
[   65.824194]  tracepoint_add_func+0x330/0x3dc
[   65.825236]  tracepoint_probe_register+0x74/0xc0
[   65.826351]  trace_event_reg+0x8c/0xa0
[   65.827276]  __ftrace_event_enable_disable+0x174/0x4d0
[   65.828506]  __ftrace_set_clr_event_nolock+0xe0/0x150
[   65.829721]  ftrace_set_clr_event+0x90/0x13c
[   65.830769]  ftrace_event_write+0xd4/0x120
[   65.831766]  vfs_write+0xcc/0x2f0
[   65.832581]  ksys_write+0x78/0x110
[   65.833422]  __arm64_sys_write+0x24/0x30
[   65.834376]  invoke_syscall+0x50/0x120
[   65.835300]  el0_svc_common.constprop.0+0x68/0x124
[   65.836451]  do_el0_svc+0x40/0xbc
[   65.837290]  el0_svc+0x48/0xc0
[   65.838054]  el0t_64_sync_handler+0xf4/0x120
[   65.839102]  el0t_64_sync+0x190/0x194
[   65.840006] irq event stamp: 69710
[   65.840845] hardirqs last  enabled at (69709): [<ffff8000092c4028>] el1_dbg+0x78/0x90
[   65.842699] hardirqs last disabled at (69710): [<ffff8000092c3fd4>] el1_dbg+0x24/0x90
[   65.844568] softirqs last  enabled at (69694): [<ffff800008010b08>] __do_softirq+0x448/0x5bc
[   65.846573] softirqs last disabled at (69689): [<ffff800008017288>] ____do_softirq+0x18/0x24
[   65.848578] ---[ end trace 0000000000000000 ]---

Thanks,
Mark.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
