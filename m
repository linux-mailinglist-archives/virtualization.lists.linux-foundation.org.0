Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AC93E1EE42B
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 14:07:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 40B2388872;
	Thu,  4 Jun 2020 12:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fw15SvnWR4lQ; Thu,  4 Jun 2020 12:07:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9919A8887E;
	Thu,  4 Jun 2020 12:07:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72A1AC016E;
	Thu,  4 Jun 2020 12:07:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E55B2C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 12:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CD28B88872
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 12:07:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YkmcwxpIvInp
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 12:07:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35DF9878A4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 12:07:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id F3ED126F; Thu,  4 Jun 2020 14:07:50 +0200 (CEST)
Date: Thu, 4 Jun 2020 14:07:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 42/75] x86/sev-es: Setup GHCB based boot #VC handler
Message-ID: <20200604120749.GC30945@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-43-joro@8bytes.org>
 <20200520192230.GK1457@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520192230.GK1457@zn.tnic>
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

On Wed, May 20, 2020 at 09:22:30PM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:52PM +0200, Joerg Roedel wrote:
> > diff --git a/arch/x86/include/asm/sev-es.h b/arch/x86/include/asm/sev-es.h
> > index b2cbcd40b52e..e1ed963a57ec 100644
> > --- a/arch/x86/include/asm/sev-es.h
> > +++ b/arch/x86/include/asm/sev-es.h
> > @@ -74,5 +74,6 @@ static inline u64 lower_bits(u64 val, unsigned int bits)
> >  }
> >  
> >  extern void vc_no_ghcb(void);
> > +extern bool vc_boot_ghcb(struct pt_regs *regs);
> 
> Those function names need verbs:
> 
> 	handle_vc_no_ghcb
> 	handle_vc_boot_ghcb

This are IDT entry points and the names above follow the convention for
them, like e.g. 'page_fault', 'nmi' or 'general_protection'. Should I
still add the verbs or just add a comment explaining what those symbols
are?

> There's already another sev_es_setup_ghcb() in compressed/. All those
> functions with the same name are just confusion waiting to happen. Let's
> prepend the ones in compressed/ with "early_" or so, so that their names
> are at least different even if they're in two different files with the
> same name.
> 
> This way you know at least which function is used in which boot stages.

Okay, will see what can be changed. Some functions are part of the
interface for sev-es-shared.c and need to have the same names, but
sev_es_setup_ghcb() can be named differently.

> > +static void __init vc_early_vc_forward_exception(struct es_em_ctxt *ctxt)
> 
> That second "vc" looks redundant.

Heh, search and replace artifact :) Fixed now.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
