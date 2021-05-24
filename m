Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C8938EAD6
	for <lists.virtualization@lfdr.de>; Mon, 24 May 2021 16:57:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC76483576;
	Mon, 24 May 2021 14:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2H2nMLHepSZm; Mon, 24 May 2021 14:57:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9108D83155;
	Mon, 24 May 2021 14:57:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 210C8C001C;
	Mon, 24 May 2021 14:57:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BC9D0C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 14:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A270440141
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 14:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qN2ISK2fC1W4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 14:57:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F0D440001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 May 2021 14:57:02 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9AC5068AFE; Mon, 24 May 2021 16:56:55 +0200 (CEST)
Date: Mon, 24 May 2021 16:56:54 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 1/1] virtio: disable partitions scanning for no
 partitions block
Message-ID: <20210524145654.GA2632@lst.de>
References: <20210520133908.98891-1-damtev@yandex-team.ru>
 <20210520133908.98891-2-damtev@yandex-team.ru>
 <YKu4Qovv1KMplifY@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKu4Qovv1KMplifY@stefanha-x1.localdomain>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Yury Kamenev <damtev@yandex-team.ru>, axboe@kernel.dk, mst@redhat.com,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 pbonzini@redhat.com, Lauri Kasanen <cand@gmx.com>
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

On Mon, May 24, 2021 at 03:29:22PM +0100, Stefan Hajnoczi wrote:
> GENHD_FL_NO_PART_SCAN is not used much in other drivers. This makes me
> wonder if the same use case is addressed through other means with SCSI,
> NVMe, etc devices. Maybe Christoph or Jens can weigh in on whether
> adding a bit to disable partition scanning for a virtio-blk fits into
> the big picture?
> 
> Is your goal to avoid accidentally detecting partitions because it's
> confusing when that happens?

I'm really confused what the use case is here.  GENHD_FL_NO_PART_SCAN
has four users:

 - the block core setting it for hidden devices, for which the concept
   of paritions doesn't make sense.  Looking back this should have never
   used GENHD_FL_NO_PART_SCAN, and instead the partition scanning code
   should just check GENHD_FL_HIDDEN as well.
 - mmc uses it for boot partitions and rpmb.  I'm not even sure how
   these can be exposed as block devices as they don't require block
   granularity access IIRC, but if the allow block layer access there
   is no reason to ever set these flags.
 - loop is a bit of a mess.  IIRC the story is that originally the
   loop device did not support partitions, then in 2008 support for
   partitions was added by partitioning the minor number space, and
   then in 2011 support for partitions without that parameter was
   added using a new flag in the loop device creation ioctl that uses
   the extended dev_t space added since.  But even that might be
   something we can handled without that flag without breaking the
   userspace ABI
 - m64card sets it for no good reason at all

In other words: in a perfect would GENHD_FL_NO_PART_SCAN would not
exist, and it certainly should not be added to a new driver, never
mind a protocol.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
