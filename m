Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8221F67F4
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 14:40:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2DC2B88760;
	Thu, 11 Jun 2020 12:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QazxzPY71FW0; Thu, 11 Jun 2020 12:40:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 750FD886B2;
	Thu, 11 Jun 2020 12:40:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 53A25C016F;
	Thu, 11 Jun 2020 12:40:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A58DC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 12:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 579FD8962C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 12:40:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qyygvt12+3XQ
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 12:40:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C6CDD895CB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 12:40:11 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 6A791869; Thu, 11 Jun 2020 14:40:09 +0200 (CEST)
Date: Thu, 11 Jun 2020 14:40:08 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v3 51/75] x86/sev-es: Handle MMIO events
Message-ID: <20200611124008.GC11924@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-52-joro@8bytes.org>
 <20200520063202.GB17090@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520063202.GB17090@linux.intel.com>
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

On Tue, May 19, 2020 at 11:32:02PM -0700, Sean Christopherson wrote:
> '0' is a valid physical address.  It happens to be reserved in the kernel
> thanks to L1TF, but using '0' as an error code is ugly.  Not to mention
> none of the callers actually check the result.

Right, I changed the function to better handle error cases and added
checks to the call-sites. It looks like below now:

static bool vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
                                 unsigned long vaddr, phys_addr_t *paddr)
{
        unsigned long va = (unsigned long)vaddr;
        unsigned int level;
        phys_addr_t pa;
        pgd_t *pgd;
        pte_t *pte;

        pgd = pgd_offset(current->active_mm, va);
        pte = lookup_address_in_pgd(pgd, va, &level);
        if (!pte) {
                ctxt->fi.vector     = X86_TRAP_PF;
                ctxt->fi.cr2        = vaddr;
                ctxt->fi.error_code = 0;

                if (user_mode(ctxt->regs))
                        ctxt->fi.error_code |= X86_PF_USER;

                return false;
        }

        pa = (phys_addr_t)pte_pfn(*pte) << PAGE_SHIFT;
        pa |= va & ~page_level_mask(level);

        *paddr = pa;

        return true;
}

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
