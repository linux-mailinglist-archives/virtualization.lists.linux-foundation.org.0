Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BC68422126E
	for <lists.virtualization@lfdr.de>; Wed, 15 Jul 2020 18:34:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1B2FA8876A;
	Wed, 15 Jul 2020 16:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i25IQQFvWO9H; Wed, 15 Jul 2020 16:34:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 002BC88783;
	Wed, 15 Jul 2020 16:34:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CBDC6C0733;
	Wed, 15 Jul 2020 16:34:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 747B0C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 16:34:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6ED6E8876A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 16:34:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lk63WxG2M1zi
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 16:34:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B7586883E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 16:34:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89EA3AF83;
 Wed, 15 Jul 2020 16:34:52 +0000 (UTC)
Date: Wed, 15 Jul 2020 18:34:47 +0200
From: Joerg Roedel <jroedel@suse.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4 34/75] x86/head/64: Build k/head64.c with
 -fno-stack-protector
Message-ID: <20200715163446.GB24822@suse.de>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-35-joro@8bytes.org>
 <202007141831.F3165F22@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202007141831.F3165F22@keescook>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org,
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

On Tue, Jul 14, 2020 at 06:34:24PM -0700, Kees Cook wrote:
> On Tue, Jul 14, 2020 at 02:08:36PM +0200, Joerg Roedel wrote:
> > +# make sure head64.c is built without stack protector
> > +nostackp := $(call cc-option, -fno-stack-protector)
> > +CFLAGS_head64.o		:= $(nostackp)
> 
> Recent refactoring[1] for stack protector suggests this should just
> unconditionally be:
> 
> CFLAGS_head64.o			+= -fno-stack-protector
> 
> But otherwise, yeah, this should be fine here -- it's all early init
> stuff.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>

Thanks, I am not sure this patch will be needed in the next version, as
I am currently rebasing to tip/master, which also made idt_descr static
in kernel/idt.c.

So with that I think I have to move the early IDT init functions to
kernel/idt.c too and setup %gs earlier in head_64.S to make
stack-protector happy.

The %gs setup actually needs to happen two times, one time when the
kernel still runs identity mapped and then again when it switched to
virtual addresses.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
