Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 457CE1A1F9E
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 13:13:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id D077D8793F;
	Wed,  8 Apr 2020 11:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b-DVvCWNyutm; Wed,  8 Apr 2020 11:13:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6E98C87927;
	Wed,  8 Apr 2020 11:13:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F225C0177;
	Wed,  8 Apr 2020 11:13:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 881F6C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7311920450
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:13:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJjsKaVSR0Xi
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:13:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by silver.osuosl.org (Postfix) with ESMTPS id B93E7203D2
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=owW3+5nk1emkhI4cOviK2xmpja0Eslb3d5NnNfm4ABY=; b=oteVl0qlOAfP5bhgb67Zr9x8Uc
 bRuCew67l9BV+/JRZuTjgTOAHnBFS5SKoNK/HOyOWZ59WupxVuibCY5+05oGbheDiG5HWHmy8S4cY
 +f2xrfMQsZOvUZYjTabyUzPGHWusJiCu9h6qxdvvNWt8LZz5G6NWmIgJo/wOSFsGaPB/EH1LWEyba
 Uxs0oqH+RwuSDxacMYmzB3oEW+Nr+dQgn9MZPS9f+gEO3+8AdQmbcC07SK3Pp7nDys4oWPuoeuDtv
 ySERjY/R8FKfZKJ7RXVPmUhhFomNX8N+JCj4eARuV9FGrPbDsyi2jNOaJLHBEZLyhuKvECYTaU5Ar
 fS+QjguQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8e4-0005mx-Gs; Wed, 08 Apr 2020 11:13:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E0E2E300130;
 Wed,  8 Apr 2020 13:13:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 944032BA90A62; Wed,  8 Apr 2020 13:13:22 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:13:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 15/26] x86/alternatives: Non-emulated text poking
Message-ID: <20200408111322.GU20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408050323.4237-16-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-16-ankur.a.arora@oracle.com>
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

On Tue, Apr 07, 2020 at 10:03:12PM -0700, Ankur Arora wrote:
> +static void __maybe_unused sync_one(void)
> +{
> +	/*
> +	 * We might be executing in NMI context, and so cannot use
> +	 * IRET as a synchronizing instruction.
> +	 *
> +	 * We could use native_write_cr2() but that is not guaranteed
> +	 * to work on Xen-PV -- it is emulated by Xen and might not
> +	 * execute an iret (or similar synchronizing instruction)
> +	 * internally.
> +	 *
> +	 * cpuid() would trap as well. Unclear if that's a solution
> +	 * either.
> +	 */
> +	if (in_nmi())
> +		cpuid_eax(1);
> +	else
> +		sync_core();
> +}

That's not thinking staight; what do you think the INT3 does when it
happens inside an NMI ?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
