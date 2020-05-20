Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D21DAAB1
	for <lists.virtualization@lfdr.de>; Wed, 20 May 2020 08:38:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7369D86B5A;
	Wed, 20 May 2020 06:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7R2Lmjg-mijX; Wed, 20 May 2020 06:38:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D9B7086B9D;
	Wed, 20 May 2020 06:38:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A7096C0176;
	Wed, 20 May 2020 06:38:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91486C0176
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 06:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7DCC086B74
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 06:38:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pl3YRh4GJzK9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 06:38:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CD35086B5A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 20 May 2020 06:38:47 +0000 (UTC)
IronPort-SDR: DiLoX6EnWasCnxfkJCaXFJ/ATcCIihneHRkvJ4Anl4PO7/SsaBqDrzEgVyAfes94EMF4s4EJ9r
 3Vi2CcSx15Vg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2020 23:38:46 -0700
IronPort-SDR: wzPYeZPBSZy/xujHLb2StAkI30oFzPyTb+qF7FyiJtIynpT25wbT2tres16z32jhJOuwo6HdwR
 rqHnm0xF6hwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,413,1583222400"; d="scan'208";a="343397466"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.152])
 by orsmga001.jf.intel.com with ESMTP; 19 May 2020 23:38:46 -0700
Date: Tue, 19 May 2020 23:38:45 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 59/75] x86/sev-es: Handle MONITOR/MONITORX Events
Message-ID: <20200520063845.GC17090@linux.intel.com>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-60-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-60-joro@8bytes.org>
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

On Tue, Apr 28, 2020 at 05:17:09PM +0200, Joerg Roedel wrote:
> From: Tom Lendacky <thomas.lendacky@amd.com>
> 
> Implement a handler for #VC exceptions caused by MONITOR and MONITORX
> instructions.
> 
> Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
> [ jroedel@suse.de: Adapt to #VC handling infrastructure ]
> Co-developed-by: Joerg Roedel <jroedel@suse.de>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  arch/x86/kernel/sev-es.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
> index 601554e6360f..1a961714cd1b 100644
> --- a/arch/x86/kernel/sev-es.c
> +++ b/arch/x86/kernel/sev-es.c
> @@ -824,6 +824,22 @@ static enum es_result vc_handle_rdpmc(struct ghcb *ghcb, struct es_em_ctxt *ctxt
>  	return ES_OK;
>  }
>  
> +static enum es_result vc_handle_monitor(struct ghcb *ghcb,
> +					struct es_em_ctxt *ctxt)
> +{
> +	phys_addr_t monitor_pa;
> +	pgd_t *pgd;
> +
> +	pgd = __va(read_cr3_pa());
> +	monitor_pa = vc_slow_virt_to_phys(ghcb, ctxt->regs->ax);
> +
> +	ghcb_set_rax(ghcb, monitor_pa);
> +	ghcb_set_rcx(ghcb, ctxt->regs->cx);
> +	ghcb_set_rdx(ghcb, ctxt->regs->dx);
> +
> +	return sev_es_ghcb_hv_call(ghcb, ctxt, SVM_EXIT_MONITOR, 0, 0);

Why?  If SVM has the same behavior as VMX, the MONITOR will be disarmed on
VM-Enter, i.e. the VMM can't do anything useful for MONITOR/MWAIT.  I
assume that's the case given that KVM emulates MONITOR/MWAIT as NOPs on
SVM.

> +}
> +
>  static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
>  					 struct ghcb *ghcb,
>  					 unsigned long exit_code)
> @@ -860,6 +876,9 @@ static enum es_result vc_handle_exitcode(struct es_em_ctxt *ctxt,
>  	case SVM_EXIT_WBINVD:
>  		result = vc_handle_wbinvd(ghcb, ctxt);
>  		break;
> +	case SVM_EXIT_MONITOR:
> +		result = vc_handle_monitor(ghcb, ctxt);
> +		break;
>  	case SVM_EXIT_NPF:
>  		result = vc_handle_mmio(ghcb, ctxt);
>  		break;
> -- 
> 2.17.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
