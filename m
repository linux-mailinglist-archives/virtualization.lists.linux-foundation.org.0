Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9EF1F6CA3
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 19:13:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A408787A69;
	Thu, 11 Jun 2020 17:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z6jttOsDvTF2; Thu, 11 Jun 2020 17:13:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2664A87AB6;
	Thu, 11 Jun 2020 17:13:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 139ABC016F;
	Thu, 11 Jun 2020 17:13:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5094FC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3D8E52041D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:13:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6DVGF4DdEwF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:13:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 7605D20418
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:13:06 +0000 (UTC)
IronPort-SDR: dgOqVE6RtalYv8S29oJXq9fhUVVKx1FMQbYZuEohIkXqfiIRlEjvAhalZNM9zZmJgP8gt0HPBr
 Jh6a1WwyYFVA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 10:13:06 -0700
IronPort-SDR: UZoHgxH1K0kmvbsR3quVSUfb5dJ2vORoRNzZEJplCkiftUSWTB6T7ceZFD8nPxuEoI/m555enE
 L9gf56ueCkOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,500,1583222400"; d="scan'208";a="380448734"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.152])
 by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2020 10:13:05 -0700
Date: Thu, 11 Jun 2020 10:13:05 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 59/75] x86/sev-es: Handle MONITOR/MONITORX Events
Message-ID: <20200611171305.GJ29918@linux.intel.com>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-60-joro@8bytes.org>
 <20200520063845.GC17090@linux.intel.com>
 <20200611131045.GE11924@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611131045.GE11924@8bytes.org>
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

On Thu, Jun 11, 2020 at 03:10:45PM +0200, Joerg Roedel wrote:
> On Tue, May 19, 2020 at 11:38:45PM -0700, Sean Christopherson wrote:
> > On Tue, Apr 28, 2020 at 05:17:09PM +0200, Joerg Roedel wrote:
> > > +static enum es_result vc_handle_monitor(struct ghcb *ghcb,
> > > +					struct es_em_ctxt *ctxt)
> > > +{
> > > +	phys_addr_t monitor_pa;
> > > +	pgd_t *pgd;
> > > +
> > > +	pgd = __va(read_cr3_pa());
> > > +	monitor_pa = vc_slow_virt_to_phys(ghcb, ctxt->regs->ax);
> > > +
> > > +	ghcb_set_rax(ghcb, monitor_pa);
> > > +	ghcb_set_rcx(ghcb, ctxt->regs->cx);
> > > +	ghcb_set_rdx(ghcb, ctxt->regs->dx);
> > > +
> > > +	return sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_MONITOR, 0, 0);
> > 
> > Why?  If SVM has the same behavior as VMX, the MONITOR will be disarmed on
> > VM-Enter, i.e. the VMM can't do anything useful for MONITOR/MWAIT.  I
> > assume that's the case given that KVM emulates MONITOR/MWAIT as NOPs on
> > SVM.
> 
> Not sure if it is disarmed on VMRUN, but the MONITOR/MWAIT instructions
> are part of the GHCB spec, so they are implemented here.

Even if MONITOR/MWAIT somehow works across VMRUN I'm not sure it's something
the guest should enable by default as it leaks GPAs to the untrusted host,
with no benefit to the guest except in specific configurations.  Yeah, the
VMM can muck with page tables to trace guest to the some extent, but the
guest shouldn't be unnecessarily volunteering information to the host.

If MONITOR/MWAIT is effectively a NOP then removing this code is a no
brainer.

Can someone from AMD chime in?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
