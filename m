Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 429F615A799
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 12:19:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C0AE28638F;
	Wed, 12 Feb 2020 11:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n5AQoZEbqVMT; Wed, 12 Feb 2020 11:19:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A7BE3864A4;
	Wed, 12 Feb 2020 11:19:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9BC88C1D89;
	Wed, 12 Feb 2020 11:19:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 355D8C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1F2FB864A4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QJ0B+PeIYH4H
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:19:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E6C548638F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:19:51 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 50C2B4A6; Wed, 12 Feb 2020 12:19:49 +0100 (CET)
Date: Wed, 12 Feb 2020 12:19:24 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 08/62] x86/boot/compressed/64: Add IDT Infrastructure
Message-ID: <20200212111923.GA20066@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-9-joro@8bytes.org>
 <CALCETrWznWHQNfd80G95G_CB-yCw8Botqee8bsLz3OcC4-SS=w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrWznWHQNfd80G95G_CB-yCw8Botqee8bsLz3OcC4-SS=w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Joerg Roedel <jroedel@suse.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>
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

Hi Andy,

thanks a lot for your valuable reviews!

On Tue, Feb 11, 2020 at 02:18:52PM -0800, Andy Lutomirski wrote:
> On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
> > +       entry.offset_low    = (u16)(address & 0xffff);
> > +       entry.segment       = __KERNEL_CS;
> > +       entry.bits.type     = GATE_TRAP;
> 
> ^^^
> 
> I realize we're not running a real kernel here, but GATE_TRAP is
> madness.  Please use GATE_INTERRUPT.

Changed that.

> > +       /* Build pt_regs */
> > +       .if \error_code == 0
> > +       pushq   $0
> > +       .endif
> 
> cld

Added.

> > +       popq    %rdi
> 
> if error_code?

The code above pushes a $0 for exceptions without an error code, so it
needs to be removed unconditionally.

> > +
> > +       /* Remove error code and return */
> > +       addq    $8, %rsp
> > +
> > +       /*
> > +        * Make sure we return to __KERNEL_CS - the CS selector on
> > +        * the IRET frame might still be from an old BIOS GDT
> > +        */
> > +       movq    $__KERNEL_CS, 8(%rsp)
> > +
> 
> If this actually happens, you have a major bug.  Please sanitize all
> the segment registers after installing the GDT rather than hacking
> around it here.

Okay, will change that. I thought I could safe some instructions in the
head_64.S code, but you are right that its better to setup a defined
environment first.


Thanks,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
