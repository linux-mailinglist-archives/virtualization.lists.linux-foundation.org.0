Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 114DD3076EA
	for <lists.virtualization@lfdr.de>; Thu, 28 Jan 2021 14:18:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A73EF866C4;
	Thu, 28 Jan 2021 13:18:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbrp7bqBpfz4; Thu, 28 Jan 2021 13:18:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 29B6586637;
	Thu, 28 Jan 2021 13:18:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A2C9C1DA7;
	Thu, 28 Jan 2021 13:18:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BBCDC013A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 13:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 265DD86B92
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 13:18:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vqINTdJYfnzj
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 13:18:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id ADE8786AE7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Jan 2021 13:18:21 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8407751D; Thu, 28 Jan 2021 14:18:19 +0100 (CET)
Date: Thu, 28 Jan 2021 14:18:18 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Lai Jiangshan <jiangshanlai+lkml@gmail.com>
Subject: Re: [PATCH v7 45/72] x86/entry/64: Add entry code for #VC handler
Message-ID: <20210128131817.GP32671@8bytes.org>
References: <20200907131613.12703-1-joro@8bytes.org>
 <20200907131613.12703-46-joro@8bytes.org>
 <CAJhGHyCMMCY9bZauzrSeQr_62SpJgZQEQy9P7Rh28HXJtF5O5A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJhGHyCMMCY9bZauzrSeQr_62SpJgZQEQy9P7Rh28HXJtF5O5A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Mike Stunes <mstunes@vmware.com>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Cfir Cohen <cfir@google.com>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 virtualization@lists.linux-foundation.org,
 Martin Radev <martin.b.radev@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Erdem Aktas <erdemaktas@google.com>,
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

Hello Lai,

On Sun, Jan 24, 2021 at 10:11:14PM +0800, Lai Jiangshan wrote:
> > +
> > +       /*
> > +        * No need to switch back to the IST stack. The current stack is either
> > +        * identical to the stack in the IRET frame or the VC fall-back stack,
> > +        * so it is definitly mapped even with PTI enabled.
> > +        */
> > +       jmp     paranoid_exit
> > +
> >
> 
> Hello
> 
> I know we don't enable PTI on AMD, but the above comment doesn't align to the
> next code.
> 
> We assume PTI is enabled as the comments said "even with PTI enabled".
> 
> When #VC happens after entry_SYSCALL_64 but before it switches to the
> kernel CR3.  vc_switch_off_ist() will switch the stack to the kernel stack
> and paranoid_exit can't work when it switches to user CR3 on the kernel stack.
> 
> The comment above lost information that the current stack is possible to be
> the kernel stack which is mapped not user CR3.
> 
> Maybe I missed something.

You are right, the scenario above would cause problems for the current
#VC entry code. With SEV-ES an #VC exception can't happen in the early
syscall entry code, so I think its the best to update the comment
reflecting this.

In the future this might change and then the #VC entry code needs to
take care of this case too. Thanks for pointing it out.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
