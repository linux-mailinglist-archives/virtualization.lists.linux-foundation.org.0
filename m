Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E197220A90
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 12:57:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26C7D893F2;
	Wed, 15 Jul 2020 10:57:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WXTTzUR-D7hx; Wed, 15 Jul 2020 10:57:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA30F893F5;
	Wed, 15 Jul 2020 10:57:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8BF17C0733;
	Wed, 15 Jul 2020 10:57:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1ABCC0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6F25A886C8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:57:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5-kW+mloTrxF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:57:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BEABD88606
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=K8h4KI86Mzb6BYGGyc/D5d7vo4fVAFqxYqHc3CALsmU=; b=BGOcXPSin+HC2fF1VqIS2IqzXw
 YGPNLIs6u0i4juJ6jLImClXgjkl/hxvLhGvj1eiIwTuEcj2kgDhn5u6DM88nmQDKbFGgiCcgyySpw
 gParcOSrVYvhyiZNKOn+DfeACZ9Ocs9TrRzsRLcdRCSbsWrIdTBx760Ir3sQ8gWmYlxLt0/+sxfVx
 xxVGGbbbEmmWZBphVSBO7n8aI+TQanyTc0mG+sXVGwxO2ubsUUdrGKoi+fVxeddBO1jINLWyEN1oh
 TbLk/A4GJCz6hdj/J7aX87Yc7dq8bkDqmHIJpZx96V571lVNVCldLVdBsHS0jFDf2l7fkWXQZ7K9g
 XGLSiGaw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvf5V-0006Ya-Er; Wed, 15 Jul 2020 10:56:37 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B5DEA300446;
 Wed, 15 Jul 2020 12:56:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A5F9C203A6143; Wed, 15 Jul 2020 12:56:29 +0200 (CEST)
Date: Wed, 15 Jul 2020 12:56:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v4 45/75] x86/sev-es: Adjust #VC IST Stack on entering
 NMI handler
Message-ID: <20200715105629.GK10769@hirez.programming.kicks-ass.net>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-46-joro@8bytes.org>
 <20200715094702.GF10769@hirez.programming.kicks-ass.net>
 <20200715102653.GN16200@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715102653.GN16200@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>
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

On Wed, Jul 15, 2020 at 12:26:53PM +0200, Joerg Roedel wrote:
> On Wed, Jul 15, 2020 at 11:47:02AM +0200, Peter Zijlstra wrote:

> > That's pretty disguisting :-(
> 
> Yeah, but its needed because ... IST :(
> I am open for suggestions on how to make it less disgusting. Or maybe
> you like it more if you think of it as a software implementation of what
> hardware should actually do to make IST less painful.

No bright ideas, sadly..

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
