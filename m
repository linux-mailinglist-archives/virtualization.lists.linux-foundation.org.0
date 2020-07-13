Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id CC46921D3D4
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 12:35:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5561E876EA;
	Mon, 13 Jul 2020 10:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lbd3SLBA1p30; Mon, 13 Jul 2020 10:35:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AEBBB876DA;
	Mon, 13 Jul 2020 10:35:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8E58CC0733;
	Mon, 13 Jul 2020 10:35:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A29CC0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 200CA876DA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:35:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kW_htGTUX4Ip
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:35:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 532E2876C3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=INXvaMVTxBym4z/fKJuakqyDRZOcv2j8dD0l03DIIOk=; b=SG6VIgfVujIJwV1bkl//5xt+9g
 GLP/+l5nCGy7FOXXJBltMRU67LYncxDKPW6XsBHqK5/7I+gwAZZAeIi4Fw+AU9EP/1AStl19tAaLC
 SfbNHamPt4X0L+rDd63gUKANJkUMuOF7Pl9RtdotmVNYk2uice1ic0JG1iXWOkPm+uBxb3DNG+iMu
 WBQD3crMEPQqSfLG0NJ363PhffAs9/YPu277+hE0NShjZJpTyx12XnfZwkkoHATqijESikkzytS65
 d4z7k9jTm4g7VM/nUtS3uougp6mu4u9g36XTFN6DBr/Hme/NNU3thCLE+pHtDGeIM5w+F+NxASdO6
 4MG6AvCA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juvnM-0000vE-10; Mon, 13 Jul 2020 10:34:48 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5FAA3300DB4;
 Mon, 13 Jul 2020 12:34:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 449F220D27C88; Mon, 13 Jul 2020 12:34:43 +0200 (CEST)
Date: Mon, 13 Jul 2020 12:34:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/18] Allow architectures to override __READ_ONCE()
Message-ID: <20200713103443.GE10769@hirez.programming.kicks-ass.net>
References: <20200710165203.31284-1-will@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200710165203.31284-1-will@kernel.org>
Cc: Joel Fernandes <joelaf@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 "Paul E. McKenney" <paulmck@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Sami Tolvanen <samitolvanen@google.com>,
 linux-alpha@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Matt Turner <mattst88@gmail.com>, kernel-team@android.com,
 Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
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

On Fri, Jul 10, 2020 at 05:51:44PM +0100, Will Deacon wrote:

> SeongJae Park (1):
>   Documentation/barriers/kokr: Remove references to
>     [smp_]read_barrier_depends()
> 
> Will Deacon (18):
>   tools: bpf: Use local copy of headers including uapi/linux/filter.h
>   compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h
>   asm/rwonce: Allow __READ_ONCE to be overridden by the architecture
>   alpha: Override READ_ONCE() with barriered implementation
>   asm/rwonce: Remove smp_read_barrier_depends() invocation
>   asm/rwonce: Don't pull <asm/barrier.h> into 'asm-generic/rwonce.h'
>   vhost: Remove redundant use of read_barrier_depends() barrier
>   alpha: Replace smp_read_barrier_depends() usage with smp_[r]mb()
>   locking/barriers: Remove definitions for [smp_]read_barrier_depends()
>   Documentation/barriers: Remove references to
>     [smp_]read_barrier_depends()
>   tools/memory-model: Remove smp_read_barrier_depends() from informal
>     doc
>   include/linux: Remove smp_read_barrier_depends() from comments
>   checkpatch: Remove checks relating to [smp_]read_barrier_depends()
>   arm64: Reduce the number of header files pulled into vmlinux.lds.S
>   arm64: alternatives: Split up alternative.h
>   arm64: cpufeatures: Add capability for LDAPR instruction
>   arm64: alternatives: Remove READ_ONCE() usage during patch operation
>   arm64: lto: Strengthen READ_ONCE() to acquire when CONFIG_LTO=y

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
