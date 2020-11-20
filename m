Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DEF72BA9B5
	for <lists.virtualization@lfdr.de>; Fri, 20 Nov 2020 12:59:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B3E3F875A6;
	Fri, 20 Nov 2020 11:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzF7heu4fCb9; Fri, 20 Nov 2020 11:59:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 518D38759E;
	Fri, 20 Nov 2020 11:59:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FD9DC0891;
	Fri, 20 Nov 2020 11:59:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CCA5C0891
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 11:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4A15D8759E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 11:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vrWAVZP0ecoH
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 11:59:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9CBC487599
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 11:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1IRDo4hBUd8j6ToyEOlhDczl8zQL0MZ1VcE/2Tj86V8=; b=lWgrloRSTuiGC5nk/4mHtAapdq
 VwjRJ9pV/B0T1qMIc8kscWWKsHYukR+oAG35rA52pWTnBDx5lko8Mg2mrSuBc9HXXKzFegH7oJGtp
 cwml6uFpFrBaQnbMehbVUamRufyImy2h3sQ01dQNaCyElJ40tKE7oY7DlyW91yiQQ3HL8MtyQUvbq
 My0bogQ20GyepoV5LrRr5SCuJg65biu6wXWYQzw+W+2vh2FY8g8nwuPKoIFrqvMl6beiZDTPBQfCH
 /pI3NOmklXlVteKMmE3U6Bp4Myx1Ojzlpwrt8x2Its6o0bCkEETXsUOqeydQ25qMtkGezRaNWRG5r
 37I6qZZA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg54r-0004IG-6x; Fri, 20 Nov 2020 11:59:45 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 61B3B307062;
 Fri, 20 Nov 2020 12:59:43 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 41741200DF1A6; Fri, 20 Nov 2020 12:59:43 +0100 (CET)
Date: Fri, 20 Nov 2020 12:59:43 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
Message-ID: <20201120115943.GD3021@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-6-jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, luto@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Fri, Nov 20, 2020 at 12:46:23PM +0100, Juergen Gross wrote:
> +static __always_inline void arch_local_irq_restore(unsigned long flags)
> +{
> +	if (!arch_irqs_disabled_flags(flags))
> +		arch_local_irq_enable();
> +}

If someone were to write horrible code like:

	local_irq_disable();
	local_irq_save(flags);
	local_irq_enable();
	local_irq_restore(flags);

we'd be up some creek without a paddle... now I don't _think_ we have
genius code like that, but I'd feel saver if we can haz an assertion in
there somewhere...

Maybe something like:

#ifdef CONFIG_DEBUG_ENTRY // for lack of something saner
	WARN_ON_ONCE((arch_local_save_flags() ^ flags) & X86_EFLAGS_IF);
#endif

At the end?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
