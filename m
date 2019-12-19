Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E966D1264D8
	for <lists.virtualization@lfdr.de>; Thu, 19 Dec 2019 15:33:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A11C984ADA;
	Thu, 19 Dec 2019 14:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwCwysoytinJ; Thu, 19 Dec 2019 14:33:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4997984B55;
	Thu, 19 Dec 2019 14:33:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C709BC1D84;
	Thu, 19 Dec 2019 14:33:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E853C077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 14:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 745638863B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 14:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYT-DSZd8KTr
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 14:33:08 +0000 (UTC)
X-Greylist: delayed 00:57:36 by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BDDBB885C4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Dec 2019 14:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YSWZcOq3c4tDpa7LmbcYDgqZaDKNh9WKgBSxITrGWH0=; b=VMU3axBiD4FRvBTUAvat9++sh
 QduzMQrNMhpyhtVc5RAWKPuxaPWfFYkdKhazG/Ft7Rb2DcgDwcNM6GB1Y+LXthA2qM1qd2DA1S3Go
 pBDLF+l0FeQ8QKOt6JpebPmTPqCHKQVdfGynuJOJRihcWND6FmluJqXwRRlAxAJXBJtDpV7B3vIIQ
 HyjLGsUezYfLMMJT6ecEqBRXmLtrO3r6tw9kZGnggFfNCAPXD0vvnCbm/e2tWk2lwkSdLuHxAXKNC
 MzM0SeXj8f6KIEsepVLCK4CRpfDa490tRRci4kujDYCTdi9wAoiKDa4FtyDHyFb1Au2y4UcUyqPt5
 itF3fF1fw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihvxC-0000aR-0J; Thu, 19 Dec 2019 13:34:58 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B60D3304D00;
 Thu, 19 Dec 2019 14:33:28 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4501F2B3E168F; Thu, 19 Dec 2019 14:34:52 +0100 (CET)
Date: Thu, 19 Dec 2019 14:34:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v10 00/11] x86: PIE support to extend KASLR randomization
Message-ID: <20191219133452.GM2827@hirez.programming.kicks-ass.net>
References: <20191205000957.112719-1-thgarnie@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191205000957.112719-1-thgarnie@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kristen@linux.intel.com, kernel-hardening@lists.openwall.com, "VMware,
 Inc." <pv-drivers@vmware.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 virtualization@lists.linux-foundation.org, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Jiri Slaby <jslaby@suse.cz>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Hellstrom <thellstrom@vmware.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Will Deacon <will@kernel.org>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>, linux-crypto@vger.kernel.org,
 Len Brown <len.brown@intel.com>, keescook@chromium.org,
 linux-pm@vger.kernel.org, Alexios Zavras <alexios.zavras@intel.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Allison Randal <allison@lohutok.net>, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

On Wed, Dec 04, 2019 at 04:09:37PM -0800, Thomas Garnier wrote:
> Minor changes based on feedback and rebase from v9.
> 
> Splitting the previous serie in two. This part contains assembly code
> changes required for PIE but without any direct dependencies with the
> rest of the patchset.

ISTR suggestion you add an objtool pass that verifies there are no
absolute text references left. Otherwise we'll forever be chasing that
last one..
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
