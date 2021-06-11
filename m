Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 486683A4425
	for <lists.virtualization@lfdr.de>; Fri, 11 Jun 2021 16:34:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC7BB60ABE;
	Fri, 11 Jun 2021 14:34:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UuBDX7S7ucc7; Fri, 11 Jun 2021 14:34:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D401260AB8;
	Fri, 11 Jun 2021 14:34:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6047DC000B;
	Fri, 11 Jun 2021 14:34:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 03700C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D856D401DF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:34:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=alien8.de
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9y7rzHqBJMvl
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:34:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7C3740130
 for <virtualization@lists.linux-foundation.org>;
 Fri, 11 Jun 2021 14:34:13 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0aec00fa6ee867e791c992.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0a:ec00:fa6e:e867:e791:c992])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B0AA21EC053C;
 Fri, 11 Jun 2021 16:34:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1623422051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=JGxv2dGnM8cqh24lNorMXXQYkTm9QOB8k1UUbsYV/vA=;
 b=PH73syyPX9IvgmsETxZdfxrCSsZMWTcA/pYMQegpkdofXR1cXEg1XEPuJS9MYErLFdFNqX
 ITpfIWTUsaN5vpq8JBkZPeXh5LbRBqlJGvqLVqRf8JiTAeW7VP9luNAuq1h46swcUr7Uja
 MtzdkWa9Pi00OJI9vUBJ/0Onm7xcNq0=
Date: Fri, 11 Jun 2021 16:34:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 2/6] x86/sev-es: Disable IRQs while GHCB is active
Message-ID: <YMN0XT8Job08HfWH@zn.tnic>
References: <20210610091141.30322-1-joro@8bytes.org>
 <20210610091141.30322-3-joro@8bytes.org> <YMNtmz6W1apXL5q+@zn.tnic>
 <YMNxNEb/T3iF4TG8@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YMNxNEb/T3iF4TG8@8bytes.org>
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

On Fri, Jun 11, 2021 at 04:20:36PM +0200, Joerg Roedel wrote:
> I am not a fan of this, because its easily forgotten to add
> local_irq_save()/local_irq_restore() calls around those. Yes, we can add
> irqs_disabled() assertions to the functions, but we can as well just
> disable/enable IRQs in them. Only the previous value of EFLAGS.IF needs
> to be carried from one function to the other.

Wrappers:

	sev_es_get_ghcb():

		local_irq_save()
		__sev_es_get_ghcb()

and the reverse.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
