Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BDF1B894D
	for <lists.virtualization@lfdr.de>; Sat, 25 Apr 2020 22:23:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 165B086B05;
	Sat, 25 Apr 2020 20:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kwWcK8yhbkRQ; Sat, 25 Apr 2020 20:23:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D4E3186AE5;
	Sat, 25 Apr 2020 20:23:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD28DC0175;
	Sat, 25 Apr 2020 20:23:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65143C0175
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:23:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5166787A6E
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fD0HaCGGRVrh
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:23:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1654D81DDA
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 20:23:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D1C8E433; Sat, 25 Apr 2020 22:23:17 +0200 (CEST)
Date: Sat, 25 Apr 2020 22:23:16 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
Message-ID: <20200425202316.GL21900@8bytes.org>
References: <20200425191032.GK21900@8bytes.org>
 <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <910AE5B4-4522-4133-99F7-64850181FBF9@amacapital.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <JGross@suse.com>, Tom Lendacky <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
 Jiri Slaby <jslaby@suse.cz>, X86 ML <x86@kernel.org>
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

On Sat, Apr 25, 2020 at 12:47:31PM -0700, Andy Lutomirski wrote:
> I assume the race you mean is:
> 
> #VC
> Immediate NMI before IST gets shifted
> #VC
> 
> Kaboom.
> 
> How are you dealing with this?  Ultimately, I think that NMI will need
> to turn off IST before engaging in any funny business. Let me ponder
> this a bit.

Right, I dealt with that by unconditionally shifting/unshifting the #VC IST entry
in do_nmi() (thanks to Davin Kaplan for the idea). It might cause
one of the IST stacks to be unused during nesting, but that is fine. The
stack memory for #VC is only allocated when SEV-ES is active (in an
SEV-ES VM).

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
