Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735A211EC3
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 10:28:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 540FA8AD86;
	Thu,  2 Jul 2020 08:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKXhd5Bwrv+P; Thu,  2 Jul 2020 08:28:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DA4788ACE5;
	Thu,  2 Jul 2020 08:28:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B70A1C0733;
	Thu,  2 Jul 2020 08:28:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C8EAC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 666ED26938
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:28:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DllTALAAWnNp
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:28:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by silver.osuosl.org (Postfix) with ESMTPS id 2FFB6268A7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1j2DrlcbUugnfL/BNKwgbBGwdXe1p5YiDNDgH1lziiA=; b=Gw3bFkBiw7lSr8XB4zKQSY2gM3
 tJk/ji3zgpfflj/zaSGFhyr7KMwLj+Oe+0Sm+KHfgrWViOHfPxx7b/QpCRZnd7QyWyLqPOjt5u4M+
 VT2c7Tj/WbWZ13AD1/9R0UzoNtp4d+F1m8batuj5Xl7qdQTZYJNIcpd7a6z0ADN51FPDOud+x2inb
 vaWHcRWO38JcCO7v+Lm2XkFcXbg2GQMLv/ahw7WmAbTz34o8N8P/o1BFnXY9TMJge7Bqawg2gEdUW
 veyOYqGH2bZGaUNyWTxK59SurZc9DII4ezuMOTRrJmJ1ycOYDis9O0xqtG1x7WpxmweqV5UnoKy94
 H7QDMhfg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jquaH-0000Gw-TV; Thu, 02 Jul 2020 08:28:42 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1CDA230015A;
 Thu,  2 Jul 2020 10:28:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 0AA3620CC68A2; Thu,  2 Jul 2020 10:28:40 +0200 (CEST)
Date: Thu, 2 Jul 2020 10:28:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/8] powerpc/pseries: use smp_rmb() in H_CONFER spin yield
Message-ID: <20200702082840.GC4781@hirez.programming.kicks-ass.net>
References: <20200702074839.1057733-1-npiggin@gmail.com>
 <20200702074839.1057733-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702074839.1057733-3-npiggin@gmail.com>
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anton Blanchard <anton@ozlabs.org>, Will Deacon <will@kernel.org>
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

On Thu, Jul 02, 2020 at 05:48:33PM +1000, Nicholas Piggin wrote:
> There is no need for rmb(), this allows faster lwsync here.

Since you determined this; I'm thinking you actually understand the
ordering here. How about recording this understanding in a comment?

Also, should the lock->slock load not use READ_ONCE() ?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
