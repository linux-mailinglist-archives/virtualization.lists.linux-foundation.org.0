Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9493E2A43D0
	for <lists.virtualization@lfdr.de>; Tue,  3 Nov 2020 12:13:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F34E120789;
	Tue,  3 Nov 2020 11:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5tZMN5NZ3IL0; Tue,  3 Nov 2020 11:13:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E3DDA20784;
	Tue,  3 Nov 2020 11:13:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1158C0051;
	Tue,  3 Nov 2020 11:13:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72169C0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 11:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 543158731A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 11:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4F7GbL+fpjij
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 11:13:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5590287314
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Nov 2020 11:13:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 91F77AD89;
 Tue,  3 Nov 2020 11:13:48 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id D95E0DA7D2; Tue,  3 Nov 2020 12:12:08 +0100 (CET)
Date: Tue, 3 Nov 2020 12:12:08 +0100
From: David Sterba <dsterba@suse.cz>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 03/37] fs: Remove asm/kmap_types.h includes
Message-ID: <20201103111208.GL6756@suse.cz>
Mail-Followup-To: dsterba@suse.cz, Thomas Gleixner <tglx@linutronix.de>,
 LKML <linux-kernel@vger.kernel.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Paul McKenney <paulmck@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Benjamin LaHaise <bcrl@kvack.org>, linux-fsdevel@vger.kernel.org,
 linux-aio@kvack.org, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
 linux-btrfs@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 x86@kernel.org, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org,
 Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-xtensa@linux-xtensa.org, Ingo Molnar <mingo@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
 Daniel Bristot de Oliveira <bristot@redhat.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Roland Scheidegger <sroland@vmware.com>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20201103092712.714480842@linutronix.de>
 <20201103095856.870272797@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103095856.870272797@linutronix.de>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-aio@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Ben Segall <bsegall@google.com>, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, Paul Mackerras <paulus@samba.org>,
 Daniel Bristot de Oliveira <bristot@redhat.com>, sparclinux@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vincent Chen <deanbo422@gmail.com>,
 Christoph Hellwig <hch@lst.de>, Vincent Guittot <vincent.guittot@linaro.org>,
 Paul McKenney <paulmck@kernel.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Russell King <linux@armlinux.org.uk>, linux-csky@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, David Airlie <airlied@linux.ie>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Mel Gorman <mgorman@suse.de>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, linux-snps-arc@lists.infradead.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 Roland Scheidegger <sroland@vmware.com>, Josef Bacik <josef@toxicpanda.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, spice-devel@lists.freedesktop.org,
 David Sterba <dsterba@suse.com>, virtualization@lists.linux-foundation.org,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Chris Mason <clm@fb.com>,
 Vineet Gupta <vgupta@synopsys.com>, LKML <linux-kernel@vger.kernel.org>,
 Christian Koenig <christian.koenig@amd.com>, Benjamin LaHaise <bcrl@kvack.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>, linux-btrfs@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, Nov 03, 2020 at 10:27:15AM +0100, Thomas Gleixner wrote:
> Historical leftovers from the time where kmap() had fixed slots.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Benjamin LaHaise <bcrl@kvack.org>
> Cc: linux-fsdevel@vger.kernel.org
> Cc: linux-aio@kvack.org
> Cc: Chris Mason <clm@fb.com>
> Cc: Josef Bacik <josef@toxicpanda.com>
> Cc: David Sterba <dsterba@suse.com>

Acked-by: David Sterba <dsterba@suse.com>

For the btrfs bits

>  fs/btrfs/ctree.h |    1 -

> --- a/fs/btrfs/ctree.h
> +++ b/fs/btrfs/ctree.h
> @@ -17,7 +17,6 @@
>  #include <linux/wait.h>
>  #include <linux/slab.h>
>  #include <trace/events/btrfs.h>
> -#include <asm/kmap_types.h>
>  #include <asm/unaligned.h>
>  #include <linux/pagemap.h>
>  #include <linux/btrfs.h>
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
