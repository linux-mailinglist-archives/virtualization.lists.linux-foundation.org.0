Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EAF22093B
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:51:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 500258AB7A;
	Wed, 15 Jul 2020 09:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hKI4Oe2JDNFd; Wed, 15 Jul 2020 09:51:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D3DAE8AB77;
	Wed, 15 Jul 2020 09:51:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B327CC0733;
	Wed, 15 Jul 2020 09:51:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE11CC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E1FBE221B2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qlIeaw9bQfmH
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id D4835220D6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B3ZNXMdtzOl2XokoISBREh8d9nxYCRmNefNrJYQQBSo=; b=oOXeAQidbZzyeFE7UCspW3f0W4
 m/ZqHaKOVyZU8GAiIVD/XTz1oC1UtT6Uct1DxIuhk+QPUKXVLxCvDYtgYxRRYvVs6QmHhBp0iexPP
 aQW5P9xuX40hne6bOHhDOckCvOT1dHZnfrmtOu8jvk8GL0CHPWwoOpDHJy7QMjliPOex2KX6XaFfb
 FQt8+A49iiYfOkZNp3ScqoSUXajHVGSPqZwYtOPnECivFAM2uMjf/iDKcQbzKM8/MMP2sDK7RaKpw
 n2LYSmhZGN7Pq8tS0xmFttoaQaO8EXQ1k+K9IOf8wshHtE36RNC6oYGijMMSpXyDHLq5NKaH5fAgq
 29Nm+15w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jve4i-0000jr-Gx; Wed, 15 Jul 2020 09:51:40 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B344B3028C8;
 Wed, 15 Jul 2020 11:51:36 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9CC92203A5F41; Wed, 15 Jul 2020 11:51:36 +0200 (CEST)
Date: Wed, 15 Jul 2020 11:51:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v4 63/75] x86/sev-es: Handle #DB Events
Message-ID: <20200715095136.GG10769@hirez.programming.kicks-ass.net>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-64-joro@8bytes.org>
 <20200715084752.GD10769@hirez.programming.kicks-ass.net>
 <20200715091337.GI16200@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715091337.GI16200@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Wed, Jul 15, 2020 at 11:13:37AM +0200, Joerg Roedel wrote:
> On Wed, Jul 15, 2020 at 10:47:52AM +0200, Peter Zijlstra wrote:
> > On Tue, Jul 14, 2020 at 02:09:05PM +0200, Joerg Roedel wrote:
> > 
> > > @@ -1028,6 +1036,16 @@ DEFINE_IDTENTRY_VC_SAFE_STACK(exc_vmm_communication)
> > >  	struct ghcb *ghcb;
> > >  
> > >  	lockdep_assert_irqs_disabled();
> > > +
> > > +	/*
> > > +	 * #DB is special and needs to be handled outside of the intrumentation_begin()/end().
> > > +	 * Otherwise the #VC handler could be raised recursivly.
> > > +	 */
> > > +	if (error_code == SVM_EXIT_EXCP_BASE + X86_TRAP_DB) {
> > > +		vc_handle_trap_db(regs);
> > > +		return;
> > > +	}
> > > +
> > >  	instrumentation_begin();
> > 
> > Wait what?! That makes no sense what so ever.
> 
> Then my understanding of intrumentation_begin/end() is wrong, I thought
> that the kernel will forbid setting breakpoints before
> instrumentation_begin(), which is necessary here because a break-point
> in the #VC handler might cause recursive #VC-exceptions when #DB is
> intercepted.
> Maybe you can elaborate on why this makes no sense?

Kernel avoids breakpoints in any noinstr text, irrespective of
instrumentation_begin().

instrumentation_begin() merely allows one to call !noinstr functions.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
