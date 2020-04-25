Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9391B1B89B8
	for <lists.virtualization@lfdr.de>; Sun, 26 Apr 2020 00:10:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D58AC87AEE;
	Sat, 25 Apr 2020 22:10:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qd74Q-CdLN4Z; Sat, 25 Apr 2020 22:10:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 512B287A6B;
	Sat, 25 Apr 2020 22:10:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3FC8AC0175;
	Sat, 25 Apr 2020 22:10:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15027C0175
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 22:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F20B087A5A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 22:10:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fs2vns8JZFAH
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 22:10:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 005CC87A0A
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 22:10:42 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 834442076C
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 22:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587852642;
 bh=xuqmIzDpOCho8iZFxLKt+Gkxw+5vPYAZTLSjtItPycU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VQq6Mz7smcr3zNIcC9pKupyHyFvsFY8q4jW93o4Pvp61DKtny6S1PN1CVtESTMt1x
 0YOy/VXa+OfZBvFpSU6eteA54tRtaoUDqUeg9gPjIMkG43XV6c3n6wN2gXYsQk4uLU
 CqnubEshLb3LjDTEOxBI+/8+ibDs0pY1ir/VgnPY=
Received: by mail-wr1-f51.google.com with SMTP id d15so14348436wrx.3
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 15:10:42 -0700 (PDT)
X-Gm-Message-State: AGi0PuaUwshU687tZDsBBmfxqsF1iUvos5mR3H19ab4o7JVSOpNcfAHT
 Q8vklsfreKBhAD1TnAPgcZTl8ccoOMl/aP7D0YAHZA==
X-Google-Smtp-Source: APiQypJY9gdxtTJ8GRawCUdcR1DxC8wlogE3i2vYIogcFwlTEoBRip4uY50PmovAxmm9X2kGA1bOgOh4cBwbd1QBjkA=
X-Received: by 2002:a5d:62cc:: with SMTP id o12mr18433808wrv.75.1587852641044; 
 Sat, 25 Apr 2020 15:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
In-Reply-To: <20200425202316.GL21900@8bytes.org>
From: Andy Lutomirski <luto@kernel.org>
Date: Sat, 25 Apr 2020 15:10:29 -0700
X-Gmail-Original-Message-ID: <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
Message-ID: <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
To: Joerg Roedel <joro@8bytes.org>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
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

On Sat, Apr 25, 2020 at 1:23 PM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Sat, Apr 25, 2020 at 12:47:31PM -0700, Andy Lutomirski wrote:
> > I assume the race you mean is:
> >
> > #VC
> > Immediate NMI before IST gets shifted
> > #VC
> >
> > Kaboom.
> >
> > How are you dealing with this?  Ultimately, I think that NMI will need
> > to turn off IST before engaging in any funny business. Let me ponder
> > this a bit.
>
> Right, I dealt with that by unconditionally shifting/unshifting the #VC IST entry
> in do_nmi() (thanks to Davin Kaplan for the idea). It might cause
> one of the IST stacks to be unused during nesting, but that is fine. The
> stack memory for #VC is only allocated when SEV-ES is active (in an
> SEV-ES VM).

Blech.  It probably works, but still, yuck.  It's a bit sad that we
seem to be growing more and more poorly designed happens-anywhere
exception types at an alarming rate.  We seem to have #NM, #MC, #VC,
#HV, and #DB.  This doesn't really scale.

--Andy
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
