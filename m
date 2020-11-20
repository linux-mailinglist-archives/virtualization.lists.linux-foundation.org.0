Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE732BA9D6
	for <lists.virtualization@lfdr.de>; Fri, 20 Nov 2020 13:08:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 484A986B74;
	Fri, 20 Nov 2020 12:08:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZI4SvTeItwOI; Fri, 20 Nov 2020 12:08:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2D0D8714B;
	Fri, 20 Nov 2020 12:08:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97D2CC0891;
	Fri, 20 Nov 2020 12:08:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5897DC0891
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 12:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 46AC886E44
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 12:08:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsC-t3TZxYkA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 12:08:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 92D6186E41
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Nov 2020 12:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vlXR+DeDm58p736gPlu4ZNiSJsmquQxprWhu8Q3iIL8=; b=fRHC2Nb6zcdTb+UFSiq7GQRUml
 BUcux3dn7RsKDlz4v+LiwCLL5XUhYCq1gUqZpb9juEnjSzn/4qQQIeiFL1LSLrh9HtqKFvu6oo2fy
 YaGX3kbhn8wEu45EEmSdWXGs1CGyP3hJ72OQrgns8cznCA9Yy75jioH9PKqiPbWVoPm3nex2Aw93R
 vbfyV+gyoMK/k6uyjezWSI2d4xiZaaa/qfdcjAV7GkIz2Ijn5O6uyxpTUYsOj7IwiraWKv9KDE44j
 HymhtOgRlYegJPkO3F0EUjLjhaP7ZarIEGVFdAeQafXl7tla9cn5tt/6O/8+i0vh5behC/4jxjuIo
 bAK0zS/w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg5Cx-0004e7-7B; Fri, 20 Nov 2020 12:08:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DB2573069B1;
 Fri, 20 Nov 2020 13:08:05 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C6997200EC4FD; Fri, 20 Nov 2020 13:08:05 +0100 (CET)
Date: Fri, 20 Nov 2020 13:08:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 08/12] x86/paravirt: remove no longer needed 32-bit
 pvops cruft
Message-ID: <20201120120805.GF3021@hirez.programming.kicks-ass.net>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-9-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201120114630.13552-9-jgross@suse.com>
Cc: "VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
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

On Fri, Nov 20, 2020 at 12:46:26PM +0100, Juergen Gross wrote:
> +#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr, ...)	\
>  	({								\
>  		PVOP_CALL_ARGS;						\
>  		PVOP_TEST_NULL(op);					\
> +		BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
> +		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
> +			     : call_clbr, ASM_CALL_CONSTRAINT		\
> +			     : paravirt_type(op),			\
> +			       paravirt_clobber(clbr),			\
> +			       ##__VA_ARGS__				\
> +			     : "memory", "cc" extra_clbr);		\
> +		(rettype)(__eax & PVOP_RETMASK(rettype));		\
>  	})

This is now very similar to ____PVOP_VCALL() (note how PVOP_CALL_ARGS is
PVOP_VCALL_ARGS).

Could we get away with doing something horrible like:

#define ____PVOP_VCALL(X...) (void)____PVOP_CALL(long, X)

?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
