Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402E55BAEB
	for <lists.virtualization@lfdr.de>; Mon, 27 Jun 2022 17:59:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F698410C2;
	Mon, 27 Jun 2022 15:59:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F698410C2
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SNu3Lypg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZWJ9Q6hI_DKG; Mon, 27 Jun 2022 15:59:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A2FB241528;
	Mon, 27 Jun 2022 15:59:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2FB241528
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D47DFC007E;
	Mon, 27 Jun 2022 15:59:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 083BCC002D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 15:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8759409BE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 15:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8759409BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpN6YFIHYlij
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 15:59:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4F57409A7
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4F57409A7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jun 2022 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656345550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PrdaOUdviFNqJUrxeM9jQQOmGHi626ZP241EikWZxH4=;
 b=SNu3LypgN+xwYYgGAF1m1WGE4dxVOckvE+2LucrglM1mNDzrvc/YpbBtAuCgqm1O4knXhX
 W3rUSrNR79NKfk6x84aIS2+M8k0KWQGa1Zpmntct+VtMHdgsvvt65IkiORaxrZ0RuHVUJi
 CHih2NWgt/uL1HBHk6eIsDl6JTSAshc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-WeusmHWPNzy5143zaHwmuA-1; Mon, 27 Jun 2022 11:59:00 -0400
X-MC-Unique: WeusmHWPNzy5143zaHwmuA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11F7F2806AD1;
 Mon, 27 Jun 2022 15:59:00 +0000 (UTC)
