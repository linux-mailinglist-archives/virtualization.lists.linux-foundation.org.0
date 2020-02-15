Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4643D15FE69
	for <lists.virtualization@lfdr.de>; Sat, 15 Feb 2020 13:33:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id F18B887D33;
	Sat, 15 Feb 2020 12:32:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jYwOLl794FEQ; Sat, 15 Feb 2020 12:32:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 01DDE8824B;
	Sat, 15 Feb 2020 12:32:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4EDAC0177;
	Sat, 15 Feb 2020 12:32:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F664C0177
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3555A868BD
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 02LsQZgDi-XK
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:32:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5979860C0
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 12:32:54 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 7A23E2C2; Sat, 15 Feb 2020 13:32:50 +0100 (CET)
Date: Sat, 15 Feb 2020 13:32:48 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andi Kleen <ak@linux.intel.com>
Subject: Re: [PATCH 08/62] x86/boot/compressed/64: Add IDT Infrastructure
Message-ID: <20200215123248.GF22063@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-9-joro@8bytes.org>
 <87k14p5557.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87k14p5557.fsf@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Joerg Roedel <jroedel@suse.de>, Andy Lutomirski <luto@kernel.org>,
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

On Fri, Feb 14, 2020 at 11:40:36AM -0800, Andi Kleen wrote:
> Joerg Roedel <joro@8bytes.org> writes:
> > +	addq    $8, %rsp
> > +
> > +	/*
> > +	 * Make sure we return to __KERNEL_CS - the CS selector on
> > +	 * the IRET frame might still be from an old BIOS GDT
> > +	 */
> > +	movq	$__KERNEL_CS, 8(%rsp)
> 
> This doesn't make sense. Either it's running on the correct CS
> before the exception or not. Likely there's some other problem
> here that you patched over with this hack.

It is actually a well-known situation and not some other problem. The
boot-code loaded a new GDT and IDT, but did not reload CS with a far
jump/ret/call. The CS value loaded is undefined and comes from the UEFI
BIOS. When an exception is raised, this old CS value is stored in the
IRET frame, and when IRET is executed the processor loads an undefined
CS value, which causes a triple fault with the current IDT setup.

The hack in this patch just fixes the IRET frame up so that it will
return to the correct CS. The reason for this hack was actually to safe
some instructions in the boot-path, because the space is limited there
between the defined offsets of the various entry points.

I removed this hack meanwhile and added a separate function which
reloads CS, DS, SS and ES and which is called from the boot-path, so
that there is no problem with the offsets.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
