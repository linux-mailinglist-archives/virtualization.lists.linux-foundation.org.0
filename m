Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 582CC1A1FB3
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 13:17:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BFEA720454;
	Wed,  8 Apr 2020 11:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiqrInfXP0fm; Wed,  8 Apr 2020 11:17:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1A13A20450;
	Wed,  8 Apr 2020 11:17:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A98DC0177;
	Wed,  8 Apr 2020 11:17:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B7ECC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:17:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 14816875A1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:17:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ANBmiTcIVJ1a
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:17:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 9994D86D96
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=3YJqaOoM4AXHXL0XANzFtbQE1EpTeXAe0og/pFKkpCA=; b=I26DyJnGGGzpg8aW0CSl3TSO8/
 fCLcInYqjvbFiDB3N97TYX+H95E7s7uhQVs1LywnJrxvQAyQKrsXOH4HCqon7QCoisfEoaw6RVFDS
 NQOCO/S4ycVdQoxRL46SZ2UfRTHDCE0HFlkAY/BrTNmWRge1970iZq7hPoYzBfUytDGspcPrPDjhj
 lDsRcJWFs6qo8zxx5srQ71V1LToOn2jGFgto63isvIjWn9uZp/yp5qMXQVuaeLYT2wjloOAyaBt4C
 CZadKhWG7I0rpK07+OqaLbMseS8zTcP0JuX9+Fe8qNltNOQHzKTM5TMcUHTWVQtPsjS20OYk7jLcj
 W3k8stdA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8iL-0000RC-Gm; Wed, 08 Apr 2020 11:17:49 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C4D5B300130;
 Wed,  8 Apr 2020 13:17:47 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B0E612BA90A63; Wed,  8 Apr 2020 13:17:47 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:17:47 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 14/26] x86/alternatives: Handle native insns in
 text_poke_loc*()
Message-ID: <20200408111747.GV20713@hirez.programming.kicks-ass.net>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
 <20200408050323.4237-15-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408050323.4237-15-ankur.a.arora@oracle.com>
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


On Tue, Apr 07, 2020 at 10:03:11PM -0700, Ankur Arora wrote:
> @@ -1071,10 +1079,13 @@ int notrace poke_int3_handler(struct pt_regs *regs)
>  			goto out_put;
>  	}
>  
> -	len = text_opcode_size(tp->opcode);
> +	if (desc->native)
> +		BUG();
> +

Subject: x86/alternatives: Handle native insns in text_poke_loc*()

That's not really handling, is it..
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
