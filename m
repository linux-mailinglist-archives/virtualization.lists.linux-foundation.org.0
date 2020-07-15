Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD1F22098C
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:08:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id EBED18ABA3;
	Wed, 15 Jul 2020 10:08:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zTpECqEXzyKz; Wed, 15 Jul 2020 10:08:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 35F3E8ABA5;
	Wed, 15 Jul 2020 10:08:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1F7F5C0733;
	Wed, 15 Jul 2020 10:08:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71473C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6062A87E5D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:08:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HBkq-xq497q2
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:08:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 973BF87EA5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:08:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 505C8B6C0;
 Wed, 15 Jul 2020 10:08:14 +0000 (UTC)
Date: Wed, 15 Jul 2020 12:08:08 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v4 63/75] x86/sev-es: Handle #DB Events
Message-ID: <20200715100808.GL16200@suse.de>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-64-joro@8bytes.org>
 <20200715084752.GD10769@hirez.programming.kicks-ass.net>
 <20200715091337.GI16200@suse.de>
 <20200715095136.GG10769@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715095136.GG10769@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
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

On Wed, Jul 15, 2020 at 11:51:36AM +0200, Peter Zijlstra wrote:
> On Wed, Jul 15, 2020 at 11:13:37AM +0200, Joerg Roedel wrote:
> > Then my understanding of intrumentation_begin/end() is wrong, I thought
> > that the kernel will forbid setting breakpoints before
> > instrumentation_begin(), which is necessary here because a break-point
> > in the #VC handler might cause recursive #VC-exceptions when #DB is
> > intercepted.
> > Maybe you can elaborate on why this makes no sense?
> 
> Kernel avoids breakpoints in any noinstr text, irrespective of
> instrumentation_begin().
> 
> instrumentation_begin() merely allows one to call !noinstr functions.

Right, but the handler calls into various other functions. I actually
started to annotate them all with noinstr, but that was a can of worms
when calling into generic kernel functions. And the only problem with
intrumentation in the #VC handler is the #VC-for-#DB exit-code, so I
decided to only handle this one with instrumentation forbidden and allow
it for the rest of the handler.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
