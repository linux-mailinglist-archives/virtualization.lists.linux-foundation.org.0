Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE523A66A9
	for <lists.virtualization@lfdr.de>; Mon, 14 Jun 2021 14:33:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 726CA8399E;
	Mon, 14 Jun 2021 12:33:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fzNmw6Fk276; Mon, 14 Jun 2021 12:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 58AD183A4E;
	Mon, 14 Jun 2021 12:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF16CC000B;
	Mon, 14 Jun 2021 12:33:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FA93C000B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 12:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29CF74049D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 12:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUay2wMPcTBP
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 12:33:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BCF8B40485
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 12:33:09 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 05EE12DA; Mon, 14 Jun 2021 14:33:05 +0200 (CEST)
Date: Mon, 14 Jun 2021 14:33:04 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Eric Biederman <ebiederm@xmission.com>, x86@kernel.org
Subject: Re: [PATCH v2 0/2] x86: Disable kexec for SEV-ES guests
Message-ID: <YMdMgCAIYN4zOX4N@8bytes.org>
References: <20210603132233.10004-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210603132233.10004-1-joro@8bytes.org>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, David Rientjes <rientjes@google.com>,
 Martin Radev <martin.b.radev@gmail.com>,
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

Gentle ping.

On Thu, Jun 03, 2021 at 03:22:31PM +0200, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Changes v1->v2:
> 
> 	- Rebased to v5.13-rc4
> 	- Add the check also to the kexec_file_load system call
> 
> Original cover letter:
> 
> Hi,
> 
> two small patches to disable kexec on x86 when running as an SEV-ES
> guest. Trying to kexec a new kernel would fail anyway because there is
> no mechanism yet to hand over the APs from the old to the new kernel.
> Supporting this needs changes in the Hypervisor and the guest kernel
> as well.
> 
> This code is currently being work on, but disable kexec in SEV-ES
> guests until it is ready.
> 
> Please review.
> 
> Regards,
> 
> 	Joerg
> 
> Joerg Roedel (2):
>   kexec: Allow architecture code to opt-out at runtime
>   x86/kexec/64: Forbid kexec when running as an SEV-ES guest
> 
>  arch/x86/kernel/machine_kexec_64.c |  8 ++++++++
>  include/linux/kexec.h              |  1 +
>  kernel/kexec.c                     | 14 ++++++++++++++
>  kernel/kexec_file.c                |  9 +++++++++
>  4 files changed, 32 insertions(+)
> 
> -- 
> 2.31.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
