Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12F2FD9EE
	for <lists.virtualization@lfdr.de>; Wed, 20 Jan 2021 20:45:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 235C787021;
	Wed, 20 Jan 2021 19:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbymANZxLWDX; Wed, 20 Jan 2021 19:45:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id A407186F5C;
	Wed, 20 Jan 2021 19:45:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C492C013A;
	Wed, 20 Jan 2021 19:45:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87322C013A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 19:45:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 836B986E1D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 19:45:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwVYyzTAH4sq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 19:45:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3623A86CAC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 19:45:12 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id c6so20068335ede.0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 Jan 2021 11:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UqXhr6U1RGBGjv0Nmx2hKPUeAH0sokB4LM4fa/b0g0Q=;
 b=R+IWStL2+wlSzaEPF5grre/1r+Jaffw+FsSinFtR7GqGC4E2gIGppNZ48FLSAM1P7V
 qmOSQXfMkfMvZdsjTxKcjGptYXy54nxR82l+BpQkvK4R5NMIJd7MNHbu+ZZs3+OD+aSP
 A/aOYQcz6NfqfQoK/m5hgsDdS5u8yBivB/ibpaQimmRiM+LXerCEUiNaw1WxlXSfayCO
 RDh9CfRYuEHhLrQI7nCm9ERtXoOuf3fAdpNPmGAHBLeqsGgN+X3hX0i3Z+vflrYKvBuv
 6TqFt5BK8O+lYEg936dFG4VwU4JjTpoOeDwoCeHHKrfIY47nUARkbZ6uIlK3RU07mG5K
 ThBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UqXhr6U1RGBGjv0Nmx2hKPUeAH0sokB4LM4fa/b0g0Q=;
 b=TuImBZSEH3/ADAgqXK33RYTDRQA4cYXxZFewmsqsIBdbB6KFqfb3H9z2pIv9XwxTTx
 ombG4rOFAxMscJTNKyVG5boBo4y6dTl82DAi0gs9C514fiRbnJgOXmcVcp6UEWRZ9dY9
 8nM3m+ikzeo75Oq9rYSgtNamKMn8J0v0MoQN/JUZBgN92TcQfLC7bivCtuGzKtf/5g+e
 1VQ4TESSJ7teMFn9p6RJloEe+R5jPCT+6ALCuLACLpWH9JPhOQMLL5Ptzo8yDlLFyGEC
 zIWpYrpVSSvdYyWKgGTMkV7rtWYj8zhsMVjQJxK7McQ9j32tkT/X2ctP6IdjdX1F6HWB
 KG4A==
X-Gm-Message-State: AOAM533d5AcSXev4OmfQKo0tgdsJlR03Hp3+pfJzIRf+EQB7bmngnVFr
 562qAU6KrQ4jOJwWKNYqHeK1hiJMRk4w9MI6l0i3LQ==
X-Google-Smtp-Source: ABdhPJxvb1wfnaERyYy/x1se5fCDDeRdAl7RuDhoERoccNXJ6VsNibgl6cUEjC5ZVp2ZI7TxxiJV79nr+G+lpZJH5es=
X-Received: by 2002:a50:934a:: with SMTP id n10mr8420776eda.26.1611171910694; 
 Wed, 20 Jan 2021 11:45:10 -0800 (PST)
MIME-Version: 1.0
References: <20210120120058.29138-1-wei.liu@kernel.org>
 <20210120120058.29138-7-wei.liu@kernel.org>
In-Reply-To: <20210120120058.29138-7-wei.liu@kernel.org>
From: Pavel Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 20 Jan 2021 14:44:34 -0500
Message-ID: <CA+CK2bDOhzx1_TcWQp2zFUb5+59ayFby=ZSoNyApNEQ0FRJUFA@mail.gmail.com>
Subject: Re: [PATCH v5 06/16] x86/hyperv: allocate output arg pages if required
To: Wei Liu <wei.liu@kernel.org>
Cc: Linux on Hyper-V List <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Michael Kelley <mikelley@microsoft.com>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Nuno Das Neves <nunodasneves@linux.microsoft.com>,
 Borislav Petkov <bp@alien8.de>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 virtualization@lists.linux-foundation.org,
 Vineeth Pillai <viremana@linux.microsoft.com>,
 Lillian Grassin-Drake <ligrassi@microsoft.com>
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

On Wed, Jan 20, 2021 at 7:01 AM Wei Liu <wei.liu@kernel.org> wrote:
>
> When Linux runs as the root partition, it will need to make hypercalls
> which return data from the hypervisor.
>
> Allocate pages for storing results when Linux runs as the root
> partition.
>
> Signed-off-by: Lillian Grassin-Drake <ligrassi@microsoft.com>
> Co-Developed-by: Lillian Grassin-Drake <ligrassi@microsoft.com>
> Signed-off-by: Wei Liu <wei.liu@kernel.org>

