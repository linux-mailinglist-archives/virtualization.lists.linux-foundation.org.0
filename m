Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 961D018DB1F
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 23:24:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 49CDF2046A;
	Fri, 20 Mar 2020 22:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M7goVcuJI+vp; Fri, 20 Mar 2020 22:24:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8B3072048D;
	Fri, 20 Mar 2020 22:24:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6DE36C07FF;
	Fri, 20 Mar 2020 22:24:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78C0FC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 725E687563
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TgVnyR310fQQ
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:24:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3165A86FB4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:24:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 53C68ABC7;
 Fri, 20 Mar 2020 22:24:30 +0000 (UTC)
Date: Fri, 20 Mar 2020 23:24:27 +0100
From: Joerg Roedel <jroedel@suse.de>
To: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 23/70] x86/sev-es: Add support for handling IOIO exceptions
Message-ID: <20200320222427.GG611@suse.de>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-24-joro@8bytes.org>
 <alpine.DEB.2.21.2003201402100.205664@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003201402100.205664@chino.kir.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Andy Lutomirski <luto@kernel.org>,
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

On Fri, Mar 20, 2020 at 02:03:17PM -0700, David Rientjes wrote:
> On Thu, 19 Mar 2020, Joerg Roedel wrote:
> > +	if (exit_info_1 & IOIO_TYPE_STR) {
> > +		int df = (regs->flags & X86_EFLAGS_DF) ? -1 : 1;
> >		[ ... ]
> > +		if (!(exit_info_1 & IOIO_TYPE_IN)) {
> > +			ret = vc_insn_string_read(ctxt,
> > +					       (void *)(es_base + regs->si),
> > +					       ghcb->shared_buffer, io_bytes,
> > +					       exit_info_2, df);
> 
> The last argument to vc_insn_string_read() is "bool backwards" which in 
> this case it appears will always be true?

Right, thanks, good catch, I'll fix this. Seems to be a leftover from a
previous version.

Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
