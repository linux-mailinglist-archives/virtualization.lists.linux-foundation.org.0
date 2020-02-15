Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F715FE83
	for <lists.virtualization@lfdr.de>; Sat, 15 Feb 2020 13:45:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 30FCE203CC;
	Sat, 15 Feb 2020 12:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mASaxTsrevfK; Sat, 15 Feb 2020 12:45:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 42D09203C7;
	Sat, 15 Feb 2020 12:45:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8E81C0177;
	Sat, 15 Feb 2020 12:45:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B68D9C0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A4B36869A5
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHX56mAanA4X
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:45:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 10AC386982
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:45:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 5FA122C2; Sat, 15 Feb 2020 13:45:42 +0100 (CET)
Date: Sat, 15 Feb 2020 13:45:41 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 41/62] x86/sev-es: Handle MSR events
Message-ID: <20200215124540.GG22063@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-42-joro@8bytes.org>
 <b688b4ad-5a64-d2df-6dd8-e23fac75a6b9@intel.com>
 <20200214072324.GE22063@8bytes.org>
 <d43a1cc5-4229-e1fb-2a7a-d701d7b12ea9@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d43a1cc5-4229-e1fb-2a7a-d701d7b12ea9@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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

On Fri, Feb 14, 2020 at 08:59:39AM -0800, Dave Hansen wrote:
> On 2/13/20 11:23 PM, Joerg Roedel wrote:
> > Yes, investigating this is on the list for future optimizations (besides
> > caching CPUID results). My idea is to use alternatives patching for
> > this. But the exception handling is needed anyway because #VC
> > exceptions happen very early already, basically the first thing after
> > setting up a stack is calling verify_cpu(), which uses CPUID.
> 
> Ahh, bummer.  How does a guest know that it's running under SEV-ES?
> What's the enumeration mechanism if CPUID doesn't "work"?

There are two ways a guest can find out:

	1) Read the SEV_STATUS_MSR and check for the SEV-ES bit
	2) If a #VC exception is raised it also knows it runs as an
	   SEV-ES guest

This patch-set implements both ways at the appropriate stages of the
boot process. Very early it just installs a #VC handler without checking
whether it is running under SEV-ES and handles the exceptions when they
are raised.

Later in the boot process it also reads the SEV_STATUS_MSR and sets a
cpu_feature flag to do alternative patching based on its value.

> > The other reason is that things like MMIO and IOIO instructions can't be
> > easily patched by alternatives. Those would work with the runtime
> > checking you showed above, though.
> 
> Is there a reason we can't make a rule that you *must* do MMIO through
> an accessor function so we *can* patch them?  I know random drivers
> might break the rule, but are SEV-ES guests going to be running random
> drivers?  I would think that they mostly if not all want to use
> virtio.

Yeah, there are already defined accessor functions for MMIO, like
read/write[bwlq] and memcpy_toio/memcpy_fromio. It is probably worth
testing what performance overhead is involved in overloading these to
call directly into the paravirt path when SEV-ES is enabled. With
alternatives patching it would still add a couple of NOPS for the
non-SEV-ES case.

But all that does not remove the need for the #VC exception handler, as
#VC exceptions can also be triggered by user-space, and the instruction
emulation for MMIO will be needed to allow MMIO in user-space (the
patch-set currently does not allow that, but it could be needed in the
future).

Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
