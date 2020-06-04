Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 864071EE7C3
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 17:30:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 26A8288216;
	Thu,  4 Jun 2020 15:30:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14ZukP8Zkb9W; Thu,  4 Jun 2020 15:30:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7CBA88226;
	Thu,  4 Jun 2020 15:30:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C64ABC016E;
	Thu,  4 Jun 2020 15:30:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1F9FC016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C87B224AF5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3hcJQu0o-O4q
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:30:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by silver.osuosl.org (Postfix) with ESMTPS id DA2B3248F6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 15:30:34 +0000 (UTC)
Received: from zn.tnic (p200300ec2f112d0035262982e5edc845.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f11:2d00:3526:2982:e5ed:c845])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3817D1EC0118;
 Thu,  4 Jun 2020 17:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1591284633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=dgOFdDW+wev1gcsAysq51nTpw31Zuln3/0Xnz7fwqtE=;
 b=lY1y2A+1RzmtxBuefUaVNKu/Y1Wj+Nvw4Y9pBw79JG/+MQBzPlnZkr2uFIyLIkrGlRb4iB
 eZMF4rQHg/FKxFGQd6yAn+xN5lvToN5VcyMpqXNH3MT4NvtumJjwozsbFNTSnB9ZJhLOnC
 47J+naxjkG0RfuLl25dliKfHi+8JGD8=
Date: Thu, 4 Jun 2020 17:30:27 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 42/75] x86/sev-es: Setup GHCB based boot #VC handler
Message-ID: <20200604153021.GC2246@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-43-joro@8bytes.org>
 <20200520192230.GK1457@zn.tnic> <20200604120749.GC30945@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604120749.GC30945@8bytes.org>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Joerg Roedel <jroedel@suse.de>,
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

On Thu, Jun 04, 2020 at 02:07:49PM +0200, Joerg Roedel wrote:
> This are IDT entry points and the names above follow the convention for
> them, like e.g. 'page_fault', 'nmi' or 'general_protection'. Should I
> still add the verbs or just add a comment explaining what those symbols
> are?

Hmmkay, I see vc_no_ghcb doing

call    do_vc_no_ghcb

and that's setup in early_idt_setup().

vc_boot_ghcb(), OTOH, is called by do_early_exception() only so that one
could be called handle_vc_boot_ghcb(), no? I.e., I don't see it being an
IDT entry point.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
