Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4018C03F
	for <lists.virtualization@lfdr.de>; Thu, 19 Mar 2020 20:27:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A64186BBD;
	Thu, 19 Mar 2020 19:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JtnlTa73qrr; Thu, 19 Mar 2020 19:27:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 389F686BBB;
	Thu, 19 Mar 2020 19:27:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 16C9DC07FF;
	Thu, 19 Mar 2020 19:27:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC8E0C07FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 19:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AA5272322B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 19:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oS6nk1vVpCSy
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 19:26:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id C7EBB2036B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 19 Mar 2020 19:26:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B4686AD03;
 Thu, 19 Mar 2020 19:26:56 +0000 (UTC)
Date: Thu, 19 Mar 2020 20:26:54 +0100
From: Joerg Roedel <jroedel@suse.de>
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 70/70] x86/sev-es: Add NMI state tracking
Message-ID: <20200319192654.GD611@suse.de>
References: <20200319091407.1481-1-joro@8bytes.org>
 <20200319091407.1481-71-joro@8bytes.org>
 <CALCETrUOQneBHjoZkP-7T5PDijb=WOyv7xF7TD0GLR2Aw77vyA@mail.gmail.com>
 <20200319160749.GC5122@8bytes.org>
 <CALCETrXY5M87C1Fc3QvTkc6MdbQ_3gAuOPUeWJktAzK4T60QNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALCETrXY5M87C1Fc3QvTkc6MdbQ_3gAuOPUeWJktAzK4T60QNQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <keescook@chromium.org>,
 kvm list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Joerg Roedel <joro@8bytes.org>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Dan Williams <dan.j.williams@intel.com>,
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

On Thu, Mar 19, 2020 at 11:40:39AM -0700, Andy Lutomirski wrote:
 
> Nope.  A nested NMI will reset the interrupted NMI's return frame to
> cause it to run again when it's done.  I don't think this will have
> any real interaction with #VC.  There's no longjmp() here.

Ahh, so I misunderstood that part, in this case your proposal of sending
the NMI-complete message right at the beginning of do_nmi() should work
just fine. I will test this and see how it works out.

> I certainly *like* preventing nesting, but I don't think we really
> want a whole alternate NMI path just for a couple of messed-up AMD
> generations.  And the TF trick is not so pretty either.

Indeed, if it could be avoided, it should.

> 
> > > This causes us to pop the NMI frame off the stack.  Assuming the NMI
> > > restart logic is invoked (which is maybe impossible?), we get #DB,
> > > which presumably is actually delivered.  And we end up on the #DB
> > > stack, which might already have been in use, so we have a potential
> > > increase in nesting.  Also, #DB may be called from an unexpected
> > > context.
> >
> > An SEV-ES hypervisor is required to intercept #DB, which means that the
> > #DB exception actually ends up being a #VC exception. So it will not end
> > up on the #DB stack.
> 
> With your patch set, #DB doesn't seem to end up on the #DB stack either.

Right, it does not use the #DB stack or shift-ist stuff. Maybe it
should, is this needed for anything else than making entry code
debugable by kgdb?

Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
