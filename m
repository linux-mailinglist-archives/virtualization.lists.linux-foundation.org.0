Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 42761220950
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 11:56:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F3B3B89199;
	Wed, 15 Jul 2020 09:56:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gt-ahWJUGqpB; Wed, 15 Jul 2020 09:56:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8B760891AA;
	Wed, 15 Jul 2020 09:56:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A335C0733;
	Wed, 15 Jul 2020 09:56:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 86D45C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 756AB8AC9B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZhxhzKONx1q
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:56:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9DACD8ABEF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=icvsh0UAC9qH2aXd5iDWHDNfzNryn9ZQFj2YeE2x3Lo=; b=aVqwxJf/YogDENWanh6k54iAGI
 9UWG/KMCQJeVdsLop0VPQ79Zr/SQfouIqOsOlLMxUwWnqkkXy4Oh6Sdw/0KZmzWZ+HycSExS2RqNy
 4dCX+oEmw4S4UUGMrF4jUES2V8rnOvJZW5gkCi41UyGni8n7w/OrL1RNO/WQxMeHqsC2fiV7h7ERZ
 78bzlQI2ze2+W5xpUlOrrCFcz/VkLV+AAj1M68CU/vKoQVKVDI+82A0HARYOp8qUjd6peTUn0XET0
 PNeM9BfgcQNefofCusAPr5QFt3rPrPGPI7BUEVpSgW60HTQaWwS/lB8IqzlYdsOcP1WPds8VPAGzb
 ri6mySkA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jve8s-0001Wv-P0; Wed, 15 Jul 2020 09:55:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E514A302753;
 Wed, 15 Jul 2020 11:55:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id D1352207A6655; Wed, 15 Jul 2020 11:55:56 +0200 (CEST)
Date: Wed, 15 Jul 2020 11:55:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v4 00/75] x86: SEV-ES Guest Support
Message-ID: <20200715095556.GI10769@hirez.programming.kicks-ass.net>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200715092456.GE10769@hirez.programming.kicks-ass.net>
 <20200715093426.GK16200@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715093426.GK16200@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Wed, Jul 15, 2020 at 11:34:26AM +0200, Joerg Roedel wrote:
> On Wed, Jul 15, 2020 at 11:24:56AM +0200, Peter Zijlstra wrote:
> > Can we get some more words -- preferably in actual code comments, on
> > when exactly #VC happens?
> 
> Sure, will add this as a comment before the actual runtime VC handler.

Thanks!

> > Because the only thing I remember is that #VC could happen on any memop,
> > but I also have vague memories of that being a later extention.
> 
> Currently it is only raised when something happens that the hypervisor
> intercepts, for example on a couple of instructions like CPUID,
> RD/WRMSR, ..., or on MMIO/IOIO accesses.
> 
> With Secure Nested Paging (SNP), which needs additional enablement, a #VC can
> happen on any memory access. I wrote the IST handling entry code for #VC
> with that in mind, but do not actually enable it. This is the reason why
> the #VC handler just panics the system when it ends up on the fall-back
> (VC2) stack, with SNP enabled it needs to handle the SNP exit-codes in
> that path.

And recursive #VC was instant death, right? Because there's no way to
avoid IST stack corruption in that case.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
