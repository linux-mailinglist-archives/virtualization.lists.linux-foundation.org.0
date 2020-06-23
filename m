Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FFC2056D7
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 18:13:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0BA2F88F3C;
	Tue, 23 Jun 2020 16:13:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulJ-nws0EdoR; Tue, 23 Jun 2020 16:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 76E0588F38;
	Tue, 23 Jun 2020 16:13:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4305BC016F;
	Tue, 23 Jun 2020 16:13:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BA36C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DCD8220774
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHhVpDnArQ9t
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:13:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 1C08E20445
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 16:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2ZeuviZXPtyZ/aF+IWZIvBCFWEao8ngk72TsRFpdUlQ=; b=ATjsWIR5mScsdXgmjIWTkFg1Wk
 j3PvAh/3jFwmTPn+cKufy4YfwEAVTB5Q+YDKJxIFA/YBf8QnuKGZB6iBvijGNLqsyu010C+STY8WW
 LAB3d9puouEtlsYWgQtJ+x3DVKMIoh/RG/cNY63fcTwbR+z6FfaHoyxaXbpm9V+Gsr6kNlqXZaL0H
 Ea0iQWyFLSV4klNOb2ksXlD1PlNyImPPRPhFq5Tv2I6Q3BeNur0uGK7mHwgDTiWh9oUuj3yijj6Sy
 VY7TJOMc0JboU8lVaX9JX8xVVicMeVSgx92/mx8HMv+xWWnNs0kZMIoGwIGEnFy0KFzU+Hif8FPzi
 gviDAAUA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnlYR-0006db-JS; Tue, 23 Jun 2020 16:13:47 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D6622306E5C;
 Tue, 23 Jun 2020 18:13:45 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C4847234EBA51; Tue, 23 Jun 2020 18:13:45 +0200 (CEST)
Date: Tue, 23 Jun 2020 18:13:45 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623161345.GQ4817@hirez.programming.kicks-ass.net>
References: <20200623120433.GB14101@suse.de>
 <20200623125201.GG4817@hirez.programming.kicks-ass.net>
 <20200623134003.GD14101@suse.de>
 <20200623135916.GI4817@hirez.programming.kicks-ass.net>
 <20200623145344.GA117543@hirez.programming.kicks-ass.net>
 <20200623145914.GF14101@suse.de>
 <20200623152326.GL4817@hirez.programming.kicks-ass.net>
 <56af2f70-a1c6-aa64-006e-23f2f3880887@citrix.com>
 <20200623155204.GO4817@hirez.programming.kicks-ass.net>
 <dae40b7b-e584-1ab4-2ebe-13526cdec946@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dae40b7b-e584-1ab4-2ebe-13526cdec946@intel.com>
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joerg Roedel <joro@8bytes.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>,
 X86 ML <x86@kernel.org>
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

On Tue, Jun 23, 2020 at 09:03:56AM -0700, Dave Hansen wrote:
> On 6/23/20 8:52 AM, Peter Zijlstra wrote:
> > Isn't current #MC unconditionally fatal from kernel? But yes, I was
> > sorta aware people want that changed.
> 
> Not unconditionally.  copy_to_iter_mcsafe() is a good example of one
> thing we _can_ handle.

Urgh, I thought that stuff was still pending.

Anyway, the important thing is that it is fatal if we hit early NMI.
Which I think still holds.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
