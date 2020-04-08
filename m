Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C301A1FBF
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 13:23:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FA078426E;
	Wed,  8 Apr 2020 11:23:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FuATibsctRdz; Wed,  8 Apr 2020 11:23:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3EC448442D;
	Wed,  8 Apr 2020 11:23:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10AC3C0177;
	Wed,  8 Apr 2020 11:23:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C5E2BC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B0BB287D63
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:23:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oxtA1dOmg5Ox
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:23:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 32AB887D39
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4ZLX7MfSUqHHEvMTIVvOx5yn0LV+2MvDcxCOdLfIT5s=; b=nkszLrTMFN8ogtJBJVVDqDDkIX
 eSArLLy1rOFEHGcIv2pr37OPq3pKTdTYcNgnodxsyyLNWOD3DAjqhsiDqkAyH4oQ6l9V2pQn72kPD
 mILd26jF+lKPcN8g3yoW3x8kS4c26LjWz7lIqFKXpkhg3jfFTpiwXP0YUs0eTbaTntgpaIHbizTaA
 9TrGdyDOTCx/MILvvo54NNBGXTQ5n+B6MPfI6sgngiGeJc7xDpCcKRQpmsNEboGHcz6r5hsgA97Y6
 +tgOqOBPKlkwCWrUoph4w02SlhpL1VEdCekvbk2tenz9RfmrZBEfICuPRptBcDh4bWpIXzaNm5/sg
 1n6I1bdA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8ns-0000Iw-4E; Wed, 08 Apr 2020 11:23:32 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 302BA300478;
 Wed,  8 Apr 2020 13:23:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1C0332BA90A63; Wed,  8 Apr 2020 13:23:29 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:23:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 15/26] x86/alternatives: Non-emulated text poking
Message-ID: <20200408112329.GW20713@hirez.programming.kicks-ass.net>
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
> +static int __maybe_unused text_poke_late(patch_worker_t worker, void *stage)
> +{
> +	int ret;
> +
> +	lockdep_assert_held(&text_mutex);
> +
> +	if (system_state != SYSTEM_RUNNING)
> +		return -EINVAL;
> +
> +	text_poke_state.stage = stage;
> +	text_poke_state.num_acks = cpumask_weight(cpu_online_mask);
> +	text_poke_state.head = &alt_modules;
> +
> +	text_poke_state.patch_worker = worker;
> +	text_poke_state.state = PATCH_SYNC_DONE; /* Start state */
> +	text_poke_state.primary_cpu = smp_processor_id();
> +
> +	/*
> +	 * Run the worker on all online CPUs. Don't need to do anything
> +	 * for offline CPUs as they come back online with a clean cache.
> +	 */
> +	ret = stop_machine(patch_worker, &text_poke_state, cpu_online_mask);

This.. that on its own is almost a reason to NAK the entire thing. We're
all working very hard to get rid of stop_machine() and you're adding
one.

Worse, stop_machine() is notoriously crap on over-committed virt, the
exact scenario where you want it.

> +
> +	return ret;
> +}
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
