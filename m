Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6501D1156
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 13:30:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3995E87899;
	Wed, 13 May 2020 11:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z-StDlR23Iqz; Wed, 13 May 2020 11:30:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B2BB787855;
	Wed, 13 May 2020 11:30:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 88418C016F;
	Wed, 13 May 2020 11:30:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8EB5BC016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8ACB686CAC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UCQsM80vQ5Cc
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:30:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0FC3086C9E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 11:30:18 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 38D9522E; Wed, 13 May 2020 13:30:13 +0200 (CEST)
Date: Wed, 13 May 2020 13:30:11 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 24/75] x86/boot/compressed/64: Unmap GHCB page before
 booting the kernel
Message-ID: <20200513113011.GG18353@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-25-joro@8bytes.org>
 <20200513111340.GD4025@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513111340.GD4025@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Wed, May 13, 2020 at 01:13:40PM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:34PM +0200, Joerg Roedel wrote:
> > @@ -302,9 +313,13 @@ void do_boot_page_fault(struct pt_regs *regs, unsigned long error_code)
> >  	 *	- User faults
> >  	 *	- Reserved bits set
> >  	 */
> > -	if (error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
> > +	if (ghcb_fault ||
> > +	    error_code & (X86_PF_PROT | X86_PF_USER | X86_PF_RSVD)) {
> >  		/* Print some information for debugging */
> > -		error_putstr("Unexpected page-fault:");
> > +		if (ghcb_fault)
> > +			error_putstr("Page-fault on GHCB page:");
> > +		else
> > +			error_putstr("Unexpected page-fault:");
> 
> You could carve out the info dumping into a separate function to
> unclutter this if-statement (diff ontop):

Yeah, I had this this way in v2, but changed it upon you request[1] :)


	Joerg

[1] https://lore.kernel.org/lkml/20200402114941.GA9352@zn.tnic/
	
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
