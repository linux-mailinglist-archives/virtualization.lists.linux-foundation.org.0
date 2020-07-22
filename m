Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6542292F1
	for <lists.virtualization@lfdr.de>; Wed, 22 Jul 2020 10:05:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 03F0E87DAF;
	Wed, 22 Jul 2020 08:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YZSByiM3lUR; Wed, 22 Jul 2020 08:05:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D31D5882F8;
	Wed, 22 Jul 2020 08:05:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F65FC004C;
	Wed, 22 Jul 2020 08:05:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE45CC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D947B8805D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id It4pAkBMjbSg
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:05:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3677387DAF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 22 Jul 2020 08:05:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0EB4CAFE8;
 Wed, 22 Jul 2020 08:05:41 +0000 (UTC)
Date: Wed, 22 Jul 2020 10:05:30 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Mike Stunes <mstunes@vmware.com>
Subject: Re: [PATCH v4 51/75] x86/sev-es: Handle MMIO events
Message-ID: <20200722080530.GH6132@suse.de>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-52-joro@8bytes.org>
 <40D5C698-1ED2-4CCE-9C1D-07620A021A6A@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40D5C698-1ED2-4CCE-9C1D-07620A021A6A@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, Erdem Aktas <erdemaktas@google.com>,
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

Hmm, I have a theory ...

On Tue, Jul 21, 2020 at 09:01:44PM +0000, Mike Stunes wrote:
> If I remove the call to probe_roms from setup_arch, or remove the calls to romchecksum from probe_roms, this kernel boots normally.
> 
> Please let me know of other tests I should run or data that I can collect. Thanks!

... can you please try the attached diff?

diff --git a/arch/x86/kernel/sev-es.c b/arch/x86/kernel/sev-es.c
index 251d0aabc55a..e1fea7a38019 100644
--- a/arch/x86/kernel/sev-es.c
+++ b/arch/x86/kernel/sev-es.c
@@ -389,7 +389,8 @@ static bool vc_slow_virt_to_phys(struct ghcb *ghcb, struct es_em_ctxt *ctxt,
 	pgd_t *pgd;
 	pte_t *pte;
 
-	pgd = pgd_offset(current->active_mm, va);
+	pgd = __va(read_cr3_pa());
+	pgd = &pgd[pgd_index(va)];
 	pte = lookup_address_in_pgd(pgd, va, &level);
 	if (!pte) {
 		ctxt->fi.vector     = X86_TRAP_PF;
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
