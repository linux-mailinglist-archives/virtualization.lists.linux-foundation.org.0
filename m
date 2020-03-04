Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 998FC179845
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 19:45:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2141B84E10;
	Wed,  4 Mar 2020 18:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k645kNXziXB2; Wed,  4 Mar 2020 18:45:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E5C08854A0;
	Wed,  4 Mar 2020 18:45:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE1F1C013E;
	Wed,  4 Mar 2020 18:45:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3DD1CC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2BFFA83EEA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fjnb1EOrJUo5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:45:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 58AD18401E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:45:48 +0000 (UTC)
Received: from carbon-x1.hos.anvin.org
 ([IPv6:2601:646:8600:3281:e7ea:4585:74bd:2ff0])
 (authenticated bits=0)
 by mail.zytor.com (8.15.2/8.15.2) with ESMTPSA id 024IivPG430134
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
 Wed, 4 Mar 2020 10:44:57 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 024IivPG430134
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
 s=2020022001; t=1583347500;
 bh=QUlRbhYXKi9CdoMv3oDgidaagtZkvk5Xf61FHG+n0Uw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KvnKCUYqLiZUp2UObBU/tThRYE5Pcbpbj9OH7MRc6EhVU+JkTmvljzcf9g3Iq0bUo
 9V/tj2EXxvJiUXm7HH1prOmM37wqwJoIIdDzX831hmKb+hmUXMnLz6huKUq6lctiao
 9yVGb1BWiEcKMdHr7tY+bxx1phc/XYIDy/FPIaZRucMI0ALoh4PforyLWc2i46g4LF
 9jvPpeb6Wt8rrT/rjPRpA9yATnlktqf18q7Ch9gkjeys788Oa08dWH+Jl0E1vAvCtE
 7A/rPHzQ/zlvdtJoTGxn717oTmGTxwdSf+uw1OjF/a1K8De68Woo5pz7m6tpEgXSaS
 wvrehHjq8HzNA==
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
To: Kees Cook <keescook@chromium.org>, Peter Zijlstra <peterz@infradead.org>
References: <20200228000105.165012-1-thgarnie@chromium.org>
 <202003022100.54CEEE60F@keescook>
 <20200303095514.GA2596@hirez.programming.kicks-ass.net>
 <CAJcbSZH1oON2VC2U8HjfC-6=M-xn5eU+JxHG2575iMpVoheKdA@mail.gmail.com>
 <6e7e4191612460ba96567c16b4171f2d2f91b296.camel@linux.intel.com>
 <202003031314.1AFFC0E@keescook>
 <20200304092136.GI2596@hirez.programming.kicks-ass.net>
 <202003041019.C6386B2F7@keescook>
From: "H. Peter Anvin" <hpa@zytor.com>
Message-ID: <e60876d0-4f7d-9523-bcec-6d002f717623@zytor.com>
Date: Wed, 4 Mar 2020 10:44:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <202003041019.C6386B2F7@keescook>
Content-Language: en-US
Cc: Kristen Carlson Accardi <kristen@linux.intel.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org,
 Thomas Garnier <thgarnie@chromium.org>, Pavel Machek <pavel@ucw.cz>,
 Jiri Slaby <jslaby@suse.cz>, Ard Biesheuvel <ardb@kernel.org>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>,
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

On 2020-03-04 10:21, Kees Cook wrote:
> On Wed, Mar 04, 2020 at 10:21:36AM +0100, Peter Zijlstra wrote:
>> But at what cost; it does unspeakable ugly to the asm. And didn't a
>> kernel compiled with the extended PIE range produce a measurably slower
>> kernel due to all the ugly?
> 
> Was that true? I thought the final results were a wash and that earlier
> benchmarks weren't accurate for some reason? I can't find the thread
> now. Thomas, do you have numbers on that?
> 
> BTW, I totally agree that fgkaslr is the way to go in the future. I
> am mostly arguing for this under the assumption that it doesn't
> have meaningful performance impact and that it gains the kernel some
> flexibility in the kinds of things it can do in the future. If the former
> is not true, then I'd agree, the benefit needs to be more clear.
> 

"Making the assembly really ugly" by itself is a reason not to do it, in my
Not So Humble Opinion[TM]; but the reason the kernel and small memory models
exist in the first place is because there is a nonzero performance impact of
the small-PIC memory model. Having modules in separate regions would further
add the cost of a GOT references all over the place (PLT is optional, useless
and deprecated for eager binding) *plus* might introduce at least one new
vector of attack: overwrite a random GOT slot, and just wait until it gets hit
by whatever code path it happens to be in; the exact code path doesn't matter.
From an kASLR perspective this is *very* bad, since you only need to guess the
general region of a GOT rather than an exact address.

The huge memory model, required for arbitrary placement, has a very
significant performance impact.

The assembly code is *very* different across memory models.

	-hpa
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
