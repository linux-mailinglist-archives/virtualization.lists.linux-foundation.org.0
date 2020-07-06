Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7B215E65
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 20:35:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7BC3D89465;
	Mon,  6 Jul 2020 18:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQ-dAAmlp2pa; Mon,  6 Jul 2020 18:35:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 019DD89461;
	Mon,  6 Jul 2020 18:35:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1B0FC016F;
	Mon,  6 Jul 2020 18:35:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 83F08C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5279C2630B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HyiC5eJN8TTX
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 8730B2624F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:18 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D2248206DF;
 Mon,  6 Jul 2020 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594060518;
 bh=L1CbjDcZbuTi+ztU4KBMPGZHPbJI+hhe3kCcYygI0o0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pihAVQPmOe+iFKvXzWEZmccOMAFXbtPUIoeXKLuLZyeXrYbyOJ6cXySu9bEogjbdh
 cLDn9jzGmTenZvCFTagNnHqffzlsPGhOGmvjuOt5phD9ZUcu+P3pwzmspR82n/YyNp
 ck5o8VKYVnNWweouqlXuNVXDuMhuL9ES7pvNRgzU=
Date: Mon, 6 Jul 2020 19:35:11 +0100
From: Will Deacon <will@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when
 CLANG_LTO=y
Message-ID: <20200706183510.GA23766@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-19-will@kernel.org>
 <20200706160820.GC10992@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706160820.GC10992@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, Arnd Bergmann <arnd@arndb.de>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sami Tolvanen <samitolvanen@google.com>, Matt Turner <mattst88@gmail.com>,
 kernel-team@android.com, Marco Elver <elver@google.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org
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

On Mon, Jul 06, 2020 at 05:08:20PM +0100, Dave Martin wrote:
> On Tue, Jun 30, 2020 at 06:37:34PM +0100, Will Deacon wrote:
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > new file mode 100644
> > index 000000000000..515e360b01a1
> > --- /dev/null
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -0,0 +1,63 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2020 Google LLC.
> > + */
> > +#ifndef __ASM_RWONCE_H
> > +#define __ASM_RWONCE_H
> > +
> > +#ifdef CONFIG_CLANG_LTO
> > +
> > +#include <linux/compiler_types.h>
> > +#include <asm/alternative-macros.h>
> > +
> > +#ifndef BUILD_VDSO
> > +
> > +#ifdef CONFIG_AS_HAS_LDAPR
> > +#define __LOAD_RCPC(sfx, regs...)					\
> > +	ALTERNATIVE(							\
> > +		"ldar"	#sfx "\t" #regs,				\
> 
> ^ Should this be here?  It seems that READ_ONCE() will actually read
> twice... even if that doesn't actually conflict with the required
> semantics of READ_ONCE(), it looks odd.

It's patched at runtime, so it's either LDAR or LDAPR.

> Making a direct link between LTO and the memory model also seems highly
> spurious (as discussed in the other subthread) so can we have a comment
> explaining the reasoning?

Sure, although like I say, this is more about helping to progress that
conversation.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
