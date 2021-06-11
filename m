Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD96A3A43F6
	for <lists.virtualization@lfdr.de>; Fri, 11 Jun 2021 16:20:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 36B7A400C2;
	Fri, 11 Jun 2021 14:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ppkgpaDuNKRO; Fri, 11 Jun 2021 14:20:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0DB2C404E2;
	Fri, 11 Jun 2021 14:20:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E789C000B;
	Fri, 11 Jun 2021 14:20:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB016C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF94B414C6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:20:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZJtZYUoCanUr
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:20:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 639F1414C2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:20:40 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4D7A52FA; Fri, 11 Jun 2021 16:20:37 +0200 (CEST)
Date: Fri, 11 Jun 2021 16:20:36 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v4 2/6] x86/sev-es: Disable IRQs while GHCB is active
Message-ID: <YMNxNEb/T3iF4TG8@8bytes.org>
References: <20210610091141.30322-1-joro@8bytes.org>
 <20210610091141.30322-3-joro@8bytes.org> <YMNtmz6W1apXL5q+@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMNtmz6W1apXL5q+@zn.tnic>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

On Fri, Jun 11, 2021 at 04:05:15PM +0200, Borislav Petkov wrote:
> On Thu, Jun 10, 2021 at 11:11:37AM +0200, Joerg Roedel wrote:
> Why not simply "sandwich" them:
> 
> 	local_irq_save()
> 	sev_es_get_ghcb()
> 
> 	...blablabla
> 
> 	sev_es_put_ghcb()
> 	local_irq_restore();
> 
> in every call site?

I am not a fan of this, because its easily forgotten to add
local_irq_save()/local_irq_restore() calls around those. Yes, we can add
irqs_disabled() assertions to the functions, but we can as well just
disable/enable IRQs in them. Only the previous value of EFLAGS.IF needs
to be carried from one function to the other.

> Hmm, so why aren't you accessing/setting data->ghcb_active and
> data->backup_ghcb_active safely using cmpxchg() if this path can be
> interrupted by an NMI?

Using cmpxchg is not necessary here. It is all per-cpu data, so local to
the current cpu. If an NMI happens anywhere in sev_es_get_ghcb() it can
still use the GHCB, because the interrupted #VC handler will not start
writing to it before sev_es_get_ghcb() returned.

Problems only come up when one path starts writing to the GHCB, but that
happens long after it is marked active.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
