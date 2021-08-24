Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6345D3F55BD
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 04:14:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BEDF80BAD;
	Tue, 24 Aug 2021 02:14:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9FKB0EozB1F; Tue, 24 Aug 2021 02:14:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 4A7F880B72;
	Tue, 24 Aug 2021 02:14:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C35C7C000E;
	Tue, 24 Aug 2021 02:14:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AA7AC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAD0D40489
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FbcCG3uyAsnw
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:14:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52295402FD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 02:14:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10085"; a="217220790"
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="217220790"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 19:14:20 -0700
X-IronPort-AV: E=Sophos;i="5.84,346,1620716400"; d="scan'208";a="425944647"
Received: from akleen-mobl1.amr.corp.intel.com (HELO [10.255.228.210])
 ([10.255.228.210])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 19:14:19 -0700
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
To: Dan Williams <dan.j.williams@intel.com>,
 "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
 <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
From: Andi Kleen <ak@linux.intel.com>
Message-ID: <d992b5af-8d57-6aa6-bd49-8e2b8d832b19@linux.intel.com>
Date: Mon, 23 Aug 2021 19:14:18 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4iJVQKJ3bVwZhD08c8GNEP0jW2gx=H504NXcYK5o2t01A@mail.gmail.com>
Content-Language: en-US
Cc: Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Linux PCI <linux-pci@vger.kernel.org>, linux-mips@vger.kernel.org,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
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


On 8/23/2021 6:04 PM, Dan Williams wrote:
> On Mon, Aug 23, 2021 at 5:31 PM Kuppuswamy, Sathyanarayanan
> <sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
>>
>>
>> On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
>>>> Add a new variant of pci_iomap for mapping all PCI resources
>>>> of a devices as shared memory with a hypervisor in a confidential
>>>> guest.
>>>>
>>>> Signed-off-by: Andi Kleen<ak@linux.intel.com>
>>>> Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
>>> I'm a bit puzzled by this part. So why should the guest*not*  map
>>> pci memory as shared? And if the answer is never (as it seems to be)
>>> then why not just make regular pci_iomap DTRT?
>> It is in the context of confidential guest (where VMM is un-trusted). So
>> we don't want to make all PCI resource as shared. It should be allowed
>> only for hardened drivers/devices.
> That's confusing, isn't device authorization what keeps unaudited
> drivers from loading against untrusted devices? I'm feeling like
> Michael that this should be a detail that drivers need not care about
> explicitly, in which case it does not need to be exported because the
> detail can be buried in lower levels.

We originally made it default (similar to AMD), but it during code audit 
we found a lot of drivers who do ioremap early outside the probe 
function. Since it would be difficult to change them all we made it 
opt-in, which ensures that only drivers that have been enabled can talk 
with the host at all and can't be attacked. That made the problem of 
hardening all these drivers a lot more practical.

Currently we only really need virtio and MSI-X shared, so for changing 
two places in the tree you avoid a lot of headache elsewhere.

Note there is still a command line option to override if you want to 
allow and load other drivers.

-Andi

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
