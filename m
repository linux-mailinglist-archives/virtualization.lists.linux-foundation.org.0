Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C33518D8B4
	for <lists.virtualization@lfdr.de>; Fri, 20 Mar 2020 20:48:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E047588C15;
	Fri, 20 Mar 2020 19:48:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sH6HKl22XLFj; Fri, 20 Mar 2020 19:48:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 658DF88CBF;
	Fri, 20 Mar 2020 19:48:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 50C34C07FF;
	Fri, 20 Mar 2020 19:48:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D46ABC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:48:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C12E686644
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:48:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RB4fvzESmadi
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:48:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7330C86276
 for <virtualization@lists.linux-foundation.org>;
 Fri, 20 Mar 2020 19:48:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4F2324CA; Fri, 20 Mar 2020 20:48:51 +0100 (CET)
Date: Fri, 20 Mar 2020 20:48:49 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 70/70] x86/sev-es: Add NMI state tracking
Message-ID: <20200320194849.GJ5122@8bytes.org>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-71-joro@8bytes.org>
 <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
 <20200319160749.GC5122@8bytes.org>
 <CALCETrXY5M87C1Fc3QvTkc6MdbQ_3gAuOPUeWJktAzK4T60QNQ@mail.gmail.com>
 <20200319192654.GD611@suse.de>
 <CALCETrXzyUGjPYBR_NDSvTG8TqLuQP2Q+v_mwXPne4O0U-18NA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrXzyUGjPYBR_NDSvTG8TqLuQP2Q+v_mwXPne4O0U-18NA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Joerg Roedel <jroedel@suse.de>,
 Kees Cook <keescook@chromium.org>, kvm list <kvm@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
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

On Thu, Mar 19, 2020 at 02:27:49PM -0700, Andy Lutomirski wrote:
> AIUI the shift-ist stuff is because we aren't very good about the way
> that we handle tracing right now, and that can cause a limited degree
> of recursion.  #DB uses IST for historical reasons that don't
> necessarily make sense.  Right now, we need it for only one reason:
> the MOV SS issue.  IIRC this isn't actually triggerable without
> debugging enabled -- MOV SS with no breakpoint but TF on doesn't seem
> to malfunction quite as badly.

I had a look at the shift_ist stuff today and it looks like a good
solution to the #VC nesting problem when it is turned into a #VC
handler. The devil is in the details, of course, as 3 or 4 stacks for
the #VC handler (per cpu) should only be allocated when actually running
in an SEV-ES guest. Let's see how this works out in practice.

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
