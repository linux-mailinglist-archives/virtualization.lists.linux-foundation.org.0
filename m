Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBAD21209A
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 12:09:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 00D2786A4F;
	Thu,  2 Jul 2020 10:09:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vDR+mK7obKF; Thu,  2 Jul 2020 10:09:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BA9308B14D;
	Thu,  2 Jul 2020 10:09:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84F30C0733;
	Thu,  2 Jul 2020 10:09:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29826C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2195A8A4C6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:09:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9sycUaTyzAau
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:09:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5B9B18A2A8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 10:09:01 +0000 (UTC)
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MbizQ-1jErZc2qWE-00dIBs for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 12:08:58 +0200
Received: by mail-qk1-f175.google.com with SMTP id 145so22573178qke.9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 03:08:58 -0700 (PDT)
X-Gm-Message-State: AOAM531TB1PINMbIAbLddMGY7q+HQliT8RZUpBFnH3/6FGHK4Koerygq
 93W6HTyong8znkafpWjAY8HQlZXXJ2CR42CmNJg=
X-Google-Smtp-Source: ABdhPJx5SOJMuDfQwJVKZB5+m6bRsdErAkrfs1PX1uiM9LM3hcJxJy3YrlJL+419fren+MgMc2n134OOOUrPQ10mHDg=
X-Received: by 2002:a05:620a:1654:: with SMTP id
 c20mr22857877qko.138.1593684537553; 
 Thu, 02 Jul 2020 03:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-5-will@kernel.org>
 <20200702093239.GA15391@C02TD0UTHF1T.local>
 <20200702094833.GA16248@willie-the-truck>
In-Reply-To: <20200702094833.GA16248@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jul 2020 12:08:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a07G1dLC+RUBDkzDbCRCP_gwZAaVK+k1UxvXT+7Kj=o+g@mail.gmail.com>
Message-ID: <CAK8P3a07G1dLC+RUBDkzDbCRCP_gwZAaVK+k1UxvXT+7Kj=o+g@mail.gmail.com>
Subject: Re: [PATCH 04/18] alpha: Override READ_ONCE() with barriered
 implementation
To: Will Deacon <will@kernel.org>
X-Provags-ID: V03:K1:0A2m4qKP2rTaJscNrjFMgo202R+r16AN45/TxRx96GidH0A/zYZ
 ZiUHPsH12rz2RgGjJH8rurspAmKCMlAtzzbSI55e1hq+5aZfM+Gsgl+cTLO52BA2hMLa51N
 kM/jpo3DQxDTD+AIg5xUN7UwAJtFvGfHqKi8zq7Idvn3J24s4E6aXrkeEYYTCRJiKp1tcrN
 yZMAtCY9Z5LO6qGzUNPTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PVrKMOnU2VM=:Ru+wqrIjRyFwK1AalrMiom
 7G1nTYxiNtzNMtcypTc+kQm7SSDjCrS3MlRJcqJ7oYKg7SE4xy1dvAhe6c6N8udv0Ejc9a+Vh
 tC/RJlq+shr+zj6mrRHYSDUEJdveK8m84Rau404W73/t80RYOnrEMJnv0ms7PiZOpzCbHk/ld
 CyeT9uT3s+RRkrYP0W/B/DFQbLzSc5hSiMXbHCf06D/H4HWC3BaUcXN5s9rZ2dTJMRVxOmC7o
 nexqvLBFTE41kwZHkluYW//hSKCVxNQfNEN7GKD+R/exqT3lpE0Dqop4VFH3R9kDAH0NGuFzm
 RKZQehJp+XY7NPTnv4IwZ76P07JFtOoQ5apuTANPsQdLrqVBtriIeTmrqYTEzLnEmN6NqItPZ
 SYZrjhgdbQf2xsswYqQPoaIoQAuwQwr5PoMTrLI8qnGK4KTkZ7ajL1QvBjpzq7+9cCDdIAlUL
 bp8OIibNaMo+OzZDosvk+/NwMqmx5+FxHtWbM26BWsG06mX5P8ljXRr0z5zzT5ol/TSiyQH2r
 WckjaVX1SFQ7RYiYLUo2X0vmyESrrLHCsINNdtK/S5dzw6DgbGY0zROm1WlkXbTKe2Sqr94Kh
 whuYRtai3Bpn9l2Ljl2hATdp+W4MNyqZEtddW4M9aKXBd0y16HwFCVZ5M4QLd30zB6PalrF7/
 q9Ay66pRnXP0GeHYpW/ZsWzdAxWPAowyPHwx0L1HXlqTLOAYN7BnU+GGXXqgHdG6Rzybyfh/U
 Yb/c33G7LcnbreQG3BIhnrk3aGS1sH9q7k+wnUSqzaLFVaU2hhjB6bzOHzXEThi5/sN3e7fM3
 DhiynF1J8jME9weSWnBhRpHvEBgQ+Vd1xjgjmetDDS9IjgiR6E=
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

On Thu, Jul 2, 2020 at 11:48 AM Will Deacon <will@kernel.org> wrote:
> On Thu, Jul 02, 2020 at 10:32:39AM +0100, Mark Rutland wrote:
> > On Tue, Jun 30, 2020 at 06:37:20PM +0100, Will Deacon wrote:
> > > -#define read_barrier_depends() __asm__ __volatile__("mb": : :"memory")
> > > +#define __smp_load_acquire(p)                                              \
> > > +({                                                                 \
> > > +   __unqual_scalar_typeof(*p) ___p1 =                              \
> > > +           (*(volatile typeof(___p1) *)(p));                       \
> > > +   compiletime_assert_atomic_type(*p);                             \
> > > +   ___p1;                                                          \
> > > +})
> >
> > Sorry if I'm being thick, but doesn't this need a barrier after the
> > volatile access to provide the acquire semantic?
> >
> > IIUC prior to this commit alpha would have used the asm-generic
> > __smp_load_acquire, i.e.
> >
> > | #ifndef __smp_load_acquire
> > | #define __smp_load_acquire(p)                                           \
> > | ({                                                                      \
> > |         __unqual_scalar_typeof(*p) ___p1 = READ_ONCE(*p);               \
> > |         compiletime_assert_atomic_type(*p);                             \
> > |         __smp_mb();                                                     \
> > |         (typeof(*p))___p1;                                              \
> > | })
> > | #endif

I also have a question that I didn't dare ask when the same
code came up before (I guess it's also what's in the kernel today):

With the cast to 'typeof(*p)' at the end, doesn't that mean we
lose the effect of __unqual_scalar_typeof() again, so any "volatile"
pointer passed into __READ_ONCE_SCALAR() or
__smp_load_acquire() still leads to a volatile load of the original
variable, plus another volatile access to ___p1 after
spilling it to the stack as a non-volatile variable?

I hope I'm missing something obvious here.

        Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
