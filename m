Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FDF441DC0
	for <lists.virtualization@lfdr.de>; Mon,  1 Nov 2021 17:10:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3984180C27;
	Mon,  1 Nov 2021 16:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjsYFb1oMAIT; Mon,  1 Nov 2021 16:10:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0B40680C35;
	Mon,  1 Nov 2021 16:10:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84219C0021;
	Mon,  1 Nov 2021 16:10:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DE656C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 16:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDD0880C1E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 16:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 81q5w_dAU_mR
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 16:10:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66BBA80C26
 for <virtualization@lists.linux-foundation.org>;
 Mon,  1 Nov 2021 16:10:35 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0cfa005d2c15110524cf3f.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0c:fa00:5d2c:1511:524:cf3f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E3EEA1EC0399;
 Mon,  1 Nov 2021 17:10:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1635783032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=cNsdwN4kKqk3161ajpvhRVfJcWO0W7ga/sbEAeYvU0A=;
 b=gM5qhsjPBTvrmKdXG/5HtueWzax3vGYxTRXR2FVKwwYSC4zZS6r3n2C2iGcZoX8XODyiPL
 UDWJGYDmI+8ncxmpPCjc9XdxdOETd6fEDqfkkkm/7QTOA5nK6A0sOPB0QozLxu0T4iS7VJ
 XR0HA2rgVU8uUt/+0SAC+yykmI6XvT8=
Date: Mon, 1 Nov 2021 17:10:25 +0100
From: Borislav Petkov <bp@alien8.de>
To: Eric Biederman <ebiederm@xmission.com>
Subject: Re: [PATCH v2 01/12] kexec: Allow architecture code to opt-out at
 runtime
Message-ID: <YYARccITlowHABg1@zn.tnic>
References: <20210913155603.28383-1-joro@8bytes.org>
 <20210913155603.28383-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210913155603.28383-2-joro@8bytes.org>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
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

On Mon, Sep 13, 2021 at 05:55:52PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Allow a runtime opt-out of kexec support for architecture code in case
> the kernel is running in an environment where kexec is not properly
> supported yet.
> 
> This will be used on x86 when the kernel is running as an SEV-ES
> guest. SEV-ES guests need special handling for kexec to hand over all
> CPUs to the new kernel. This requires special hypervisor support and
> handling code in the guest which is not yet implemented.
> 
> Cc: stable@vger.kernel.org # v5.10+
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  include/linux/kexec.h |  1 +
>  kernel/kexec.c        | 14 ++++++++++++++
>  kernel/kexec_file.c   |  9 +++++++++
>  3 files changed, 24 insertions(+)

I guess I can take this through the tip tree along with the next one.

Eric?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
