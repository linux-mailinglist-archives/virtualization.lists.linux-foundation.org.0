Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 10573A2793
	for <lists.virtualization@lfdr.de>; Thu, 29 Aug 2019 22:03:15 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 38D6C535E;
	Thu, 29 Aug 2019 20:03:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EB533533B
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 20:01:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 51E851FB
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 20:01:24 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id z9so122879edq.8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aYf/lCZC1gwMIR9/lhwT5M/JPgKzeUqjFNgwUcFRWFg=;
	b=U75GJORVMHIr0iUVnntJaP5CkG0L6J04X+1V/ZPN5uW3dQqnBj8pdaROlXs8b4Z1SG
	DR1yBHet2NvJnJhuzP0i5c/qQ5sBWpaG0KlB9URDDEL2UqurL8fMaEild5hR6irruZ3I
	WwlNUWnUuDyL8bRkDmAo8qYqSmnG/ayXfekSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aYf/lCZC1gwMIR9/lhwT5M/JPgKzeUqjFNgwUcFRWFg=;
	b=A7+sC6zm1Hf1yb/yNpHVfzJrjm1/SVK/dRhXhP0xt5tlQkLMSFpM3iECB8GphQeKWY
	XiJ0LnHfHIXWrl4erSY5QQc+Aa3SQftCzWU7Ui6AEQk8tVQU5rgEYefMekoqxjdo0mTf
	3gXTA/KoyfJ62wste9QF3gOovW2T3tp3N2fb4/xeK6UTHY0e8P2lqxV4/04UTusA8ddl
	voZt9cIzlA4wxyww1Tm0ZNHFemZgvPrlq83XUKcjDbL+ElC4xMPXcVctgTwVS6zLs2n7
	j4j2icYzSR4EQdwjQJ9S2BOXeh/Mn7o6pzWI2b/2zjbH6uHvD5VSIdsTlYybekM4vG3A
	xjcA==
X-Gm-Message-State: APjAAAXgPwhuQVI1w0KpJwDx3DvhmaddanoiEElIHQLfHhKg8NXD+Xbr
	Xwo3UokaidkXQGxmBQQDPn+jj7+Hx8Q=
X-Google-Smtp-Source: APXvYqw5Nr4WNJSEvGHJEnse82bsmBYVGQrkD4vRa7PVTRlB2FJ5GBudQWg/dz0gKUqyaWEXXmH/hw==
X-Received: by 2002:a17:906:e0d1:: with SMTP id
	gl17mr6617990ejb.4.1567108882622; 
	Thu, 29 Aug 2019 13:01:22 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com.
	[209.85.221.43])
	by smtp.gmail.com with ESMTPSA id q17sm609938edr.94.2019.08.29.13.01.22
	for <virtualization@lists.linux-foundation.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 29 Aug 2019 13:01:22 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id q12so4629125wrj.12
	for <virtualization@lists.linux-foundation.org>;
	Thu, 29 Aug 2019 13:01:22 -0700 (PDT)
X-Received: by 2002:a5d:4a4e:: with SMTP id v14mr13235010wrs.200.1567108513590;
	Thu, 29 Aug 2019 12:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190730191303.206365-1-thgarnie@chromium.org>
	<20190806154347.GD25897@zn.tnic>
	<20190806155034.GP2349@hirez.programming.kicks-ass.net>
In-Reply-To: <20190806155034.GP2349@hirez.programming.kicks-ass.net>
From: Thomas Garnier <thgarnie@chromium.org>
Date: Thu, 29 Aug 2019 12:55:00 -0700
X-Gmail-Original-Message-ID: <CAJcbSZETvvQYmh6U_Oauptdsrp-emmSG_QsAZzKLv+0-b2Yxig@mail.gmail.com>
Message-ID: <CAJcbSZETvvQYmh6U_Oauptdsrp-emmSG_QsAZzKLv+0-b2Yxig@mail.gmail.com>
Subject: Re: [PATCH v9 00/11] x86: PIE support to extend KASLR randomization
To: Peter Zijlstra <peterz@infradead.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Feng Tang <feng.tang@intel.com>,
	Kristen Carlson Accardi <kristen@linux.intel.com>,
	Kernel Hardening <kernel-hardening@lists.openwall.com>, "VMware,
	Inc." <pv-drivers@vmware.com>, virtualization@lists.linux-foundation.org,
	Nadav Amit <namit@vmware.com>, Pavel Machek <pavel@ucw.cz>,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Hellstrom <thellstrom@vmware.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	the arch/x86 maintainers <x86@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Len Brown <len.brown@intel.com>,
	Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
	Alexios Zavras <alexios.zavras@intel.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
	Maran Wilson <maran.wilson@oracle.com>,
	Linux PM list <linux-pm@vger.kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Tue, Aug 6, 2019 at 8:51 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Aug 06, 2019 at 05:43:47PM +0200, Borislav Petkov wrote:
> > On Tue, Jul 30, 2019 at 12:12:44PM -0700, Thomas Garnier wrote:
> > > These patches make some of the changes necessary to build the kernel as
> > > Position Independent Executable (PIE) on x86_64. Another patchset will
> > > add the PIE option and larger architecture changes.
> >
> > Yeah, about this: do we have a longer writeup about the actual benefits
> > of all this and why we should take this all? After all, after looking
> > at the first couple of asm patches, it is posing restrictions to how
> > we deal with virtual addresses in asm (only RIP-relative addressing in
> > 64-bit mode, MOVs with 64-bit immediates, etc, for example) and I'm
> > willing to bet money that some future unrelated change will break PIE
> > sooner or later.

The goal is being able to extend the range of addresses where the
kernel can be placed with KASLR. I will look at clarifying that in the
future.

>
> Possibly objtool can help here; it should be possible to teach it about
> these rules, and then it will yell when violated. That should avoid
> regressions.
>

I will look into that as well.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
