Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B82732052FF
	for <lists.virtualization@lfdr.de>; Tue, 23 Jun 2020 15:03:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62EBA87612;
	Tue, 23 Jun 2020 13:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lapQdE6WDk2o; Tue, 23 Jun 2020 13:03:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E7F238773E;
	Tue, 23 Jun 2020 13:03:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B684FC0894;
	Tue, 23 Jun 2020 13:03:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D82F4C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C74E28761D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rCxDksBEmr9b
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:03:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 40C9A87612
 for <virtualization@lists.linux-foundation.org>;
 Tue, 23 Jun 2020 13:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YaPfqTCjeDJ9yQ4e7Ug2AGa7kbHGPm3KcaODCyhYn5k=; b=kGSfp6xHac4GqUF2vY+RwsZvtv
 UtLfm9rQDTo+JtvY9BvI3ZBed/ULh8lhJvTMgFO03+l0rXmutXve4emLYgluNUaAjGzxt7P3/Dq7z
 jEQ2dZHsRc0N9TSA3Onut7BDTJdXmUQ1ktnDfGVTNvD09O61TCjE8ggrVHK7U8vOoGMvG2Qx6IDfM
 OrAT6fCMMx5AHvdh8ofYbc3OcE1CAByxLfGEty3z8FkvgQVSjRtA2G5zp+VMADbkm8Y5TYaPkDTSW
 OC7F6qJi6s4/AF1qlXVPlcrECrBgRFz4ONJWn6G71e1KFlk7Usfpdjv91uJ6wGPH2ixslVKd91zDi
 61hKOVmQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jniaC-0007Vk-Lm; Tue, 23 Jun 2020 13:03:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E0300300F28;
 Tue, 23 Jun 2020 15:03:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id CCDBB23CBF713; Tue, 23 Jun 2020 15:03:22 +0200 (CEST)
Date: Tue, 23 Jun 2020 15:03:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: Should SEV-ES #VC use IST? (Re: [PATCH] Allow RDTSC and RDTSCP
 from userspace)
Message-ID: <20200623130322.GH4817@hirez.programming.kicks-ass.net>
References: <20200425202316.GL21900@8bytes.org>
 <CALCETrW2Y6UFC=zvGbXEYqpsDyBh0DSEM4NQ+L=_pp4aOd6Fuw@mail.gmail.com>
 <CALCETrXGr+o1_bKbnre8cVY14c_76m8pEf3iB_i7h+zfgE5_jA@mail.gmail.com>
 <20200623094519.GF31822@suse.de>
 <20200623104559.GA4817@hirez.programming.kicks-ass.net>
 <20200623111107.GG31822@suse.de>
 <20200623111443.GC4817@hirez.programming.kicks-ass.net>
 <20200623114324.GA14101@suse.de>
 <20200623115014.GE4817@hirez.programming.kicks-ass.net>
 <20200623121237.GC14101@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200623121237.GC14101@suse.de>
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

On Tue, Jun 23, 2020 at 02:12:37PM +0200, Joerg Roedel wrote:
> On Tue, Jun 23, 2020 at 01:50:14PM +0200, Peter Zijlstra wrote:
> > If SNP is the sole reason #VC needs to be IST, then I'd strongly urge
> > you to only make it IST if/when you try and make SNP happen, not before.
> 
> It is not the only reason, when ES guests gain debug register support
> then #VC also needs to be IST, because #DB can be promoted into #VC
> then, and as #DB is IST for a reason, #VC needs to be too.

Didn't I read somewhere that that is only so for Rome/Naples but not for
the later chips (Milan) which have #DB pass-through?

> Besides that, I am not a fan of delegating problems I already see coming
> to future-Joerg and future-Peter, but if at all possible deal with them
> now and be safe later.

Well, we could just say no :-) At some point in the very near future
this house of cards is going to implode.

We're talking about the 3rd case where the only reason things 'work' is
because we'll have to panic():

 - #MC
 - #DB with BUS LOCK DEBUG EXCEPTION
 - #VC SNP

(and it ain't a happy accident they're all IST)

Did someone forget to pass the 'ISTs are *EVIL*' memo to the hardware
folks? How come we're getting more and more of them? (/me puts fingers
in ears and goes la-la-la-la in anticipation of Andrew mentioning CET)


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
