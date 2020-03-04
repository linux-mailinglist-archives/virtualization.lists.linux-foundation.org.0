Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1EB178D4C
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 10:22:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 724AF853C5;
	Wed,  4 Mar 2020 09:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I1FLkJHExS3v; Wed,  4 Mar 2020 09:22:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CDB1F84F12;
	Wed,  4 Mar 2020 09:22:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A056CC013E;
	Wed,  4 Mar 2020 09:22:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13909C013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 09:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F0722853C5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 09:22:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q+AQlkpOokVC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 09:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DDBCC84F12
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Xz1gqS8mHQf0FeXfh5Zn6ODmAjqLlTi3e7QpQPXzA9Q=; b=LDG8TcPSz6KerDK5RXGKXHL0+s
 nd+daixZ03zWZPBsZex2W0SE2BU+bLdvHBFIbasjYsjLE9O6AcvIE4aklaE3c2rh36+IES5zOiJKo
 CZHk/ZIgcOCzatmD7F0LvmIA2106SZonTNmKrjs8DuOvT6kzu3GSWHE0zWKaxMKARsPaQGewBXixa
 ItobUKdK8g+0ymqN8mZ30rSgQf5HEI0PdCrTHBXpOW9woanZqUxWXgFDIr91oXYH//OaNr2XpNsGu
 Foq59USFJcUjcKrB2RUG0sl7wBvbaaaFVwnCCFfz9rz8IvgRMTSRUVdUbDAj+EcyeoS8xmPTFub7+
 KssVL8pg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9QDl-0008ML-Jr; Wed, 04 Mar 2020 09:21:41 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CDE6B30066E;
 Wed,  4 Mar 2020 10:19:37 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 407052011CA98; Wed,  4 Mar 2020 10:21:36 +0100 (CET)
Date: Wed, 4 Mar 2020 10:21:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <20200304092136.GI2596@hirez.programming.kicks-ass.net>
References: <20200228000105.165012-1-thgarnie@chromium.org>
 <202003022100.54CEEE60F@keescook>
 <20200303095514.GA2596@hirez.programming.kicks-ass.net>
 <CAJcbSZH1oON2VC2U8HjfC-6=M-xn5eU+JxHG2575iMpVoheKdA@mail.gmail.com>
 <6e7e4191612460ba96567c16b4171f2d2f91b296.camel@linux.intel.com>
 <202003031314.1AFFC0E@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202003031314.1AFFC0E@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Kristen Carlson Accardi <kristen@linux.intel.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org,
 Thomas Garnier <thgarnie@chromium.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jiri Slaby <jslaby@suse.cz>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Len Brown <len.brown@intel.com>, Linux PM list <linux-pm@vger.kernel.org>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Juergen Gross <jgross@suse.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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

On Tue, Mar 03, 2020 at 01:19:22PM -0800, Kees Cook wrote:
> On Tue, Mar 03, 2020 at 01:01:26PM -0800, Kristen Carlson Accardi wrote:
> > On Tue, 2020-03-03 at 07:43 -0800, Thomas Garnier wrote:
> > > On Tue, Mar 3, 2020 at 1:55 AM Peter Zijlstra <peterz@infradead.org>

> > > > But,... do we still need this in the light of that fine-grained
> > > > kaslr
> > > > stuff?
> > > > 
> > > > What is the actual value of this PIE crud in the face of that?
> > > 
> > > If I remember well, it makes it easier/better but I haven't seen a
> > > recent update on that. Is that accurate Kees?
> > 
> > I believe this patchset is valuable if people are trying to brute force
> > guess the kernel location, but not so awesome in the event of
> > infoleaks. In the case of the current fgkaslr implementation, we only
> > randomize within the existing text segment memory area - so with PIE
> > the text segment base can move around more, but within that it wouldn't
> > strengthen anything. So, if you have an infoleak, you learn the base
> > instantly, and are just left with the same extra protection you get
> > without PIE.
> 
> Right -- PIE improves both non- and fg- KASLR similarly, in the sense
> that the possible entropy for base offset is expanded. It also opens the
> door to doing even more crazy things. 

So I'm really confused. I see it increases the aslr range, but I'm still
not sure why we care in the face of fgkaslr. Current kaslr is completely
broken because the hardware leaks more bits than we currently have, even
without the kernel itself leaking an address.

But leaking a single address is not a problem with fgkaslr.

> (e.g. why keep the kernel text all
> in one contiguous chunk?)

Dear gawd, please no. Also, we're limited to 2G text, that's just not a
lot of room. I'm really going to object when people propose we introduce
direct PLT for x86.

> And generally speaking, it seems a nice improvement to me, as it gives
> the kernel greater addressing flexibility.

But at what cost; it does unspeakable ugly to the asm. And didn't a
kernel compiled with the extended PIE range produce a measurably slower
kernel due to all the ugly?

So maybe I'm slow, but please spell out the benefit, because I'm not
seeing it.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
