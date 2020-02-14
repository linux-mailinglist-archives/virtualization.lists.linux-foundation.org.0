Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F9115D2C4
	for <lists.virtualization@lfdr.de>; Fri, 14 Feb 2020 08:23:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9032B20480;
	Fri, 14 Feb 2020 07:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShdqwCAQxza1; Fri, 14 Feb 2020 07:23:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B5CE5203DA;
	Fri, 14 Feb 2020 07:23:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9AE61C0177;
	Fri, 14 Feb 2020 07:23:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CB23C0177
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 07:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 42F32863E2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 07:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xy-hWyKs8wJi
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 07:23:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4B284863E0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 14 Feb 2020 07:23:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id CFB203FC; Fri, 14 Feb 2020 08:23:25 +0100 (CET)
Date: Fri, 14 Feb 2020 08:23:24 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 41/62] x86/sev-es: Handle MSR events
Message-ID: <20200214072324.GE22063@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-42-joro@8bytes.org>
 <b688b4ad-5a64-d2df-6dd8-e23fac75a6b9@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b688b4ad-5a64-d2df-6dd8-e23fac75a6b9@intel.com>
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

On Thu, Feb 13, 2020 at 07:45:00AM -0800, Dave Hansen wrote:
> On 2/11/20 5:52 AM, Joerg Roedel wrote:
> > Implement a handler for #VC exceptions caused by RDMSR/WRMSR
> > instructions.
> 
> As a general comment on all of these event handlers: Why do we bother
> having the hypercalls in the interrupt handler as opposed to just
> calling them directly.  What you have is:
> 
> 	wrmsr()
> 	-> #VC exception
> 	   hcall()
> 
> But we could make our rd/wrmsr() wrappers just do:
> 
> 	if (running_on_sev_es())
> 		hcall(HCALL_MSR_WHATEVER...)
> 	else
> 		wrmsr()
> 
> and then we don't have any of the nastiness of exception handling.

Yes, investigating this is on the list for future optimizations (besides
caching CPUID results). My idea is to use alternatives patching for
this. But the exception handling is needed anyway because #VC
exceptions happen very early already, basically the first thing after
setting up a stack is calling verify_cpu(), which uses CPUID.
The other reason is that things like MMIO and IOIO instructions can't be
easily patched by alternatives. Those would work with the runtime
checking you showed above, though.

Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
