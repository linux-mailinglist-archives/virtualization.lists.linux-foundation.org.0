Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A667688E9
	for <lists.virtualization@lfdr.de>; Mon, 15 Jul 2019 14:32:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0A20AD9D;
	Mon, 15 Jul 2019 12:32:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5CE24D90
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 12:32:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 00779876
	for <virtualization@lists.linux-foundation.org>;
	Mon, 15 Jul 2019 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209;
	h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IZmADf5/xR5R3mmqabrQ4fHdojbS9pEGiQhr85URq6M=;
	b=aEybarIkTFSF6XayXEm9oTybN
	bRM340R6NHNLm2LEYd9DXp+8WWywggz0CuALF0J1wDzPuVxYFHl5h/Jw4SbiTUAtP+p3zqM/a6Lca
	uWAH/o4UXolDp6pR2+auZSFsE7irfkrG9l09A5kXNeTbBAkAuv9b3pSh6LV69G8TU2UFR19P7dSHs
	BP/piakMXAWFL9OGZtkRexsPfwx3DEGrBE5V6cPibP0GfHeoDmoIkzc3BID6B4OgeBLXPSMp7WZ2w
	RoSrOscOWXXcDUJRqOdN97QTU1LKAIpoBiSQ+oHxTwaZ5aC5ON7p97SNIWay0hnMAhwYsz9qoBbqS
	6ZKU8MzGQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
	helo=hirez.programming.kicks-ass.net)
	by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
	id 1hn09K-0002Kz-NY; Mon, 15 Jul 2019 12:32:10 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id E2AA820144520; Mon, 15 Jul 2019 14:32:07 +0200 (CEST)
Date: Mon, 15 Jul 2019 14:32:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 0/2] Remove 32-bit Xen PV guest support
Message-ID: <20190715123207.GE3419@hirez.programming.kicks-ass.net>
References: <20190715113739.17694-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715113739.17694-1-jgross@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, x86@kernel.org,
	Alok Kataria <akataria@vmware.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
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

On Mon, Jul 15, 2019 at 01:37:37PM +0200, Juergen Gross wrote:
> The long term plan has been to replace Xen PV guests by PVH. The first
> victim of that plan are now 32-bit PV guests, as those are used only
> rather seldom these days. Xen on x86 requires 64-bit support and with
> Grub2 now supporting PVH officially since version 2.04 there is no
> need to keep 32-bit PV guest support alive in the Linux kernel.
> Additionally Meltdown mitigation is not available in the kernel running
> as 32-bit PV guest, so dropping this mode makes sense from security
> point of view, too.
> 
> Juergen Gross (2):
>   x86/xen: remove 32-bit Xen PV guest support
>   x86/paravirt: remove 32-bit support from PARAVIRT_XXL

Hooray!
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
