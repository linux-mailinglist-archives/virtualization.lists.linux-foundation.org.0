Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC871E1E3A
	for <lists.virtualization@lfdr.de>; Tue, 26 May 2020 11:19:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6511222875;
	Tue, 26 May 2020 09:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0vapmfKQEv18; Tue, 26 May 2020 09:19:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6CD6E2283C;
	Tue, 26 May 2020 09:19:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 48DB4C016F;
	Tue, 26 May 2020 09:19:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2261C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D6EDF84F90
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gpW14iSxpwMk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:19:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 128DC84E77
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 May 2020 09:19:16 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0f91004890e1585abde4e7.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0f:9100:4890:e158:5abd:e4e7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E9AF21EC01CE;
 Tue, 26 May 2020 11:19:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1590484754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=3q+7t7sjlYH1ceIvNrmNgbY6YY9E6lQweSEw445KMuQ=;
 b=iKa2bVBpMQp6StjjDbQaxUSuJ6wTp1s+D5je8Zka3UYOO595HcNgIRtDL9u0hOFnuPhGDR
 MQnn6PnjduoWek/zB3TtJ35+Q0grOSS/8KmKwPz0q9/upZHz5W9p3CmZZPhGuWcO6Wb/Nn
 Y120KdDXjix8h/C8LNwg7L1XZb/LHKU=
Date: Tue, 26 May 2020 11:19:09 +0200
From: Borislav Petkov <bp@alien8.de>
To: Sean Christopherson <sean.j.christopherson@intel.com>
Subject: Re: [PATCH v3 64/75] x86/sev-es: Cache CPUID results for improved
 performance
Message-ID: <20200526091909.GB28228@zn.tnic>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-65-joro@8bytes.org>
 <20200520051637.GA16599@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520051637.GA16599@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
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

On Tue, May 19, 2020 at 10:16:37PM -0700, Sean Christopherson wrote:
> The whole cache on-demand approach seems like overkill.  The number of CPUID
> leaves that are invoked after boot with any regularity can probably be counted
> on one hand.   IIRC glibc invokes CPUID to gather TLB/cache info, XCR0-based
> features, and one or two other leafs.  A statically sized global array that's
> arbitrarily index a la x86_capability would be just as simple and more
> performant.  It would also allow fancier things like emulating CPUID 0xD in
> the guest if you want to go down that road.

And before we do any of that "caching" or whatnot, I'd like to see
numbers justifying its existence. Because if it is only a couple of
CPUID invocations and the boot delay is immeasurable, then it's not
worth the effort.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
