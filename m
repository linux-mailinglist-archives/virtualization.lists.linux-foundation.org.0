Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CDC1ED8F1
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 01:07:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 02E94886A8;
	Wed,  3 Jun 2020 23:07:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRJnrot9xLr9; Wed,  3 Jun 2020 23:07:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F3436886AD;
	Wed,  3 Jun 2020 23:07:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CA25BC0888;
	Wed,  3 Jun 2020 23:07:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AEFCC016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 23:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 43EC887D7F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 23:07:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id au88ZisRsepr
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 23:07:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 575CF87D6D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 23:07:17 +0000 (UTC)
IronPort-SDR: DSLZPetW4xRSJFCZsQuLtt5kWHvqs7ymq1/QkTGUrWRDRFyRIzqSbRoCO2+fa3Poi5n2wp4Kt4
 qqSxWXKwT7Gw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2020 16:07:16 -0700
IronPort-SDR: 9vgjozx/oRvfwuPeSTLMZum356iRJhNe/DrZ/MBqnUU3vFsurtA0Q5wtboYcgXlyglaP+MZ8SD
 SBq1OTh5oacw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,470,1583222400"; d="scan'208";a="445286783"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.152])
 by orsmga005.jf.intel.com with ESMTP; 03 Jun 2020 16:07:16 -0700
Date: Wed, 3 Jun 2020 16:07:16 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 25/75] x86/sev-es: Add support for handling IOIO
 exceptions
Message-ID: <20200603230716.GD25606@linux.intel.com>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-26-joro@8bytes.org>
 <20200520062055.GA17090@linux.intel.com>
 <20200603142325.GB23071@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603142325.GB23071@8bytes.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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

On Wed, Jun 03, 2020 at 04:23:25PM +0200, Joerg Roedel wrote:
> > > +		 */
> > > +		io_bytes   = (exit_info_1 >> 4) & 0x7;
> > > +		ghcb_count = sizeof(ghcb->shared_buffer) / io_bytes;
> > > +
> > > +		op_count    = (exit_info_1 & IOIO_REP) ? regs->cx : 1;
> > > +		exit_info_2 = min(op_count, ghcb_count);
> > > +		exit_bytes  = exit_info_2 * io_bytes;
> > > +
> > > +		es_base = insn_get_seg_base(ctxt->regs, INAT_SEG_REG_ES);
> > > +
> > > +		if (!(exit_info_1 & IOIO_TYPE_IN)) {
> > > +			ret = vc_insn_string_read(ctxt,
> > > +					       (void *)(es_base + regs->si),
> > 
> > SEV(-ES) is 64-bit only, why bother with the es_base charade?
> 
> User-space can also cause IOIO #VC exceptions, and user-space can be
> 32-bit legacy code with segments, so es_base has to be taken into
> account.

Is there actually a use case for this?  Exposing port IO to userspace
doesn't exactly improve security.

Given that i386 ABI requires EFLAGS.DF=0 upon function entry/exit, i.e. is
the de facto default, the DF bug implies this hasn't been tested.  And I
don't see how this could possibly have worked for SEV given that the kernel
unrolls string I/O because the VMM can't emulate string I/O.  Presumably
someone would have complained if they "needed" to run legacy crud.  The
host and guest obviously need major updates, so supporting e.g. DPDK with
legacy virtio seems rather silly.

> > > +					       ghcb->shared_buffer, io_bytes,
> > > +					       exit_info_2, df);
> > 
> > df handling is busted, it's aways non-zero.  Same goes for the SI/DI
> > adjustments below.
> 
> Right, this is fixed now.
> 
> > Batching the memory accesses and I/O accesses separately is technically
> > wrong, e.g. a #DB on a memory access will result in bogus data being shown
> > in the debugger.  In practice it seems unlikely to matter, but I'm curious
> > as to why string I/O is supported in the first place.  I didn't think there
> > was that much string I/O in the kernel?
> 
> True, #DBs won't be correct anymore. Currently debugging is not
> supported in SEV-ES guests anyway, but if it is supported the #DB
> exception would happen in the #VC handler and not on the original
> instruction.

As in, the guest can't debug itself?  Or the host can't debug the guest?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
