Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6961A1FE7
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 13:36:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 54CE1861A2;
	Wed,  8 Apr 2020 11:36:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmVs3dKgy852; Wed,  8 Apr 2020 11:36:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E74138664E;
	Wed,  8 Apr 2020 11:36:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7AFFC0177;
	Wed,  8 Apr 2020 11:36:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D15FBC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BBF3985BFB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:36:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WFtx-OXDcrBt
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:36:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 875DA85ADC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BmUpeBD+1tkdQ4tsE6HQqpMf3ktolc1V6p/HWEY98HY=; b=Qi5xW5e0IyX3C7czAvN4b9USKe
 Vw9AbT0hUhEsMc1N29Rjr5JF4PixkRwKoB2k7CHbQKlhhwdI1gHZDWzkIC/T4W3XpYwGK22A3OD5f
 YKOR/wZquke/IPYf/tjWI2lDstAxcpTdxYF/D0CVP6LcMHwWMxOEMFYdGFZiwekJE6baYqsYbNNdj
 VG6eu4ZlrMcD4swRR19FENQfTY/PhgNUrGXs7/3vtIkFJ8qruO7bPZyDME/fAI98LYIqRAeuyV57a
 adom5zNbI+HwxK7C/0/zE6K+9Pmygi92/oQ7XoIP89JEZTSZylxoRwf+X6weK/tFwvTqc0h2UD0Bx
 weCYpnBw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM90T-0003t1-3O; Wed, 08 Apr 2020 11:36:33 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 400EE304DB2;
 Wed,  8 Apr 2020 13:36:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 2C1832BA90A66; Wed,  8 Apr 2020 13:36:31 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:36:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 19/26] x86/alternatives: NMI safe runtime patching
Message-ID: <20200408113631.GX20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408050323.4237-20-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-20-ankur.a.arora@oracle.com>
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

On Tue, Apr 07, 2020 at 10:03:16PM -0700, Ankur Arora wrote:
> @@ -1807,12 +1911,20 @@ static int __maybe_unused text_poke_late(patch_worker_t worker, void *stage)
>  	text_poke_state.state = PATCH_SYNC_DONE; /* Start state */
>  	text_poke_state.primary_cpu = smp_processor_id();
>  
> +	text_poke_state.nmi_context = nmi;
> +
> +	if (nmi)
> +		register_nmi_handler(NMI_LOCAL, text_poke_nmi,
> +				     NMI_FLAG_FIRST, "text_poke_nmi");
>  	/*
>  	 * Run the worker on all online CPUs. Don't need to do anything
>  	 * for offline CPUs as they come back online with a clean cache.
>  	 */
>  	ret = stop_machine(patch_worker, &text_poke_state, cpu_online_mask);
>  
> +	if (nmi)
> +		unregister_nmi_handler(NMI_LOCAL, "text_poke_nmi");
> +
>  	return ret;
>  }

This is completely bonghits crazy.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
