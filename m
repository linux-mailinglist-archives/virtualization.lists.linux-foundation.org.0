Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD2E3A6BCF
	for <lists.virtualization@lfdr.de>; Mon, 14 Jun 2021 18:30:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2F9D83AC5;
	Mon, 14 Jun 2021 16:30:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VaCWQx_HBms1; Mon, 14 Jun 2021 16:30:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8875D83ACA;
	Mon, 14 Jun 2021 16:30:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10F19C0024;
	Mon, 14 Jun 2021 16:30:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76E86C000B
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 16:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7158E6064F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=alien8.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIWnK8de-kkM
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 16:30:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CED26063F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 16:30:40 +0000 (UTC)
Received: from zn.tnic (p200300ec2f09b900f41fb76786649a77.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f09:b900:f41f:b767:8664:9a77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0F3931EC04AD;
 Mon, 14 Jun 2021 18:30:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1623688238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=tVybpe3ScAdNUEPVEjHH5nE/bvfaoZC3CtL5wDnzh28=;
 b=GKv0VXZC8ntKpjSsSrPflcEj52On4dvo1oJIDtfRolgHrzN6dG5gdL9wTmcr4hlZ5a7RqJ
 AhBlZTQtj71lZYFdWOrrC737EXu9VLbqgCnDVQLdoo9ePecNx+as7DiJVCtQKa/wljqLfR
 jJR1zbJGXhnLi3x5TUT1Zgw8XWRwR8g=
Date: Mon, 14 Jun 2021 18:30:35 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v5 2/6] x86/sev-es: Make sure IRQs are disabled while
 GHCB is active
Message-ID: <YMeEK5fiGA3QncAC@zn.tnic>
References: <20210614135327.9921-1-joro@8bytes.org>
 <20210614135327.9921-3-joro@8bytes.org> <YMeC7vJxm0OVJJhr@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMeC7vJxm0OVJJhr@zn.tnic>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
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

On Mon, Jun 14, 2021 at 06:25:18PM +0200, Borislav Petkov wrote:
> ** underscored to mean, that callers need to disable local locks. There's
							     ^^^^^^

"interrupts" ofc.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
