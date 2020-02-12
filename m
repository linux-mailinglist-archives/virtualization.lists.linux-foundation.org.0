Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 521D215A804
	for <lists.virtualization@lfdr.de>; Wed, 12 Feb 2020 12:39:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C321820465;
	Wed, 12 Feb 2020 11:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 95mJ+WWqu7mP; Wed, 12 Feb 2020 11:39:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 302EF203D1;
	Wed, 12 Feb 2020 11:39:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 154F2C1D8E;
	Wed, 12 Feb 2020 11:39:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FC16C0177
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2B017203D1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFMFCuoI2-PK
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:38:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id C36CE20013
 for <virtualization@lists.linux-foundation.org>;
 Wed, 12 Feb 2020 11:38:57 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E4BE34A6; Wed, 12 Feb 2020 12:38:54 +0100 (CET)
Date: Wed, 12 Feb 2020 12:38:40 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 14/62] x86/boot/compressed/64: Add stage1 #VC handler
Message-ID: <20200212113840.GB20066@8bytes.org>
References: <20200211135256.24617-1-joro@8bytes.org>
 <20200211135256.24617-15-joro@8bytes.org>
 <CALCETrWh58j3a2exXE0GE5E9EN+U=F8JEix74MUEFkoWY6Gf6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrWh58j3a2exXE0GE5E9EN+U=F8JEix74MUEFkoWY6Gf6Q@mail.gmail.com>
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

On Tue, Feb 11, 2020 at 02:23:22PM -0800, Andy Lutomirski wrote:
> On Tue, Feb 11, 2020 at 5:53 AM Joerg Roedel <joro@8bytes.org> wrote:
> > +void __init no_ghcb_vc_handler(struct pt_regs *regs)
> 
> Isn't there a second parameter: unsigned long error_code?

No, the function gets the error-code from regs->orig_ax. This particular
function only needs to check for error_code == SVM_EXIT_CPUID, as that
is the only one supported when there is no GHCB.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
