Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6E0439199
	for <lists.virtualization@lfdr.de>; Mon, 25 Oct 2021 10:41:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 597DA40369;
	Mon, 25 Oct 2021 08:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qp-Jf5inuzK8; Mon, 25 Oct 2021 08:41:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2DF9C40368;
	Mon, 25 Oct 2021 08:41:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8876C000E;
	Mon, 25 Oct 2021 08:41:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E5E3C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 08:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D3594032E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 08:41:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dKPK1MMojxC
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 08:41:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3A554025F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 25 Oct 2021 08:41:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A463468B05; Mon, 25 Oct 2021 10:41:05 +0200 (CEST)
Date: Mon, 25 Oct 2021 10:41:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Max Gurtovoy <mgurtovoy@nvidia.com>
Subject: Re: [PATCH] virtio_blk: corrent types for status handling
Message-ID: <20211025084105.GA14544@lst.de>
References: <20211025075825.1603118-1-mst@redhat.com>
 <ed3bcce8-ede4-f4a3-d0a3-91662d5aae4e@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed3bcce8-ede4-f4a3-d0a3-91662d5aae4e@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Jens Axboe <axboe@kernel.dk>, Feng Li <lifeng1519@gmail.com>,
 kernel test robot <lkp@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Israel Rukshin <israelr@nvidia.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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

On Mon, Oct 25, 2021 at 11:24:57AM +0300, Max Gurtovoy wrote:
> Maybe we can compare the returned status to BLK_STS_OK. But I see we don't 
> do it also in NVMe subsystem so I guess we can assume BLK_STS_OK == 0 
> forever.

Jes,  BLK_STS_OK == 0 is an intentional allowed short cut.  It is not
just a block layer design, but part of how the sparse __bitwise__
annotations work.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
