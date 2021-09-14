Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6FF40AC2B
	for <lists.virtualization@lfdr.de>; Tue, 14 Sep 2021 13:04:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD88080E97;
	Tue, 14 Sep 2021 11:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQeQnhAh88M0; Tue, 14 Sep 2021 11:04:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A280280C17;
	Tue, 14 Sep 2021 11:04:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20816C001E;
	Tue, 14 Sep 2021 11:04:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7FFE8C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60B7B4029A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:04:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HEg8h22NDOLD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:04:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61B9C40295
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mMZLspAs4SibC8RtzDy4xBKwM9DL7s6XmwYmYiusX18=; b=rNwoE9hFA4si/ZyTkc3P2xDSE7
 dcDCaJMft5fR4xVFBTYgKbPlTrZobXVQCFvH5slK9GNtC8AsiWSO1E52cxfHL+8hDcJzCnIU7bnO+
 5284nOCG0guLsFRtNKk9mOpa+t8kHLtFTlOqLF5cadZkcvqQYIQhTJYITteqcomdiUyCmoaczvSVd
 3bUD9lxuc3YT+t2ug8Z+Mr0ptYmcX5blTE3UTp7QhWKR3vNK7bdpN3aI6Ik2v1hXccBUNiwH8cNqE
 7FS0N0sS7q4CoyuNfKZozcRXEoLqjCQctkiifuggp9azW6hpMeitTSp8Yo6dePlYN8Ge4Ly83VSTj
 rAXlcRvA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ6DQ-00Ea8d-1B; Tue, 14 Sep 2021 11:03:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CE829300255;
 Tue, 14 Sep 2021 13:03:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A4AA62D0615DB; Tue, 14 Sep 2021 13:03:02 +0200 (CEST)
Date: Tue, 14 Sep 2021 13:03:02 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 7/9] virtio-pci: harden INTX interrupts
Message-ID: <YUCBZjjk77q8JS4f@hirez.programming.kicks-ass.net>
References: <20210913055353.35219-1-jasowang@redhat.com>
 <20210913055353.35219-8-jasowang@redhat.com> <875yv4f99j.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875yv4f99j.ffs@tglx>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, david.kaplan@amd.com,
 mst@redhat.com, f.hetzelt@tu-berlin.de, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, konrad.wilk@oracle.com,
 Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
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

On Mon, Sep 13, 2021 at 11:36:24PM +0200, Thomas Gleixner wrote:

> That's the real problem and for that your barrier is at the wrong place
> because you want to make sure that those stores are visible before the
> store to intx_soft_enabled becomes visible, i.e. this should be:
> 
> 
>         /* Ensure that all preceeding stores are visible before intx_soft_enabled */
> 	smp_wmb();
> 	vp_dev->intx_soft_enabled = true;

That arguably wants to be smp_store_release() instead of smp_wmb() :-)

> Now Micheal is not really enthusiatic about the barrier in the interrupt
> handler hotpath, which is understandable.
> 
> As the device startup is not really happening often it's sensible to do
> the following
> 
>         disable_irq();
>         vp_dev->intx_soft_enabled = true;
>         enable_irq();
> 
> because:
> 
>         disable_irq()
>           synchronize_irq()
> 
> acts as a barrier for the preceeding stores:
> 
>         disable_irq()
>    	  raw_spin_lock(desc->lock);
>           __disable_irq(desc);
>    	  raw_spin_unlock(desc->lock);
> 
>           synchronize_irq()
>             do {
>    	      raw_spin_lock(desc->lock);
>               in_progress = check_inprogress(desc);
>    	      raw_spin_unlock(desc->lock);
>             } while (in_progress);     

Here you rely on the UNLOCK+LOCK pattern because we have two adjacent
critical sections (or rather, the same twice), which provides RCtso
ordering, which is sufficient to make the below store:

> 
>         intx_soft_enabled = true;

a RELEASE. still, I would suggest writing it at least using
WRITE_ONCE() with a comment on.

	disable_irq();
	/*
	 * The above disable_irq() provides TSO ordering and as such
	 * promotes the below store to store-release.
	 */
	WRITE_ONCE(intx_soft_enabled, true);
	enable_irq();

> In this case synchronize_irq() prevents the subsequent store to
> intx_soft_enabled to leak into the __disable_irq(desc) section which in
> turn makes it impossible for an interrupt handler to observe
> intx_soft_enabled == true before the prerequisites which preceed the
> call to disable_irq() are visible.
> 
> Of course the memory ordering wizards might disagree, but if they do,
> then we have a massive chase of ordering problems vs. similar constructs
> all over the tree ahead of us.

Your case, UNLOCK s + LOCK s, is fully documented to provide RCtso
ordering. The more general case of: UNLOCK r + LOCK s, will shortly
appear in documentation near you. Meaning we can forget about the
details an blanket state that any UNLOCK followed by a LOCK (on the same
CPU) will provide TSO ordering.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
