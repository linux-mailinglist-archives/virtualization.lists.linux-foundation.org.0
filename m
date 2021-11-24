Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B478345B45F
	for <lists.virtualization@lfdr.de>; Wed, 24 Nov 2021 07:37:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12A84814AB;
	Wed, 24 Nov 2021 06:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p8RqMZy539HW; Wed, 24 Nov 2021 06:37:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D91F280D0D;
	Wed, 24 Nov 2021 06:37:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6376FC0036;
	Wed, 24 Nov 2021 06:37:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1B508C0012
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 09AE160B30
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ziBG3lIxR-mq
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:37:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6C15F60B00
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Nov 2021 06:37:39 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4D2F768AFE; Wed, 24 Nov 2021 07:37:35 +0100 (CET)
Date: Wed, 24 Nov 2021 07:37:35 +0100
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH 08/29] dax: remove dax_capable
Message-ID: <20211124063735.GB6889@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-9-hch@lst.de> <20211123223123.GF266024@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211123223123.GF266024@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linux-ext4@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Nov 23, 2021 at 02:31:23PM -0800, Darrick J. Wong wrote:
> > -	struct super_block	*sb = mp->m_super;
> > -
> > -	if (!xfs_buftarg_is_dax(sb, mp->m_ddev_targp) &&
> > -	   (!mp->m_rtdev_targp || !xfs_buftarg_is_dax(sb, mp->m_rtdev_targp))) {
> > +	if (!mp->m_ddev_targp->bt_daxdev &&
> > +	   (!mp->m_rtdev_targp || !mp->m_rtdev_targp->bt_daxdev)) {
> 
> Nit: This  ^ paren should be indented one more column because it's a
> sub-clause of the if() test.

Done.

> Nit: xfs_alert() already adds a newline to the end of the format string.

Already done in the current tree.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
