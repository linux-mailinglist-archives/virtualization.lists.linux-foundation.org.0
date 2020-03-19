Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CFE18BC5A
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 17:24:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27DCB883E1;
	Thu, 19 Mar 2020 16:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6KDCZGwcMRsX; Thu, 19 Mar 2020 16:24:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 91D48883CC;
	Thu, 19 Mar 2020 16:24:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6473BC07FF;
	Thu, 19 Mar 2020 16:24:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72570C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 570F887E96
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:24:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s7qFNT77DreC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:24:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 98DF887E15
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 16:24:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9C464217; Thu, 19 Mar 2020 17:24:40 +0100 (CET)
Date: Thu, 19 Mar 2020 17:24:39 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 41/70] x86/sev-es: Add Runtime #VC Exception Handler
Message-ID: <20200319162439.GE5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-42-joro@8bytes.org>
 <CALCETrW9EYi5dzCKNtKkxM18CC4n5BZxTp1=qQ5qZccwstXjzg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrW9EYi5dzCKNtKkxM18CC4n5BZxTp1=qQ5qZccwstXjzg@mail.gmail.com>
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

On Thu, Mar 19, 2020 at 08:44:03AM -0700, Andy Lutomirski wrote:
> On Thu, Mar 19, 2020 at 2:14 AM Joerg Roedel <joro@8bytes.org> wrote:
> >
> > From: Tom Lendacky <thomas.lendacky@amd.com>
> >
> > Add the handler for #VC exceptions invoked at runtime.
> 
> If I read this correctly, this does not use IST.  If that's true, I
> don't see how this can possibly work.  There at least two nasty cases
> that come to mind:
> 
> 1. SYSCALL followed by NMI.  The NMI IRET hack gets to #VC and we
> explode.  This is fixable by getting rid of the NMI EFLAGS.TF hack.

Not an issue in this patch-set, the confusion comes from the fact that I
left some parts of the single-step-over-iret code in the patch. But it
is not used. The NMI handling in this patch-set sends the NMI-complete
message before the IRET, when the kernel is still in a safe environment
(kernel stack, kernel cr3).

> 2. tools/testing/selftests/x86/mov_ss_trap_64.  User code does MOV
> (addr), SS; SYSCALL, where addr has a data breakpoint.  We get #DB
> promoted to #VC with no stack.

Also not an issue, as debugging is not supported at the moment in SEV-ES
guests (hardware has no way yet to save/restore the debug registers
across #VMEXITs). But this will change with future hardware. If you look
at the implementation for dr7 read/write events, you see that the dr7
value is cached and returned, but does not make it to the hardware dr7.

I though about using IST for the #VC handler, but the implications for
nesting #VC handlers made me decide against it. But for future hardware
that supports debugging inside SEV-ES guests it will be an issue. I'll
think about how to fix the problem, it probably has to be IST :(

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
