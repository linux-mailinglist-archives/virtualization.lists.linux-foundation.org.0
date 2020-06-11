Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E761F657E
	for <lists.virtualization@lfdr.de>; Thu, 11 Jun 2020 12:14:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id BD644267C8;
	Thu, 11 Jun 2020 10:14:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGEG7t+LddNs; Thu, 11 Jun 2020 10:14:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 21CF226922;
	Thu, 11 Jun 2020 10:14:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F4131C016F;
	Thu, 11 Jun 2020 10:14:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32EF0C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 21B4F879E9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqC3Xbuxb9WW
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:14:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DCDBB87825
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 10:14:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 00D2B869; Thu, 11 Jun 2020 12:14:10 +0200 (CEST)
Date: Thu, 11 Jun 2020 12:14:09 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 42/75] x86/sev-es: Setup GHCB based boot #VC handler
Message-ID: <20200611101409.GC32093@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-43-joro@8bytes.org>
 <20200520192230.GK1457@zn.tnic> <20200604120749.GC30945@8bytes.org>
 <20200604153021.GC2246@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200604153021.GC2246@zn.tnic>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
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

On Thu, Jun 04, 2020 at 05:30:27PM +0200, Borislav Petkov wrote:
> Hmmkay, I see vc_no_ghcb doing
> 
> call    do_vc_no_ghcb
> 
> and that's setup in early_idt_setup().
> 
> vc_boot_ghcb(), OTOH, is called by do_early_exception() only so that one
> could be called handle_vc_boot_ghcb(), no? I.e., I don't see it being an
> IDT entry point.

Right, I renamed it to handle_vc_boot_ghcb().


	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
