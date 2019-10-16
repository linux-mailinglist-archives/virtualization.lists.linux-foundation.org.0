Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB00DA25C
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 01:36:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AD361C3F;
	Wed, 16 Oct 2019 23:36:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 24001ACC
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 23:36:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D8FC489D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 16 Oct 2019 23:36:06 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 64FD22168B;
	Wed, 16 Oct 2019 23:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571268966;
	bh=zs7s9mYV1czuyS7zmMEbjDCgV4caTp0UbUZf6qwavPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BHZXm/0CxbuOxgifRVRY6Hz3s2GKbEXB7kJPvU95gf6t73yRheKtMm0x0qdqJxJ5D
	joicQ5Aov1S+tWqieLnvS5IIqBj7tFPDKp7AtroKdp8MDV7/4T5c9mFxGkcUxYriNq
	uc4LyClOQnmYSnxwmG6PG1Eb/CpdD7DlHgOsvJnM=
Date: Thu, 17 Oct 2019 00:36:02 +0100
From: Will Deacon <will@kernel.org>
To: mst@redhat.com, jasowang@redhat.com
Subject: Re: read_barrier_depends() usage in vhost.c
Message-ID: <20191016233602.i2afxb5mb465laq6@willie-the-truck>
References: <20191016233340.djrr7o7dwueqccac@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016233340.djrr7o7dwueqccac@willie-the-truck>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: peterz@infradead.org, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org, paulmck@kernel.org,
	virtualization@lists.linux-foundation.org
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

[Bah: I typoed the LKML address, so I've fixed it for this one]

On Thu, Oct 17, 2019 at 12:33:40AM +0100, Will Deacon wrote:
> Hi all,
> 
> In an attempt to remove the remaining traces of [smp_]read_barrier_depends()
> following my previous patches to strengthen READ_ONCE() for Alpha [1], I
> ended up trying to decipher the read_barrier_depends() usage in the vhost
> driver:
> 
> --->8
> 
> // drivers/vhost/vhost.c
> static int get_indirect(struct vhost_virtqueue *vq,
> 			struct iovec iov[], unsigned int iov_size,
> 			unsigned int *out_num, unsigned int *in_num,
> 			struct vhost_log *log, unsigned int *log_num,
> 			struct vring_desc *indirect)
> {
> 	[...]
> 
> 	/* We will use the result as an address to read from, so most
> 	 * architectures only need a compiler barrier here. */
> 	read_barrier_depends();
> 
> --->8
> 
> Unfortunately, although the barrier is commented (hurrah!), it's not
> particularly enlightening about the accesses making up the dependency
> chain, and I don't understand the supposed need for a compiler barrier
> either (read_barrier_depends() doesn't generally provide this).
> 
> Does anybody know which accesses are being ordered here? Usually you'd need
> a READ_ONCE()/rcu_dereference() beginning the chain, but I haven't managed
> to find one...
> 
> Thanks,
> 
> Will
> 
> [1] c2bc66082e10 ("locking/barriers: Add implicit smp_read_barrier_depends() to READ_ONCE()")
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
