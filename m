Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C08271F6554
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 12:05:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7E80D87257;
	Thu, 11 Jun 2020 10:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HPZXmtXbwjfr; Thu, 11 Jun 2020 10:05:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 11C7087034;
	Thu, 11 Jun 2020 10:05:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DFDECC016F;
	Thu, 11 Jun 2020 10:05:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F0A4C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:05:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3A6F886CB3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:05:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QeWBIqlW7wwB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:05:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CB52E86ABB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:05:23 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 3AD5C869; Thu, 11 Jun 2020 12:05:21 +0200 (CEST)
Date: Thu, 11 Jun 2020 12:05:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 40/75] x86/sev-es: Compile early handler code into
 kernel image
Message-ID: <20200611100519.GB32093@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-41-joro@8bytes.org>
 <20200520091415.GC1457@zn.tnic> <20200604115413.GB30945@8bytes.org>
 <20200604151945.GB2246@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604151945.GB2246@zn.tnic>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
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

On Thu, Jun 04, 2020 at 05:19:53PM +0200, Borislav Petkov wrote:
> On Thu, Jun 04, 2020 at 01:54:13PM +0200, Joerg Roedel wrote:
> > It is not only the trace-point, this would also eliminate exception
> > handling in case the MSR access triggers a #GP. The "Unhandled MSR
> > read/write" messages would turn into a "General Protection Fault"
> > message.
> 
> But the early ones can trigger a #GP too. And there we can't handle
> those #GPs.
> 
> Why would the late ones need exception handling all of a sudden? And
> for the GHCB MSR, of all MSRs which the SEV-ES guest has used so far to
> bootstrap?!

For example when there is a bug in the code which triggers an SEV-ES-only
code-path at runtime on bare-metal or in a non-SEV-ES VM. When the MSR
is accessed accidentially in that code-path the exception handling will
be helpful.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
