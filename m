Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C5453948
	for <lists.virtualization@lfdr.de>; Tue, 16 Nov 2021 19:15:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D5884042F;
	Tue, 16 Nov 2021 18:15:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cICKRePmfKNw; Tue, 16 Nov 2021 18:15:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2619C4042D;
	Tue, 16 Nov 2021 18:15:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1EA8C0012;
	Tue, 16 Nov 2021 18:15:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0732AC0012
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 18:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D13434039C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 18:15:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3CDiE4SO-AWX
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 18:15:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1093400BD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Nov 2021 18:15:34 +0000 (UTC)
Received: from [128.177.79.46] (helo=csail.mit.edu)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1mn2zO-00026C-FP; Tue, 16 Nov 2021 13:15:26 -0500
Date: Tue, 16 Nov 2021 10:18:37 -0800
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v3 1/3] MAINTAINERS: Update maintainers for paravirt ops
 and VMware hypervisor interface
Message-ID: <20211116181837.GA24696@csail.mit.edu>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
 <163657487268.84207.5604596767569015608.stgit@srivatsa-dev>
 <YYy9P7Rjg9hntmm3@kroah.com> <20211111153916.GA7966@csail.mit.edu>
 <YY1krlfM5R7uEzJF@kroah.com> <20211111194002.GA8739@csail.mit.edu>
 <YY6hhWtvh+OvOqAl@sashalap> <20211115223900.GA22267@csail.mit.edu>
 <70cd970d6c39a5ea5e88cbf4b86031c22c5d10d4.camel@perches.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <70cd970d6c39a5ea5e88cbf4b86031c22c5d10d4.camel@perches.com>
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

On Mon, Nov 15, 2021 at 08:33:40PM -0800, Joe Perches wrote:
> On Mon, 2021-11-15 at 14:39 -0800, Srivatsa S. Bhat wrote:
> > On Fri, Nov 12, 2021 at 12:16:53PM -0500, Sasha Levin wrote:
> > > Maybe we should just remove MAINTAINERS from stable trees to make it
> > > obvious.
> > 
> > I don't think we should go quite that far. Instead, perhaps we can
> > modify get_maintainer.pl (if needed) such that it prints out a warning
> > or reminder to consult the upstream MAINTAINERS file if the script is
> > invoked on an older stable kernel.
> 
> I don't see how that's feasible.
> 

Not that I'm pushing for this change, but isn't it straight-forward to
distinguish upstream and stable kernel releases based on their
versioning schemes? The SUBLEVEL in the Makefile is always 0 for
upstream, and positive for stable versions (ignoring ancient kernels
like v2.6.32, of course). Since stable kernels are behind mainline by
definition, anytime the get_maintainer.pl script is invoked on a
kernel with a positive SUBLEVEL value, we can print out the said
warning/reminder (if it is considered useful).

Regards,
Srivatsa
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
