Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407B432F48
	for <lists.virtualization@lfdr.de>; Tue, 19 Oct 2021 09:23:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C79783419;
	Tue, 19 Oct 2021 07:23:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTKodHr8D0cx; Tue, 19 Oct 2021 07:23:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7940F83443;
	Tue, 19 Oct 2021 07:23:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17530C000D;
	Tue, 19 Oct 2021 07:23:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D3F7C000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D617402DD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZ8gvcsGJxK0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:23:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AB0F40233
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Oct 2021 07:23:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C6E1568BFE; Tue, 19 Oct 2021 09:23:26 +0200 (CEST)
Date: Tue, 19 Oct 2021 09:23:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Darrick J. Wong" <djwong@kernel.org>
Subject: Re: [PATCH 06/11] xfs: factor out a xfs_setup_dax helper
Message-ID: <20211019072326.GA23171@lst.de>
References: <20211018044054.1779424-1-hch@lst.de>
 <20211018044054.1779424-7-hch@lst.de> <20211018164351.GT24307@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018164351.GT24307@magnolia>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: , linux-xfs@vger.kernel.org, linux-erofs@lists.ozlabs.org, To-header@lst.de,
 Mike Snitzer <snitzer@redhat.com>, nvdimm@lists.linux.dev,
 linux-s390@vger.kernel.org, no@lst.de, on@lst.de,
 virtualization@lists.linux-foundation.org, "input <"@lst.de,
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

On Mon, Oct 18, 2021 at 09:43:51AM -0700, Darrick J. Wong wrote:
> > --- a/fs/xfs/xfs_super.c
> > +++ b/fs/xfs/xfs_super.c
> > @@ -339,6 +339,32 @@ xfs_buftarg_is_dax(
> >  			bdev_nr_sectors(bt->bt_bdev));
> >  }
> >  
> > +static int
> > +xfs_setup_dax(
> 
> /me wonders if this should be named xfs_setup_dax_always, since this
> doesn't handle the dax=inode mode?

Sure, why not.

> The only reason I bring that up is that Eric reminded me a while ago
> that we don't actually print any kind of EXPERIMENTAL warning for the
> auto-detection behavior.

Yes, I actually noticed that as well when preparing this series.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
