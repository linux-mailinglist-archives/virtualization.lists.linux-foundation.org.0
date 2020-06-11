Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9C01F6721
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 13:48:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4A13487A24;
	Thu, 11 Jun 2020 11:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 86AkoengnkA3; Thu, 11 Jun 2020 11:48:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B316287A21;
	Thu, 11 Jun 2020 11:48:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 86762C016F;
	Thu, 11 Jun 2020 11:48:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0E4F3C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EFA5C2044A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:48:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DmLCZ62WpYsz
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:48:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 7990020409
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 11:48:37 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DAE2B869; Thu, 11 Jun 2020 13:48:33 +0200 (CEST)
Date: Thu, 11 Jun 2020 13:48:31 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 47/75] x86/sev-es: Add Runtime #VC Exception Handler
Message-ID: <20200611114831.GA11924@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-48-joro@8bytes.org>
 <20200523075924.GB27431@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200523075924.GB27431@zn.tnic>
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

On Sat, May 23, 2020 at 09:59:24AM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:57PM +0200, Joerg Roedel wrote:
> > +	/*
> > +	 * Mark the per-cpu GHCBs as in-use to detect nested #VC exceptions.
> > +	 * There is no need for it to be atomic, because nothing is written to
> > +	 * the GHCB between the read and the write of ghcb_active. So it is safe
> > +	 * to use it when a nested #VC exception happens before the write.
> > +	 */
> 
> Looks liks that is that text... support for nested #VC exceptions.
> I'm sure this has come up already but why do we even want to support
> nested #VCs? IOW, can we do without them first or are they absolutely
> necessary?
> 
> I'm guessing VC exceptions inside the VC handler but what are the
> sensible use cases?

The most important use-case is #VC->NMI->#VC. When an NMI hits while the
#VC handler uses the GHCB and the NMI handler causes another #VC, then
the contents of the GHCB needs to be backed up, so that it doesn't
destroy the GHCB contents of the first #VC handling path.


Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
