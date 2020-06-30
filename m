Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABC420FD8A
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 22:21:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8163387A47;
	Tue, 30 Jun 2020 20:21:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ow6tAUijeeKx; Tue, 30 Jun 2020 20:21:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C930E87967;
	Tue, 30 Jun 2020 20:21:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC68DC016E;
	Tue, 30 Jun 2020 20:21:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9598DC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 20:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 73CC32052B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 20:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EAyzoj-hASp4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 20:21:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 62FBC20348
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 20:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=pAld+PmSm3uQ9OLHyA9LsKDVn58a/UVYkn4lwoGnumM=; b=eAS27j4l5VKQ8En/OF9eH/i5RP
 +zf93Ed62vvzDVNpm3OQPePdECVVSJpOKoPHPo0qto2p1L5df+7KSwptQDd/nIrdnpM5pzrhFjqJW
 Gay6KM35iiIdnoVMtvL/4zFrkRmS8yLmL8kAueTKNarZQya4QhxBswEHfzITY6U2oKozvVDs84Yl7
 8YFxk3ukDS3ImbkleuGENzLAnxsGWZJK4RrZ92k+myKvwxG+jTKqc4UERDxZlwKgkAJCQy/4cc2Xk
 2MFT8Aygu1X6cIf9AXIRkGnOEsa+DHSPoHT2y4I+azRP5RQAjvGtlG/6aByC0gvgXiSJN2XicZtSl
 46R2yNXA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqMkd-0000sY-D6; Tue, 30 Jun 2020 20:21:07 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A75C130015A;
 Tue, 30 Jun 2020 22:20:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 850D8203A69CB; Tue, 30 Jun 2020 22:20:59 +0200 (CEST)
Date: Tue, 30 Jun 2020 22:20:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH 18/18] arm64: lto: Strengthen READ_ONCE() to acquire when
 CLANG_LTO=y
Message-ID: <20200630202059.GE4817@hirez.programming.kicks-ass.net>
References: <20200630173734.14057-1-will@kernel.org>
 <20200630173734.14057-19-will@kernel.org>
 <CANpmjNPOO=AVsVJMdL8sq03jwHsDR_1_FfWccwaLKEBRn1RFtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANpmjNPOO=AVsVJMdL8sq03jwHsDR_1_FfWccwaLKEBRn1RFtA@mail.gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Android Kernel Team <kernel-team@android.com>,
 Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Josh Triplett <josh@joshtriplett.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 linux-alpha@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Matt Turner <mattst88@gmail.com>, virtualization@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Richard Henderson <rth@twiddle.net>
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

On Tue, Jun 30, 2020 at 09:47:30PM +0200, Marco Elver wrote:
> I do wonder, though, if there is some way to make the compiler do
> something better for us. Clearly, implementing real
> memory_order_consume hasn't worked out until today. But maybe the
> compiler could promote dependent loads to acquires if it recognizes it
> lost dependencies during optimizations. Just thinking out loud, it
> probably still has some weird corner case that will break. ;-)

I'd be very hesitant to let the compiler upgrade the ordering for us,
specifically because we're not using C11 crud and are using a lot of
inline asm.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
