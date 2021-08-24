Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F593F6A47
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 22:14:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B19242516;
	Tue, 24 Aug 2021 20:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWTjPsvOp5S0; Tue, 24 Aug 2021 20:14:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id CF55042502;
	Tue, 24 Aug 2021 20:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 576CCC0022;
	Tue, 24 Aug 2021 20:14:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B17FC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88F3F42516
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8IXyYCkhkxV
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:14:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D83A342502
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 20:14:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204591559"
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="204591559"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 13:14:05 -0700
X-IronPort-AV: E=Sophos;i="5.84,348,1620716400"; d="scan'208";a="526813111"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.209.119.65])
 ([10.209.119.65])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2021 13:14:03 -0700
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20210824185541.GA3485816@bjorn-Precision-5520>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <a80fc61a-bc55-b82c-354b-b57863ab03db@linux.intel.com>
Date: Tue, 24 Aug 2021 13:14:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210824185541.GA3485816@bjorn-Precision-5520>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>


On 8/24/2021 11:55 AM, Bjorn Helgaas wrote:
> [+cc Rajat; I still don't know what "shared memory with a hypervisor
> in a confidential guest" means,

A confidential guest is a guest which uses memory encryption to isolate 
itself from the host. It doesn't trust the host. But it still needs to 
communicate with the host for IO, so it has some special memory areas 
that are explicitly marked shared. These are used to do IO with the 
host. All their usage needs to be carefully hardened to avoid any 
security attacks on the guest, that's why we want to limit this 
interaction only to a small set of hardened drivers. For MMIO, the set 
is currently only virtio and MSI-X.

-Andi


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
