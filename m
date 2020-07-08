Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4263921828C
	for <lists.virtualization@lfdr.de>; Wed,  8 Jul 2020 10:33:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E066789510;
	Wed,  8 Jul 2020 08:33:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWa4BdrOvnPd; Wed,  8 Jul 2020 08:33:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3C83788942;
	Wed,  8 Jul 2020 08:33:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1788BC016F;
	Wed,  8 Jul 2020 08:33:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5B6C6C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5125424F76
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:33:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M25aJtPWaJ4M
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:33:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by silver.osuosl.org (Postfix) with ESMTPS id 370E925506
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Jul 2020 08:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ZJNpnEdpSwAOlQcxfZwII1itlZxmBIrNUFOl9UFQI0s=; b=Ya9qiXHHrdyTWGPp032YRnzFIH
 6MPYm0BEoMc8ncfqqgb17R+Q1Yuv0iN4WdS/fxjtUiznK3bLbXquZDs7sSVGogtzLN++DsaGuBaJ+
 qxeWf0cuxdCtPe/HsGMvplOVk4llp07clkobZcvBYbO9+adWvLV/Hbov12TR7dC+IhsmIB0z9Yw2T
 h9JG4XlquyLth3icw8mMkkAJA+hfeaw90jRoPMbh7DqJSBErC0cwQQ0pwFWtmhCEul0BDB0WstS46
 RzcRgZc2lOT/SzvFOdYKUM8hfD52L0Dsui/qWIIQ1E2spaJ5v3/tsywLBG9gTevjRjwSFW6I+TOuB
 k1AQxs/A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt5VF-0007ob-RZ; Wed, 08 Jul 2020 08:32:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DF5B6300739;
 Wed,  8 Jul 2020 10:32:10 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BB50D2BDFCA5B; Wed,  8 Jul 2020 10:32:10 +0200 (CEST)
Date: Wed, 8 Jul 2020 10:32:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
Message-ID: <20200708083210.GD597537@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <de3ead58-7f81-8ebd-754d-244f6be24af4@redhat.com>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Anton Blanchard <anton@ozlabs.org>, linuxppc-dev@lists.ozlabs.org
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

On Tue, Jul 07, 2020 at 11:33:45PM -0400, Waiman Long wrote:
> From 5d7941a498935fb225b2c7a3108cbf590114c3db Mon Sep 17 00:00:00 2001
> From: Waiman Long <longman@redhat.com>
> Date: Tue, 7 Jul 2020 22:29:16 -0400
> Subject: [PATCH 2/9] locking/pvqspinlock: Introduce
>  CONFIG_PARAVIRT_QSPINLOCKS_LITE
> 
> Add a new PARAVIRT_QSPINLOCKS_LITE config option that allows
> architectures to use the PV qspinlock code without the need to use or
> implement a pv_kick() function, thus eliminating the atomic unlock
> overhead. The non-atomic queued_spin_unlock() can be used instead.
> The pv_wait() function will still be needed, but it can be a dummy
> function.
> 
> With that option set, the hybrid PV queued/unfair locking code should
> still be able to make it performant enough in a paravirtualized

How is this supposed to work? If there is no kick, you have no control
over who wakes up and fairness goes out the window entirely.

You don't even begin to explain...
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
