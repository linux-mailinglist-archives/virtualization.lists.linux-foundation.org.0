Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE9205001
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 13:07:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6DBED86288;
	Tue, 23 Jun 2020 11:07:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aQxfJ2FHJFgY; Tue, 23 Jun 2020 11:07:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 09B94862A5;
	Tue, 23 Jun 2020 11:07:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D57FAC016F;
	Tue, 23 Jun 2020 11:07:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A31ABC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8CCE6203ED
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:07:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5HmTZ8Xn6RT
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:07:19 +0000 (UTC)
X-Greylist: delayed 00:20:57 by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 2A9C91FE0A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 11:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4eAYveGOd5Gez3be6eH40cghw2s0xCHHy8CvDzPrHTA=; b=ua9bUxKgV6UuUKYXhlrAwvEA+M
 JWMyWbeW4rCzaGNCKK8dur1jeln7leLjad6kn0qQtpEjgmKNWtFxZd7aFYNjSN+E2LtYgBR8ZfdC2
 UZUcpLwpNSvy5cBKmWIEVq6w3lZjbeB+E1QK0vV9yhpGQU6WutF9uC7kROcxmox/0WbjhY9F95Y7i
 R44TOUGibZYH1jJqDpxiGYXpstZlnEMCWDgYZdFoauoYsV4da0v+O79VK7jvOaUcf7wfVYLSrwJcJ
 pu3eYomUVflopB7io2JVme0q9YdvUUDDhYCYum2qHANZwjKYdPEYfWkJiY4mjBiC0t3zhm02w+K8w
 kZPZXtsw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnglf-0006E2-Dh; Tue, 23 Jun 2020 11:07:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 56694303DA0;
 Tue, 23 Jun 2020 13:07:06 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 437002370FA3D; Tue, 23 Jun 2020 13:07:06 +0200 (CEST)
Date: Tue, 23 Jun 2020 13:07:06 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623110706.GB4817@hirez.programming.kicks-ass.net>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
 <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200428075512.GP30814@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428075512.GP30814@suse.de>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, X86 ML <x86@kernel.org>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Tue, Apr 28, 2020 at 09:55:12AM +0200, Joerg Roedel wrote:
> On Mon, Apr 27, 2020 at 10:37:41AM -0700, Andy Lutomirski wrote:
> > I have a somewhat serious question: should we use IST for #VC at all?
> > As I understand it, Rome and Naples make it mandatory for hypervisors
> > to intercept #DB, which means that, due to the MOV SS mess, it's sort
> > of mandatory to use IST for #VC.  But Milan fixes the #DB issue, so,
> > if we're running under a sufficiently sensible hypervisor, we don't
> > need IST for #VC.
> 
> The reason for #VC being IST is not only #DB, but also SEV-SNP. SNP adds
> page ownership tracking between guest and host, so that the hypervisor
> can't remap guest pages without the guest noticing.
> 
> If there is a violation of ownership, which can happen at any memory
> access, there will be a #VC exception to notify the guest. And as this
> can happen anywhere, for example on a carefully crafted stack page set
> by userspace before doing SYSCALL, the only robust choice for #VC is to
> use IST.

So what happens if this #VC triggers on the first access to the #VC
stack, because the malicious host has craftily mucked with only the #VC
IST stack page?

Or on the NMI IST stack, then we get #VC in NMI before the NMI can fix
you up.

AFAICT all of that is non-recoverable.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
