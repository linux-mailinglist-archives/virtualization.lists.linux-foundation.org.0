Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B48AFF8EB0
	for <lists.virtualization@lfdr.de>; Tue, 12 Nov 2019 12:37:01 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 908C7CC7;
	Tue, 12 Nov 2019 11:36:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0A03DB9E
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 11:36:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AD5F112F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 12 Nov 2019 11:36:53 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 61D6421925;
	Tue, 12 Nov 2019 11:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573558613;
	bh=IBRZ0V+FizBPRXBE7AIelmGcF/rqx4zxpH+FTVnkzDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vgR6vb6pygOrhYdh1tLbICYpzNyLiNW/NGEr6J8+nCx71yHQDyEQ3zjASKeUfsJrC
	tr9H+e8krqDcjj664LKgstygnZJcLRjtIzdyrNXpDLEotbjAeOGuGg3W0fRW/q0rLK
	wrAAh0Cey56Uy6sOjPmN8QeMewVkm+GLfLdNBr24=
Date: Tue, 12 Nov 2019 11:36:47 +0000
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 01/13] compiler.h: Split {READ,WRITE}_ONCE definitions
	out into rwonce.h
Message-ID: <20191112113646.GC17835@willie-the-truck>
References: <20191108170120.22331-1-will@kernel.org>
	<20191108170120.22331-2-will@kernel.org>
	<CAK8P3a0f=WvSQSBQ4t0FmEkcFE_mC3oARxaeTviTSkSa-D2qhg@mail.gmail.com>
	<93f80017-d65e-7c3a-29b0-d9a568d08f58@de.ibm.com>
	<CAK8P3a21KdGKMDDPs3jc9XEg3=LbzFnGwVm+xDTB+EqGXiZorA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a21KdGKMDDPs3jc9XEg3=LbzFnGwVm+xDTB+EqGXiZorA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Josh Triplett <josh@joshtriplett.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	SeongJae Park <sj38.park@gmail.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	alpha <linux-alpha@vger.kernel.org>, Joe Perches <joe@perches.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Matt Turner <mattst88@gmail.com>, Yunjae Lee <lyj7694@gmail.com>,
	virtualization@lists.linux-foundation.org,
	Boqun Feng <boqun.feng@gmail.com>, Richard Henderson <rth@twiddle.net>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Nov 11, 2019 at 10:32:46AM +0100, Arnd Bergmann wrote:
> On Mon, Nov 11, 2019 at 9:10 AM Christian Borntraeger
> <borntraeger@de.ibm.com> wrote:
> > On 08.11.19 20:57, Arnd Bergmann wrote:
> > > On Fri, Nov 8, 2019 at 6:01 PM Will Deacon <will@kernel.org> wrote:
> > >>
> > >> In preparation for allowing architectures to define their own
> > >> implementation of the 'READ_ONCE()' macro, move the generic
> > >> '{READ,WRITE}_ONCE()' definitions out of the unwieldy 'linux/compile=
r.h'
> > >> and into a new 'rwonce.h' header under 'asm-generic'.
> > >
> > > Adding Christian Borntr=E4ger to Cc, he originally added the
> > > READ_ONCE()/WRITE_ONCE()
> > > code.
> > >
> > > I wonder if it would be appropriate now to revert back to a much simp=
ler version
> > > of these helpers for any modern compiler. As I understand, only gcc-4=
.6 and
> > > gcc4.7 actually need the song-and-dance version with the union and sw=
itch/case,
> > > while for others, we can might be able back to a macro doing a volati=
le access.
> >
> > As far as I know this particular issue with  volatile access on aggrega=
te types
> > was fixed in gcc 4.8. On the other hand we know that the current constr=
uct will
> > work on all compilers. Not so sure about the orignal ACCESS_ONCE implem=
entation.
> =

> I've seen problems with clang on the current version, leading to unnecess=
ary
> temporaries being spilled to the stack in some cases, so I think it would=
 still
> help to simplify it.
> =

> We probably don't want the exact ACCESS_ONCE() implementation back
> that existed before, but rather something that implements the stricter
> READ_ONCE() and WRITE_ONCE(). I'd probably also want to avoid the
> __builtin_memcpy() exception for odd-sized accesses and instead have
> a separate way to do those.

If you have a patch, I'm happy to carry it at the end of the series to
avoid conflicts. It's not completely clear to me what you're after, so if
you need me to adjust anything here then please shout!

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
