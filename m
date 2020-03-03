Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D30177329
	for <lists.virtualization@lfdr.de>; Tue,  3 Mar 2020 10:56:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98DB2840A3;
	Tue,  3 Mar 2020 09:56:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hptr6-XaRdUB; Tue,  3 Mar 2020 09:56:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7769584237;
	Tue,  3 Mar 2020 09:56:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68244C013E;
	Tue,  3 Mar 2020 09:56:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1EC0CC013E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 09:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 068A220023
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 09:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZ5AOM5Adcg8
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 09:56:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 491011FE0A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Mar 2020 09:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xjAYzYZJidsTEHXSs//Oe4SJs+qAxcjB8dKxwUENenQ=; b=zrXbi+1XYsYg1hOUfgotstGR1s
 A/yiklisppTF0E9uRLa0vly9Whs1m5MF6QXAFqbz0RIOZTQ3IBkvmXEsEzAH7H4G/eUNCE9COhaKf
 Jt1sB06ShmrP6pL5etFIXieKzux9rI1PRF59uv6SLpF0G2BI2GBcdWRCspKTvO/2p1jLRtrNUi6Sh
 HA8kSw8UO5dmWtltons0CLJ0nXm+Y659s9TY0lr4a4KSUKIjb7SJaBWwJIkbCrpzdLCOQb8EEI+W+
 eVFHzpAPkRg2pOXnstpM7fhlRyhkazF7U53uvuy8CCxYkEUPSwaZ6iuVSdlA2OHKAJpd7ZHKu3O6I
 dRuWKx+w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j94Gm-0001E5-NN; Tue, 03 Mar 2020 09:55:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8918A30110E;
 Tue,  3 Mar 2020 10:53:16 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 780FD2119B2EB; Tue,  3 Mar 2020 10:55:14 +0100 (CET)
Date: Tue, 3 Mar 2020 10:55:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <20200303095514.GA2596@hirez.programming.kicks-ass.net>
References: <20200228000105.165012-1-thgarnie@chromium.org>
 <202003022100.54CEEE60F@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202003022100.54CEEE60F@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kristen@linux.intel.com, kernel-hardening@lists.openwall.com, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org,
 Thomas Garnier <thgarnie@chromium.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jiri Slaby <jslaby@suse.cz>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-crypto@vger.kernel.org,
 Len Brown <len.brown@intel.com>, linux-pm@vger.kernel.org,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Mon, Mar 02, 2020 at 09:02:15PM -0800, Kees Cook wrote:
> On Thu, Feb 27, 2020 at 04:00:45PM -0800, Thomas Garnier wrote:
> > Minor changes based on feedback and rebase from v10.
> > 
> > Splitting the previous serie in two. This part contains assembly code
> > changes required for PIE but without any direct dependencies with the
> > rest of the patchset.
> > 
> > Note: Using objtool to detect non-compliant PIE relocations is not yet
> > possible as this patchset only includes the simplest PIE changes.
> > Additional changes are needed in kvm, xen and percpu code.
> > 
> > Changes:
> >  - patch v11 (assembly);
> >    - Fix comments on x86/entry/64.
> >    - Remove KASLR PIE explanation on all commits.
> >    - Add note on objtool not being possible at this stage of the patchset.
> 
> This moves us closer to PIE in a clean first step. I think these patches
> look good to go, and unblock the work in kvm, xen, and percpu code. Can
> one of the x86 maintainers pick this series up?

But,... do we still need this in the light of that fine-grained kaslr
stuff?

What is the actual value of this PIE crud in the face of that?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
