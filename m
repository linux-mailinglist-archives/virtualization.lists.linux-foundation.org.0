Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332A2208B2
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:26:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id DC3628AB3F;
	Wed, 15 Jul 2020 09:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e+6s-9J8kiyd; Wed, 15 Jul 2020 09:26:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7D73D8AB3C;
	Wed, 15 Jul 2020 09:26:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57791C08A0;
	Wed, 15 Jul 2020 09:26:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E7D1C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 12CD18A165
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jskuNi1+KlEi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:26:42 +0000 (UTC)
X-Greylist: delayed 00:13:01 by SQLgrey-1.7.6
Received: from mx2.suse.de (unknown [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5CD3988B31
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:26:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0D1F0AF6F;
 Wed, 15 Jul 2020 09:26:44 +0000 (UTC)
Date: Wed, 15 Jul 2020 11:26:38 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4 70/75] x86/head/64: Don't call verify_cpu() on
 starting APs
Message-ID: <20200715092638.GJ16200@suse.de>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-71-joro@8bytes.org>
 <202007141837.2B93BBD78@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202007141837.2B93BBD78@keescook>
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

thanks for your reviews!

On Tue, Jul 14, 2020 at 06:40:30PM -0700, Kees Cook wrote:
> Eek, no. MSR_IA32_MISC_ENABLE_XD_DISABLE needs to be cleared very early
> during CPU startup; this can't just be skipped.

That MSR is Intel-only, right? The boot-path installed here is only used
for SEV-ES guests, running on AMD systems, so this MSR is not even
accessed during boot on those VMs.

The alternative is to set up exception handling prior to calling
verify_cpu, including segments, stack and IDT. Given that verify_cpu()
does not add much value to SEV-ES guests, I'd like to avoid adding this
complexity.

> Also, is UNWIND_HINT_EMPTY needed for the new target?

Yes, I think it is, will add it in the next version.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
