Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5051E6111
	for <lists.virtualization@lfdr.de>; Thu, 28 May 2020 14:38:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F029C88E52;
	Thu, 28 May 2020 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4O-x8BBWAdUx; Thu, 28 May 2020 12:38:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5A9B988DDA;
	Thu, 28 May 2020 12:38:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42225C088D;
	Thu, 28 May 2020 12:38:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CA5CC016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 12:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4BE2088E23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 12:38:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tMCmUVTmcCMs
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 12:38:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2302588DDA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 May 2020 12:38:51 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0be200b0299b2dfed8209e.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0b:e200:b029:9b2d:fed8:209e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 076D81EC02CF;
 Thu, 28 May 2020 14:38:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590669528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=0opdngyx2K/yyYLMUGP93EKBwY9KCD9g0UxDDXfrvcQ=;
 b=OTstkblyMvF224WY8T7jjseB4wM38dKW4H4F/RPxzwKpxlwqaUV8iXiCvcpbsYrOZlNn7p
 063TkMHt3P+ev+xJU6BTFKFiV7r5lABDEarM088hPKFm2ruuj0wHKLlSV/6wSVcYKcB6nw
 0T4+F+gnvXWLVPJcyikeGbz1M+l6ZTU=
Date: Thu, 28 May 2020 14:38:42 +0200
From: Borislav Petkov <bp@alien8.de>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 67/75] x86/vmware: Add VMware specific handling for
 VMMCALL under SEV-ES
Message-ID: <20200528123842.GA382@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-68-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200428151725.31091-68-joro@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Doug Covelli <dcovelli@vmware.com>,
 Joerg Roedel <jroedel@suse.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, hpa@zytor.com,
 Erdem Aktas <erdemaktas@google.com>, David Rientjes <rientjes@google.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

On Tue, Apr 28, 2020 at 05:17:17PM +0200, Joerg Roedel wrote:
> From: Doug Covelli <dcovelli@vmware.com>
> 
> This change adds VMware specific handling for #VC faults caused by

s/This change adds/Add/

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
