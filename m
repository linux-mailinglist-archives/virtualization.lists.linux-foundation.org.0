Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74546E2A9
	for <lists.virtualization@lfdr.de>; Thu,  9 Dec 2021 07:38:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E16D580CF0;
	Thu,  9 Dec 2021 06:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VDYz0ycZaTNr; Thu,  9 Dec 2021 06:38:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A0E1680D61;
	Thu,  9 Dec 2021 06:38:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7EA2FC0074;
	Thu,  9 Dec 2021 06:38:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 231D8C0012
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 006DC40287
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:38:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ktV_IZAgt9Ep
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:38:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 372AA40255
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Dec 2021 06:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=FsKxqxdl8RTXcrCs1taUxZX0xPB0YfyR2WAofanQv4c=; b=tzpxlQNVdQARHgzFox9EjzDlBK
 9P+xRXtYPujeFPWYpeurA29pUG8mUzk/k+CsiWYISNnVPI59NE+rItNPJgjpZg0Xx3JLa0GYYmREE
 U83TqGcX5d0wkYMpkNMh6n2Yi19PKjrCihpuwh+hSzjDj48DKutqXSiJegcVKMgKIW4oON55iiGuG
 DucCpb6/XVUxO2AdqunqblMHeGV0z8ZwK355niJbK9AmVZwYlgw+6pevLVykXYDS9I/L6fuXzp97h
 Gpe9msGNLo8vCUCSYqouP8FiqLWO23mfMta22uYbqShgkg4TL1+KUI4oAPkooooZrdJYp/3kINKRi
 PSDwAhBg==;
Received: from [2001:4bb8:180:a1c8:2d0e:135:af53:41f8] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvD4W-0096hM-8N; Thu, 09 Dec 2021 06:38:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>
Subject: devirtualize kernel access to DAX
Date: Thu,  9 Dec 2021 07:38:23 +0100
Message-Id: <20211209063828.18944-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, dm-devel@redhat.com,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Alasdair Kergon <agk@redhat.com>
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

Hi Dan,

this series cleans up a few loose end ends and then removes the
copy_from_iter and copy_to_iter dax_operations methods in favor of
straight calls.

Diffstat:
 drivers/dax/bus.c             |    3 +
 drivers/dax/super.c           |   40 ++++++++++++++-------
 drivers/md/dm-linear.c        |   20 ----------
 drivers/md/dm-log-writes.c    |   80 ------------------------------------------
 drivers/md/dm-stripe.c        |   20 ----------
 drivers/md/dm.c               |   52 ---------------------------
 drivers/nvdimm/pmem.c         |   27 +-------------
 drivers/s390/block/dcssblk.c  |   18 +--------
 fs/dax.c                      |    5 --
 fs/fuse/virtio_fs.c           |   20 +---------
 include/linux/dax.h           |   28 +++-----------
 include/linux/device-mapper.h |    4 --
 include/linux/uio.h           |   20 ----------
 13 files changed, 44 insertions(+), 293 deletions(-)
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
