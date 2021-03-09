Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 142AD332281
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 11:02:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2802E605B1;
	Tue,  9 Mar 2021 10:02:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RA5xsmTNutCx; Tue,  9 Mar 2021 10:02:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F90960590;
	Tue,  9 Mar 2021 10:02:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 67BFCC0001;
	Tue,  9 Mar 2021 10:02:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4254BC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 10:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AF7F4017A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 10:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R6yvF8hW8sYL
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 10:02:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org
 [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 07E354017B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 10:02:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B07012E2; Tue,  9 Mar 2021 11:02:39 +0100 (CET)
Date: Tue, 9 Mar 2021 11:02:36 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 6/7] x86/boot/compressed/64: Check SEV encryption in
 32-bit boot-path
Message-ID: <YEdHvAWaWv8YDiUB@8bytes.org>
References: <20210210102135.30667-1-joro@8bytes.org>
 <20210210102135.30667-7-joro@8bytes.org>
 <20210302194353.GH15469@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302194353.GH15469@zn.tnic>
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

On Tue, Mar 02, 2021 at 08:43:53PM +0100, Borislav Petkov wrote:
> On Wed, Feb 10, 2021 at 11:21:34AM +0100, Joerg Roedel wrote:
> > +	/*
> > +	 * Store the sme_me_mask as an indicator that SEV is active. It will be
> > +	 * set again in startup_64().
> 
> So why bother? Or does something needs it before that?

This was actually a bug. The startup32_check_sev_cbit() needs something
to skip the check when SEV is not active. Therefore the value is set
here in sme_me_mask, but the function later checks sev_status.

I fixed it by setting sev_status to 1 here (indicates SEV is active).

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
