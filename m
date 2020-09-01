Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 209DA258F99
	for <lists.virtualization@lfdr.de>; Tue,  1 Sep 2020 15:55:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CE63886243;
	Tue,  1 Sep 2020 13:55:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BeZMRW9CMrIl; Tue,  1 Sep 2020 13:55:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 60FAB8605E;
	Tue,  1 Sep 2020 13:55:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4361AC0051;
	Tue,  1 Sep 2020 13:55:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD58CC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 13:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D56E9204CF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 13:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PEPM5U+oLXGM
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 13:55:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 00DBF204B2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 13:55:48 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 9D02D391; Tue,  1 Sep 2020 15:55:46 +0200 (CEST)
Date: Tue, 1 Sep 2020 15:55:45 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v6 69/76] x86/realmode: Setup AP jump table
Message-ID: <20200901135545.GE22385@8bytes.org>
References: <20200824085511.7553-1-joro@8bytes.org>
 <20200824085511.7553-70-joro@8bytes.org>
 <20200831170937.GK27517@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200831170937.GK27517@zn.tnic>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
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

On Mon, Aug 31, 2020 at 07:09:37PM +0200, Borislav Petkov wrote:
> On Mon, Aug 24, 2020 at 10:55:04AM +0200, Joerg Roedel wrote:
> > +	/* Check if AP Jump Table is non-zero and page-aligned */
> > +	if (!jump_table_addr || jump_table_addr & ~PAGE_MASK)
> > +		return 0;
> 
> I think you need to return !0 here so that the panic() below fires with
> a modified message:
> 
> 	panic("Failed to get/update SEV-ES AP Jump Table");
> 
> or are we gonna boot an UP guest still?

Right, this needs a !0 return value. This code runs once on the boot CPU
before the kernel starts the secondary CPUs, so a panic() is the right
thing to do if this fails.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
