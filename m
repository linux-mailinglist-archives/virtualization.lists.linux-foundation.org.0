Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F241ED203
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 16:23:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 69FCB8680C;
	Wed,  3 Jun 2020 14:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUb85CoX5JmJ; Wed,  3 Jun 2020 14:23:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9B4A886841;
	Wed,  3 Jun 2020 14:23:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7109FC016E;
	Wed,  3 Jun 2020 14:23:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00CB9C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 14:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D052D204A1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 14:23:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Wuilwp0Ii4Z
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 14:23:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 4DB1920011
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 14:23:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B4EF728B; Wed,  3 Jun 2020 16:23:26 +0200 (CEST)
Date: Wed, 3 Jun 2020 16:23:25 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v3 25/75] x86/sev-es: Add support for handling IOIO
 exceptions
Message-ID: <20200603142325.GB23071@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-26-joro@8bytes.org>
 <20200520062055.GA17090@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520062055.GA17090@linux.intel.com>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

Hi Jean,

On Tue, May 19, 2020 at 11:20:55PM -0700, Sean Christopherson wrote:
> On Tue, Apr 28, 2020 at 05:16:35PM +0200, Joerg Roedel wrote:
> > +		/*
> > +		 * For the string variants with rep prefix the amount of in/out
> > +		 * operations per #VC exception is limited so that the kernel
> > +		 * has a chance to take interrupts an re-schedule while the
> > +		 * instruction is emulated.
> 
> Doesn't this also suppress single-step #DBs?

Yes it does.

> 
> > +		 */
> > +		io_bytes   = (exit_info_1 >> 4) & 0x7;
> > +		ghcb_count = sizeof(ghcb->shared_buffer) / io_bytes;
> > +
> > +		op_count    = (exit_info_1 & IOIO_REP) ? regs->cx : 1;
> > +		exit_info_2 = min(op_count, ghcb_count);
> > +		exit_bytes  = exit_info_2 * io_bytes;
> > +
> > +		es_base = insn_get_seg_base(ctxt->regs, INAT_SEG_REG_ES);
> > +
> > +		if (!(exit_info_1 & IOIO_TYPE_IN)) {
> > +			ret = vc_insn_string_read(ctxt,
> > +					       (void *)(es_base + regs->si),
> 
> SEV(-ES) is 64-bit only, why bother with the es_base charade?

User-space can also cause IOIO #VC exceptions, and user-space can be
32-bit legacy code with segments, so es_base has to be taken into
account.


> 
> > +					       ghcb->shared_buffer, io_bytes,
> > +					       exit_info_2, df);
> 
> df handling is busted, it's aways non-zero.  Same goes for the SI/DI
> adjustments below.

Right, this is fixed now.

> Batching the memory accesses and I/O accesses separately is technically
> wrong, e.g. a #DB on a memory access will result in bogus data being shown
> in the debugger.  In practice it seems unlikely to matter, but I'm curious
> as to why string I/O is supported in the first place.  I didn't think there
> was that much string I/O in the kernel?

True, #DBs won't be correct anymore. Currently debugging is not
supported in SEV-ES guests anyway, but if it is supported the #DB
exception would happen in the #VC handler and not on the original
instruction.


Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
