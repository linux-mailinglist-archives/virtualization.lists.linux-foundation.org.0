Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA9B210A56
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 13:33:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 780188AA5A;
	Wed,  1 Jul 2020 11:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0gT7a7fJ6uxR; Wed,  1 Jul 2020 11:33:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5AE508AA8C;
	Wed,  1 Jul 2020 11:33:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 39D88C0733;
	Wed,  1 Jul 2020 11:33:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 11B8EC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0B43A2E10C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:33:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GRU0qmZjPwN
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:33:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by silver.osuosl.org (Postfix) with ESMTPS id D29732E009
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 11:33:48 +0000 (UTC)
Received: from mail-qk1-f175.google.com ([209.85.222.175]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M4Ja3-1jqs6y2SEz-000KSs for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Jul 2020 13:33:45 +0200
Received: by mail-qk1-f175.google.com with SMTP id b4so21749931qkn.11
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Jul 2020 04:33:45 -0700 (PDT)
X-Gm-Message-State: AOAM532+nGbDXr8IkjhClFW+mHYma2HEAOBI1xUX3ZLM0WXnjL2WCa9n
 RHq5wJEil41n1yxmoPD/e21XnfCn4RKfKv22XyE=
X-Google-Smtp-Source: ABdhPJzUyheLKExWmWPJJq8cfmtDNQPYUV5VmAxlZw/B9iC/fX9pH44hi8zZXNkJzktUY7GsGZCLQHu7TodbT+JJTF8=
X-Received: by 2002:a37:9dd6:: with SMTP id
 g205mr25563365qke.352.1593603224183; 
 Wed, 01 Jul 2020 04:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-3-will@kernel.org>
 <CAK8P3a136e2k-iGoJ4X51mnj0f0KSLJKOw6b=s4F2QHHeyAMEQ@mail.gmail.com>
 <20200701101603.GB14959@willie-the-truck>
In-Reply-To: <20200701101603.GB14959@willie-the-truck>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 1 Jul 2020 13:33:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0cfjU-EOVJoMrUcjVDXLOk1Trv4DWcz_bME5Aj3=JPvQ@mail.gmail.com>
Message-ID: <CAK8P3a0cfjU-EOVJoMrUcjVDXLOk1Trv4DWcz_bME5Aj3=JPvQ@mail.gmail.com>
Subject: Re: [PATCH 02/18] compiler.h: Split {READ, WRITE}_ONCE definitions out
 into rwonce.h
To: Will Deacon <will@kernel.org>
X-Provags-ID: V03:K1:0RJetzpMJrj2NfCVGrJ12vjIThzN3+AdqKbUC/5oYdSQz+1vE9n
 Lhszk+f10NQf0UxUKP0XG3DCzdESMjxVgtnjrAeLINXuTP1wtGks5nLvBp+yUJRPAd624aw
 lWVp54RqQcjaIJkHldAh0lY7FuQ/MWHnYrAbChSMqjJtZtGSN8cLShOaUiXNr+5sej8sXhd
 Cq1NtaFZa0TGTVCB6X2mw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AwYjrrsBtjM=:Zsf4QKLGioc65RmEfqdT4e
 Ln3f3PJcdUbescA+mp29p1B8ys1LLQt9iAol0Ktbl0HFt3Qp/ZGx5usqNXQiCY2QE1h2eF+Tc
 6s4sOCmG/X7CzbjYG82kENFGrDGSjEpAP2XQdMcKyWjvSavWYojEgSvlZGITRP7W1V3xfOf/v
 KITTJX2zwalgMXA4YjMTCfJ0ulEMiAMv9nqPgoGszGJlUiJR8cSj5Y0ZmY2QYf/7HNERAVGqS
 2O9Lqx0VrMOooyEWFzV7jKG30bqeJwilnC458w5lU9fS60vOPp+GfunY92DiWYB2B3wOZO0Uq
 grWmpgOga452AILUj3lHOw32IQjd2C2wP+XG193gaIfaEMQXaON7EqqFohLqMbOPw+j55kla7
 qEq5DBV8a3R/o3vRwFsV4jfLr6pDN/lRO0FL36JtyrdQhL8vA/lF+ADvg9jlcQDdj9wJQeLwC
 ozsRZcKJw3IYZnPNbCXDBpqXE2MFqSvw82LGUtM7lsBY6iL4gvjWySo+77EgcyT8TYGxBVM6Y
 yCF6u8SymRbYDPoizLYzBO3BvQmo1/4akoDkybUAVozTUzeq8JK8GFxNpQZYoZmAB5fon7Izl
 QaiIgBABtKuk+6+j4UpSGltzNykfC05P4DbDisOOPdx4PnId1N6ksUxVdpK1nhD9/Q2mONerJ
 v1qIfQxpwf0NO/HjRsleEJHBHU0a8Nq1ojN0EPE/bDRNakTWrJEDuC0pZzm8KR1rzPlO7juS5
 bPEvye5y9G99iVcwSY1YtUtG4PpzNHF8Q36PxjzaH3SmXlsTNbAb/wiR6CKomHTdUMsi1y6Vy
 gybEn6Q4yKA81t3EZfwSID85IEmSoP6zkSI367Ejctlh7c3i4C1ppcEqG2Ma9HDJcxCAf8wz7
 4vCUliSEitB8B8ZNosfBg1sRw4eK0MLECM4Kljin3cerklFRB9k4mV3zoYU9HWxUdga1M04k7
 NYjy/mnijfl5MUqNvbIBb0YD1xPtsHJw+MebnxzqedhQUoVok04Jt
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

On Wed, Jul 1, 2020 at 12:16 PM Will Deacon <will@kernel.org> wrote:
> On Tue, Jun 30, 2020 at 09:11:32PM +0200, Arnd Bergmann wrote:
> > On Tue, Jun 30, 2020 at 7:37 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > In preparation for allowing architectures to define their own
> > > implementation of the READ_ONCE() macro, move the generic
> > > {READ,WRITE}_ONCE() definitions out of the unwieldy 'linux/compiler.h'
> > > file and into a new 'rwonce.h' header under 'asm-generic'.
> > >
> > > Acked-by: Paul E. McKenney <paulmck@kernel.org>
> > > Signed-off-by: Will Deacon <will@kernel.org>
> > > ---
> > >  include/asm-generic/Kbuild   |  1 +
> > >  include/asm-generic/rwonce.h | 91 ++++++++++++++++++++++++++++++++++++
> > >  include/linux/compiler.h     | 83 +-------------------------------
> >
> > Very nice, this has the added benefit of allowing us to stop including
> > asm/barrier.h once linux/compiler.h gets changed to not include
> > asm/rwonce.h.
>
> Yeah, with this series linux/compiler.h _does_ include asm/rwonce.h because
> otherwise there are many callers to fix up, but that could be addressed
> subsequently, I suppose.

Right, I didn't mean you should change that right away. I actually
have a work-in-progress patch series that removes a ton of
indirect header inclusions to improve build speed, and a script to
add the explicit includes into .c files where needed.

> > The asm/barrier.h header has a circular dependency, pulling in
> > linux/compiler.h itself.
>
> Hmm. Once smp_read_barrier_depends() disappears, I could actually remove
> the include of <asm/barrier.h> from asm-generic/rwonce.h. It would have to
> remain for arch/alpha/, however, since we need the barrier definitions to
> implement READ_ONCE(). I can probably also replace the include of
> <linux/compiler.h> in asm-generic/barrier.h with <asm/rwonce.h> too (so it's
> still circular, but at least a lot simpler).
>
> I'll have a play...

I think this would require the same kind of fixup for anything that depends on
asm/barrier.h being included implicitly at the moment.

      Arnd
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
