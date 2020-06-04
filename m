Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 251581EE78E
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 17:20:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9992786FC3;
	Thu,  4 Jun 2020 15:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sT1n6bVuBbsZ; Thu,  4 Jun 2020 15:20:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3A9A886F50;
	Thu,  4 Jun 2020 15:20:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27377C016E;
	Thu,  4 Jun 2020 15:20:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D5F3C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 87A5B86F6A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgTGg5Tv7a61
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:20:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5F2EF86F50
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:20:03 +0000 (UTC)
Received: from zn.tnic (p200300ec2f112d0035262982e5edc845.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:2d00:3526:2982:e5ed:c845])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6CEA41EC0118;
 Thu,  4 Jun 2020 17:19:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1591283999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=v9mztibqlfJ/JLIFyImy9Q9qLirhr2kGLDWk5NuYc4Q=;
 b=GOHk7ZNT2JDKJZmzMCdd5ncsxdBtJ1WHI3JpBPGUDAkVXAd85NgVuWzqUzOfQmaZdUu940
 a7IhnG5aPPNkpl1OkaM3bTFrDqJDi9bC3qCWYfBupJVuZh/oWYxRKXYVZ/z8vWsDn0Y9ax
 RIzQH1SGrPjgRb2qcSl81uulBZZChEA=
Date: Thu, 4 Jun 2020 17:19:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 40/75] x86/sev-es: Compile early handler code into
 kernel image
Message-ID: <20200604151945.GB2246@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-41-joro@8bytes.org>
 <20200520091415.GC1457@zn.tnic> <20200604115413.GB30945@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604115413.GB30945@8bytes.org>
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

On Thu, Jun 04, 2020 at 01:54:13PM +0200, Joerg Roedel wrote:
> It is not only the trace-point, this would also eliminate exception
> handling in case the MSR access triggers a #GP. The "Unhandled MSR
> read/write" messages would turn into a "General Protection Fault"
> message.

But the early ones can trigger a #GP too. And there we can't handle
those #GPs.

Why would the late ones need exception handling all of a sudden? And
for the GHCB MSR, of all MSRs which the SEV-ES guest has used so far to
bootstrap?!

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
