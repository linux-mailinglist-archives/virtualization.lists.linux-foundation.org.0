Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D5C40AC3A
	for <lists.virtualization@lfdr.de>; Tue, 14 Sep 2021 13:09:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC7D60A58;
	Tue, 14 Sep 2021 11:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0_3vL5aOBpEB; Tue, 14 Sep 2021 11:09:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1E7F660AC6;
	Tue, 14 Sep 2021 11:09:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3441C000D;
	Tue, 14 Sep 2021 11:09:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1ACEBC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0947560A58
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dH884CAXNfko
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:09:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 619AB600CA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Sep 2021 11:09:35 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1631617771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M5L53b1aW4qWbrWwixZQLL5XpvN/Xich8YXIpyYky8g=;
 b=taPBC9dDsPSAxokSNWsFlzdEp2X2njXjJABW2xf54PpdxaXJW8V5Hd8e98sgxTFU/0wj8z
 4EZxiZFfGjQz1kncwWvCniVE0bwqUt3p7W0UAR0nH+JjDYw1GNW51sh4W9nmnfmmtOtwwK
 b9Kn28esA6htvsuKMsWg6Ad32TAFZ/EASmvYpvNl6y97qFIZqHs6jrWWLZ6NyN7aUs7S3c
 uUoaxJfxHbTV8tPLX22lWZEd4RhJgLQIE2zGXxiZRrJw1fwrIGVXx9onJyEnLTGPd7qhzq
 pNE8d9p3pqBAAhXRXBzaf/5r9TzCqmeJ48dmS3L1Nm2iTYol58mWl4ST4g0Dkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1631617771;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=M5L53b1aW4qWbrWwixZQLL5XpvN/Xich8YXIpyYky8g=;
 b=IWZiRicc3an/+umdwpR9xwKZEvdzyIUll1dV1bDMKON/4eAqP/uib1dxUY6WkhRsurOu/S
 npzWxwUSYz0F9nCg==
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 7/9] virtio-pci: harden INTX interrupts
In-Reply-To: <YUCBZjjk77q8JS4f@hirez.programming.kicks-ass.net>
References: <20210913055353.35219-1-jasowang@redhat.com>
 <20210913055353.35219-8-jasowang@redhat.com> <875yv4f99j.ffs@tglx>
 <YUCBZjjk77q8JS4f@hirez.programming.kicks-ass.net>
Date: Tue, 14 Sep 2021 13:09:31 +0200
Message-ID: <87tuinct1w.ffs@tglx>
MIME-Version: 1.0
Cc: "Paul E.
 McKenney" <paulmck@kernel.org>, david.kaplan@amd.com, mst@redhat.com,
 f.hetzelt@tu-berlin.de, linux-kernel@vger.kernel.org,
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

On Tue, Sep 14 2021 at 13:03, Peter Zijlstra wrote:
> On Mon, Sep 13, 2021 at 11:36:24PM +0200, Thomas Gleixner wrote:
> Here you rely on the UNLOCK+LOCK pattern because we have two adjacent
> critical sections (or rather, the same twice), which provides RCtso
> ordering, which is sufficient to make the below store:
>
>> 
>>         intx_soft_enabled = true;
>
> a RELEASE. still, I would suggest writing it at least using
> WRITE_ONCE() with a comment on.

Right. forgot about that.

> 	disable_irq();
> 	/*
> 	 * The above disable_irq() provides TSO ordering and as such
> 	 * promotes the below store to store-release.
> 	 */
> 	WRITE_ONCE(intx_soft_enabled, true);
> 	enable_irq();
>
>> In this case synchronize_irq() prevents the subsequent store to
>> intx_soft_enabled to leak into the __disable_irq(desc) section which in
>> turn makes it impossible for an interrupt handler to observe
>> intx_soft_enabled == true before the prerequisites which preceed the
>> call to disable_irq() are visible.
>> 
>> Of course the memory ordering wizards might disagree, but if they do,
>> then we have a massive chase of ordering problems vs. similar constructs
>> all over the tree ahead of us.
>
> Your case, UNLOCK s + LOCK s, is fully documented to provide RCtso
> ordering. The more general case of: UNLOCK r + LOCK s, will shortly
> appear in documentation near you. Meaning we can forget about the
> details an blanket state that any UNLOCK followed by a LOCK (on the same
> CPU) will provide TSO ordering.

I think we also should document the disable/synchronize_irq() scheme
somewhere.

Thanks,

        tglx

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
