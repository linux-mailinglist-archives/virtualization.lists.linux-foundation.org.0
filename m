Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB01AC36F
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 15:43:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D46F85EC4;
	Thu, 16 Apr 2020 13:30:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3V6zdbLK39L9; Thu, 16 Apr 2020 13:30:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8DBFD85E95;
	Thu, 16 Apr 2020 13:30:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A8E4C1D88;
	Thu, 16 Apr 2020 13:30:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01C5BC0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 13:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C264020352
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 13:30:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4SOSSp43Ex9W
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 13:30:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 28F5E20242
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 13:30:52 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E492DED; Thu, 16 Apr 2020 15:30:46 +0200 (CEST)
Date: Thu, 16 Apr 2020 15:30:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arvind Sankar <nivedita@alum.mit.edu>
Subject: Re: [PATCH 12/70] x86/boot/compressed/64: Add IDT Infrastructure
Message-ID: <20200416133045.GA4290@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-13-joro@8bytes.org>
 <20200407022127.GA1048595@rani.riverdale.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407022127.GA1048595@rani.riverdale.lan>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Dan Williams <dan.j.williams@intel.com>,
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

Hi Arvind,

On Mon, Apr 06, 2020 at 10:21:27PM -0400, Arvind Sankar wrote:
> On Thu, Mar 19, 2020 at 10:13:09AM +0100, Joerg Roedel wrote:
> > From: Joerg Roedel <jroedel@suse.de>
> > +/*
> > + * Reload GDT after relocation - The GDT at the non-relocated position
> > + * might be overwritten soon by the in-place decompression, so reload
> > + * GDT at the relocated address. The GDT is referenced by exception
> > + * handling and needs to be set up correctly.
> > + */
> > +	leaq	gdt(%rip), %rax
> > +	movq	%rax, gdt64+2(%rip)
> > +	lgdt	gdt64(%rip)
> > +
> >  /*
> >   * Clear BSS (stack is currently empty)
> >   */
> 
> Note that this is now done in mainline as of commit c98a76eabbb6e, just
> prior to jumping to .Lrelocated, so this can be dropped on the next
> rebase.

Thanks for the heads-up, I removed this hunk.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
