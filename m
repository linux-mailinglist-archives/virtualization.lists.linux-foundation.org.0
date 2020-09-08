Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 12999261AE2
	for <lists.virtualization@lfdr.de>; Tue,  8 Sep 2020 20:42:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8B79022DE3;
	Tue,  8 Sep 2020 18:42:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0bR-JHQsihR; Tue,  8 Sep 2020 18:42:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8575420797;
	Tue,  8 Sep 2020 18:42:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FCA2C0051;
	Tue,  8 Sep 2020 18:42:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0C2AC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 18:42:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id DEF8B86C40
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 18:42:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A5xSxCYaE4NB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 18:42:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2D0C186BB7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Sep 2020 18:42:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4510AD39;
 Tue,  8 Sep 2020 18:42:38 +0000 (UTC)
Date: Tue, 8 Sep 2020 20:42:34 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v7 67/72] x86/smpboot: Load TSS and getcpu GDT entry
 before loading IDT
Message-ID: <20200908184234.GE23826@suse.de>
References: <20200907131613.12703-1-joro@8bytes.org>
 <20200907131613.12703-68-joro@8bytes.org>
 <20200908172042.GF25236@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908172042.GF25236@zn.tnic>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>,
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

On Tue, Sep 08, 2020 at 07:20:42PM +0200, Borislav Petkov wrote:
> On Mon, Sep 07, 2020 at 03:16:08PM +0200, Joerg Roedel wrote:
> > +void cpu_init_exception_handling(void)
> > +{
> > +	struct tss_struct *tss = this_cpu_ptr(&cpu_tss_rw);
> > +	int cpu = raw_smp_processor_id();
> > +
> > +	/* paranoid_entry() gets the CPU number from the GDT */
> > +	setup_getcpu(cpu);
> > +
> > +	/* IST vectors need TSS to be set up. */
> > +	tss_setup_ist(tss);
> > +	tss_setup_io_bitmap(tss);
> > +	set_tss_desc(cpu, &get_cpu_entry_area(cpu)->tss.x86_tss);
> > +
> > +	load_TR_desc();
> 
> Aha, this is what you mean here in your 0th message. I'm guessing it is
> ok to do those things twice in start_secondary...

Yes, I think its best to do it twice, so that cpu_init() stays the CPU
state barrier it should be, independent of what happens before.


	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
