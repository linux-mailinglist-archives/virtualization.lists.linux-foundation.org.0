Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E768517850B
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 22:43:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F36752045C;
	Tue,  3 Mar 2020 21:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OB6dsYtnbrwq; Tue,  3 Mar 2020 21:43:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8F8112050F;
	Tue,  3 Mar 2020 21:43:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BB3CC013E;
	Tue,  3 Mar 2020 21:43:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76701C013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 21:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6221585E28
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 21:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLH4225Qs0_6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 21:43:12 +0000 (UTC)
X-Greylist: delayed 00:17:27 by SQLgrey-1.7.6
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
 [209.85.217.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EA353834D2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 21:43:11 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id u26so3484840vsg.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Mar 2020 13:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2qU0zyTDNzYtyDUGa9/iXos9xa7ov/2wTakWPxGP1ks=;
 b=WqGcGMvMn5GluxOGODQRPNpbzgvWO+OkNu8cZEiK4m3NjrW/mP/9I8Ma2MOO/Ww+Rh
 AXpTLggSqb4nT/DNHZ4zPLZBLfPgo7r9MZEl//d92/3cJAZoUlA/0t9tIJIOzPiz4Vo8
 qCIuwYIq9DuCng1+aDxogCJeRnZ7hUGxeizAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2qU0zyTDNzYtyDUGa9/iXos9xa7ov/2wTakWPxGP1ks=;
 b=jAxrpxcCw9LVcC4oF+yON4Ghqg87kMPOrzA8Hg+PRMIr+suaB/DhXdenKOxfhfcwyI
 5Jpbk1QFcuORbDyb8Spw2pJjLyCXmBSAqCwJGzAQ6Qfm7ANJoldkALTym6UmjWTzadhj
 xfY6QdupKJ3AW53S8r9U2RbpSz3Pj9n/tlKk7j0Vq8D/sxp3VPfB6BhKJj7UCb9+5suw
 1SOsdYzkbRJfGiC1rAwuR6GyYgZ+nisgLfOtZuh3VtJcv7JS+9yy6GH+rW6Qx9CPzpqX
 1RXzGgxIv+q2nKxKfs/mudPPNz7Bg+nS6xH5rgz8KrRFFTU73QH5iR1Dhdw6w3YFWgyD
 HK8A==
X-Gm-Message-State: ANhLgQ1qffaBv0TXosVyIZtRuqatjq06DdxaBCrnkmIgEUYv1YkRrNLj
 uGQqEcyB2Xg9zNzY/JB6X/Rz4qu5pC4=
X-Google-Smtp-Source: ADFU+vsH9zwFogphrokiom6kP9jpc0/EfWWpx0kYNByJFBy78L6FRZ6b+5u0kGb51gx765tnnhfbdw==
X-Received: by 2002:a17:902:8d8a:: with SMTP id
 v10mr5883926plo.90.1583270363955; 
 Tue, 03 Mar 2020 13:19:23 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id k20sm3338375pfk.123.2020.03.03.13.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 13:19:23 -0800 (PST)
Date: Tue, 3 Mar 2020 13:19:22 -0800
From: Kees Cook <keescook@chromium.org>
To: Kristen Carlson Accardi <kristen@linux.intel.com>
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <202003031314.1AFFC0E@keescook>
References: <20200228000105.165012-1-thgarnie@chromium.org>
 <202003022100.54CEEE60F@keescook>
 <20200303095514.GA2596@hirez.programming.kicks-ass.net>
 <CAJcbSZH1oON2VC2U8HjfC-6=M-xn5eU+JxHG2575iMpVoheKdA@mail.gmail.com>
 <6e7e4191612460ba96567c16b4171f2d2f91b296.camel@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e7e4191612460ba96567c16b4171f2d2f91b296.camel@linux.intel.com>
Cc: Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org,
 Thomas Garnier <thgarnie@chromium.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jiri Slaby <jslaby@suse.cz>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Len Brown <len.brown@intel.com>, Linux PM list <linux-pm@vger.kernel.org>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Tue, Mar 03, 2020 at 01:01:26PM -0800, Kristen Carlson Accardi wrote:
> On Tue, 2020-03-03 at 07:43 -0800, Thomas Garnier wrote:
> > On Tue, Mar 3, 2020 at 1:55 AM Peter Zijlstra <peterz@infradead.org>
> > wrote:
> > > On Mon, Mar 02, 2020 at 09:02:15PM -0800, Kees Cook wrote:
> > > > On Thu, Feb 27, 2020 at 04:00:45PM -0800, Thomas Garnier wrote:
> > > > > Minor changes based on feedback and rebase from v10.
> > > > > 
> > > > > Splitting the previous serie in two. This part contains
> > > > > assembly code
> > > > > changes required for PIE but without any direct dependencies
> > > > > with the
> > > > > rest of the patchset.
> > > > > 
> > > > > Note: Using objtool to detect non-compliant PIE relocations is
> > > > > not yet
> > > > > possible as this patchset only includes the simplest PIE
> > > > > changes.
> > > > > Additional changes are needed in kvm, xen and percpu code.
> > > > > 
> > > > > Changes:
> > > > >  - patch v11 (assembly);
> > > > >    - Fix comments on x86/entry/64.
> > > > >    - Remove KASLR PIE explanation on all commits.
> > > > >    - Add note on objtool not being possible at this stage of
> > > > > the patchset.
> > > > 
> > > > This moves us closer to PIE in a clean first step. I think these
> > > > patches
> > > > look good to go, and unblock the work in kvm, xen, and percpu
> > > > code. Can
> > > > one of the x86 maintainers pick this series up?
> > > 
> > > But,... do we still need this in the light of that fine-grained
> > > kaslr
> > > stuff?
> > > 
> > > What is the actual value of this PIE crud in the face of that?
> > 
> > If I remember well, it makes it easier/better but I haven't seen a
> > recent update on that. Is that accurate Kees?
> 
> I believe this patchset is valuable if people are trying to brute force
> guess the kernel location, but not so awesome in the event of
> infoleaks. In the case of the current fgkaslr implementation, we only
> randomize within the existing text segment memory area - so with PIE
> the text segment base can move around more, but within that it wouldn't
> strengthen anything. So, if you have an infoleak, you learn the base
> instantly, and are just left with the same extra protection you get
> without PIE.

Right -- PIE improves both non- and fg- KASLR similarly, in the sense
that the possible entropy for base offset is expanded. It also opens the
door to doing even more crazy things. (e.g. why keep the kernel text all
in one contiguous chunk?)

And generally speaking, it seems a nice improvement to me, as it gives
the kernel greater addressing flexibility.

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
