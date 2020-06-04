Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E721EE3B6
	for <lists.virtualization@lfdr.de>; Thu,  4 Jun 2020 13:54:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E60852276C;
	Thu,  4 Jun 2020 11:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rHOaKucLSAM1; Thu,  4 Jun 2020 11:54:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EC9D6221B7;
	Thu,  4 Jun 2020 11:54:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B8BE6C016E;
	Thu,  4 Jun 2020 11:54:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F8BCC016E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4846384EAD
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijPmNwlPYPUC
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:54:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4253F85F8D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Jun 2020 11:54:17 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 744CC26F; Thu,  4 Jun 2020 13:54:14 +0200 (CEST)
Date: Thu, 4 Jun 2020 13:54:13 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 40/75] x86/sev-es: Compile early handler code into
 kernel image
Message-ID: <20200604115413.GB30945@8bytes.org>
References: <20200428151725.31091-1-joro@8bytes.org>
 <20200428151725.31091-41-joro@8bytes.org>
 <20200520091415.GC1457@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200520091415.GC1457@zn.tnic>
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

On Wed, May 20, 2020 at 11:14:15AM +0200, Borislav Petkov wrote:
> On Tue, Apr 28, 2020 at 05:16:50PM +0200, Joerg Roedel wrote:
> > +static inline u64 sev_es_rd_ghcb_msr(void)
> > +{
> > +	return native_read_msr(MSR_AMD64_SEV_ES_GHCB);
> > +}
> > +
> > +static inline void sev_es_wr_ghcb_msr(u64 val)
> > +{
> > +	u32 low, high;
> > +
> > +	low  = (u32)(val);
> > +	high = (u32)(val >> 32);
> > +
> > +	native_write_msr(MSR_AMD64_SEV_ES_GHCB, low, high);
> > +}
> 
> Instead of duplicating those two, you can lift the ones in the
> compressed image into sev-es.h and use them here. I don't care one bit
> about the MSR tracepoints in native_*_msr().

It is not only the trace-point, this would also eliminate exception
handling in case the MSR access triggers a #GP. The "Unhandled MSR
read/write" messages would turn into a "General Protection Fault"
message.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
