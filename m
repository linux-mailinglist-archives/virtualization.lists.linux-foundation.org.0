Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B53C5453D28
	for <lists.virtualization@lfdr.de>; Wed, 17 Nov 2021 01:31:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C9F240571;
	Wed, 17 Nov 2021 00:31:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoYXP2zH9x0w; Wed, 17 Nov 2021 00:31:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D8B3A40562;
	Wed, 17 Nov 2021 00:31:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AD18C0012;
	Wed, 17 Nov 2021 00:31:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD69AC0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 00:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 84F4C4010B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 00:31:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KL3zD8w0eB-4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 00:31:14 +0000 (UTC)
X-Greylist: delayed 00:39:58 by SQLgrey-1.8.0
Received: from smtprelay.hostedemail.com (smtprelay0249.hostedemail.com
 [216.40.44.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A4FDC400FE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Nov 2021 00:31:14 +0000 (UTC)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave02.hostedemail.com (Postfix) with ESMTP id ABC9C18070A75
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 23:11:35 +0000 (UTC)
Received: from omf13.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id E5D631829912D;
 Tue, 16 Nov 2021 23:11:32 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf13.hostedemail.com (Postfix) with ESMTPA id F396A2000266; 
 Tue, 16 Nov 2021 23:11:24 +0000 (UTC)
Message-ID: <d4e9430989b427e95448ef57b22605d1f4dbc499.camel@perches.com>
Subject: Re: [PATCH v3 1/3] MAINTAINERS: Update maintainers for paravirt ops
 and VMware hypervisor interface
From: Joe Perches <joe@perches.com>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Date: Tue, 16 Nov 2021 15:11:28 -0800
In-Reply-To: <20211116181837.GA24696@csail.mit.edu>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
 <163657487268.84207.5604596767569015608.stgit@srivatsa-dev>
 <YYy9P7Rjg9hntmm3@kroah.com> <20211111153916.GA7966@csail.mit.edu>
 <YY1krlfM5R7uEzJF@kroah.com> <20211111194002.GA8739@csail.mit.edu>
 <YY6hhWtvh+OvOqAl@sashalap> <20211115223900.GA22267@csail.mit.edu>
 <70cd970d6c39a5ea5e88cbf4b86031c22c5d10d4.camel@perches.com>
 <20211116181837.GA24696@csail.mit.edu>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: F396A2000266
X-Stat-Signature: fopgi45mrrmohs63mm8zh3mmrq316zpw
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18gfxLs9Ei5ua9isHj0ybElXINBrGjr1+s=
X-HE-Tag: 1637104284-88717
Cc: Sasha Levin <sashal@kernel.org>, jgross@suse.com, anishs@vmware.com,
 pv-drivers@vmware.com, Greg KH <gregkh@linuxfoundation.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, keerthanak@vmware.com,
 namit@vmware.com, rostedt@goodmis.org, Alexey Makhalov <amakhalov@vmware.com>,
 kuba@kernel.org
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

On Tue, 2021-11-16 at 10:18 -0800, Srivatsa S. Bhat wrote:
> On Mon, Nov 15, 2021 at 08:33:40PM -0800, Joe Perches wrote:
> > On Mon, 2021-11-15 at 14:39 -0800, Srivatsa S. Bhat wrote:
> > > On Fri, Nov 12, 2021 at 12:16:53PM -0500, Sasha Levin wrote:
> > > > Maybe we should just remove MAINTAINERS from stable trees to make it
> > > > obvious.
> > > 
> > > I don't think we should go quite that far. Instead, perhaps we can
> > > modify get_maintainer.pl (if needed) such that it prints out a warning
> > > or reminder to consult the upstream MAINTAINERS file if the script is
> > > invoked on an older stable kernel.
> > 
> > I don't see how that's feasible.
> > 
> 
> Not that I'm pushing for this change, but isn't it straight-forward to
> distinguish upstream and stable kernel releases based on their
> versioning schemes? The SUBLEVEL in the Makefile is always 0 for
> upstream, and positive for stable versions (ignoring ancient kernels
> like v2.6.32, of course). Since stable kernels are behind mainline by
> definition, anytime the get_maintainer.pl script is invoked on a
> kernel with a positive SUBLEVEL value, we can print out the said
> warning/reminder (if it is considered useful).

checkpatch doesn't work on trees, it works on patches.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
