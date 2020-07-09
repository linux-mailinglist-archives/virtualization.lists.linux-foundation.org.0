Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2D7219AD3
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 10:31:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F31B1265F6;
	Thu,  9 Jul 2020 08:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w6xup8ldAxOd; Thu,  9 Jul 2020 08:31:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABD6924C93;
	Thu,  9 Jul 2020 08:31:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A053C016F;
	Thu,  9 Jul 2020 08:31:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53F1CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4916689598
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 58hbtOBqUtP4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3D97B89563
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 08:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2u6IXv0WvuYmLy64Ol8ToLNhgDQTw8a7diWyD8qQt08=; b=F0s0r0RGrn5TfKzoVnYXlTKpg+
 KGNajxhzv6v7lQl2vblqcIsoUZOfS0vFJigwA3e9/RP28IYSY/w/fMOqFWMDqdBjISV03OsTlM8hu
 LZqsSCgVytkRYh5ISkCcBLr4Le1Nh2Ql7PK1dzZdVgSQAlgUSnSTvqEkqAHfaeJXFaWg+DTGddS1c
 4rKztouBM+OG3AGJvLZScssnBagjrXd+I0tpCAUr7QuU+cpcf+lja0j1YbFdUWenzhQa1pfrdaTlJ
 sGnWvmh+F87Ou5hBRP3Mbqxb15xqCM+gQyE5R0kCel3LAyVegAqk0RpHYPBIsqc2Un1Oji38WRzKa
 ybx7cLnw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtRxb-00026c-Cs; Thu, 09 Jul 2020 08:31:15 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id BD0133013E5;
 Thu,  9 Jul 2020 10:31:13 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A7C6C29E916A5; Thu,  9 Jul 2020 10:31:13 +0200 (CEST)
Date: Thu, 9 Jul 2020 10:31:13 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v3 0/6] powerpc: queued spinlocks and rwlocks
Message-ID: <20200709083113.GI597537@hirez.programming.kicks-ass.net>
References: <20200706043540.1563616-1-npiggin@gmail.com>
 <24f75d2c-60cd-2766-4aab-1a3b1c80646e@redhat.com>
 <1594101082.hfq9x5yact.astroid@bobo.none>
 <20200708084106.GE597537@hirez.programming.kicks-ass.net>
 <a9834278-25bf-90e9-10f2-cd10e5407ff6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9834278-25bf-90e9-10f2-cd10e5407ff6@redhat.com>
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

On Wed, Jul 08, 2020 at 07:54:34PM -0400, Waiman Long wrote:
> On 7/8/20 4:41 AM, Peter Zijlstra wrote:
> > On Tue, Jul 07, 2020 at 03:57:06PM +1000, Nicholas Piggin wrote:
> > > Yes, powerpc could certainly get more performance out of the slow
> > > paths, and then there are a few parameters to tune.
> > Can you clarify? The slow path is already in use on ARM64 which is weak,
> > so I doubt there's superfluous serialization present. And Will spend a
> > fair amount of time on making that thing guarantee forward progressm, so
> > there just isn't too much room to play.
> > 
> > > We don't have a good alternate patching for function calls yet, but
> > > that would be something to do for native vs pv.
> > Going by your jump_label implementation, support for static_call should
> > be fairly straight forward too, no?
> > 
> >    https://lkml.kernel.org/r/20200624153024.794671356@infradead.org
> > 
> Speaking of static_call, I am also looking forward to it. Do you have an
> idea when that will be merged?

0day had one crash on the last round, I think Steve send a fix for that
last night and I'll go look at it.

That said, the last posting got 0 feedback, so either everybody is
really happy with it, or not interested. So let us know in the thread,
with some review feedback.

Once I get through enough of the inbox to actually find the fix and test
it, I'll also update the thread, and maybe threaten to merge it if
everybody stays silent :-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
