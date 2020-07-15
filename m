Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C557221184
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 17:49:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B120085BDF;
	Wed, 15 Jul 2020 15:49:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mco1b5fVXcWz; Wed, 15 Jul 2020 15:49:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E93908B604;
	Wed, 15 Jul 2020 15:49:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CC09DC0733;
	Wed, 15 Jul 2020 15:49:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E0A9C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:49:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 572F188FD5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:49:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yH188DcjkpHN
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:49:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9641F88FC7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 15:49:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1FA51ABE4;
 Wed, 15 Jul 2020 15:49:02 +0000 (UTC)
Date: Wed, 15 Jul 2020 17:48:56 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4 70/75] x86/head/64: Don't call verify_cpu() on
 starting APs
Message-ID: <20200715154856.GA24822@suse.de>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-71-joro@8bytes.org>
 <202007141837.2B93BBD78@keescook> <20200715092638.GJ16200@suse.de>
 <202007150815.A81E879@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202007150815.A81E879@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
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

Hi Kees,

as a general note: With SEV-ES the guest kernel will get #VC exceptions
for events that, without SEV-ES, would just cause a #VMEXIT to the
hypervisor.

On Wed, Jul 15, 2020 at 08:26:14AM -0700, Kees Cook wrote:
> On Wed, Jul 15, 2020 at 11:26:38AM +0200, Joerg Roedel wrote:
> > That MSR is Intel-only, right? The boot-path installed here is only used
> > for SEV-ES guests, running on AMD systems, so this MSR is not even
> > accessed during boot on those VMs.
> 
> Oh, hrm, yes, that's true. If other x86 maintainers are comfortable with
> this, then okay. My sense is that changing the early CPU startup paths
> will cause trouble down the line.

The AP startup path does not change for non SEV-ES guests. But under
SEV-ES everything that might cause a #VC exception must be avoided until
the kernel is ready to handle them. With the current patches this
happens when the AP runs in 64bit long-mode and loaded TSS and IDT.
Therefore a slightly different AP boot-path is needed for SEV-ES guests.

> So, going back to the requirements here ... what things in verify_cpu()
> can cause exceptions? AFAICT, cpuid is safely handled (i.e. it is
> detected and only run in a way to avoid exceptions and the MSR
> reads/writes are similarly bound by CPU family/id range checks). I must
> be missing something. :)

It is actually the CPUID instructions that cause #VC exceptions. The
MSRs that are accessed on AMD processors are not intercepted in the
hypervisors this code has been tested on, so these will not cause #VC
exceptions.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