Received: from [10.22.10.125] (unknown [10.22.10.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45DA6415F5E;
 Mon, 27 Jun 2022 15:58:59 +0000 (UTC)
Message-ID: <c69f25d2-128d-0ff8-ecba-93c82e1adfde@redhat.com>
Date: Mon, 27 Jun 2022 11:58:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4] x86/paravirt: useless assignment instructions cause
 Unixbench full core performance degradation
Content-Language: en-US
To: Guo Hui <guohui@uniontech.com>, peterz@infradead.org
References: <YrlhGqqce0NCQ6hi@hirez.programming.kicks-ass.net>
 <20220627142732.31067-1-guohui@uniontech.com>
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20220627142732.31067-1-guohui@uniontech.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Cc: jgross@suse.com, x86@kernel.org, hpa@zytor.com, pv-drivers@vmware.com,
 boqun.feng@gmail.com, dave.hansen@linux.intel.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 mingo@redhat.com, bp@alien8.de, amakhalov@vmware.com, tglx@linutronix.de,
 will@kernel.org, wangxiaohua@uniontech.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On 6/27/22 10:27, Guo Hui wrote:
> The instructions assigned to the vcpu_is_preempted function parameter
> in the X86 architecture physical machine are redundant instructions,
> causing the multi-core performance of Unixbench to drop by about 4% to 5%.
> The C function is as follows:
> static bool vcpu_is_preempted(long vcpu);
>
> The parameter 'vcpu' in the function osq_lock
> that calls the function vcpu_is_preempted is assigned as follows:
>
> The C code is in the function node_cpu:
> cpu = node->cpu - 1;
>
> The instructions corresponding to the C code are:
> mov 0x14(%rax),%edi
> sub $0x1,%edi
>
> The above instructions are unnecessary
> in the X86 Native operating environment,
> causing high cache-misses and degrading performance.
>
> This patch uses static_key to not execute this instruction
> in the Native runtime environment.
>
> The patch effect is as follows two machines,
> Unixbench runs with full core score:
>
> 1. Machine configuration:
> Intel(R) Xeon(R) Silver 4210 CPU @ 2.20GHz
> CPU core: 40
> Memory: 256G
> OS Kernel: 5.19-rc3
>
> Before using the patch:
> System Benchmarks Index Values               BASELINE       RESULT    INDEX
> Dhrystone 2 using register variables         116700.0  948326591.2  81261.9
> Double-Precision Whetstone                       55.0     211986.3  38543.0
> Execl Throughput                                 43.0      43453.2  10105.4
> File Copy 1024 bufsize 2000 maxblocks          3960.0     438936.2   1108.4
> File Copy 256 bufsize 500 maxblocks            1655.0     118197.4    714.2
> File Copy 4096 bufsize 8000 maxblocks          5800.0    1534674.7   2646.0
> Pipe Throughput                               12440.0   46482107.6  37365.0
> Pipe-based Context Switching                   4000.0    1915094.2   4787.7
> Process Creation                                126.0      85442.2   6781.1
> Shell Scripts (1 concurrent)                     42.4      69400.7  16368.1
> Shell Scripts (8 concurrent)                      6.0       8877.2  14795.3
> System Call Overhead                          15000.0    4714906.1   3143.3
>                                                                     ========
> System Benchmarks Index Score                                        7923.3
>
> After using the patch:
> System Benchmarks Index Values               BASELINE       RESULT    INDEX
> Dhrystone 2 using register variables         116700.0  947032915.5  81151.1
> Double-Precision Whetstone                       55.0     211971.2  38540.2
> Execl Throughput                                 43.0      45054.8  10477.9
> File Copy 1024 bufsize 2000 maxblocks          3960.0     515024.9   1300.6
> File Copy 256 bufsize 500 maxblocks            1655.0     146354.6    884.3
> File Copy 4096 bufsize 8000 maxblocks          5800.0    1679995.9   2896.5
> Pipe Throughput                               12440.0   46466394.2  37352.4
> Pipe-based Context Switching                   4000.0    1898221.4   4745.6
> Process Creation                                126.0      85653.1   6797.9
> Shell Scripts (1 concurrent)                     42.4      69437.3  16376.7
> Shell Scripts (8 concurrent)                      6.0       8898.9  14831.4
> System Call Overhead                          15000.0    4658746.7   3105.8
>                                                                     ========
> System Benchmarks Index Score                                        8248.8
>
> 2. Machine configuration:
> Hygon C86 7185 32-core Processor
> CPU core: 128
> Memory: 256G
> OS Kernel: 5.19-rc3
>
> Before using the patch:
> System Benchmarks Index Values               BASELINE       RESULT    INDEX
> Dhrystone 2 using register variables         116700.0 2256644068.3 193371.4
> Double-Precision Whetstone                       55.0     438969.9  79812.7
> Execl Throughput                                 43.0      10108.6   2350.8
> File Copy 1024 bufsize 2000 maxblocks          3960.0     275892.8    696.7
> File Copy 256 bufsize 500 maxblocks            1655.0      72082.7    435.5
> File Copy 4096 bufsize 8000 maxblocks          5800.0     925043.4   1594.9
> Pipe Throughput                               12440.0  118905512.5  95583.2
> Pipe-based Context Switching                   4000.0    7820945.7  19552.4
> Process Creation                                126.0      31233.3   2478.8
> Shell Scripts (1 concurrent)                     42.4      49042.8  11566.7
> Shell Scripts (8 concurrent)                      6.0       6656.0  11093.3
> System Call Overhead                          15000.0    6816047.5   4544.0
>                                                                     ========
> System Benchmarks Index Score                                        7756.6
>
> After using the patch:
> System Benchmarks Index Values               BASELINE       RESULT    INDEX
> Dhrystone 2 using register variables         116700.0 2252272929.4 192996.8
> Double-Precision Whetstone                       55.0     451847.2  82154.0
> Execl Throughput                                 43.0      10595.1   2464.0
> File Copy 1024 bufsize 2000 maxblocks          3960.0     301279.3    760.8
> File Copy 256 bufsize 500 maxblocks            1655.0      79291.3    479.1
> File Copy 4096 bufsize 8000 maxblocks          5800.0    1039755.2   1792.7
> Pipe Throughput                               12440.0  118701468.1  95419.2
> Pipe-based Context Switching                   4000.0    8073453.3  20183.6
> Process Creation                                126.0      33440.9   2654.0
> Shell Scripts (1 concurrent)                     42.4      52722.6  12434.6
> Shell Scripts (8 concurrent)                      6.0       7050.4  11750.6
> System Call Overhead                          15000.0    6834371.5   4556.2
>                                                                     ========
> System Benchmarks Index Score                                        8157.8
>
> Signed-off-by: Guo Hui <guohui@uniontech.com>
> ---
>   arch/x86/kernel/paravirt-spinlocks.c |  4 ++++
>   kernel/locking/osq_lock.c            | 12 +++++++++++-
>   2 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/kernel/paravirt-spinlocks.c b/arch/x86/kernel/paravirt-spinlocks.c
> index 9e1ea99ad..a2eb375e2 100644
> --- a/arch/x86/kernel/paravirt-spinlocks.c
> +++ b/arch/x86/kernel/paravirt-spinlocks.c
> @@ -33,6 +33,8 @@ bool pv_is_native_vcpu_is_preempted(void)
>   		__raw_callee_save___native_vcpu_is_preempted;
>   }
>   
> +DECLARE_STATIC_KEY_TRUE(vcpu_has_preemption);
> +
>   void __init paravirt_set_cap(void)
>   {
>   	if (!pv_is_native_spin_unlock())
> @@ -40,4 +42,6 @@ void __init paravirt_set_cap(void)
>   
>   	if (!pv_is_native_vcpu_is_preempted())
>   		setup_force_cpu_cap(X86_FEATURE_VCPUPREEMPT);
> +	else
> +		static_branch_disable(&vcpu_has_preemption);
>   }
> diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
> index d5610ad52..adb41080d 100644
> --- a/kernel/locking/osq_lock.c
> +++ b/kernel/locking/osq_lock.c
> @@ -27,6 +27,16 @@ static inline int node_cpu(struct optimistic_spin_node *node)
>   	return node->cpu - 1;
>   }
>   
> +DEFINE_STATIC_KEY_TRUE(vcpu_has_preemption);
> +
> +static inline bool vcpu_is_preempted_node(struct optimistic_spin_node *node)
> +{
> +	if (!static_branch_unlikely(&vcpu_has_preemption))
> +		return false;
> +
> +	return vcpu_is_preempted(node_cpu(node->prev));
> +}
> +
>   static inline struct optimistic_spin_node *decode_cpu(int encoded_cpu_val)
>   {
>   	int cpu_nr = encoded_cpu_val - 1;
> @@ -141,7 +151,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
>   	 * polling, be careful.
>   	 */
>   	if (smp_cond_load_relaxed(&node->locked, VAL || need_resched() ||
> -				  vcpu_is_preempted(node_cpu(node->prev))))
> +						vcpu_is_preempted_node(node)))
>   		return true;
>   
>   	/* unqueue */

The patch looks good. I do have a minor nit though.

Usually, DEFINE_STATIC_KEY_TRUE() is paired with static_branch_likely() 
and DEFINE_STATIC_KEY_FALSE() is paired with static_branch_unlikely(). I 
think what Peter meant is to use DEFINE_STATIC_KEY_FALSE() and enable 
vcpu_has_preemption together with X86_FEATURE_VCPUPREEMPT in the same if 
block.

Cheers,
Longman

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
