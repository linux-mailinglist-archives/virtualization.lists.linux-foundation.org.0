Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1008B3F58BE
	for <lists.virtualization@lfdr.de>; Tue, 24 Aug 2021 09:12:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DEBD80F79;
	Tue, 24 Aug 2021 07:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id klbaAn2n79Gk; Tue, 24 Aug 2021 07:12:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D0C3980F81;
	Tue, 24 Aug 2021 07:12:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2BC60C002B;
	Tue, 24 Aug 2021 07:12:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9553BC0021
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 07:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CDAF80F4C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 07:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5x-FTbiDYRyo
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 07:12:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7616D80F31
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Aug 2021 07:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yyOWKyVgFnzXQH7hUCU2sLB3yDJPcTOpVipPjz3CdkE=; b=vhbSFZGCSzrdVnS1l48yczaF9K
 SvGLI6rQMV0CT4xfqBFA1Ef8Ep6dM6q2xMdXaRx9S+pjQv+qRWNTnYsJWFL8YUyXFnmmGXijIOv/u
 PmjJy+0bZz71DBJ/UkUMV+6BfLJLvi+0cQKLjAPOl4yUvzdEyDBluDRFXDs9PGsu260PN6t8h9BWS
 H1PEQ3FThNCcxhmfejfOihqbEbqvN5Tz9D5EG6yz3rmvyIp8Jq/WE/Lfa1HosWUPEttO8bNdoTMb3
 MEPPz3NaNDAKI3Hj8hsdNgFtMUO4QPPaCM8IM8adV5zMNm5tB0B7013DPglF0teZ/nW4MFAZoW9MB
 bODkw5sg==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat
 Linux)) id 1mIQXL-00Ah6e-Fc; Tue, 24 Aug 2021 07:08:07 +0000
Date: Tue, 24 Aug 2021 08:07:55 +0100
From: Christoph Hellwig <hch@infradead.org>
To: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v4 11/15] pci: Add pci_iomap_shared{,_range}
Message-ID: <YSSay4zGjLaNMOh1@infradead.org>
References: <20210805005218.2912076-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210805005218.2912076-12-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210823195409-mutt-send-email-mst@kernel.org>
 <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26a3cce5-ddf7-cbe6-a41e-58a2aea48f78@linux.intel.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, linux-mips@vger.kernel.org,
 James E J Bottomley <James.Bottomley@hansenpartnership.com>,
 Dave Hansen <dave.hansen@intel.com>, Peter H Anvin <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arch@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Richard Henderson <rth@twiddle.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
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

On Mon, Aug 23, 2021 at 05:30:54PM -0700, Kuppuswamy, Sathyanarayanan wrote:
> 
> 
> On 8/23/21 4:56 PM, Michael S. Tsirkin wrote:
> > > Add a new variant of pci_iomap for mapping all PCI resources
> > > of a devices as shared memory with a hypervisor in a confidential
> > > guest.
> > > 
> > > Signed-off-by: Andi Kleen<ak@linux.intel.com>
> > > Signed-off-by: Kuppuswamy Sathyanarayanan<sathyanarayanan.kuppuswamy@linux.intel.com>
> > I'm a bit puzzled by this part. So why should the guest*not*  map
> > pci memory as shared? And if the answer is never (as it seems to be)
> > then why not just make regular pci_iomap DTRT?
> 
> It is in the context of confidential guest (where VMM is un-trusted). So
> we don't want to make all PCI resource as shared. It should be allowed
> only for hardened drivers/devices.

Well, assuming the host can do any damage when mapped shared that also
means not mapping it shared will completely break the drivers.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
