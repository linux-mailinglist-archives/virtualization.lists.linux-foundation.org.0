Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 186FB42AE91
	for <lists.virtualization@lfdr.de>; Tue, 12 Oct 2021 23:15:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACBE0823C0;
	Tue, 12 Oct 2021 21:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ExbKnIOF_0HR; Tue, 12 Oct 2021 21:14:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5DC5C81991;
	Tue, 12 Oct 2021 21:14:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8FDFC001E;
	Tue, 12 Oct 2021 21:14:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D8F1C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 21:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C2B660C18
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 21:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b5kY6TaebPbc
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 21:14:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 25E0460C16
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 21:14:56 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id t11so366301plq.11
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 Oct 2021 14:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BvJKY1rKY/9760Gl0LeNDnuiT6sXKAWtw9tI5dawnj8=;
 b=o/GLSCG6RnyZhSaxYArhdjDI+GZqq0Tuo0BHCi9OQXV0eO0sxdtvf5e9ph018gRDa6
 WJ99ynXkrqPdl7uWFgm585DMEglXtlaisSsg/qyShYDhpZIu1BvMNlFI6crNzwZb3kVM
 D3Nt1dq7SpMnmm5+jl5p2FM1bFc6n4drqjIT0i4Fl9t9fDJ6UGChKOyaRtuZgyFcoJia
 eMdADZLXI2+b0qbYF+jnjboenngTrHPevUOH10+K98UqYyLojIdvIWQWl6PIPtNp4mXn
 ohpD2sOBLXyWV5UH2WaEiVPcRxts93LbhGN71NGL15k92yGs1DLkNua+zz0+5eS3od4g
 tZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BvJKY1rKY/9760Gl0LeNDnuiT6sXKAWtw9tI5dawnj8=;
 b=7rnESOeVBS9VC6wxQ5k7eEezHD6s4QBIkJi2t8YVVBgV3D6Us7fEkxMB6SwWL93xqH
 isRqe4H+6W5eDju0PmsCHsHUt/s2wcIiVLBcge6w7PETd1jO2RT92Ar1SBd7OXkXRLAI
 7FuNpV+JCGE4G0hbsgpM3O+wpf5iUq33DJMhQaothBjiR7XMJnuDhzgqSoPD3aQ0/jkv
 UPk87Kzt9op6F+4Eb1XU4ILDGKGpuf7mec83ymkYQU8iOhyGQWjq6LxLB+ZL9VlLFcfp
 BrsZIFN1pfspZReHZvSvkgYIOUyKa3oh2sWg5SG3qVfqmHfePJlAkRfGuEXw16RktM0i
 sNnQ==
X-Gm-Message-State: AOAM531dUXLEqz0KW95M+kcDunGTGbK3V21eLshNIOTW2fLfDpoCgRlT
 J/1Vo06F6ezwl0B3MklXF7chXWlP8URg+Pz1vfteGg==
X-Google-Smtp-Source: ABdhPJxlgENg9aVPk1SZ9ZEg6wuYtjv4aFSKCDl25/S1StL4dP/rCMPRYztdsJE333jGYnVsE21IQwgFHVQV3g7Wdr8=
X-Received: by 2002:a17:90b:350f:: with SMTP id
 ls15mr8831441pjb.220.1634073295349; 
 Tue, 12 Oct 2021 14:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211009003711.1390019-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009003711.1390019-13-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20211009053103-mutt-send-email-mst@kernel.org>
 <CAPcyv4hDhjRXYCX_aiOboLF0eaTo6VySbZDa5NQu2ed9Ty2Ekw@mail.gmail.com>
 <0e6664ac-cbb2-96ff-0106-9301735c0836@linux.intel.com>
 <CAPcyv4g0v0YHZ-okxf4wwVCYxHotxdKwsJpZGkoT+fhvvAJEFg@mail.gmail.com>
 <9302f1c2-b3f8-2c9e-52c5-d5a4a2987409@linux.intel.com>
In-Reply-To: <9302f1c2-b3f8-2c9e-52c5-d5a4a2987409@linux.intel.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 12 Oct 2021 14:14:44 -0700
Message-ID: <CAPcyv4hG0HcbUO8Mb=ccDp5Bz3RJNkAJwKwNzRkQ1gCMpp_OMQ@mail.gmail.com>
Subject: Re: [PATCH v5 12/16] PCI: Add pci_iomap_host_shared(),
 pci_iomap_host_shared_range()
To: Andi Kleen <ak@linux.intel.com>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux PCI <linux-pci@vger.kernel.org>, X86 ML <x86@kernel.org>,
 linux-mips@vger.kernel.org,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, "Reshetova, Elena" <elena.reshetova@intel.com>,
 Andrea Arcangeli <aarcange@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>,
 linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 virtualization@lists.linux-foundation.org, Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-alpha@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>,
 "David S . Miller" <davem@davemloft.net>,
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

On Tue, Oct 12, 2021 at 11:35 AM Andi Kleen <ak@linux.intel.com> wrote:
>
>
> > The "better safe-than-sorry" argument is hard to build consensus
> > around. The spectre mitigations ran into similar problems where the
> > community rightly wanted to see the details and instrument the
> > problematic paths rather than blanket sprinkle lfence "just to be
> > safe".
>
> But that was due to performance problems in hot paths. Nothing of this
> applies here.

