Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE01C380F
	for <lists.virtualization@lfdr.de>; Mon,  4 May 2020 13:28:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1BEA1876B3;
	Mon,  4 May 2020 11:28:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YuiHEOcWaAA7; Mon,  4 May 2020 11:28:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 614C2876CB;
	Mon,  4 May 2020 11:28:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50301C0175;
	Mon,  4 May 2020 11:28:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 473DEC0175
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4326788175
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:28:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1yteNgZuFt87
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:28:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1F9E38816C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  4 May 2020 11:28:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 00A8CADD3;
 Mon,  4 May 2020 11:27:10 +0000 (UTC)
Date: Mon, 4 May 2020 13:27:06 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 12/75] x86/boot/compressed/64: Switch to __KERNEL_CS
 after GDT is loaded
Message-ID: <20200504112706.GG8135@suse.de>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-13-joro@8bytes.org>
 <20200504104129.GD15046@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504104129.GD15046@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
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

On Mon, May 04, 2020 at 12:41:29PM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:22PM +0200, Joerg Roedel wrote:
> > +	/* Reload CS so IRET returns to a CS actually in the GDT */
> > +	pushq	$__KERNEL_CS
> > +	leaq	.Lon_kernel_cs(%rip), %rax
> > +	pushq	%rax
> > +	lretq
> > +
> > +.Lon_kernel_cs:
> > +
> >  	/*
> >  	 * paging_prepare() sets up the trampoline and checks if we need to
> >  	 * enable 5-level paging.
> > -- 
> 
> So I'm thinking I should take this one even now on the grounds that
> it sanitizes CS to something known-good than what was there before and
> who knows what set it and loaded the kernel...?
> 
> And that is a good thing in itself.

Right, sure. CS is basically undefined at this point and depends on what
loaded the kernel (EFI, legacy boot code, some container runtime...), so
setting it to something known is definitly good.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
