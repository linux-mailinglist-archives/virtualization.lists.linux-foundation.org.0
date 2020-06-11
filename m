Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F71F6CE7
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 19:38:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4826A20523;
	Thu, 11 Jun 2020 17:38:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6JFZw+NCA0S; Thu, 11 Jun 2020 17:38:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2D09F2544B;
	Thu, 11 Jun 2020 17:38:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0F337C016F;
	Thu, 11 Jun 2020 17:38:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0ACC5C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EA490874EA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:38:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s27obmMSvWI0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:38:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id B731787382
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 17:38:50 +0000 (UTC)
IronPort-SDR: J8i+NNP22ZO3pX/KXLlafbgg0Uo1JxGp2jdeFLIPNuRWFT7J4ZldwDkpvWNv2VwwlDflGr3kMn
 kAmRNTGLAVqQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2020 10:38:49 -0700
IronPort-SDR: zIXZk1x7swvBXnIsc/AiNUfO/vkCBXoLCKBqY2ZiI1nI4gO/aKwjk7q+8TG3rKNcSjvUQvNDdy
 MFzRBY+uHppg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,500,1583222400"; d="scan'208";a="296669214"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com)
 ([10.54.74.152])
 by fmsmga004.fm.intel.com with ESMTP; 11 Jun 2020 10:38:48 -0700
Date: Thu, 11 Jun 2020 10:38:48 -0700
From: Sean Christopherson <sean.j.christopherson@intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v3 47/75] x86/sev-es: Add Runtime #VC Exception Handler
Message-ID: <20200611173848.GK29918@linux.intel.com>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-48-joro@8bytes.org>
 <20200523075924.GB27431@zn.tnic>
 <20200611114831.GA11924@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200611114831.GA11924@8bytes.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, x86@kernel.org,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Borislav Petkov <bp@alien8.de>,
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

On Thu, Jun 11, 2020 at 01:48:31PM +0200, Joerg Roedel wrote:
> On Sat, May 23, 2020 at 09:59:24AM +0200, Borislav Petkov wrote:
> > On Tue, Apr 28, 2020 at 05:16:57PM +0200, Joerg Roedel wrote:
> > > +	/*
> > > +	 * Mark the per-cpu GHCBs as in-use to detect nested #VC exceptions.
> > > +	 * There is no need for it to be atomic, because nothing is written to
> > > +	 * the GHCB between the read and the write of ghcb_active. So it is safe
> > > +	 * to use it when a nested #VC exception happens before the write.
> > > +	 */
> > 
> > Looks liks that is that text... support for nested #VC exceptions.
> > I'm sure this has come up already but why do we even want to support
> > nested #VCs? IOW, can we do without them first or are they absolutely
> > necessary?
> > 
> > I'm guessing VC exceptions inside the VC handler but what are the
> > sensible use cases?
> 
> The most important use-case is #VC->NMI->#VC. When an NMI hits while the
> #VC handler uses the GHCB and the NMI handler causes another #VC, then
> the contents of the GHCB needs to be backed up, so that it doesn't
> destroy the GHCB contents of the first #VC handling path.

Isn't it possible for the #VC handler to hit a #PF, e.g. on copy_from_user()
in insn_fetch_from_user()?  If that happens, what prevents the #PF handler
from hitting a #VC?  AIUI, do_vmm_communication() panics if the backup GHCB
is already in use, e.g. #VC->#PF->#VC->NMI->#VC would be fatal.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
