Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 332A7388EC9
	for <lists.virtualization@lfdr.de>; Wed, 19 May 2021 15:16:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B10BD403BE;
	Wed, 19 May 2021 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qzA2MfEsGiRo; Wed, 19 May 2021 13:16:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E59C40377;
	Wed, 19 May 2021 13:16:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28D56C001C;
	Wed, 19 May 2021 13:16:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDF7CC0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE8594020C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xvIRNSg6dF7d
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:16:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A89C4011B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 May 2021 13:16:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 63C252FA; Wed, 19 May 2021 15:16:39 +0200 (CEST)
Date: Wed, 19 May 2021 15:16:38 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH 2/6] x86/sev-es: Forward page-faults which happen during
 emulation
Message-ID: <YKUPtrquQyImL3h5@8bytes.org>
References: <20210512075445.18935-1-joro@8bytes.org>
 <20210512075445.18935-3-joro@8bytes.org>
 <YJwQ1xsiDtv3LkBe@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJwQ1xsiDtv3LkBe@google.com>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Hyunwook Baek <baekhw@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

Hi Sean,

On Wed, May 12, 2021 at 05:31:03PM +0000, Sean Christopherson wrote:
> This got me looking at the flows that "inject" #PF, and I'm pretty sure there
> are bugs in __vc_decode_user_insn() + insn_get_effective_ip().
> 
> Problem #1: __vc_decode_user_insn() assumes a #PF if insn_fetch_from_user_inatomic()
> fails, but the majority of failure cases in insn_get_seg_base() are #GPs, not #PF.
> 
> 	res = insn_fetch_from_user_inatomic(ctxt->regs, buffer);
> 	if (!res) {
> 		ctxt->fi.vector     = X86_TRAP_PF;
> 		ctxt->fi.error_code = X86_PF_INSTR | X86_PF_USER;
> 		ctxt->fi.cr2        = ctxt->regs->ip;
> 		return ES_EXCEPTION;
> 	}
> 
> Problem #2: Using '0' as an error code means a legitimate effective IP of '0'
> will be misinterpreted as a failure.  Practically speaking, I highly doubt anyone
> will ever actually run code at address 0, but it's technically possible.  The
> most robust approach would be to pass a pointer to @ip and return an actual error
> code.  Using a non-canonical magic value might also work, but that could run afoul
> of future shenanigans like LAM.
> 
> 	ip = insn_get_effective_ip(regs);
> 	if (!ip)
> 		return 0;

Your observations are all correct. I put some changes onto this
patch-set to fix these problems.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
