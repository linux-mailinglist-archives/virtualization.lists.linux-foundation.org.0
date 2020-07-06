Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A642D215E68
	for <lists.virtualization@lfdr.de>; Mon,  6 Jul 2020 20:35:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2DFEB2663D;
	Mon,  6 Jul 2020 18:35:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1ZQM6iCFccS; Mon,  6 Jul 2020 18:35:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 34442265F4;
	Mon,  6 Jul 2020 18:35:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18471C0891;
	Mon,  6 Jul 2020 18:35:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 834D8C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7230D89445
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBBIPtd-WOQ6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B2E6989462
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Jul 2020 18:35:49 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 007982064C;
 Mon,  6 Jul 2020 18:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594060549;
 bh=QElTtoqqXckuhA9BZOgcYSdLXXIBOg7PR5IagnhwDho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VujbM6QUizcvQdgwE+TRzHSqSJ0FHj+o1kzk/zYc4jni+539xqlVorsw42yU86v/1
 fj31wKt7x318hyaDbrCvT9nj6jWUPko7rLCC9SURvyoUSijZsWNZD5QNo9NlOaG4ib
 xdY1aWUQF/pAYNyJsZqgjV6qCWWfW3H+OZPzglKM=
Date: Mon, 6 Jul 2020 19:35:43 +0100
From: Will Deacon <will@kernel.org>
To: Dave Martin <Dave.Martin@arm.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when
 CLANG_LTO=y
Message-ID: <20200706183542.GB23766@willie-the-truck>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-19-will@kernel.org>
 <20200701170722.4rte5ssnmrn2uqzg@bakewell.cambridge.arm.com>
 <20200702072301.GA15963@willie-the-truck>
 <20200706160023.GB10992@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200706160023.GB10992@arm.com>
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

On Mon, Jul 06, 2020 at 05:00:23PM +0100, Dave Martin wrote:
> On Thu, Jul 02, 2020 at 08:23:02AM +0100, Will Deacon wrote:
> > On Wed, Jul 01, 2020 at 06:07:25PM +0100, Dave P Martin wrote:
> > > Also, can you illustrate code that can only be unsafe with Clang LTO?
> > 
> > I don't have a concrete example, but it's an ongoing concern over on the LTO
> > thread [1], so I cooked this to show one way we could deal with it. The main
> > concern is that the whole-program optimisations enabled by LTO may allow the
> > compiler to enumerate possible values for a pointer at link time and replace
> > an address dependency between two loads with a control dependency instead,
> > defeating the dependency ordering within the CPU.
> 
> Why can't that happen without LTO?

It could, but I'd argue that it's considerably less likely because there
is less information available to the compiler to perform these sorts of
optimisations. It also doesn't appear to be happening in practice.

The current state of affairs is that, if/when we catch the compiler
performing harmful optimistations, we look for a way to disable them.
However, there are good reasons to enable LTO, so this is one way to
do that without having to worry about the potential impact on dependency
ordering.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
