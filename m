Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA8A18DB09
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 23:21:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4459C25075;
	Fri, 20 Mar 2020 22:21:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6WI-LpVL6xZv; Fri, 20 Mar 2020 22:21:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 612032046A;
	Fri, 20 Mar 2020 22:21:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 52DBBC1D89;
	Fri, 20 Mar 2020 22:21:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22962C07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1E1AF892B1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:21:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HCHAqh1Bkhe
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:21:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 47E68892AC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:21:05 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 923B24CA; Fri, 20 Mar 2020 23:21:03 +0100 (CET)
Date: Fri, 20 Mar 2020 23:21:02 +0100
From: Joerg Roedel <joro@8bytes.org>
To: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 62/70] x86/kvm: Add KVM specific VMMCALL handling under
 SEV-ES
Message-ID: <20200320222102.GM5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-63-joro@8bytes.org>
 <alpine.DEB.2.21.2003201423230.205664@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003201423230.205664@chino.kir.corp.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, erdemaktas@google.com, Dan Williams <dan.j.williams@intel.com>,
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

On Fri, Mar 20, 2020 at 02:23:58PM -0700, David Rientjes wrote:
> On Thu, 19 Mar 2020, Joerg Roedel wrote:
> > +#if defined(CONFIG_AMD_MEM_ENCRYPT)
> > +static void kvm_sev_es_hcall_prepare(struct ghcb *ghcb, struct pt_regs *regs)
> > +{
> > +	/* RAX and CPL are already in the GHCB */
> > +	ghcb_set_rbx(ghcb, regs->bx);
> > +	ghcb_set_rcx(ghcb, regs->cx);
> > +	ghcb_set_rdx(ghcb, regs->dx);
> > +	ghcb_set_rsi(ghcb, regs->si);
> 
> Is it possible to check the hypercall from RAX and only copy the needed 
> regs or is there a requirement that they must all be copied 
> unconditionally?

No, there is no such requirement. This could be optimized with hypercall
specific knowledge as it is in the KVM code anyway.

Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
