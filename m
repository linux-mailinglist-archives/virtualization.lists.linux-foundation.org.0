Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2EF212271
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 13:39:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 64ED18B142;
	Thu,  2 Jul 2020 11:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNY5TdxicG+q; Thu,  2 Jul 2020 11:39:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CF6BF8AF19;
	Thu,  2 Jul 2020 11:39:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B98C1C0733;
	Thu,  2 Jul 2020 11:39:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0FF38C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 059268AF19
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:39:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uPWM8T8l-csh
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:39:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 135C98A899
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 11:39:30 +0000 (UTC)
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1Mwfj0-1itvnB3lkI-00y5Om for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 13:39:28 +0200
Received: by mail-qk1-f173.google.com with SMTP id b4so25220898qkn.11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 04:39:27 -0700 (PDT)
X-Gm-Message-State: AOAM530sSrCvqneatRD6xrJQ66lofHGH/kHacIzaulzdiZFiUw+1Ayxf
 oCFqYY3OKzl5pbI1qNcf7v+5IrNoaRgmo0aUprw=
X-Google-Smtp-Source: ABdhPJxZnj5versBmr7lWdCxrevvSnrtGz16SQp4OMCvU87jKF+QYKva7czF6a7gzq//AqJiVHDYLYMn/4Cgp3bsm/o=
X-Received: by 2002:a37:9dd6:: with SMTP id
 g205mr30820571qke.352.1593689966522; 
 Thu, 02 Jul 2020 04:39:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-5-will@kernel.org>
 <20200702093239.GA15391@C02TD0UTHF1T.local>
 <20200702094833.GA16248@willie-the-truck>
 <CAK8P3a07G1dLC+RUBDkzDbCRCP_gwZAaVK+k1UxvXT+7Kj=o+g@mail.gmail.com>
 <20200702111832.GC16418@willie-the-truck>
In-Reply-To: <20200702111832.GC16418@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jul 2020 13:39:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3VrEkDf8t1CCsY+g7rtXkqBsiPOr97b1yRbz8NpjdfFA@mail.gmail.com>
Message-ID: <CAK8P3a3VrEkDf8t1CCsY+g7rtXkqBsiPOr97b1yRbz8NpjdfFA@mail.gmail.com>
Subject: Re: [PATCH 04/18] alpha: Override READ_ONCE() with barriered
 implementation
To: Will Deacon <will@kernel.org>
X-Provags-ID: V03:K1:75cgBxUSSk1OBRTl7v2vg8qXyyxY2ZT4J7bCQjbhW+39ShrxcsV
 qgRDLRWEmoGfJh0gVM45aq6cOP5VgjOH/ofylovuQQoExmHhhHrmI/bRWACRitkcteFdUEE
 dN9Znt1YO0/eSi96J25oXd6q60paXz0O5fxYXPWipywaD2641rW62nXY0PrC0Tl0X2dqUmS
 2grbZnj+HCzOGtsFNjdXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PmBcJ4fDFho=:/IvWwkwXxWVhfhQn83R/1f
 naG7FS3AqWQCdXuKv9zlv38vawKDrKyXgU7APEehUO3q2NxqqoXxcYiAvyqa6lA8tHFOHPYmn
 pkne0t8Fdtw4ydJHXZBwEsPET4OAmTUAcsdCEVRzWdUwLgSLYEd+yVu8Fva279F6TCpcibgx+
 t/05LZnmKoHFtDaF57yIXjvqdBY4LuOL+dlbUrm8ttpXYWOVkXhQs4ECQcqocHSDgpq8XjnSl
 D8C6LN1+kOp7gmklKLvx10gzrG1U++HEd74/eqa7Yfv6On42pA+pyyOQk65OoKT37yaECHkCb
 RJ6XmKHTw2vMxnfDDIU5DNe8Hf4nH3dHXUzzB391FFuTJs0tZ/eeRMkp+qULSLrTQmRAb4CWA
 GeVIJSW7kP3xtuO3m3tQ900/Bki9H66f/nrIYqaDvgn4iiJjmP37lRmmomLgrdmtHnb85tSEn
 s0Z2DsMGhI/K6+So+wu7VBrL26RXrXodNrHOKhozjGjvCScno9tDLPeobkRqZDT2Bdx9aNxhG
 /ya9gy3Z1yZN7xLJQp6pETBYnVqQSg9OHdrQpZMkZxjc3emFRz1Frm7tRJuctE4pl8XotKiZH
 gBPyAUNRb0y/63T67FZkS4u3C5p37PG9lc2h4G5WOlBUDTDlb1mQBk5jAw8bfNZIj9IVuIlFj
 u/fsZmTqZSQqyLICL/W4bsUsumwOYC/edFCcbiyb4gmgZRKAyRy7HnC01oSeW8vteLv1NmyPe
 BdHVLZl38CmK9R96LxY02cbtTS+4LgQeIfTUA5MsqE2yZoB1e2cd50ggWrl3he5rOw4EnagpI
 JlsMfykMq9v4QwjxzJIoq5CujmAKZHYskxhPrTOqVjpVCpXuwZ8wnVLt0BOHYmhXXDu8kVO1P
 dz/ALWxD6pymZvfSQuUaNnjx9vNACTN6An2rc2RpKylnWklgUX+fXrio65TKvL+k6qXcVrrWc
 FzFb+moFvZNtsggt6BafbZX76f4b9PBU7rNK9ArBHrKjcis6QMzOQ
Cc: Mark Rutland <mark.rutland@arm.com>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Sami Tolvanen <samitolvanen@google.com>, alpha <linux-alpha@vger.kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>, Matt Turner <mattst88@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Android Kernel Team <kernel-team@android.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>
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

On Thu, Jul 2, 2020 at 1:18 PM Will Deacon <will@kernel.org> wrote:
> On Thu, Jul 02, 2020 at 12:08:41PM +0200, Arnd Bergmann wrote:
> > On Thu, Jul 2, 2020 at 11:48 AM Will Deacon <will@kernel.org> wrote:
> > > On Thu, Jul 02, 2020 at 10:32:39AM +0100, Mark Rutland wrote:

> Not sure I follow you here, but I can confirm that what you're worried
> about doesn't happen for the usual case of a pointer-to-volatile scalar.
>
> For example, ignoring dependency ordering:
>
> unsigned long foo(volatile unsigned long *p)
> {
>         return smp_load_acquire(p) + 1;
> }
>
> Ends up looking like:
>
>         unsigned long ___p1 = *(const volatile unsigned long *)p;
>         smp_mb();
>         (volatile unsigned long)___p1;
>
> My understanding is that casting a non-pointer type to volatile doesn't
> do anything, so we're good.

Right, I mixed up the correct

        (typeof(*p))___p;

with the incorrect

       *typeof(p)&___p;

which would dereference a volatile pointer and cause the
problem.

The code is all fine then.

    Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