Reviewed-by: Pavel Tatashin <pasha.tatashin@soleen.com>

The new warnings reported by the robot are the same as for the input argument.

Pasha

> ---
> v3: Fix hv_cpu_die to use free_pages.
> v2: Address Vitaly's comments
> ---
>  arch/x86/hyperv/hv_init.c       | 35 ++++++++++++++++++++++++++++-----
>  arch/x86/include/asm/mshyperv.h |  1 +
>  2 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/hyperv/hv_init.c b/arch/x86/hyperv/hv_init.c
> index e04d90af4c27..6f4cb40e53fe 100644
> --- a/arch/x86/hyperv/hv_init.c
> +++ b/arch/x86/hyperv/hv_init.c
> @@ -41,6 +41,9 @@ EXPORT_SYMBOL_GPL(hv_vp_assist_page);
>  void  __percpu **hyperv_pcpu_input_arg;
>  EXPORT_SYMBOL_GPL(hyperv_pcpu_input_arg);
>
> +void  __percpu **hyperv_pcpu_output_arg;
> +EXPORT_SYMBOL_GPL(hyperv_pcpu_output_arg);
> +
>  u32 hv_max_vp_index;
>  EXPORT_SYMBOL_GPL(hv_max_vp_index);
>
> @@ -73,12 +76,19 @@ static int hv_cpu_init(unsigned int cpu)
>         void **input_arg;
>         struct page *pg;
>
> -       input_arg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
>         /* hv_cpu_init() can be called with IRQs disabled from hv_resume() */
> -       pg = alloc_page(irqs_disabled() ? GFP_ATOMIC : GFP_KERNEL);
> +       pg = alloc_pages(irqs_disabled() ? GFP_ATOMIC : GFP_KERNEL, hv_root_partition ? 1 : 0);
>         if (unlikely(!pg))
>                 return -ENOMEM;
> +
> +       input_arg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
>         *input_arg = page_address(pg);
> +       if (hv_root_partition) {
> +               void **output_arg;
> +
> +               output_arg = (void **)this_cpu_ptr(hyperv_pcpu_output_arg);
> +               *output_arg = page_address(pg + 1);
> +       }
>
>         hv_get_vp_index(msr_vp_index);
>
> @@ -205,14 +215,23 @@ static int hv_cpu_die(unsigned int cpu)
>         unsigned int new_cpu;
>         unsigned long flags;
>         void **input_arg;
> -       void *input_pg = NULL;
> +       void *pg;
>
>         local_irq_save(flags);
>         input_arg = (void **)this_cpu_ptr(hyperv_pcpu_input_arg);
> -       input_pg = *input_arg;
> +       pg = *input_arg;
>         *input_arg = NULL;
> +
> +       if (hv_root_partition) {
> +               void **output_arg;
> +
> +               output_arg = (void **)this_cpu_ptr(hyperv_pcpu_output_arg);
> +               *output_arg = NULL;
> +       }
> +
>         local_irq_restore(flags);
> -       free_page((unsigned long)input_pg);
> +
> +       free_pages((unsigned long)pg, hv_root_partition ? 1 : 0);
>
>         if (hv_vp_assist_page && hv_vp_assist_page[cpu])
>                 wrmsrl(HV_X64_MSR_VP_ASSIST_PAGE, 0);
> @@ -346,6 +365,12 @@ void __init hyperv_init(void)
>
>         BUG_ON(hyperv_pcpu_input_arg == NULL);
>
> +       /* Allocate the per-CPU state for output arg for root */
> +       if (hv_root_partition) {
> +               hyperv_pcpu_output_arg = alloc_percpu(void *);
> +               BUG_ON(hyperv_pcpu_output_arg == NULL);
> +       }
> +
>         /* Allocate percpu VP index */
>         hv_vp_index = kmalloc_array(num_possible_cpus(), sizeof(*hv_vp_index),
>                                     GFP_KERNEL);
> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
> index ac2b0d110f03..62d9390f1ddf 100644
> --- a/arch/x86/include/asm/mshyperv.h
> +++ b/arch/x86/include/asm/mshyperv.h
> @@ -76,6 +76,7 @@ static inline void hv_disable_stimer0_percpu_irq(int irq) {}
>  #if IS_ENABLED(CONFIG_HYPERV)
>  extern void *hv_hypercall_pg;
>  extern void  __percpu  **hyperv_pcpu_input_arg;
> +extern void  __percpu  **hyperv_pcpu_output_arg;
>
>  static inline u64 hv_do_hypercall(u64 control, void *input, void *output)
>  {
> --
> 2.20.1
>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
