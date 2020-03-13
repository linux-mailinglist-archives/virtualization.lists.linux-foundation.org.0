Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2A91847D3
	for <lists.virtualization@lfdr.de>; Fri, 13 Mar 2020 14:17:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DF6D5894BB;
	Fri, 13 Mar 2020 13:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMGN6GyBq72J; Fri, 13 Mar 2020 13:17:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 990D689466;
	Fri, 13 Mar 2020 13:17:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 75CCAC0177;
	Fri, 13 Mar 2020 13:17:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3585C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 13:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A022885593
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 13:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uux_s9a04lti
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 13:17:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8CC3F854D0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Mar 2020 13:17:43 +0000 (UTC)
Received: from zn.tnic (p200300EC2F0E1E00C9D39E8F6B716147.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:1e00:c9d3:9e8f:6b71:6147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 11F561EC0664;
 Fri, 13 Mar 2020 14:17:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1584105460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=79SYJVbn9xyGCTNXi5+gvS6+5Ev7kVYhMM7OtsN1PKU=;
 b=HiBZdupsZoSjjTHntD0FOa9pLwb5ty+/YkZgYBs31cVZjMRhsFyc3aJ2J9lTOMwr50mASS
 e0Rvn2ZnlfcPJR5PskONaUD6rLayd3PY3QYzsZs1UVkV1G5gNcvVsn2Q4zIw6IWGwf7GbO
 DRbz7NBtr2YJEMdNKYAvkqmRKFQ5TAg=
Date: Fri, 13 Mar 2020 14:17:42 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexey Makhalov <amakhalov@vmware.com>
Subject: Re: [PATCH 0/5] x86/vmware: Steal time accounting support
Message-ID: <20200313131742.GA8142@zn.tnic>
References: <20200212200312.2033-1-amakhalov@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212200312.2033-1-amakhalov@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>, "VMware, Inc." <pv-drivers@vmware.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
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

On Wed, Feb 12, 2020 at 08:03:07PM +0000, Alexey Makhalov wrote:
> Hello,
> 
> This patchset introduces steal time accounting support for
> the VMware guest. The idea and implementation of guest
> steal time support is similar to KVM ones and it is based
> on steal clock. The steal clock is a per CPU structure in
> a shared memory between hypervisor and guest, initialized
> by each CPU through hypercall. Steal clock is got updated
> by the hypervisor and read by the guest. 
> 
> The patchset consists of 5 items:
> 
> 1. x86/vmware: Make vmware_select_hypercall() __init
> Minor clean up.
> 
> 2. x86/vmware: Remove vmware_sched_clock_setup()
> Preparation for the main patch.
> 
> 3. x86/vmware: Steal time clock for VMware guest
> Core steal time support functionality.
> 
> 4. x86/vmware: Enable steal time accounting
> Support for steal time accounting used by update_rq_clock().
> 
> 5. x86/vmware: Use bool type for vmw_sched_clock
> Minor clean up.
> 
> Alexey Makhalov (5):
>   x86/vmware: Make vmware_select_hypercall() __init
>   x86/vmware: Remove vmware_sched_clock_setup()
>   x86/vmware: Steal time clock for VMware guest
>   x86/vmware: Enable steal time accounting
>   x86/vmware: Use bool type for vmw_sched_clock
> 
>  Documentation/admin-guide/kernel-parameters.txt |   2 +-
>  arch/x86/kernel/cpu/vmware.c                    | 227 +++++++++++++++++++++++-
>  2 files changed, 220 insertions(+), 9 deletions(-)

$ make ARCH=i386 allyesconfig
$ make ARCH=i386

  ...

  AR      drivers/net/built-in.a
  AR      drivers/built-in.a
  GEN     .version
  CHK     include/generated/compile.h
  LD      vmlinux.o
ld: arch/x86/kernel/kvm.o:(.discard+0x2): multiple definition of `__pcpu_unique_steal_time'; arch/x86/kernel/cpu/vmware.o:(.discard+0x0): first defined here
make: *** [Makefile:1078: vmlinux] Error 1

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
