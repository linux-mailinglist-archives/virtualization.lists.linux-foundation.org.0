Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5021A1F60
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 13:05:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 06B9C8793F;
	Wed,  8 Apr 2020 11:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GdFr3pJpuXvq; Wed,  8 Apr 2020 11:05:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 171C087677;
	Wed,  8 Apr 2020 11:05:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF575C1D89;
	Wed,  8 Apr 2020 11:05:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D043C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:05:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 378B6875A1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cKBr4lgpAGG5
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:05:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7AC5186E42
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oqUjbefYS3Yk7lY8aXBkaPJgSKoP23s64kxD/fHCpR8=; b=ugEMl3nwCKlvAWACI3gmebiipt
 8/1xS63dnZ7clRpRx+bkMlxjyy8k+YsGj2MI+19jCGbSbjP9/Mh5p/Sq4Ns9IBZ0gRBma6VKHMr/o
 XEW41GFTJDDlVx/mihtetBghKO/Pe9haIl5N9JxwKET5XHndOUhNK/ybyUXpJEQJAjk2gFBFkRJZB
 +02sNenIRFkYFGQEGXc6iwLxT+UnA4UTLIsWcXvI4Ai5zcYW6wgFbgT0qxY+3I8cqsnpMr251t/ZG
 vDz6HI4/lhpMzkmvbNWol4H34lr5aKfXny5PMY1OzXL/BXXZbLP430nCgbEc5TvjOztIXWIfYYJ1u
 pLlISIDg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8W0-0007ea-8z; Wed, 08 Apr 2020 11:05:04 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 9ACC7300130;
 Wed,  8 Apr 2020 13:05:01 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8BE212BA90A60; Wed,  8 Apr 2020 13:05:01 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:05:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 09/26] x86/paravirt: Add runtime_patch()
Message-ID: <20200408110501.GS20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408050323.4237-10-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-10-ankur.a.arora@oracle.com>
Cc: jgross@suse.com, hpa@zytor.com, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, boris.ostrovsky@oracle.com
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

On Tue, Apr 07, 2020 at 10:03:06PM -0700, Ankur Arora wrote:
> +/*
> + * preempt_enable_no_resched() so we don't add any preemption points until
> + * after the caller has returned.
> + */
> +#define preempt_enable_runtime_patch()	preempt_enable_no_resched()
> +#define preempt_disable_runtime_patch()	preempt_disable()

NAK, this is probably a stright preemption bug, also, afaict, there
aren't actually any users of this in the patch-set.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
