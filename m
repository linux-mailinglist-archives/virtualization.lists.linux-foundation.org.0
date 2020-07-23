Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9125B22B608
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 20:48:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2462F2041A;
	Thu, 23 Jul 2020 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hdH3N908KhsP; Thu, 23 Jul 2020 18:48:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 44B2A21538;
	Thu, 23 Jul 2020 18:48:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DF12C004C;
	Thu, 23 Jul 2020 18:48:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E783C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8B5C1888CE
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kch9rb+dZ1Go
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:48:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A0CBA888E2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 18:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1f7jSo8LA10wBMQErGxZHBOUpBnSmikLw3twngiB9do=; b=F/slu0yrPHxiFr2ZrGc9sNP3ns
 LfcamOV4YCSjJmAGql8AMoxgRpgB7ejoGOoyBLRe1+NSiLXfp9s6mu47IldFSbQMbbcbjzbuf5u9O
 833qpQHg1wNCif0Lkq4328/WTptDw86N2VO7KfNGktPrwAGmjr8DSQjE1+eFSW1K8SBisHKNbRDV7
 cmLO0EzWU8yk6Qi6ew5Fj8GFbqy5DhWcjYesQlU6LImS6PD+RqUFfZR8xNf4Vgk5d/STeIWcbrgB3
 HEhT+oCJJ9EhcXF59Ajf1oGcNx4KwTMd9LXGPsPEGnP5wOjXWz5J0tqHK64RSquaQFlBJPTpvUZQp
 TcS/d44Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jygG9-0004Wx-0f; Thu, 23 Jul 2020 18:48:01 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 28C213013E5;
 Thu, 23 Jul 2020 20:47:59 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C4A532010461D; Thu, 23 Jul 2020 20:47:59 +0200 (CEST)
Date: Thu, 23 Jul 2020 20:47:59 +0200
From: peterz@infradead.org
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 5/6] powerpc/pseries: implement paravirt qspinlocks
 for SPLPAR
Message-ID: <20200723184759.GS119549@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <20200706043540.1563616-6-npiggin@gmail.com>
 <874kqhvu1v.fsf@mpe.ellerman.id.au>
 <8265d782-4e50-a9b2-a908-0cb588ffa09c@redhat.com>
 <20200723140011.GR5523@worktop.programming.kicks-ass.net>
 <845de183-56f5-2958-3159-faa131d46401@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <845de183-56f5-2958-3159-faa131d46401@redhat.com>
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

On Thu, Jul 23, 2020 at 02:32:36PM -0400, Waiman Long wrote:
> BTW, do you have any comment on my v2 lock holder cpu info qspinlock patch?
> I will have to update the patch to fix the reported 0-day test problem, but
> I want to collect other feedback before sending out v3.

I want to say I hate it all, it adds instructions to a path we spend an
aweful lot of time optimizing without really getting anything back for
it.

Will, how do you feel about it?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
