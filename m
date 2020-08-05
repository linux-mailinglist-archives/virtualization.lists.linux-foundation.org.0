Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5E923CB62
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 16:13:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4D828688F;
	Wed,  5 Aug 2020 14:13:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDdoBHn-cr5V; Wed,  5 Aug 2020 14:13:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 74690861F0;
	Wed,  5 Aug 2020 14:13:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A986C004C;
	Wed,  5 Aug 2020 14:13:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA6A4C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 14:13:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BFA88880E2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 14:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lkurbyntoiJY
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 14:12:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6CAFF880CC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=RIIneg+7/mEtbE19meMAOfaXXJsMYVcX3DCzixtwFp4=; b=xZgN77rc7QTu2SUz2Txvp07BQa
 rEKwKgC5ctZBRSV40lDEvZPvCZt5LmfeV/pyQOmnZC6mdVXAcchmO14bFXVpo3vNwueBX+BKFPz14
 f3/FLmbDBzST8oOh2reniGLLG9o+E1Ce7vjg6GOkTdUF+fQZiWJ9F00Wkv+lyojL6bu8DUzqsLlUx
 eS124XSyfJ6v5oa2y7SUVKVHMHUjRsHW1rss0vou12PBoO3y4ruAdOXLDdQounpE76OtzNK7a5JeY
 JNab3EZGOKfbwCt7HaeJUJEm5q3n4ieRvin6IaqQqHS17pXADia68KF231yRUFKPInlpMI0WxtlyC
 GXTIOgJw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3K9p-0000Mo-TQ; Wed, 05 Aug 2020 14:12:42 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B13C7301E02;
 Wed,  5 Aug 2020 16:12:37 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A584823D7A30F; Wed,  5 Aug 2020 16:12:37 +0200 (CEST)
Date: Wed, 5 Aug 2020 16:12:37 +0200
From: peterz@infradead.org
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH] x86/paravirt: Add missing noinstr to arch_local*() helpers
Message-ID: <20200805141237.GS2674@hirez.programming.kicks-ass.net>
References: <0000000000007d3b2d05ac1c303e@google.com>
 <20200805132629.GA87338@elver.google.com>
 <20200805134232.GR2674@hirez.programming.kicks-ass.net>
 <20200805135940.GA156343@elver.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200805135940.GA156343@elver.google.com>
Cc: jgross@suse.com, fenghua.yu@intel.com, yu-cheng.yu@intel.com,
 tony.luck@intel.com, dave.hansen@linux.intel.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, virtualization@lists.linux-foundation.org,
 mingo@redhat.com, bp@alien8.de, hpa@zytor.com, tglx@linutronix.de,
 syzbot <syzbot+8db9e1ecde74e590a657@syzkaller.appspotmail.com>, x86@kernel.org
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

On Wed, Aug 05, 2020 at 03:59:40PM +0200, Marco Elver wrote:
> On Wed, Aug 05, 2020 at 03:42PM +0200, peterz@infradead.org wrote:

> > Shouldn't we __always_inline those? They're going to be really small.
> 
> I can send a v2, and you can choose. For reference, though:
> 
> 	ffffffff86271ee0 <arch_local_save_flags>:
> 	ffffffff86271ee0:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> 	ffffffff86271ee5:       48 83 3d 43 87 e4 01    cmpq   $0x0,0x1e48743(%rip)        # ffffffff880ba630 <pv_ops+0x120>
> 	ffffffff86271eec:       00
> 	ffffffff86271eed:       74 0d                   je     ffffffff86271efc <arch_local_save_flags+0x1c>
> 	ffffffff86271eef:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> 	ffffffff86271ef4:       ff 14 25 30 a6 0b 88    callq  *0xffffffff880ba630
> 	ffffffff86271efb:       c3                      retq
> 	ffffffff86271efc:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> 	ffffffff86271f01:       0f 0b                   ud2

> 	ffffffff86271a90 <arch_local_irq_restore>:
> 	ffffffff86271a90:       53                      push   %rbx
> 	ffffffff86271a91:       48 89 fb                mov    %rdi,%rbx
> 	ffffffff86271a94:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> 	ffffffff86271a99:       48 83 3d 97 8b e4 01    cmpq   $0x0,0x1e48b97(%rip)        # ffffffff880ba638 <pv_ops+0x128>
> 	ffffffff86271aa0:       00
> 	ffffffff86271aa1:       74 11                   je     ffffffff86271ab4 <arch_local_irq_restore+0x24>
> 	ffffffff86271aa3:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> 	ffffffff86271aa8:       48 89 df                mov    %rbx,%rdi
> 	ffffffff86271aab:       ff 14 25 38 a6 0b 88    callq  *0xffffffff880ba638
> 	ffffffff86271ab2:       5b                      pop    %rbx
> 	ffffffff86271ab3:       c3                      retq
> 	ffffffff86271ab4:       0f 1f 44 00 00          nopl   0x0(%rax,%rax,1)
> 	ffffffff86271ab9:       0f 0b                   ud2


Blergh, that's abysmall. In part I suspect because you have
CONFIG_PARAVIRT_DEBUG, let me try and untangle that PV macro maze.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
