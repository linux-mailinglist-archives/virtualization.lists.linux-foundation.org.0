Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6603B1BAB6F
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 19:37:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CECE85FFC;
	Mon, 27 Apr 2020 17:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMJ370mGPzeJ; Mon, 27 Apr 2020 17:37:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4315F85C95;
	Mon, 27 Apr 2020 17:37:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21579C003B;
	Mon, 27 Apr 2020 17:37:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DC0FC003B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:37:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5D1412042C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:37:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGicfuxYmvLA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:37:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 9B2D62033D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:37:54 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2F0A720775
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 17:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588009074;
 bh=CRnrGSfeXKE04SYiSfLjK47OzoOEUP1L82XDJvKWoR4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=nu+Pwm8C7ZzEGBJLMJ9VwcO6z51c/SaWNuYsdGhtItHu3A+6FYmc/eXSNmTVAb2uK
 tneA1fuX8ZfPP79F3RSubUzWXXK8kKasgds0aHFbkTeJbXUGK2foYTtQ/f6xlDFlN3
 djowQs6+Y1171rpUGBcqSzTO520lNKT2mJFacNgE=
Received: by mail-wr1-f42.google.com with SMTP id k1so21580967wrx.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 10:37:54 -0700 (PDT)
X-Gm-Message-State: AGi0PuYizOe5RfPoSq1Q1sAm4k5xee5DFv1G+FnFz4BUDvUm88BOXAWC
 xTuLRCzbKSwPBMPFjQbU/tZzEwqsi066mVNcmCAO5w==
X-Google-Smtp-Source: APiQypK2liBn30m34/Dp/fYtTgQDcIlhKU2o3YS7OuvYuy5s6viTinmEVCuKGI6u9wjEWkrN2rR1dZgH24YAvZ+2RGI=
X-Received: by 2002:adf:f648:: with SMTP id x8mr27923047wrp.257.1588009072661; 
 Mon, 27 Apr 2020 10:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
In-Reply-To: <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 27 Apr 2020 10:37:41 -0700
X-Gmail-Original-Message-ID: <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
Message-ID: <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
Subject: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP from
 userspace)
To: Andy Lutomirski <luto@kernel.org>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Joerg Roedel <joro@8bytes.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>,
 X86 ML <x86@kernel.org>
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

On Sat, Apr 25, 2020 at 3:10 PM Andy Lutomirski <luto@kernel.org> wrote:
>
> On Sat, Apr 25, 2020 at 1:23 PM Joerg Roedel <joro@8bytes.org> wrote:
> >
> > On Sat, Apr 25, 2020 at 12:47:31PM -0700, Andy Lutomirski wrote:
> > > I assume the race you mean is:
> > >
> > > #VC
> > > Immediate NMI before IST gets shifted
> > > #VC
> > >
> > > Kaboom.
> > >
> > > How are you dealing with this?  Ultimately, I think that NMI will need
> > > to turn off IST before engaging in any funny business. Let me ponder
> > > this a bit.
> >
> > Right, I dealt with that by unconditionally shifting/unshifting the #VC IST entry
> > in do_nmi() (thanks to Davin Kaplan for the idea). It might cause
> > one of the IST stacks to be unused during nesting, but that is fine. The
> > stack memory for #VC is only allocated when SEV-ES is active (in an
> > SEV-ES VM).
>
> Blech.  It probably works, but still, yuck.  It's a bit sad that we
> seem to be growing more and more poorly designed happens-anywhere
> exception types at an alarming rate.  We seem to have #NM, #MC, #VC,
> #HV, and #DB.  This doesn't really scale.

I have a somewhat serious question: should we use IST for #VC at all?
As I understand it, Rome and Naples make it mandatory for hypervisors
to intercept #DB, which means that, due to the MOV SS mess, it's sort
of mandatory to use IST for #VC.  But Milan fixes the #DB issue, so,
if we're running under a sufficiently sensible hypervisor, we don't
need IST for #VC.

So I think we have two choices:

1. Use IST for #VC and deal with all the mess that entails.

2. Say that we SEV-ES client support on Rome and Naples is for
development only and do a quick boot-time check for whether #DB is
intercepted.  (Just set TF and see what vector we get.)  If #DB is
intercepted, print a very loud warning and refuse to boot unless some
special sev_es.insecure_development_mode or similar option is set.

#2 results in simpler and more robust entry code.  #1 is more secure.

So my question is: will anyone actually use SEV-ES in production on
Rome or Naples?  As I understand it, it's not really ready for prime
time on those chips.  And do we care if the combination of a malicious
hypervisor and malicious guest userspace on Milan can compromise the
guest kernel?  I don't think SEV-ES is really mean to resist a
concerted effort by the hypervisor to compromise the guest.

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
