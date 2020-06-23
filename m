Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB44205A86
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 20:27:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C88B89761;
	Tue, 23 Jun 2020 18:27:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpL0SWeezlf2; Tue, 23 Jun 2020 18:27:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BE87889769;
	Tue, 23 Jun 2020 18:27:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA2B7C016F;
	Tue, 23 Jun 2020 18:27:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFD77C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DE8A98780B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:27:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IN-Vj2oEsPPC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:27:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D75D187808
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:27:06 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4653D2085B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 18:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592936826;
 bh=e3u7eLEEiVgkvLGksxftLW9CJqkzsq+PZNCEuWyaMmA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=df8cmTqu/u475ksvRlgGMGspPrUZ1p4YlTLJWRWJf2sLid0Jg+1PK1r6nHm17M0Nf
 Cs9pG/JyzOOIt6yP8CVgR6gkIFrQyirjD0ndbYEKmArDq+iSaao360C3EcX7/d1YSM
 VHRwBaOLwVvpAT9hUlJJVXqo8l0Og1MbMtH/xeJ0=
Received: by mail-wr1-f42.google.com with SMTP id l10so21565184wrr.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:27:06 -0700 (PDT)
X-Gm-Message-State: AOAM531JKnaINCtPiyrgcC2h+J73EomoegjU+ODlKsORasG7PkxxCb/c
 9rLNJppJNm+NhH2EfagP5u8nUB6Y8bQsQy+VCgszMw==
X-Google-Smtp-Source: ABdhPJz5I7kL1T4ZP6bKS2E9K/nkWfzSSzswn+8HddchIlf6AWc3lOZVTGa8iJYbAb/SvKbx8Na8udAAXAZQ0/7UDfE=
X-Received: by 2002:adf:e482:: with SMTP id i2mr2759106wrm.75.1592936824477;
 Tue, 23 Jun 2020 11:27:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
 <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
 <20200623111443.GC4817@hirez.programming.kicks-ass.net>
 <20200623114324.GA14101@suse.de>
 <20200623115014.GE4817@hirez.programming.kicks-ass.net>
 <20200623121237.GC14101@suse.de>
 <20200623130322.GH4817@hirez.programming.kicks-ass.net>
 <9e3f9b2a-505e-dfd7-c936-461227b4033e@citrix.com>
In-Reply-To: <9e3f9b2a-505e-dfd7-c936-461227b4033e@citrix.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Tue, 23 Jun 2020 11:26:52 -0700
X-Gmail-Original-Message-ID: <CALCETrWEUXU_BYd5ypF3XC10hSQUJ=XCVz40n3VfcWELS+roTg@mail.gmail.com>
Message-ID: <CALCETrWEUXU_BYd5ypF3XC10hSQUJ=XCVz40n3VfcWELS+roTg@mail.gmail.com>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>, X86 ML <x86@kernel.org>
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

On Tue, Jun 23, 2020 at 8:23 AM Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>
> On 23/06/2020 14:03, Peter Zijlstra wrote:
> > On Tue, Jun 23, 2020 at 02:12:37PM +0200, Joerg Roedel wrote:
> >> On Tue, Jun 23, 2020 at 01:50:14PM +0200, Peter Zijlstra wrote:
> >>> If SNP is the sole reason #VC needs to be IST, then I'd strongly urge
> >>> you to only make it IST if/when you try and make SNP happen, not before.
> >> It is not the only reason, when ES guests gain debug register support
> >> then #VC also needs to be IST, because #DB can be promoted into #VC
> >> then, and as #DB is IST for a reason, #VC needs to be too.
> > Didn't I read somewhere that that is only so for Rome/Naples but not for
> > the later chips (Milan) which have #DB pass-through?
>
> I don't know about hardware timelines, but some future part can now opt
> in to having debug registers as part of the encrypted state, and swapped
> by VMExit, which would make debug facilities generally usable, and
> supposedly safe to the #DB infinite loop issues, at which point the
> hypervisor need not intercept #DB for safety reasons.
>
> Its worth nothing that on current parts, the hypervisor can set up debug
> facilities on behalf of the guest (or behind its back) as the DR state
> is unencrypted, but that attempting to intercept #DB will redirect to
> #VC inside the guest and cause fun. (Also spare a thought for 32bit
> kernels which have to cope with userspace singlestepping the SYSENTER
> path with every #DB turning into #VC.)

What do you mean 32-bit?  64-bit kernels have exactly the same
problem.  At least the stack is okay, though.


Anyway, since I'm way behind on this thread, here are some thoughts:

First, I plan to implement actual precise recursion detection for the
IST stacks.  We'll be able to reliably panic when unallowed recursion
happens.

Second, I don't object *that* strongly to switching to a second #VC
stack if an NMI or MCE happens, but we really need to make sure we
cover *all* the bases.  And #VC is distressingly close to "happens at
all kinds of unfortunate times and the guest doesn't actually have
much ability to predice it" right now.  So we have #VC + #DB + #VC,
#VC + NMI + #VC, #VC + MCE + #VC, and even worse options.  So doing
the shift in a reliable way is not necessarily possible in a clean
way.

Let me contemplate.   And maybe produce some code soon.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
