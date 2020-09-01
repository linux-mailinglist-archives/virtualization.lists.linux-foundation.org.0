Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC5F258E02
	for <lists.virtualization@lfdr.de>; Tue,  1 Sep 2020 14:14:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 305C9870AF;
	Tue,  1 Sep 2020 12:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dcr7ge4Yiv31; Tue,  1 Sep 2020 12:13:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B09A4870AE;
	Tue,  1 Sep 2020 12:13:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85AF8C0051;
	Tue,  1 Sep 2020 12:13:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 842B9C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 12:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 70F7086BEA
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 12:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PPcYIeE1I8xj
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 12:13:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2FE4484FC0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 12:13:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AB1D6391; Tue,  1 Sep 2020 14:13:52 +0200 (CEST)
Date: Tue, 1 Sep 2020 14:13:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v6 36/76] x86/head/64: Load IDT earlier
Message-ID: <20200901121351.GB22385@8bytes.org>
References: <20200824085511.7553-1-joro@8bytes.org>
 <20200824085511.7553-37-joro@8bytes.org>
 <20200829102405.GA29091@zn.tnic>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829102405.GA29091@zn.tnic>
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

On Sat, Aug 29, 2020 at 12:24:05PM +0200, Borislav Petkov wrote:
> On Mon, Aug 24, 2020 at 10:54:31AM +0200, Joerg Roedel wrote:
> > @@ -385,3 +386,25 @@ void __init alloc_intr_gate(unsigned int n, const void *addr)
> >  	if (!WARN_ON(test_and_set_bit(n, system_vectors)))
> >  		set_intr_gate(n, addr);
> >  }
> > +
> > +void __init early_idt_setup_early_handler(unsigned long physaddr)
> 
> I wonder if you could drop one of the "early"es:
> 
> idt_setup_early_handler()
> 
> for example looks ok to me. Or
> 
> early_setup_idt_handler()
> 
> if you wanna have "early" as prefix...

Yeah, makes sense. I settled with the second version.


Thanks,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
