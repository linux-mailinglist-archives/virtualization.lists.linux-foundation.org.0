Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9801BB2F
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 18:42:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BFE0CEC6;
	Mon, 13 May 2019 16:42:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B37499F0
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:42:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from shards.monkeyblade.net (shards.monkeyblade.net [23.128.96.9])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3B9A427B
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 16:42:20 +0000 (UTC)
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d8])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	(Authenticated sender: davem-davemloft)
	by shards.monkeyblade.net (Postfix) with ESMTPSA id 19DB514E25407;
	Mon, 13 May 2019 09:42:19 -0700 (PDT)
Date: Mon, 13 May 2019 09:42:18 -0700 (PDT)
Message-Id: <20190513.094218.1962516460150696760.davem@davemloft.net>
To: jasowang@redhat.com
Subject: Re: [PATCH net] vhost: don't use kmap() to log dirty pages
From: David Miller <davem@davemloft.net>
In-Reply-To: <1557725265-63525-1-git-send-email-jasowang@redhat.com>
References: <1557725265-63525-1-git-send-email-jasowang@redhat.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
	(shards.monkeyblade.net [149.20.54.216]);
	Mon, 13 May 2019 09:42:19 -0700 (PDT)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: aarcange@redhat.com, James.Bottomley@HansenPartnership.com,
	kvm@vger.kernel.org, mst@redhat.com, peterz@infradead.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, hch@infradead.org,
	mingo@redhat.com, dvhart@infradead.org, tglx@linutronix.de
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 May 2019 01:27:45 -0400

> Vhost log dirty pages directly to a userspace bitmap through GUP and
> kmap_atomic() since kernel doesn't have a set_bit_to_user()
> helper. This will cause issues for the arch that has virtually tagged
> caches. The way to fix is to keep using userspace virtual
> address. Fortunately, futex has arch_futex_atomic_op_inuser() which
> could be used for setting a bit to user.
> 
> Note there're several cases that futex helper can fail e.g a page
> fault or the arch that doesn't have the support. For those cases, a
> simplified get_user()/put_user() pair protected by a global mutex is
> provided as a fallback. The fallback may lead false positive that
> userspace may see more dirty pages.
> 
> Cc: Christoph Hellwig <hch@infradead.org>
> Cc: James Bottomley <James.Bottomley@HansenPartnership.com>
> Cc: Andrea Arcangeli <aarcange@redhat.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Darren Hart <dvhart@infradead.org>
> Fixes: 3a4d5c94e9593 ("vhost_net: a kernel-level virtio server")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

I want to see a review from Michael for this change before applying.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
