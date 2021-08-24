Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B810F3F6A72
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 22:31:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E55A60745;
	Tue, 24 Aug 2021 20:31:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aFo61RQMPWWb; Tue, 24 Aug 2021 20:31:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 08F3D60C11;
	Tue, 24 Aug 2021 20:31:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7F499C000E;
	Tue, 24 Aug 2021 20:31:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 846EFC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6FC3481886
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:31:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C0dKI8Xbhr5m
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:31:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06A948183D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:31:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3738C610F7;
 Tue, 24 Aug 2021 20:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629837076;
 bh=u89RhbA1T4/YcegxqumOKFDZveULzg7IH3BXxWstXGA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=E7gmG9cu+2X8EpSv9jHNw194dQ/bFH+W8S5CviPC+WEzgK9x1GqwxeKDnQA93Ubc6
 pIROpW9mCbmFawlLNt183dkzLJG92jUie48vdct5nMY9KMIpav4jCN5vVtcBqt99IN
 LlMRmUTD9hQbKroaOXlhVlrUixEOK798eHEQ6pmGyuqfJJo5J4wfidKynCvdtb3s37
 PjcEO5DOcIPu3SLREF0Tt+IUZRL6NjCeGqQy3Vt+WmnxMDtnryxVfbjA5YVJAeYKm9
 BpOJvSuNngQVXkAMINkK0ZwKmdIz+EDYyzVhKaDWPyJSTPhZYBRtaAf1VAW/wDK4NO
 xT3mGvV5LJ4bA==
Date: Tue, 24 Aug 2021 15:31:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Message-ID: <20210824203115.GA3492097@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a80fc61a-bc55-b82c-354b-b57863ab03db@linux.intel.com>
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

On Tue, Aug 24, 2021 at 01:14:02PM -0700, Andi Kleen wrote:
> 
> On 8/24/2021 11:55 AM, Bjorn Helgaas wrote:
> > [+cc Rajat; I still don't know what "shared memory with a hypervisor
> > in a confidential guest" means,
> 
> A confidential guest is a guest which uses memory encryption to isolate
> itself from the host. It doesn't trust the host. But it still needs to
> communicate with the host for IO, so it has some special memory areas that
> are explicitly marked shared. These are used to do IO with the host. All
> their usage needs to be carefully hardened to avoid any security attacks on
> the guest, that's why we want to limit this interaction only to a small set
> of hardened drivers. For MMIO, the set is currently only virtio and MSI-X.

Good material for the commit log next time around.  Thanks!

Bjorn
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
