Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EEE1ECC28
	for <lists.virtualization@lfdr.de>; Wed,  3 Jun 2020 11:06:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EF88686407;
	Wed,  3 Jun 2020 09:06:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tMlcx8iec-GP; Wed,  3 Jun 2020 09:06:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3BC1E8654C;
	Wed,  3 Jun 2020 09:06:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04BB2C016E;
	Wed,  3 Jun 2020 09:06:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91BC4C016E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7EDF587765
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:06:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9-4x+P+trYA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:06:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1E45D875BE
 for <virtualization@lists.linux-foundation.org>;
 Wed,  3 Jun 2020 09:06:44 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7798D28B; Wed,  3 Jun 2020 11:06:39 +0200 (CEST)
Date: Wed, 3 Jun 2020 11:06:37 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH v3 13/75] x86/boot/compressed/64: Add IDT Infrastructure
Message-ID: <20200603090637.GA16171@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-14-joro@8bytes.org>
 <20200504105445.GE15046@zn.tnic> <20200504112859.GH8135@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200504112859.GH8135@suse.de>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, x86@kernel.org,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Borislav Petkov <bp@alien8.de>, Masami Hiramatsu <mhiramat@kernel.org>,
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

On Mon, May 04, 2020 at 01:28:59PM +0200, Joerg Roedel wrote:
> On Mon, May 04, 2020 at 12:54:45PM +0200, Borislav Petkov wrote:
> > On Tue, Apr 28, 2020 at 05:16:23PM +0200, Joerg Roedel wrote:
> > > +#include "../../entry/calling.h"
> > 
> > Leftover from something? Commenting it out doesn't break the build here.
> 
> Yes, probably a leftover from when I tried to use the PT_REGS macros
> there. I'll remove it.

Turns out this include is still needed to get ORIG_RAX defined. I'll
leave it in place.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
