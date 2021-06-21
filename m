Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 756DA3AECD2
	for <lists.virtualization@lfdr.de>; Mon, 21 Jun 2021 17:52:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09BB982681;
	Mon, 21 Jun 2021 15:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wTDRMxhWzw8y; Mon, 21 Jun 2021 15:52:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E90F582477;
	Mon, 21 Jun 2021 15:52:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E17FC000C;
	Mon, 21 Jun 2021 15:52:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA504C000C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 15:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BABE840398
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 15:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=suse.de header.b="WvmxKlxA";
 dkim=neutral reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="XmFjjm32"; dkim=pass (1024-bit key)
 header.d=suse.de header.b="WvmxKlxA"; dkim=neutral
 reason="invalid (unsupported algorithm ed25519-sha256)"
 header.d=suse.de header.b="XmFjjm32"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WxPNaR4nSTe8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 15:52:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7C5C4034C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 15:52:23 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AF7651FD42;
 Mon, 21 Jun 2021 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624290740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aWl5oiozFnzBHCGQMAccuUiysRNNMrHrEHi6rCshBRA=;
 b=WvmxKlxAVRMoYFZIQoXIPooX5wqG7nsGBl+LsiA7+M6E9y4KVPieWil2p8dFCcd8G9nUUN
 qS7Y5Hbp2OE/9TUlOEMrvgBaYZspbqKZJKPjqItATXWXrZ3hxUh4msyj+5qjo31hvt8j1H
 u9KXe73ra8DEwhH4Vgsamdg+i3A1CH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624290740;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aWl5oiozFnzBHCGQMAccuUiysRNNMrHrEHi6rCshBRA=;
 b=XmFjjm32wWes2zR6ngx/UexJ1qoTZ1+FIXXuqeeotDr0TK+NLnrAtHNKwGdlbV5Vye6sVf
 GPUJSIdoexk6UNAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F250C118DD;
 Mon, 21 Jun 2021 15:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624290740; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aWl5oiozFnzBHCGQMAccuUiysRNNMrHrEHi6rCshBRA=;
 b=WvmxKlxAVRMoYFZIQoXIPooX5wqG7nsGBl+LsiA7+M6E9y4KVPieWil2p8dFCcd8G9nUUN
 qS7Y5Hbp2OE/9TUlOEMrvgBaYZspbqKZJKPjqItATXWXrZ3hxUh4msyj+5qjo31hvt8j1H
 u9KXe73ra8DEwhH4Vgsamdg+i3A1CH0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624290740;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aWl5oiozFnzBHCGQMAccuUiysRNNMrHrEHi6rCshBRA=;
 b=XmFjjm32wWes2zR6ngx/UexJ1qoTZ1+FIXXuqeeotDr0TK+NLnrAtHNKwGdlbV5Vye6sVf
 GPUJSIdoexk6UNAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id e1mDObO10GC1HgAALh3uQQ
 (envelope-from <jroedel@suse.de>); Mon, 21 Jun 2021 15:52:19 +0000
Date: Mon, 21 Jun 2021 17:52:18 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v7 0/2] x86/sev: Fixes for SEV-ES Guest Support
Message-ID: <YNC1sn9VxnKxP0iC@suse.de>
References: <20210618115409.22735-1-joro@8bytes.org>
 <YNCQbmC6kuL4K1Mp@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YNCQbmC6kuL4K1Mp@hirez.programming.kicks-ass.net>
Cc: kvm@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Kees Cook <keescook@chromium.org>,
 Cfir Cohen <cfir@google.com>, linux-coco@lists.linux.dev,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Mon, Jun 21, 2021 at 03:13:18PM +0200, Peter Zijlstra wrote:
> On Fri, Jun 18, 2021 at 01:54:07PM +0200, Joerg Roedel wrote:
> > Joerg Roedel (2):
> >   x86/sev: Make sure IRQs are disabled while GHCB is active
> >   x86/sev: Split up runtime #VC handler for correct state tracking
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

Thanks Peter, also for your help with improving this code.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
