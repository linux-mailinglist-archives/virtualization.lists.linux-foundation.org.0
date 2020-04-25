Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C9F1B8691
	for <lists.virtualization@lfdr.de>; Sat, 25 Apr 2020 14:49:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 45A6B85D8E;
	Sat, 25 Apr 2020 12:49:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GHyCd89TgprG; Sat, 25 Apr 2020 12:49:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B75D385D11;
	Sat, 25 Apr 2020 12:49:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A07A5C0175;
	Sat, 25 Apr 2020 12:49:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BFA28C0175
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:49:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9CF3B87EB0
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:49:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4Sz0y7agfJw
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:49:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E515E87EAD
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 12:49:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 08E85AD10;
 Sat, 25 Apr 2020 12:49:12 +0000 (UTC)
Date: Sat, 25 Apr 2020 14:49:09 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
Message-ID: <20200425124909.GO30814@suse.de>
References: <20200319091407.1481-56-joro@8bytes.org>
 <20200424210316.848878-1-mstunes@vmware.com>
 <2c49061d-eb84-032e-8dcb-dd36a891ce90@intel.com>
 <ead88d04-1756-1190-2b37-b24f86422595@amd.com>
 <4d2ac222-a896-a60e-9b3c-b35aa7e81a97@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4d2ac222-a896-a60e-9b3c-b35aa7e81a97@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: jgross@suse.com, Tom Lendacky <thomas.lendacky@amd.com>,
 thellstrom@vmware.com, x86@kernel.org, Mike Stunes <mstunes@vmware.com>,
 keescook@chromium.org, kvm@vger.kernel.org, peterz@infradead.org,
 joro@8bytes.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org, luto@kernel.org, hpa@zytor.com,
 dan.j.williams@intel.com, jslaby@suse.cz
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

Hi Dave,

On Fri, Apr 24, 2020 at 03:53:09PM -0700, Dave Hansen wrote:
> Ahh, so any instruction that can have an instruction intercept set
> potentially needs to be able to tolerate a #VC?  Those instruction
> intercepts are under the control of the (untrusted relative to the
> guest) hypervisor, right?
> 
> >From the main sev-es series:
> 
> +#ifdef CONFIG_AMD_MEM_ENCRYPT
> +idtentry vmm_communication     do_vmm_communication    has_error_code=1
> +#endif

The next version of the patch-set (which I will hopefully have ready
next week) will have this changed. The #VC exception handler uses an IST
stack and is set to paranoid=1 and shift_ist. The IST stacks for the #VC
handler are only allocated when SEV-ES is active.

> That's a fun point because it means that the (untrusted) hypervisor can
> cause endless faults.  I *guess* we have mitigation for this with our
> stack guard pages, but it's still a bit nasty that the hypervisor can
> arbitrarily land a guest in the double-fault handler.
> 
> It just all seems a bit weak for the hypervisor to be considered
> untrusted.  But, it's _certainly_ a steep in the right direction from SEV.

Yeah, a malicious hypervisor can do bad things to an SEV-ES VM, but it
can't easily steal its secrets from memory or registers. The #VC handler
does its best to just crash the VM if unexpected hypervisor behavior is
detected.


Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
