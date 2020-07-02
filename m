Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D78FF21271F
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 16:55:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7F30A886A5;
	Thu,  2 Jul 2020 14:55:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLfR0hP9zEMW; Thu,  2 Jul 2020 14:55:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6F5778949D;
	Thu,  2 Jul 2020 14:55:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 54A36C0733;
	Thu,  2 Jul 2020 14:55:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81C5BC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7D28988F61
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:55:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qaFBjkhpyhXy
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:55:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EB81F88F56
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 14:55:41 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1105F2075D;
 Thu,  2 Jul 2020 14:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593701741;
 bh=nbXe6nJCNrMku6QIpQkPDTVx3nVSr/HZ3tO6LrfZY8Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PcEiNPxuhlEyLh2HMXcrpBV1EC5XLsFjtMKSlRSdePnrAVWjczQYEysgptdOEIbNb
 QjfUU6jDXo4nj7OwF7ffPzJvSQ1L4KMCNuYjhVu7foez1h5841jqZdO+/Wfss7iN0Y
 tyFLYFMHbSNeYbjpimnr2GDt6pYflThH5++ITr0w=
Date: Thu, 2 Jul 2020 15:55:33 +0100
From: Will Deacon <will@kernel.org>
To: Joel Fernandes <joelaf@google.com>
Subject: Re: [PATCH 04/18] alpha: Override READ_ONCE() with barriered
 implementation
Message-ID: <20200702145532.GB16999@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-5-will@kernel.org>
 <CAJWu+oqs-d0oDswB2Owyh-4Zo4WXAqKhKU0L=1HEwEfQbc1izw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJWu+oqs-d0oDswB2Owyh-4Zo4WXAqKhKU0L=1HEwEfQbc1izw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Arnd Bergmann <arnd@arndb.de>, Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 "Cc: Android Kernel" <kernel-team@android.com>, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-alpha@vger.kernel.org
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

Hi Joel,

On Thu, Jul 02, 2020 at 10:43:55AM -0400, Joel Fernandes wrote:
> On Tue, Jun 30, 2020 at 1:38 PM Will Deacon <will@kernel.org> wrote:
> > diff --git a/arch/alpha/include/asm/barrier.h b/arch/alpha/include/asm/barrier.h
> > index 92ec486a4f9e..2ecd068d91d1 100644
> > --- a/arch/alpha/include/asm/barrier.h
> > +++ b/arch/alpha/include/asm/barrier.h
> > - * For example, the following code would force ordering (the initial
> > - * value of "a" is zero, "b" is one, and "p" is "&a"):
> > - *
> > - * <programlisting>
> > - *     CPU 0                           CPU 1
> > - *
> > - *     b = 2;
> > - *     memory_barrier();
> > - *     p = &b;                         q = p;
> > - *                                     read_barrier_depends();
> > - *                                     d = *q;
> > - * </programlisting>
> > - *
> > - * because the read of "*q" depends on the read of "p" and these
> > - * two reads are separated by a read_barrier_depends().  However,
> > - * the following code, with the same initial values for "a" and "b":
> > - *
> 
> Would it be Ok to keep this example in the kernel sources? I think it
> serves as good documentation and highlights the issue in the Alpha
> architecture well.

I'd _really_ like to remove it, as I think it only serves to confuse people
on a topic that is confusing enough already. Paul's perfbook [1] already has
plenty of information about this, so I don't think we need to repeat that
here. I could add a citation, perhaps?

> > - * <programlisting>
> > - *     CPU 0                           CPU 1
> > - *
> > - *     a = 2;
> > - *     memory_barrier();
> > - *     b = 3;                          y = b;
> > - *                                     read_barrier_depends();
> > - *                                     x = a;
> > - * </programlisting>
> > - *
> > - * does not enforce ordering, since there is no data dependency between
> > - * the read of "a" and the read of "b".  Therefore, on some CPUs, such
> > - * as Alpha, "y" could be set to 3 and "x" to 0.  Use rmb()
> > - * in cases like this where there are no data dependencies.
> > - */
> > -#define read_barrier_depends() __asm__ __volatile__("mb": : :"memory")
> > +#define __smp_load_acquire(p)                                          \
> > +({                                                                     \
> > +       __unqual_scalar_typeof(*p) ___p1 =                              \
> > +               (*(volatile typeof(___p1) *)(p));                       \
> > +       compiletime_assert_atomic_type(*p);                             \
> > +       ___p1;                                                          \
> > +})
> 
> I had the same question as Mark about the need for a memory barrier
> here, otherwise alpha will again break right? Looking forward to the
> future fix you mentioned.

Yeah, sorry about that. It went missing somehow during the rebase, it seems.

> BTW,  do you know any architecture where speculative execution of
> address-dependent loads can cause similar misorderings? That would be
> pretty insane though. In Alpha's case it is not speculation but rather
> the split local cache design as the docs mention.   The reason I ask
> is it is pretty amusing that control-dependent loads do have such
> misordering issues due to speculative branch execution and I wondered
> what other games the CPUs are playing. FWIW I ran into [1] which talks
> about analogy between memory dependence and control dependence.

I think you're asking about value prediction, and the implications it would
have on address-dependent loads where the address can itself be predicted.
I'm not aware of an CPUs where that is observable architecturally.

arm64 has some load instructions that do not honour address dependencies,
but I believe that's mainly to enable alternative cache designs for things
like non-temporal and large vector loads.

Will

[1] https://mirrors.edge.kernel.org/pub/linux/kernel/people/paulmck/perfbook/perfbook.html
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
