Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A08B21F68D9
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 15:10:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3E2DF887C3;
	Thu, 11 Jun 2020 13:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ILngVhaJRVod; Thu, 11 Jun 2020 13:10:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 18B90887BD;
	Thu, 11 Jun 2020 13:10:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E40C4C016F;
	Thu, 11 Jun 2020 13:10:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44A49C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 13:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3011F887B0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 13:10:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQg+Xn-8W2Od
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 13:10:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A25B584AF9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 13:10:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5CFB3869; Thu, 11 Jun 2020 15:10:46 +0200 (CEST)
Date: Thu, 11 Jun 2020 15:10:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v3 59/75] x86/sev-es: Handle MONITOR/MONITORX Events
Message-ID: <20200611131045.GE11924@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-60-joro@8bytes.org>
 <20200520063845.GC17090@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520063845.GC17090@linux.intel.com>
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

On Tue, May 19, 2020 at 11:38:45PM -0700, Sean Christopherson wrote:
> On Tue, Apr 28, 2020 at 05:17:09PM +0200, Joerg Roedel wrote:
> > +static enum es_result vc_handle_monitor(struct ghcb *ghcb,
> > +					struct es_em_ctxt *ctxt)
> > +{
> > +	phys_addr_t monitor_pa;
> > +	pgd_t *pgd;
> > +
> > +	pgd = __va(read_cr3_pa());
> > +	monitor_pa = vc_slow_virt_to_phys(ghcb, ctxt->regs->ax);
> > +
> > +	ghcb_set_rax(ghcb, monitor_pa);
> > +	ghcb_set_rcx(ghcb, ctxt->regs->cx);
> > +	ghcb_set_rdx(ghcb, ctxt->regs->dx);
> > +
> > +	return sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_MONITOR, 0, 0);
> 
> Why?  If SVM has the same behavior as VMX, the MONITOR will be disarmed on
> VM-Enter, i.e. the VMM can't do anything useful for MONITOR/MWAIT.  I
> assume that's the case given that KVM emulates MONITOR/MWAIT as NOPs on
> SVM.

Not sure if it is disarmed on VMRUN, but the MONITOR/MWAIT instructions
are part of the GHCB spec, so they are implemented here.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
