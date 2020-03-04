Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 177261798D5
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 20:20:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 5FAD620493;
	Wed,  4 Mar 2020 19:20:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjIz4qZ4OPIL; Wed,  4 Mar 2020 19:20:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6827F2048A;
	Wed,  4 Mar 2020 19:20:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44683C013E;
	Wed,  4 Mar 2020 19:20:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4729BC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4291F86CE0
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:20:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H+SNF53Z1Pdm
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:20:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A7BA286C8B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 19:20:01 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id m13so3650914edb.6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Mar 2020 11:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cFsbFw0YKq63mN4kk6cHyhQWkj6+cfAUWsGxTYtg/zw=;
 b=nDBn0SdZFqEAWyplGDuVVyCUbVweD3UVmTUas+PF5dDOYARN/7YmBRHICsQ65dOabg
 1CV71i2U64XmzdBXXOUhdWzg3vyWxAZOcINdLaJ3/Dz245ZCnNgJv2yPIGfjoCB19RyP
 c0pOAlPq9+G9kihFmOZZfCArlHHOjP6Zlf8cc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cFsbFw0YKq63mN4kk6cHyhQWkj6+cfAUWsGxTYtg/zw=;
 b=l4rqnUPxqlMEMU07EV4CUraz5hvYAHTt2KCaOkh6J73pxQdII3cC6zHrGhAWDmdQS2
 gHYdIlIcMbejhe4yPcQiJjByGvnXQWhv7DKCBTJRq1zmNlidVGXNjWcwxHakgi6vQRXF
 yb0f6saNIPxg3yre3l7UgQZ/s+PZ4ShteYc9cdS7vbXrORgisZpFhw2JGQwzQ5ew+gZO
 MJ/tZlm0+zqZBqzhubYGNJiZ/xRm4ZOtT8gVpWXKfry6C4YMmd8ZtmH4O63+KAxe7gG3
 1rhJu2dRYXtLW6wa8BWPOuHUZTlAnhFSwNoY8s4GPUD5nlD/zxfF+a08ZvhYsEX9c637
 VETw==
X-Gm-Message-State: ANhLgQ1Lo4gFK/XiDfCUnoYdLBMnKVIuqk4dVkAnDA98AukBtSeT4muD
 JwI2y0veMb/SgRLhl7IikdHdpJb3jws=
X-Google-Smtp-Source: ADFU+vsQBeUZFAJh+WikSUifD3O/epZwpV4dQQLm94OAslrtzYfZWGIfScJdo+/EZHAY8w9BVdRGXQ==
X-Received: by 2002:a17:906:3609:: with SMTP id
 q9mr3642639ejb.367.1583349599557; 
 Wed, 04 Mar 2020 11:19:59 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id e24sm535444eds.45.2020.03.04.11.19.57
 for <virtualization@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2020 11:19:58 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id i9so3466276wml.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Mar 2020 11:19:57 -0800 (PST)
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr5219880wmk.83.1583349596173; 
 Wed, 04 Mar 2020 11:19:56 -0800 (PST)
MIME-Version: 1.0
References: <20200228000105.165012-1-thgarnie@chromium.org>
 <202003022100.54CEEE60F@keescook>
 <20200303095514.GA2596@hirez.programming.kicks-ass.net>
 <CAJcbSZH1oON2VC2U8HjfC-6=M-xn5eU+JxHG2575iMpVoheKdA@mail.gmail.com>
 <6e7e4191612460ba96567c16b4171f2d2f91b296.camel@linux.intel.com>
 <202003031314.1AFFC0E@keescook>
 <20200304092136.GI2596@hirez.programming.kicks-ass.net>
 <202003041019.C6386B2F7@keescook>
 <e60876d0-4f7d-9523-bcec-6d002f717623@zytor.com>
In-Reply-To: <e60876d0-4f7d-9523-bcec-6d002f717623@zytor.com>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Wed, 4 Mar 2020 11:19:44 -0800
X-Gmail-Original-Message-ID: <CAJcbSZHBB1u2Vq0jZKsmd0UcRj=aichxTtbGvbWgf8-g8WPa7w@mail.gmail.com>
Message-ID: <CAJcbSZHBB1u2Vq0jZKsmd0UcRj=aichxTtbGvbWgf8-g8WPa7w@mail.gmail.com>
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Kristen Carlson Accardi <kristen@linux.intel.com>,
 Kernel Hardening <kernel-hardening@lists.openwall.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org, Pavel Machek <pavel@ucw.cz>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jiri Slaby <jslaby@suse.cz>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 the arch/x86 maintainers <x86@kernel.org>, "VMware,
 Inc." <pv-drivers@vmware.com>, Ingo Molnar <mingo@redhat.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Len Brown <len.brown@intel.com>, Kees Cook <keescook@chromium.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Cao jin <caoj.fnst@cn.fujitsu.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
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

On Wed, Mar 4, 2020 at 10:45 AM H. Peter Anvin <hpa@zytor.com> wrote:
>
> On 2020-03-04 10:21, Kees Cook wrote:
> > On Wed, Mar 04, 2020 at 10:21:36AM +0100, Peter Zijlstra wrote:
> >> But at what cost; it does unspeakable ugly to the asm. And didn't a
> >> kernel compiled with the extended PIE range produce a measurably slower
> >> kernel due to all the ugly?
> >
> > Was that true? I thought the final results were a wash and that earlier
> > benchmarks weren't accurate for some reason? I can't find the thread
> > now. Thomas, do you have numbers on that?

I have never seen a significant performance impact. Performance and
size is better on more recent versions of gcc as it has better
generation of PIE code (for example generation of switches).

> >
> > BTW, I totally agree that fgkaslr is the way to go in the future. I
> > am mostly arguing for this under the assumption that it doesn't
> > have meaningful performance impact and that it gains the kernel some
> > flexibility in the kinds of things it can do in the future. If the former
> > is not true, then I'd agree, the benefit needs to be more clear.
> >
>
> "Making the assembly really ugly" by itself is a reason not to do it, in my
> Not So Humble Opinion[TM]; but the reason the kernel and small memory models
> exist in the first place is because there is a nonzero performance impact of
> the small-PIC memory model. Having modules in separate regions would further
> add the cost of a GOT references all over the place (PLT is optional, useless
> and deprecated for eager binding) *plus* might introduce at least one new
> vector of attack: overwrite a random GOT slot, and just wait until it gets hit
> by whatever code path it happens to be in; the exact code path doesn't matter.
> From an kASLR perspective this is *very* bad, since you only need to guess the
> general region of a GOT rather than an exact address.

I agree that it would add GOT references and I can explore that more
in terms of performance impact and size. This patchset makes the GOT
readonly too so I don't think the attack vector applies.

>
> The huge memory model, required for arbitrary placement, has a very
> significant performance impact.

I assume you mean mcmodel=large, it doesn't use it. It uses -fPIE and
removes -mcmodel=kernel. It favors relative references whenever
possible.

>
> The assembly code is *very* different across memory models.
>
>         -hpa
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
