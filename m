Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CEF1B88D9
	for <lists.virtualization@lfdr.de>; Sat, 25 Apr 2020 21:21:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4382885D3F;
	Sat, 25 Apr 2020 19:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B84gfBRFBRKt; Sat, 25 Apr 2020 19:11:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2D90184DF6;
	Sat, 25 Apr 2020 19:11:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09EECC1D93;
	Sat, 25 Apr 2020 19:11:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94D48C0175
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 19:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7DEE884DF6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 19:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AszAZ-YqvDbt
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 19:11:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4AD7E85D37
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Apr 2020 19:11:09 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id ED5AD433; Sat, 25 Apr 2020 21:10:35 +0200 (CEST)
Date: Sat, 25 Apr 2020 21:10:32 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH] Allow RDTSC and RDTSCP from userspace
Message-ID: <20200425191032.GK21900@8bytes.org>
References: <20200319091407.1481-56-joro@8bytes.org>
 <20200424210316.848878-1-mstunes@vmware.com>
 <2c49061d-eb84-032e-8dcb-dd36a891ce90@intel.com>
 <ead88d04-1756-1190-2b37-b24f86422595@amd.com>
 <4d2ac222-a896-a60e-9b3c-b35aa7e81a97@intel.com>
 <20200425124909.GO30814@suse.de>
 <CALCETrWCiMkA37yf972h+fqsz1_dbfye8AbrkJxDPJzC+1PBEw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrWCiMkA37yf972h+fqsz1_dbfye8AbrkJxDPJzC+1PBEw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Mike Stunes <mstunes@vmware.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, LKML <linux-kernel@vger.kernel.org>,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Dave Hansen <dave.hansen@intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>, Jiri Slaby <jslaby@suse.cz>,
 X86 ML <x86@kernel.org>
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

On Sat, Apr 25, 2020 at 11:15:35AM -0700, Andy Lutomirski wrote:
> shift_ist is gross.  What's it for?  If it's not needed, I'd rather
> not use it, and I eventually want to get rid of it for #DB as well.

The #VC handler needs to be able to nest, there is no way around that
for various reasons, the two most important ones are:

	1. The #VC -> NMI -> #VC case. #VCs can happen in the NMI
	   handler, for example (but not exclusivly) for RDPMC.

	2. In case of an error the #VC handler needs to print out error
	   information by calling one of the printk wrappers. Those will
	   end up doing IO to some console/serial port/whatever which
	   will also cause #VC exceptions to emulate the access to the
	   output devices.

Using shift_ist is perfect for that, the only problem is the race
condition with the NMI handler, as shift_ist does not work well with
exceptions that can also trigger within the NMI handler. But I have
taken care of that for #VC.


Regards,

	Joerg

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
