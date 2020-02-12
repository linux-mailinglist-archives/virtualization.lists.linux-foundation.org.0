Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970B15AA83
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 14:57:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8D1A62046C;
	Wed, 12 Feb 2020 13:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BANFgoR57wzw; Wed, 12 Feb 2020 13:57:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B2E772047F;
	Wed, 12 Feb 2020 13:57:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 96B69C1D8E;
	Wed, 12 Feb 2020 13:57:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3ECC9C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 29D30843E6
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:57:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVNR26rcR2rG
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:57:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1F5FC8435A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 13:57:00 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 44D5E20E; Wed, 12 Feb 2020 14:56:57 +0100 (CET)
Date: Wed, 12 Feb 2020 14:56:45 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 62/62] x86/sev-es: Add NMI state tracking
Message-ID: <20200212135645.GK20066@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-63-joro@8bytes.org>
 <CALCETrWV15+YTGsEwUHBSjT2MYappLANw4fQHjgZgei2UyV1JQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrWV15+YTGsEwUHBSjT2MYappLANw4fQHjgZgei2UyV1JQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, "H. Peter Anvin" <hpa@zytor.com>,
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

On Tue, Feb 11, 2020 at 02:50:29PM -0800, Andy Lutomirski wrote:
> On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
> This patch is overcomplicated IMO.  Just do the magic incantation in C
> from do_nmi or from here:
> 
>         /*
>          * For ease of testing, unmask NMIs right away.  Disabled by
>          * default because IRET is very expensive.
> 
> If you do the latter, you'll need to handle the case where the NMI
> came from user mode.
> 
> The ideal solution is do_nmi, I think.
> 
> if (static_cpu_has(X86_BUG_AMD_FORGOT_ABOUT_NMI))
>   sev_es_unmask_nmi();
> 
> Feel free to use X86_FEATURE_SEV_ES instead :)

Yeah, I also had that implemented once, but then changed it because I
thought that nested NMIs do not necessarily call into do_nmi(), which
would cause NMIs to stay blocked forever. I need to read through the NMI
entry code again to check if that can really happen.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
