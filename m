Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1403169D5
	for <lists.virtualization@lfdr.de>; Wed, 10 Feb 2021 16:13:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DCD4873FF;
	Wed, 10 Feb 2021 15:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4zna18IZSMY; Wed, 10 Feb 2021 15:13:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2E9DB872D4;
	Wed, 10 Feb 2021 15:13:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 20E0FC013A;
	Wed, 10 Feb 2021 15:13:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4696BC0891
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3D5BB86A03
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbXVjacF18Uw
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:13:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 748DE86C29
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Feb 2021 15:12:29 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B8FA83C2; Wed, 10 Feb 2021 16:12:26 +0100 (CET)
Date: Wed, 10 Feb 2021 16:12:25 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 0/7] x86/seves: Support 32-bit boot path and other updates
Message-ID: <20210210151224.GC7302@8bytes.org>
References: <20210210102135.30667-1-joro@8bytes.org>
 <20210210145835.GE358613@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210145835.GE358613@fedora>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Arvind Sankar <nivedita@alum.mit.edu>, hpa@zytor.com,
 Jiri Slaby <jslaby@suse.cz>, daniel.kiper@oracle.com, x86@kernel.org,
 David Rientjes <rientjes@google.com>, Martin Radev <martin.b.radev@gmail.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, Cfir Cohen <cfir@google.com>,
 Andy Lutomirski <luto@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Juergen Gross <jgross@suse.com>, Mike Stunes <mstunes@vmware.com>,
 linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Erdem Aktas <erdemaktas@google.com>
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

Hi Konrad,

On Wed, Feb 10, 2021 at 09:58:35AM -0500, Konrad Rzeszutek Wilk wrote:
> What GRUB versions are we talking about (CC-ing Daniel Kiper, who owns
> GRUB).

I think this was about 32-bit GRUB builds used by distributions. I
personally tested it with a kernel which has EFI support disabled, in
this case the OVMF firmware will also boot into the startup_32 boot
path.

> By 'some firmware' we talking SeaBIOS?

No, SeaBIOS is not supported for SEV-ES, only OVMF has handling for #VC
so far.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
