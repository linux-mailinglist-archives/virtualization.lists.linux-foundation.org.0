Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA211EE23D
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 12:15:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A814D88177;
	Thu,  4 Jun 2020 10:15:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YYm+Pa8sQTdY; Thu,  4 Jun 2020 10:15:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0CE5A88179;
	Thu,  4 Jun 2020 10:15:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6E1BC016E;
	Thu,  4 Jun 2020 10:15:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7D141C016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:15:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6515386EFE
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:15:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KDXJ6SZBAFo0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:15:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E73FC86EF9
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 10:15:06 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D9CA726F; Thu,  4 Jun 2020 12:15:03 +0200 (CEST)
Date: Thu, 4 Jun 2020 12:15:02 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v3 25/75] x86/sev-es: Add support for handling IOIO
 exceptions
Message-ID: <20200604101502.GA20739@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-26-joro@8bytes.org>
 <20200520062055.GA17090@linux.intel.com>
 <20200603142325.GB23071@8bytes.org>
 <20200603230716.GD25606@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200603230716.GD25606@linux.intel.com>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
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

On Wed, Jun 03, 2020 at 04:07:16PM -0700, Sean Christopherson wrote:
> On Wed, Jun 03, 2020 at 04:23:25PM +0200, Joerg Roedel wrote:
> > User-space can also cause IOIO #VC exceptions, and user-space can be
> > 32-bit legacy code with segments, so es_base has to be taken into
> > account.
> 
> Is there actually a use case for this?  Exposing port IO to userspace
> doesn't exactly improve security.

Might be true, but Linux supports it and this patch-set is not the place
to challenge this feature.

> Given that i386 ABI requires EFLAGS.DF=0 upon function entry/exit, i.e. is
> the de facto default, the DF bug implies this hasn't been tested.  And I
> don't see how this could possibly have worked for SEV given that the kernel
> unrolls string I/O because the VMM can't emulate string I/O.  Presumably
> someone would have complained if they "needed" to run legacy crud.  The
> host and guest obviously need major updates, so supporting e.g. DPDK with
> legacy virtio seems rather silly.

With SEV-ES and this unrolling of string-io doesn't need to happen
anymore. It is on the list of things to improve, but this patch-set is
already pretty big.

> > True, #DBs won't be correct anymore. Currently debugging is not
> > supported in SEV-ES guests anyway, but if it is supported the #DB
> > exception would happen in the #VC handler and not on the original
> > instruction.
> 
> As in, the guest can't debug itself?  Or the host can't debug the guest?

Both, the guest can't debug itself because writes to DR7 never make it
to the hardware DR7 register. And the host obviously can't debug the
guest because it has no access to its unencrypted memory and register
state.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
