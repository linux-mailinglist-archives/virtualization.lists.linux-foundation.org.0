Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E21CD15A825
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 12:45:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 32AD32047B;
	Wed, 12 Feb 2020 11:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wtj2sjelnQGM; Wed, 12 Feb 2020 11:45:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6116F20465;
	Wed, 12 Feb 2020 11:45:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3B278C0177;
	Wed, 12 Feb 2020 11:45:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41A1DC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2AB3C203D1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:45:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21pjKS5yMZCf
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:45:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 569CA20013
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:45:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 01EBF4A6; Wed, 12 Feb 2020 12:45:03 +0100 (CET)
Date: Wed, 12 Feb 2020 12:44:51 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 18/62] x86/boot/compressed/64: Setup GHCB Based VC
 Exception handler
Message-ID: <20200212114451.GC20066@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-19-joro@8bytes.org>
 <CALCETrVWoG7ugfE_FJgNKyyWYCmZh1162kfceJ2bs+O7Qyf-8A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrVWoG7ugfE_FJgNKyyWYCmZh1162kfceJ2bs+O7Qyf-8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

On Tue, Feb 11, 2020 at 02:25:49PM -0800, Andy Lutomirski wrote:
> On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
> >
> > From: Joerg Roedel <jroedel@suse.de>
> >
> > Install an exception handler for #VC exception that uses a GHCB. Also
> > add the infrastructure for handling different exit-codes by decoding
> > the instruction that caused the exception and error handling.
> >
> 
> > diff --git a/arch/x86/boot/compressed/sev-es.c b/arch/x86/boot/compressed/sev-es.c
> > index 8d13121a8cf2..02fb6f57128b 100644
> > --- a/arch/x86/boot/compressed/sev-es.c
> > +++ b/arch/x86/boot/compressed/sev-es.c
> > @@ -8,12 +8,16 @@
> >  #include <linux/kernel.h>
> >
> >  #include <asm/sev-es.h>
> > +#include <asm/trap_defs.h>
> >  #include <asm/msr-index.h>
> >  #include <asm/ptrace.h>
> >  #include <asm/svm.h>
> >
> >  #include "misc.h"
> >
> > +struct ghcb boot_ghcb_page __aligned(PAGE_SIZE);
> > +struct ghcb *boot_ghcb;
> > +
> >  static inline u64 read_ghcb_msr(void)
> >  {
> >         unsigned long low, high;
> > @@ -35,8 +39,95 @@ static inline void write_ghcb_msr(u64 val)
> >                         "a"(low), "d" (high) : "memory");
> >  }
> >
> > +static enum es_result es_fetch_insn_byte(struct es_em_ctxt *ctxt,
> > +                                        unsigned int offset,
> > +                                        char *buffer)
> > +{
> > +       char *rip = (char *)ctxt->regs->ip;
> > +
> > +       buffer[offset] = rip[offset];
> > +
> > +       return ES_OK;
> > +}
> > +
> > +static enum es_result es_write_mem(struct es_em_ctxt *ctxt,
> > +                                  void *dst, char *buf, size_t size)
> > +{
> > +       memcpy(dst, buf, size);
> > +
> > +       return ES_OK;
> > +}
> > +
> > +static enum es_result es_read_mem(struct es_em_ctxt *ctxt,
> > +                                 void *src, char *buf, size_t size)
> > +{
> > +       memcpy(buf, src, size);
> > +
> > +       return ES_OK;
> > +}
> 
> 
> What are all these abstractions for?

They are needed for the code in arch/x86/kernel/sev-es-shared.c. This
file is used in the pre-decompression boot code and in the running
kernels SEV-ES support.

The running kernel needs these abstraction because it will get #VC
exceptions from user-space and MMIO exits touching user-space addresses.
These functions will implement the necessary security checks.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
