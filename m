Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 875163AE9D0
	for <lists.virtualization@lfdr.de>; Mon, 21 Jun 2021 15:13:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDA17400F0;
	Mon, 21 Jun 2021 13:13:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q43QVjZo42Fr; Mon, 21 Jun 2021 13:13:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CA6C04010D;
	Mon, 21 Jun 2021 13:13:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52707C000C;
	Mon, 21 Jun 2021 13:13:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ACBA7C000C
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 13:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9898F400F0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 13:13:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mmm0ARcKMqCf
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 13:13:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC086400CF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Qu1aJMR4flK0FS15KBa/VkE4TUOWBJPRGztPmWnzK6c=; b=K0W+z+kc1UHE1xUwN23ov4DCXk
 UfNfytG81fCmu7N1/rVD6hDM5ZQASQVrfULgFCTHfXTbo9+aPfqSaT686/FlRf/IwfnQ/TtfLVnLz
 VTKBasZqrJunBpw1tyc3XWvYjCMfmCjZ08PSmYaSulth3AgwY811iHeAxtu6rh9aDyQHcEnjmfgsA
 au8SKJM6tRKOQWnfcL0S1IpZ7sVpSBHxn2J2c024z/r+YWKwmwrIHsSFa1/RS0lixLfFPTKB+NK9g
 B3+8DmaOt7MHjr1DfH9FPY6c/okFymw5ZmHpv7Erm5QUf64OA4Waf1YfeGCZouAuWoftnmYPQH3Wq
 5HRpb+nQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvJjl-00AFAZ-NK; Mon, 21 Jun 2021 13:13:20 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 579303001C0;
 Mon, 21 Jun 2021 15:13:18 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 41770203C06B1; Mon, 21 Jun 2021 15:13:18 +0200 (CEST)
Date: Mon, 21 Jun 2021 15:13:18 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v7 0/2] x86/sev: Fixes for SEV-ES Guest Support
Message-ID: <YNCQbmC6kuL4K1Mp@hirez.programming.kicks-ass.net>
References: <20210618115409.22735-1-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210618115409.22735-1-joro@8bytes.org>
Cc: kvm@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 linux-coco@lists.linux.dev, Andy Lutomirski <luto@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Juergen Gross <jgross@suse.com>,
 Mike Stunes <mstunes@vmware.com>, Sean Christopherson <seanjc@google.com>,
 linux-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Erdem Aktas <erdemaktas@google.com>
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

On Fri, Jun 18, 2021 at 01:54:07PM +0200, Joerg Roedel wrote:
> Joerg Roedel (2):
>   x86/sev: Make sure IRQs are disabled while GHCB is active
>   x86/sev: Split up runtime #VC handler for correct state tracking

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
