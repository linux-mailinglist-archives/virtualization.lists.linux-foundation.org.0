Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAE83F6B7E
	for <lists.virtualization@lfdr.de>; Wed, 25 Aug 2021 00:00:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D1F60748;
	Tue, 24 Aug 2021 22:00:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R3c2c4AQeNkb; Tue, 24 Aug 2021 22:00:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id A49006064F;
	Tue, 24 Aug 2021 21:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19438C000E;
	Tue, 24 Aug 2021 21:59:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 288F7C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 21:59:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06F8140171
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 21:59:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20150623.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V_rURqkhp0l6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 21:59:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D17CA4011B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 21:59:52 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id a21so19546419pfh.5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jcFx0PZcA3f5x3kcuOE3FShtVPGcFTUcoRfnJMf2+WA=;
 b=kSoxnifXykQ6StIPlHX99aPNWQu+Di5Pk4x5o0CyBgJd9Hi73+uUta5pC3l9MPuDvg
 fBBpumEasAZeQZ2lG3NadMhBf/b9wuvINIZK2gj66HQh13cdNeZ+ZXIwck5oL9wu4os+
 US/+tqwCN2mSD+JCYRel2n+VEvcXsl1OGVQLjDfi4InNQ0bwty5/GVhAIxR6hITtGdLg
 B2dsfbm0W5uvRuyca+8kETN9jz+XRkeYZnbViXu4AvIglxlwUOQjCHGEfA65Iz68RZya
 QItoB3l4XDQYmoL1ZwgpumDwEUbCDGUDrdkJu1fa/f2rehIPRlYuMHbS58voDQNxtFcC
 VbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jcFx0PZcA3f5x3kcuOE3FShtVPGcFTUcoRfnJMf2+WA=;
 b=PzToGobSBvG5PmP2Ob+mRPj1XEv0hNqFVSY8NSh3U3lhMyQkQk3g+sQcJTgtL1pRtA
 TvS7in6PCqFSXTCHB3K1hyj/v2k/8nuZfJCeLL+7uTXZVfs+Txwx5BvqyaQf9yAS2L/H
 i88+n3wre0hdv/PcXSGNQLdGvlRtVTE/j1mFmvtxPwaMvF5Tp9N2zX/RJuIDX19llPvV
 XYjpuTjm9V2rPRC+XzPN6S3ft4jmC9yLcKiLhufuSfPtLs1YwoaodM5RFKx63ov6F5+n
 zMv+ClI05wFwFJeK+o+3zHdfqrUcEoXay4HztQaaAqjEXIu7SkTvuixXiaPsjBSVj2qF
 fKpg==
X-Gm-Message-State: AOAM533i53Cef23vYBdLI1FucJadTJQ+KlHedgmslNm1hApu4O0hlXWj
 PF27npyDArkCPMVjf/AUmIw7jX8CQ5Kb5uLOYqzR0w==
X-Google-Smtp-Source: ABdhPJwK8XFV5db9UjT/ngKEY9JdyqfX6Fj3bAtuqrgUOWJJ8sDeTs4RTnwa4sK7JgHj0SxhjNCQ0rptoEHmw8RZG3Y=
X-Received: by 2002:a65:6642:: with SMTP id z2mr26520993pgv.240.1629842392235; 
 Tue, 24 Aug 2021 14:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
 <CACK8Z6E+__kZqU8mVUnYhFc0wz_e81qBLO3ffqSDghVtztNeQw@mail.gmail.com>
In-Reply-To: <CACK8Z6E+__kZqU8mVUnYhFc0wz_e81qBLO3ffqSDghVtztNeQw@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 24 Aug 2021 14:59:41 -0700
Message-ID: <CAPcyv4gmQeRNJJqxef5Vhws=v1g8+NtMjLBnJ1KR6rCWcd5VnA@mail.gmail.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
To: Rajat Jain <rajatja@google.com>
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-mips@vger.kernel.org,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Andi Kleen <ak@linux.intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Kirill Shutemov <kirill.shutemov@linux.intel.com>
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

On Tue, Aug 24, 2021 at 2:57 PM Rajat Jain <rajatja@google.com> wrote:
>
> On Mon, Aug 23, 2021 at 6:06 PM Dan Williams <dan.j.williams@intel.com> wrote:
> >
> > On Mon, Aug 23, 2021 at 5:31 PM Kuppuswamy, Sathyanarayanan
> > <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> > >
> > >
> > >
> > > On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
> > > >> Add a new variant of pci_iomap for mapping all PCI resources
> > > >> of a devices as shared memory with a hypervisor in a confidential
> > > >> guest.
> > > >>
> > > >> Signed-off-by: Andi Kleen<ak@linux.intel.com>
> > > >> Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> > > > I'm a bit puzzled by this part. So why should the guest*not*  map
> > > > pci memory as shared? And if the answer is never (as it seems to be)
> > > > then why not just make regular pci_iomap DTRT?
> > >
> > > It is in the context of confidential guest (where VMM is un-trusted). So
> > > we don't want to make all PCI resource as shared. It should be allowed
> > > only for hardened drivers/devices.
> >
> > That's confusing, isn't device authorization what keeps unaudited
> > drivers from loading against untrusted devices? I'm feeling like
> > Michael that this should be a detail that drivers need not care about
> > explicitly, in which case it does not need to be exported because the
> > detail can be buried in lower levels.
> >
> > Note, I specifically said "unaudited", not "hardened" because as Greg
> > mentioned the kernel must trust drivers, its devices that may not be
> > trusted.
>
> Can you please point me to the thread where this discussion with Greg
> is ongoing?

It slowed down to implement the "move to the 'authorized' device
model" recommendation. LWN has a good writeup (as usual) and a link to
the thread:

https://lwn.net/Articles/865918/
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
