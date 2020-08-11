Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F9F2418C8
	for <lists.virtualization@lfdr.de>; Tue, 11 Aug 2020 11:21:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 758818266F;
	Tue, 11 Aug 2020 09:21:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3WhX6yIP-oE; Tue, 11 Aug 2020 09:21:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EED2A83070;
	Tue, 11 Aug 2020 09:21:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A3AE2C004D;
	Tue, 11 Aug 2020 09:21:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF915C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 09:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C76FD85D7D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 09:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7-dMx8nuGBPR
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 09:21:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 24BD585D70
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 09:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=hm4JdNf7SM0QMQOFD/GVqjWP012kTgNDcYqFU8vfr/U=; b=uwpIB3NtbdqSI+ux4wqwNcFt1S
 n1zKP3ACsnDJQpYDLP+p6yoYmCE2G3vyYa2Rp9BEOTJuP4mwZR0X6NoUcCOXsXzWBOjtSYLUneDmV
 XfDgrNRL75yJb0MH9RXp30nGJxhgREaLVjZG1cOiuBKJpLYpnXyj3CmdXrCUwv4TNa21R4gMiU/TN
 zqE1QbNg3KdDlK4btbqYQnPsCRYQRzrj//c/HlUhbOdWb2B6UVwB7s0u4TodxyBBp+XzYAwfLOnsN
 nmw7lqNXFp0sYzAE5//4+e13eMMHcfZUGGB73WZC4myB4WtFAJ2uQLg+fFPV8jb33Bji1fLEzo7RL
 BABqdmMQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5QSn-0001tP-Lq; Tue, 11 Aug 2020 09:20:58 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 28822300DAE;
 Tue, 11 Aug 2020 11:20:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 1982020BFC4E5; Tue, 11 Aug 2020 11:20:54 +0200 (CEST)
Date: Tue, 11 Aug 2020 11:20:54 +0200
From: peterz@infradead.org
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>
Subject: Re: [PATCH] x86/paravirt: Add missing noinstr to arch_local*() helpers
Message-ID: <20200811092054.GB2674@hirez.programming.kicks-ass.net>
References: <20200807095032.GA3528289@elver.google.com>
 <16671cf3-3885-eb06-79ff-4cbfaeeaea79@suse.com>
 <20200807113838.GA3547125@elver.google.com>
 <e5bf3e6a-efff-7170-5ee6-1798008393a2@suse.com>
 <CANpmjNPau_DEYadey9OL+iFZKEaUTqnFnyFs1dU12o00mg7ofA@mail.gmail.com>
 <20200807151903.GA1263469@elver.google.com>
 <20200811074127.GR3982@worktop.programming.kicks-ass.net>
 <a2dffeeb-04f0-8042-b39a-b839c4800d6f@suse.com>
 <20200811081205.GV3982@worktop.programming.kicks-ass.net>
 <07f61573-fef1-e07c-03f2-a415c88dec6f@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07f61573-fef1-e07c-03f2-a415c88dec6f@suse.com>
Cc: syzbot <syzbot+8db9e1ecde74e590a657@syzkaller.appspotmail.com>,
 fenghua.yu@intel.com, Marco Elver <elver@google.com>, "Luck,
 Tony" <tony.luck@intel.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 yu-cheng.yu@intel.com, Dave Hansen <dave.hansen@linux.intel.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 virtualization@lists.linux-foundation.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Wei Liu <wei.liu@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Aug 11, 2020 at 10:38:50AM +0200, J=FCrgen Gro=DF wrote:
> In case you don't want to do it I can send the patch for the Xen
> variants.

I might've opened a whole new can of worms here. I'm not sure we
can/want to fix the entire fallout this release :/

Let me ponder this a little, because the more I look at things, the more
problems I keep finding... bah bah bah.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
