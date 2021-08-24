Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 6062E3F694E
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 20:55:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F072160BE0;
	Tue, 24 Aug 2021 18:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjLCHpItwFNr; Tue, 24 Aug 2021 18:55:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 051EA60BF3;
	Tue, 24 Aug 2021 18:55:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90EBFC000E;
	Tue, 24 Aug 2021 18:55:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 10463C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 18:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF1C24078F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 18:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5iZsoGLTy1-c
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 18:55:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B02F94076B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 18:55:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC45C61178;
 Tue, 24 Aug 2021 18:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629831343;
 bh=d/Fr0mBMXraTW+Ew01Yil+DCXSSjTvd5q9qem138RPE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=t5cnqJZj36He9/zjegb9+V9+U3YiQamVwwKvzU1WrQq1Qaa+otNQjIpOiBqlsMEdM
 /Hqh3iR5wCXL+mGe6LqhWoGFpktgZ9b12IewTtcxFDv1maXi/yfljyIhDOnl/z5XMt
 kqtFzOpSSbjXME95XQ70DtnBwGzFO7+zGwLjQy9HFrGMtxqHJNh2QDgWLglZ5C35GH
 hnCcNOL4lw0MsGxbMWF0J/SLHbKZSnrBA1q8ych11j+zeKHwRGuUnfE1N3/f5XMPXs
 oyQMr/mk68NjLI3llarex6W2QR/Y9G8ODdkhohBntXV7QiObuNljxc6qSrgPHYc8ep
 rrO89m1YOIQlQ==
Date: Tue, 24 Aug 2021 13:55:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Message-ID: <20210824185541.GA3485816@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d21a2a2d-4670-ba85-ce9a-fc8ea80ef1be@linux.intel.com>
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-mips@vger.kernel.org,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Rajat Jain <rajatja@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

[+cc Rajat; I still don't know what "shared memory with a hypervisor
in a confidential guest" means, but now we're talking about hardened
drivers and allow lists, which Rajat is interested in]

On Tue, Aug 24, 2021 at 10:20:44AM -0700, Andi Kleen wrote:
> 
> > I see. Hmm. It's a bit of a random thing to do it at the map time
> > though. E.g. DMA is all handled transparently behind the DMA API.
> > Hardening is much more than just replacing map with map_shared
> > and I suspect what you will end up with is basically
> > vendors replacing map with map shared to make things work
> > for their users and washing their hands.
> 
> That concept exists too. There is a separate allow list for the drivers. So
> just adding shared to a driver is not enough, until it's also added to the
> allowlist
> 
> Users can of course chose to disable the allowlist, but they need to
> understand the security implications.
> 
> > I would say an explicit flag in the driver that says "hardened"
> > and refusing to init a non hardened one would be better.
> 
> We have that too (that's the device filtering)
> 
> But the problem is that device filtering just stops the probe functions, not
> the initcalls, and lot of legacy drivers do MMIO interactions before going
> into probe. In some cases it's unavoidable because of the device doesn't
> have a separate enumeration mechanism it needs some kind of probing to even
> check for its existence And since we don't want to change all of them it's
> far safer to make the ioremap opt-in.
> 
> 
> -Andi
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
