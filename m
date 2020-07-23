Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFDB22B0E3
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 16:00:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95A56858B5;
	Thu, 23 Jul 2020 14:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NUVMHZ0iLMp2; Thu, 23 Jul 2020 14:00:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EAD2789AC6;
	Thu, 23 Jul 2020 14:00:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BDD19C004C;
	Thu, 23 Jul 2020 14:00:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 02990C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id F218189A33
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y8NjSxTi42n
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:00:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 34F54858B5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KJdNCW9/AeNTwbi0vonPFAdv6yCODfnRKfbwoV1pAmc=; b=aHknsQattCTLqx9Xifdf0U4KjV
 ys1rkNEy5yd9BDfxLIPuAhP1o15Re38t9kHAfy53kiCMHm1rrZeULc5Ls6Joh20xna6uoQOrfjAvK
 xEStBYKjqwu0NspaoQEqh+7FkHDyMdn6aMP4qqpgEgSC085tYzi8O4VJa5cEHx3MvJ+EdWAFyRWde
 V20QvR719AoWFdEgRqlYfSPdG5BSPlvbty+fnF/w+RFjvsrRDcgNmbdpaZvfz3vhEh5qsusNkgZPd
 A/zTIwQ73gWoLzUWA7V/MMEOXoE3O2/FmIF1CjP2MqLnR6z1+cJK8LV00dfdvfHJugTPz7EHVir2q
 q88kG/ng==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jybld-0003bC-Nr; Thu, 23 Jul 2020 14:00:13 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id DAFF0983422; Thu, 23 Jul 2020 16:00:11 +0200 (CEST)
Date: Thu, 23 Jul 2020 16:00:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks
 for SPLPAR
Message-ID: <20200723140011.GR5523@worktop.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-arch@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Boqun Feng <boqun.feng@gmail.com>, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 kvm-ppc@vger.kernel.org, Anton Blanchard <anton@ozlabs.org>,
 Will Deacon <will@kernel.org>
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

On Thu, Jul 09, 2020 at 12:06:13PM -0400, Waiman Long wrote:
> We don't really need to do a pv_spinlocks_init() if pv_kick() isn't
> supported.

Waiman, if you cannot explain how not having kick is a sane thing, what
are you saying here?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
