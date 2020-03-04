Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E59A01797BA
	for <lists.virtualization@lfdr.de>; Wed,  4 Mar 2020 19:21:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 921F885D6F;
	Wed,  4 Mar 2020 18:21:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_DZpIL3w1Vu; Wed,  4 Mar 2020 18:21:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8003085D08;
	Wed,  4 Mar 2020 18:21:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 528C8C1D8E;
	Wed,  4 Mar 2020 18:21:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39A8CC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1E63581CBE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:21:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JsSoHwRHRo5z
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:21:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D0909811F6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Mar 2020 18:21:50 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id y21so1376074pfp.1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 04 Mar 2020 10:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xF2I7tf+DwxpQhNciBVkWhhaWOLjPvYzGL3E90sj2so=;
 b=EtH+RNLzhqY+QqYdV6X7ap6Xu3EpSaat18+ckZb/mOfySU0ooqa/9cKD/lI/wgqztb
 ZK2Ma6j1qv5DcakHHIlnNCH8JvP6u0Ga6Lxhnp2OX/arBJTY2+8pgH3SNyBm7i2VIJ2k
 nN0QThNn3RyhAFc+q1sXxzjkc/ZdjOgh2+oOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xF2I7tf+DwxpQhNciBVkWhhaWOLjPvYzGL3E90sj2so=;
 b=PX48VMwFCETZwS1DhkxMMhuvKN/2lTntlUupS+hXgHmkzrHSfwmYtod8v3mVySg92e
 oY2gYsygtBaUOyJvOPj2jmitxwmY1m3TQokJ6zL12+gVl7OPd7F1L4DdLBJIrq7CH9U5
 k/iSzn0QYMtigqFdMRmXMwmY8isz21zZZ6Rt3U0sWquFUP1/+B+Np5MflL4JxSTn7U+R
 c5paPc/3GxxtKRFBeu+O7n1woQqS6V02MxYvSXTwigUJ2SLChV/POJwsDajIO5ERH9cc
 eD67rYmGRLFJWJhdLCeitCyVYkVnQh2fgkyipRFzNXlMh3/F8nQkntG/iAkhIGEUX/cf
 5vag==
X-Gm-Message-State: ANhLgQ19GjHmap3wWDCdSqJuntB0nYM1wDS1QDep3WnBiQ/OIkQ7q7/p
 tuU2o9rfQHmZXxhlcSkv49p7pg==
X-Google-Smtp-Source: ADFU+vuGalFADUNS2CsAir9E+YeLAVnzSZsmifwLoGDru8DbnpAUozLyZDUnqEqdqAQL4AUGpiCQNw==
X-Received: by 2002:a63:ed14:: with SMTP id d20mr3606078pgi.267.1583346110401; 
 Wed, 04 Mar 2020 10:21:50 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m59sm3603815pjb.41.2020.03.04.10.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2020 10:21:49 -0800 (PST)
Date: Wed, 4 Mar 2020 10:21:48 -0800
From: Kees Cook <keescook@chromium.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v11 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <202003041019.C6386B2F7@keescook>
References: <20200228000105.165012-1-thgarnie@chromium.org>
 <202003022100.54CEEE60F@keescook>
 <20200303095514.GA2596@hirez.programming.kicks-ass.net>
 <CAJcbSZH1oON2VC2U8HjfC-6=M-xn5eU+JxHG2575iMpVoheKdA@mail.gmail.com>
 <6e7e4191612460ba96567c16b4171f2d2f91b296.camel@linux.intel.com>
 <202003031314.1AFFC0E@keescook>
 <20200304092136.GI2596@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200304092136.GI2596@hirez.programming.kicks-ass.net>
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

On Wed, Mar 04, 2020 at 10:21:36AM +0100, Peter Zijlstra wrote:
> But at what cost; it does unspeakable ugly to the asm. And didn't a
> kernel compiled with the extended PIE range produce a measurably slower
> kernel due to all the ugly?

Was that true? I thought the final results were a wash and that earlier
benchmarks weren't accurate for some reason? I can't find the thread
now. Thomas, do you have numbers on that?

BTW, I totally agree that fgkaslr is the way to go in the future. I
am mostly arguing for this under the assumption that it doesn't
have meaningful performance impact and that it gains the kernel some
flexibility in the kinds of things it can do in the future. If the former
is not true, then I'd agree, the benefit needs to be more clear.

-- 
Kees Cook
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
