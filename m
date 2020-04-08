Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F771A1F95
	for <lists.virtualization@lfdr.de>; Wed,  8 Apr 2020 13:11:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B8A887927;
	Wed,  8 Apr 2020 11:11:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wj9EP37SCtLu; Wed,  8 Apr 2020 11:11:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CD5AB86E1D;
	Wed,  8 Apr 2020 11:11:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C03F8C0177;
	Wed,  8 Apr 2020 11:11:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F18AC0177
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3635E87698
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:11:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EXx3GFzpFJl6
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:11:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C3EC986E1D
 for <virtualization@lists.linux-foundation.org>;
 Wed,  8 Apr 2020 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CGYxPY0UmZ+KsvjUaaa1RrlD6l1Y5r/qTWBeIw/gLCU=; b=qL3pjtMbis9rU768jBizcb/Iy5
 lkgPZ7sOpK/DsPBuKBnqJPwEoh7EzhRMARN9MxfFoYYI+3cRY8PVXlVrCrA0udfxR5EDjqMc0V+re
 nLC3SDkLS8Utb2VXyecpgZfXVUU5LMrwtS04bHrIHbiRDeITZiyVdGtK48rrTsO5hjWT0m0UeuXg1
 tqHJFc/BZHLjSBL8q/xUAIWPg4h93yY40YdgaGCVageZbXlihC5CmwwZiGswbW56qbS7qUjqaFCUs
 xSCtdr8d62RmcMAbt4O+MdMpNnruGMaaKjQTvSpcNi0aZG7iWT2tmw1b7zea1c4rmvcajFYLhz76g
 i4M6h/2g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jM8c8-0005fM-F0; Wed, 08 Apr 2020 11:11:24 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C0CD1300130;
 Wed,  8 Apr 2020 13:11:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id AC0CC2B120793; Wed,  8 Apr 2020 13:11:22 +0200 (CEST)
Date: Wed, 8 Apr 2020 13:11:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ankur Arora <ankur.a.arora@oracle.com>
Subject: Re: [RFC PATCH 14/26] x86/alternatives: Handle native insns in
 text_poke_loc*()
Message-ID: <20200408111122.GT20713@hirez.programming.kicks-ass.net>
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
>  struct text_poke_loc {
>  	s32 rel_addr; /* addr := _stext + rel_addr */
> -	s32 rel32;
> -	u8 opcode;
> +	union {
> +		struct {
> +			s32 rel32;
> +			u8 opcode;
> +		} emulated;
> +		struct {
> +			u8 len;
> +		} native;
> +	};
>  	const u8 text[POKE_MAX_OPCODE_SIZE];
>  };

NAK, this grows the structure from 16 to 20 bytes.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
