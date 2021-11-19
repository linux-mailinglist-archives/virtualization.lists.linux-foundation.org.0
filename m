Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9C6456A85
	for <lists.virtualization@lfdr.de>; Fri, 19 Nov 2021 07:56:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27C0340372;
	Fri, 19 Nov 2021 06:56:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VQgxLdD-gM8n; Fri, 19 Nov 2021 06:56:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A9FC840580;
	Fri, 19 Nov 2021 06:56:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0CB6CC0032;
	Fri, 19 Nov 2021 06:56:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2AB3C0012
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 06:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F9BF4096F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 06:56:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fY_gfEW6J2I
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 06:56:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B276E4095F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Nov 2021 06:56:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F18E168AFE; Fri, 19 Nov 2021 07:56:45 +0100 (CET)
Date: Fri, 19 Nov 2021 07:56:45 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH 01/29] nvdimm/pmem: move dax_attribute_group from dax
 to pmem
Message-ID: <20211119065645.GB15524@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
 <20211109083309.584081-2-hch@lst.de>
 <CAPcyv4ijKTcABMs2tZEuPWo1WDOux+4XWN=DNF5v8SrQRSbfDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4ijKTcABMs2tZEuPWo1WDOux+4XWN=DNF5v8SrQRSbfDg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, Mike Snitzer <snitzer@redhat.com>,
 linux-s390 <linux-s390@vger.kernel.org>, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org,
 linux-xfs <linux-xfs@vger.kernel.org>,
 device-mapper development <dm-devel@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-ext4 <linux-ext4@vger.kernel.org>, Ira Weiny <ira.weiny@intel.com>,
 Christoph Hellwig <hch@lst.de>
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

On Wed, Nov 17, 2021 at 09:44:25AM -0800, Dan Williams wrote:
> On Tue, Nov 9, 2021 at 12:33 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > dax_attribute_group is only used by the pmem driver, and can avoid the
> > completely pointless lookup by the disk name if moved there.  This
> > leaves just a single caller of dax_get_by_host, so move dax_get_by_host
> > into the same ifdef block as that caller.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> > Link: https://lore.kernel.org/r/20210922173431.2454024-3-hch@lst.de
> > Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> 
> This one already made v5.16-rc1.

Yes, but 5.16-rc1 did not exist yet when I pointed the series.

Note that the series also has a conflict against 5.16-rc1 in pmem.c,
and buildbot pointed out the file systems need explicit dax.h
includes in a few files for some configurations.

The current branch is here, I just did not bother to repost without
any comments:

   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dax-block-cleanup

no functional changes.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
