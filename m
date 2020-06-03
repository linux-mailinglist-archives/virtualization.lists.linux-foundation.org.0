Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FEA51ECDC0
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 12:41:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B925387DD6;
	Wed,  3 Jun 2020 10:41:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id innkJ6OosQNi; Wed,  3 Jun 2020 10:41:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 77DB287DDF;
	Wed,  3 Jun 2020 10:41:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38053C0895;
	Wed,  3 Jun 2020 10:41:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB190C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C292E20415
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMwb+rb1Wm92
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:40:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id A6AC02037B
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 10:40:59 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AEA5728B; Wed,  3 Jun 2020 12:40:56 +0200 (CEST)
Date: Wed, 3 Jun 2020 12:40:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 24/75] x86/boot/compressed/64: Unmap GHCB page before
 booting the kernel
Message-ID: <20200603104055.GB20099@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-25-joro@8bytes.org>
 <20200513111340.GD4025@zn.tnic> <20200513113011.GG18353@8bytes.org>
 <20200513114633.GE4025@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513114633.GE4025@zn.tnic>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
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

On Wed, May 13, 2020 at 01:46:33PM +0200, Borislav Petkov wrote:
> On Wed, May 13, 2020 at 01:30:11PM +0200, Joerg Roedel wrote:
> > Yeah, I had this this way in v2, but changed it upon you request[1] :)
> 
> Yeah, I was wondering why this isn't a separate function - you like them
> so much. :-P
> 
> > [1] https://lore.kernel.org/lkml/20200402114941.GA9352@zn.tnic/
> 
> But that one didn't have the ghcb_fault check. Maybe it was being added
> later... :)

Yes, it was :)

I changed it back, first in the patch adding the page-fault handler and
also updated this patch.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
