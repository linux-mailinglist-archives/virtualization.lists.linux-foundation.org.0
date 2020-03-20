Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCA18DAFD
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 23:19:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9C55587FD4;
	Fri, 20 Mar 2020 22:19:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jtYhZ6CPJ9rz; Fri, 20 Mar 2020 22:19:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 041E087F83;
	Fri, 20 Mar 2020 22:19:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD4FBC07FF;
	Fri, 20 Mar 2020 22:19:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5966CC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 507CF873EC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wdaYhXrzwGRI
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:19:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D515C873E9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 22:19:27 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 87BB24CA; Fri, 20 Mar 2020 23:19:24 +0100 (CET)
Date: Fri, 20 Mar 2020 23:19:23 +0100
From: Joerg Roedel <joro@8bytes.org>
To: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH 18/70] x86/boot/compressed/64: Add stage1 #VC handler
Message-ID: <20200320221923.GL5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-19-joro@8bytes.org>
 <alpine.DEB.2.21.2003201413010.205664@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2003201413010.205664@chino.kir.corp.google.com>
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

On Fri, Mar 20, 2020 at 02:16:39PM -0700, David Rientjes wrote:
> On Thu, 19 Mar 2020, Joerg Roedel wrote:
> > +#define	GHCB_SEV_GHCB_RESP_CODE(v)	((v) & 0xfff)
> > +#define	VMGEXIT()			{ asm volatile("rep; vmmcall\n\r"); }
> 
> Since preemption and irqs should be disabled before updating the GHCB and 
> its MSR and until the contents have been accessed following VMGEXIT, 
> should there be checks in place to ensure that's always the case?

Good point, some checking is certainly helpful. Currently it is the
case, because the GHCB is accessed and used only:

	1) At boot when only the boot CPU is running

	2) In the #VC handler, which does not enable interrupts

	3) In the NMI handler, which is also not preemptible

I can also add code to sev_es_get/put_ghcb to make sure these conditions
are met. All this does not prevent the preemption by NMIs, which could
cause another nested #VC exception, but that is handled separatly.


Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
