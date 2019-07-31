Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2817C2C4
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 15:06:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 90AA82290;
	Wed, 31 Jul 2019 13:06:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 922BA3796
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 12:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 87B246CE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 12:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aeUs+tisL054K/og1W1ep85O/gPdmrMrcRsVDP6dWHA=;
	b=oaTRIpZMm2SA2ctz/ryJdx5ia
	/LKWmt439ZZvb35/VbYw9o8t12tJoXD6aI6hksP1Xc+hICCc3+lbHuj2nrT2bZGD1twR9eAYcBLn/
	E4fayvpXE78Jw5t1qTC2DQir3SQ56cuhq76gfVZUwqhIWVMHnJr4SucdiMqH6GzfyHVgrvLzspEr6
	JvFKdCyBT4g80kxsamgYcCog1sbUPhjzsmhDI3r3QnLSV/wR0XpPExqeFZbaEJuIgqkq8O0zqND35
	Ko51GPcra8ktSo4PMvM4DARlpmoUDUTy+UxkL/JmshGg8qarRhlaIOSNQ+vtaaJyNIRbpM938EXsL
	5GTiOT9LQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=hirez.programming.kicks-ass.net)
	by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hso6O-0004bd-AJ; Wed, 31 Jul 2019 12:53:08 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 10ABA2029FD58; Wed, 31 Jul 2019 14:53:06 +0200 (CEST)
Date: Wed, 31 Jul 2019 14:53:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v9 10/11] x86/paravirt: Adapt assembly for PIE support
Message-ID: <20190731125306.GU31381@hirez.programming.kicks-ass.net>
References: <20190730191303.206365-1-thgarnie@chromium.org>
	<20190730191303.206365-11-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730191303.206365-11-thgarnie@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Juergen Gross <jgross@suse.com>, Thomas Hellstrom <thellstrom@vmware.com>,
	keescook@chromium.org, kernel-hardening@lists.openwall.com,
	"VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	kristen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Jul 30, 2019 at 12:12:54PM -0700, Thomas Garnier wrote:
> if PIE is enabled, switch the paravirt assembly constraints to be
> compatible. The %c/i constrains generate smaller code so is kept by
> default.
> 
> Position Independent Executable (PIE) support will allow to extend the
> KASLR randomization range below 0xffffffff80000000.
> 
> Signed-off-by: Thomas Garnier <thgarnie@chromium.org>
> Acked-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/include/asm/paravirt_types.h | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> index 70b654f3ffe5..fd7dc37d0010 100644
> --- a/arch/x86/include/asm/paravirt_types.h
> +++ b/arch/x86/include/asm/paravirt_types.h
> @@ -338,9 +338,25 @@ extern struct paravirt_patch_template pv_ops;
>  #define PARAVIRT_PATCH(x)					\
>  	(offsetof(struct paravirt_patch_template, x) / sizeof(void *))
>  
> +#ifdef CONFIG_X86_PIE
> +#define paravirt_opptr_call "a"
> +#define paravirt_opptr_type "p"
> +
> +/*
> + * Alternative patching requires a maximum of 7 bytes but the relative call is
> + * only 6 bytes. If PIE is enabled, add an additional nop to the call
> + * instruction to ensure patching is possible.
> + */
> +#define PARAVIRT_CALL_POST  "nop;"

I'm confused; where does the 7 come from? The relative call is 6 bytes,
a normal call is 5 bytes (which is what we normally replace them with),
and the longest 'native' sequence we seem to have is also 6 bytes
(.cpu_usergs_sysret64).

> +#else
> +#define paravirt_opptr_call "c"
> +#define paravirt_opptr_type "i"
> +#define PARAVIRT_CALL_POST  ""
> +#endif
> +
>  #define paravirt_type(op)				\
>  	[paravirt_typenum] "i" (PARAVIRT_PATCH(op)),	\
> -	[paravirt_opptr] "i" (&(pv_ops.op))
> +	[paravirt_opptr] paravirt_opptr_type (&(pv_ops.op))
>  #define paravirt_clobber(clobber)		\
>  	[paravirt_clobber] "i" (clobber)
>  
> @@ -379,9 +395,10 @@ int paravirt_disable_iospace(void);
>   * offset into the paravirt_patch_template structure, and can therefore be
>   * freely converted back into a structure offset.
>   */
> -#define PARAVIRT_CALL					\
> -	ANNOTATE_RETPOLINE_SAFE				\
> -	"call *%c[paravirt_opptr];"
> +#define PARAVIRT_CALL						\
> +	ANNOTATE_RETPOLINE_SAFE					\
> +	"call *%" paravirt_opptr_call "[paravirt_opptr];"	\
> +	PARAVIRT_CALL_POST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
