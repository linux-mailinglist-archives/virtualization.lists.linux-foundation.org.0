Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD5444D93C
	for <lists.virtualization@lfdr.de>; Thu, 11 Nov 2021 16:36:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AD060B49;
	Thu, 11 Nov 2021 15:36:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngeVjMKBlgSn; Thu, 11 Nov 2021 15:36:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C42E760B47;
	Thu, 11 Nov 2021 15:36:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49A23C001E;
	Thu, 11 Nov 2021 15:36:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67DC7C001E
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 15:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BB6381A24
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 15:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rLkp48owdO49
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 15:36:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from outgoing-stata.csail.mit.edu (outgoing-stata.csail.mit.edu
 [128.30.2.210])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47235819B4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Nov 2021 15:36:14 +0000 (UTC)
Received: from [128.177.79.46] (helo=csail.mit.edu)
 by outgoing-stata.csail.mit.edu with esmtpsa (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.82) (envelope-from <srivatsa@csail.mit.edu>)
 id 1mlC7U-000Qst-6C; Thu, 11 Nov 2021 10:36:08 -0500
Date: Thu, 11 Nov 2021 07:39:16 -0800
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 1/3] MAINTAINERS: Update maintainers for paravirt ops
 and VMware hypervisor interface
Message-ID: <20211111153916.GA7966@csail.mit.edu>
References: <163657479269.84207.13658789048079672839.stgit@srivatsa-dev>
 <163657487268.84207.5604596767569015608.stgit@srivatsa-dev>
 <YYy9P7Rjg9hntmm3@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YYy9P7Rjg9hntmm3@kroah.com>
Cc: jgross@suse.com, anishs@vmware.com, pv-drivers@vmware.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org, keerthanak@vmware.com,
 namit@vmware.com, rostedt@goodmis.org, Alexey Makhalov <amakhalov@vmware.com>,
 joe@perches.com, kuba@kernel.org
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

On Thu, Nov 11, 2021 at 07:50:39AM +0100, Greg KH wrote:
> On Wed, Nov 10, 2021 at 12:08:16PM -0800, Srivatsa S. Bhat wrote:
> > From: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
> > 
> > Deep has decided to transfer maintainership of the VMware hypervisor
> > interface to Srivatsa, and the joint-maintainership of paravirt ops in
> > the Linux kernel to Srivatsa and Alexey. Update the MAINTAINERS file
> > to reflect this change.
> > 
> > Signed-off-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>
> > Acked-by: Alexey Makhalov <amakhalov@vmware.com>
> > Acked-by: Deep Shah <sdeep@vmware.com>
> > Acked-by: Juergen Gross <jgross@suse.com>
> > Cc: stable@vger.kernel.org
> 
> Why are MAINTAINERS updates needed for stable?  That's not normal :(

So that people posting bug-fixes / backports to these subsystems for
older kernels (stable and LTS releases) will CC the new subsystem
maintainers. That's why I added CC stable tag only to the first two
patches which add/replace maintainers and not the third patch which is
just a cleanup.

Regards,
Srivatsa
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
