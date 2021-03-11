Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C649337310
	for <lists.virtualization@lfdr.de>; Thu, 11 Mar 2021 13:51:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA63C4E95A;
	Thu, 11 Mar 2021 12:51:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOgrpv_IhqIu; Thu, 11 Mar 2021 12:51:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 720364D462;
	Thu, 11 Mar 2021 12:51:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1DDA2C000A;
	Thu, 11 Mar 2021 12:51:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4663AC000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 12:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 278F343143
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 12:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=alien8.de
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b6_EZJj1D4a2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 12:51:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A08C543081
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 12:51:43 +0000 (UTC)
Received: from zn.tnic (p200300ec2f0e1f0084acfb80b2ea2480.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f0e:1f00:84ac:fb80:b2ea:2480])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id F0EBC1EC04CB;
 Thu, 11 Mar 2021 13:51:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1615467102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=04Q81L86Yi8VhtfgMy5DPhkMLlrDvgeVfznIwom2C0o=;
 b=F7I4zNkFealftdt3MSO2iENkOoJ7233iIBl0MIA2fExAwgTg9QWD88MEO8x3MFz8dHZN3+
 qEbWBRHl1mcXsYMgEMA1pRva0r+EgUrrobNzE1xqTPoZc3Vv+WQhSag3viC4Y2uSFgaf4T
 ID5ejVj1usJOEZ1VFcDtbCWF5MkzXrk=
Date: Thu, 11 Mar 2021 13:51:43 +0100
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v6 00/12] x86: major paravirt cleanup
Message-ID: <20210311125143.GC5829@zn.tnic>
References: <20210309134813.23912-1-jgross@suse.com>
 <20210311125026.GB5829@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210311125026.GB5829@zn.tnic>
Cc: linux-hyperv@vger.kernel.org, Wanpeng Li <wanpengli@tencent.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 virtualization@lists.linux-foundation.org, "H. Peter Anvin" <hpa@zytor.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Wei Liu <wei.liu@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>, clang-built-linux@googlegroups.com,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, "VMware, Inc." <pv-drivers@vmware.com>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 Haiyang Zhang <haiyangz@microsoft.com>, Steven Rostedt <rostedt@goodmis.org>,
 Nathan Chancellor <nathan@kernel.org>, Jason Baron <jbaron@akamai.com>,
 Andy Lutomirski <luto@kernel.org>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Jim Mattson <jmattson@google.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Sean Christopherson <seanjc@google.com>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
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

On Thu, Mar 11, 2021 at 01:50:26PM +0100, Borislav Petkov wrote:
> and move the cleanups patches 13 and 14 to the beginning of the set?

Yeah, 14 needs ALTERNATIVE_TERNARY so I guess after patch 5, that is.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