It applies because a new API that individual driver authors is being
proposed and that's an ongoing maintenance burden that might be
mitigated by hiding that implementation detail from leaf drivers.

>
> > In this case the rules about when a driver is suitably
> > "hardened" are vague and the overlapping policy engines are confusing.
>
> What is confusing exactly?

Multiple places to go to enable functionality. The device-filter
firewall policy can collide with the ioremap access control policy.

> For me it both seems very straight forward and simple (but then I'm biased)

You seem to be having a difficult time iterating this proposal toward
consensus. I don't think the base principles are being contested as
much as the semantics, scope, and need for the proposed API that is in
the purview of all leaf driver developers.

> The policy is:
>
> - Have an allow list at driver registration.
>
> - Have an additional opt-in for MMIO mappings (and potentially config
> space, but that's not currently there) to cover init calls completely.

The proliferation of policy engines and driver special casing is the
issue. Especially in this case where the virtio use case being
opted-in is *already* in a path that has been authorized by the
device-filter policy engine. I.e. why special case the ioremap() in
virtio to be additionally authorized when the device has already been
authorized to probe? Put another way, the easiest driver API change to
merge would be no additional changes in leaf drivers.

>
> >
> > I'd rather see more concerted efforts focused/limited core changes
> > rather than leaf driver changes until there is a clearer definition of
> > hardened.
>
> A hardened driver is a driver that
>
> - Had similar security (not API) oriented review of its IO operations
> (mainly MMIO access, but also PCI config space) as a non privileged user
> interface (like a ioctl). That review should be focused on memory safety.
>
> - Had some fuzzing on these IO interfaces using to be released tools.

What is the intersection of ioremap() users that are outside of the
proposed probe authorization regime AND want confidential computing
support?

> Right now it's only three virtio drivers (console, net, block)
>
> Really it's no different than what we do for every new unprivileged user
> interface.
>
>
> > I.e. instead of jumping to the assertion that fixing up
> > these init-path vulnerabilities are too big to fix, dig to the next
> > level to provide more evidence that per-driver opt-in is the only
> > viable option.
> >
> > For example, how many of these problematic paths are built-in to the
> > average kernel config?
>
> I don't think arguments from "the average kernel config" (if such a
> thing even exists) are useful. That's would be just hand waving.

I'm trying to bridge to your contention that this enabling can not
rely on custom kernel configs and must offer protection on the same
kernel image that might ship in the host, but lets set this aside and
focus on when and where leaf drivers need to adopt a new API.

> > A strawman might be to add a sprinkling error
> > exits in the module_init() of the problematic drivers, and only fail
> > if the module is built-in, and let modprobe policy handle the rest.
>
>
> That would be already hundreds of changes. I have no idea how such a
> thing could be maintained or sustained either.
>
> Really I don't even see how these alternatives can be considered. Tree
> sweeps should always be last resort. They're a pain for everyone. But
> here they're casually thrown around as alternatives to straight forward
> one or two line changes.

If it looked straightforward I'm not sure we would be having this
discussion, I think it's reasonable to ask if this is a per-driver
opt-in responsibility that must be added in addition to probe
authorization.

> >> Default policy in user space just seems to be a bad idea here. Who
> >> should know if a driver is hardened other than the kernel? Maintaining
> >> the list somewhere else just doesn't make sense to me.
> > I do not understand the maintenance burden correlation of where the
> > policy is driven vs where the list is maintained?
>
> All the hardening and auditing happens in the kernel tree. So it seems
> the natural place to store the result is in the kernel tree.
>
> But there's no single package for initrd, so you would need custom
> configurations for all the supported distros.
>
> Also we're really arguing about a list that currently has three entries.
>
>
> >   Even if I agreed
> > with the contention that out-of-tree userspace would have a hard time
> > tracking the "hardened" driver list there is still an in-tree
> > userspace path to explore. E.g. perf maintains lists of things tightly
> > coupled to the kernel, this authorized device list seems to be in the
> > same category of data.
>
> You mean the event list? perf is in the kernel tree, so it's maintained
> together with the kernel.
>
> But we don't have a kernel initrd.

I'm proposing that this list is either tiny and slow moving enough for
initrd builders to track manually, or it's a data file that ships in
distro kernel packages that initrd builders can pull in.

> >> Also there is the more practical problem that some devices are needed
> >> for booting. For example in TDX we can't print something to the console
> >> with this mechanism, so you would never get any output before the
> >> initrd. Just seems like a nightmare for debugging anything. There really
> >> needs to be an authorization mechanism that works reasonably early.
> >>
> >> I can see a point of having user space overrides though, but we need to
> >> have a sane kernel default that works early.
> > Right, as I suggested [1], just enough early authorization to
> > bootstrap/debug initramfs and then that can authorize the remainder.
>
> But how do you debug the kernel then? Making early undebuggable seems
> just bad policy to me.

I am not proposing making the early undebuggable.

>
> And if you fix if for the console why not add the two more entries for
> virtio net and block too?

Again because there seems to be struggling consensus around what
criteria constitutes being added to this list. In order to move this
series forward I'm trying to find common ground.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
