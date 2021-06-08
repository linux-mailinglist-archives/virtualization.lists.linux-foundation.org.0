Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F247139F7CD
	for <lists.virtualization@lfdr.de>; Tue,  8 Jun 2021 15:26:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940E2400FD;
	Tue,  8 Jun 2021 13:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZiMLOBESFQZB; Tue,  8 Jun 2021 13:25:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 885BF40114;
	Tue,  8 Jun 2021 13:25:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 15801C0001;
	Tue,  8 Jun 2021 13:25:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5732FC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 13:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5296D83A84
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 13:25:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4bNDzPZNL00T
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 13:25:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E49882BC7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Jun 2021 13:25:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8A7F3386; Tue,  8 Jun 2021 15:25:53 +0200 (CEST)
Date: Tue, 8 Jun 2021 15:25:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 4/7] x86/sev-es: Run #VC handler in plain IRQ state
Message-ID: <YL9v38J0JC5FrZnM@8bytes.org>
References: <20210608095439.12668-1-joro@8bytes.org>
 <20210608095439.12668-5-joro@8bytes.org>
 <YL9bd2hx/y9oD6x/@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YL9bd2hx/y9oD6x/@hirez.programming.kicks-ass.net>
Cc: kvm@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
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

Hi Peter,

On Tue, Jun 08, 2021 at 01:58:47PM +0200, Peter Zijlstra wrote:
> So #VC cannot happen with IRQs disabled?
> 
> 	raw_spin_lock_irq(&my_lock);
> 	<#VC>
> 		raw_spin_lock_irqsave(&my_lock); // whoopsie
> 
> Every exception that can happen with IRQs disabled must be NMI like.
> 
> Again, what you seem to want is to split the handler in a from-user and
> from-kernel way, just like we did with #DB and MCE. See how
> exc_debug_user() is IRQ-like and can send signals, while
> exc_debug_kernel() is NMI like and can not.

You are right, thanks for pointing this out. I replaced that patch by
one implementing the split in a from-user and from-kernel part. Initial
testing looks good, will send it out later this week.

Thanks,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
