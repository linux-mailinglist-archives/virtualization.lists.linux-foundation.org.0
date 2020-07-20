Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFEA226351
	for <lists.virtualization@lfdr.de>; Mon, 20 Jul 2020 17:30:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7108088177;
	Mon, 20 Jul 2020 15:30:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfi1DCMb7EM5; Mon, 20 Jul 2020 15:30:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id CF70A8817F;
	Mon, 20 Jul 2020 15:30:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9FAE5C016F;
	Mon, 20 Jul 2020 15:30:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A2C4C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5497E20355
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:30:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V97oLJ7reqJE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:30:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 51A4B20035
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jul 2020 15:30:02 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4CFC6344; Mon, 20 Jul 2020 17:29:59 +0200 (CEST)
Date: Mon, 20 Jul 2020 17:29:55 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v4 70/75] x86/head/64: Don't call verify_cpu() on
 starting APs
Message-ID: <20200720152955.GA620@8bytes.org>
References: <20200714120917.11253-1-joro@8bytes.org>
 <20200714120917.11253-71-joro@8bytes.org>
 <202007141837.2B93BBD78@keescook> <20200715092638.GJ16200@suse.de>
 <202007150815.A81E879@keescook> <20200715154856.GA24822@suse.de>
 <202007151244.315DCBAE@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202007151244.315DCBAE@keescook>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Joerg Roedel <jroedel@suse.de>, Mike Stunes <mstunes@vmware.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Cfir Cohen <cfir@google.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Sean Christopherson <sean.j.christopherson@intel.com>,
 linux-kernel@vger.kernel.org, Martin Radev <martin.b.radev@gmail.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 hpa@zytor.com, Erdem Aktas <erdemaktas@google.com>,
 David Rientjes <rientjes@google.com>, Dan Williams <dan.j.williams@intel.com>,
 virtualization@lists.linux-foundation.org, Jiri Slaby <jslaby@suse.cz>
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

On Wed, Jul 15, 2020 at 12:49:23PM -0700, Kees Cook wrote:
> Aaah. I see. Thanks for the details there. So ... can you add a bunch
> more comments about why/when the new entry path is being used? I really
> don't want to accidentally discover some unrelated refactoring down
> the road (in months, years, unrelated to SEV, etc) starts to also skip
> verify_cpu() on Intel systems. There had been a lot of BIOSes that set
> this MSR to disable NX, and I don't want to repeat that pain: Linux must
> never start an Intel CPU with that MSR set. :P

Understood :)

I added a comment above the label explaining why it is only used for
SEV-ES guests and pointing out the importance of running verify_cpu() on
all other systems, especially if they are Intel based.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
