Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 768C644A8BA
	for <lists.virtualization@lfdr.de>; Tue,  9 Nov 2021 09:34:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FBF840341;
	Tue,  9 Nov 2021 08:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-9GJlUlK8qL; Tue,  9 Nov 2021 08:34:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 63EDC4033C;
	Tue,  9 Nov 2021 08:34:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37F44C000E;
	Tue,  9 Nov 2021 08:34:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 526CEC000E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3368F6077B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cNg8UG1cPR3r
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6891B60788
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+scVZaxx4kcvp0Cboq1Z7TDSMt9zURLxK3cUHRmeCJY=; b=TVkdImeUmftPM79g0PQhq20Ta/
 RuxJyo/av4rpO9uxXtuLKWWoEXVONWEOL7vNvV5s8fmK01QKc9v6zFnOGpWQ8veO3PW41Veas6UZd
 7vhJhKrargNEMiZSeZbpl5goXtJhQ1blmw3uTTLPOrnp4Ylr6Mkbdrwjsy2aUO2KGzReNWaN7T1RT
 1vs5j3lyh+OmWzCpqYO62KgdQupFc3i8JBAmq1ShrHT1uqi9w8d7WcG88O26dMVcPidYVh2zNjS3K
 Y3ydrmz/SGcOgWBJAkmvOjEGIncW+Ke5rV/nj/tmVsx9UIkM/+3rpVyE4E6+uyOWiKc8zys52VYQe
 9itJrl+Q==;
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMZh-000s7y-MB; Tue, 09 Nov 2021 08:33:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 21/29] xfs: move dax device handling into xfs_{alloc,
 free}_buftarg
Date: Tue,  9 Nov 2021 09:33:01 +0100
Message-Id: <20211109083309.584081-22-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211109083309.584081-1-hch@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 virtualization@lists.linux-foundation.org, linux-xfs@vger.kernel.org,
 dm-devel@redhat.com, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>
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

Hide the DAX device lookup from the xfs_super.c code.

Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_buf.c   |  8 ++++----
 fs/xfs/xfs_buf.h   |  4 ++--
 fs/xfs/xfs_super.c | 26 +++++---------------------
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 631c5a61d89b7..4d4553ffa7050 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1892,6 +1892,7 @@ xfs_free_buftarg(
 	list_lru_destroy(&btp->bt_lru);
 
 	blkdev_issue_flush(btp->bt_bdev);
+	fs_put_dax(btp->bt_daxdev);
 
 	kmem_free(btp);
 }
@@ -1932,11 +1933,10 @@ xfs_setsize_buftarg_early(
 	return xfs_setsize_buftarg(btp, bdev_logical_block_size(bdev));
 }
 
-xfs_buftarg_t *
+struct xfs_buftarg *
 xfs_alloc_buftarg(
 	struct xfs_mount	*mp,
-	struct block_device	*bdev,
-	struct dax_device	*dax_dev)
+	struct block_device	*bdev)
 {
 	xfs_buftarg_t		*btp;
 
@@ -1945,7 +1945,7 @@ xfs_alloc_buftarg(
 	btp->bt_mount = mp;
 	btp->bt_dev =  bdev->bd_dev;
 	btp->bt_bdev = bdev;
-	btp->bt_daxdev = dax_dev;
+	btp->bt_daxdev = fs_dax_get_by_bdev(bdev);
 
 	/*
 	 * Buffer IO error rate limiting. Limit it to no more than 10 messages
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 6b0200b8007d1..bd7f709f0d232 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -338,8 +338,8 @@ xfs_buf_update_cksum(struct xfs_buf *bp, unsigned long cksum_offset)
 /*
  *	Handling of buftargs.
  */
-extern struct xfs_buftarg *xfs_alloc_buftarg(struct xfs_mount *,
-		struct block_device *, struct dax_device *);
+struct xfs_buftarg *xfs_alloc_buftarg(struct xfs_mount *mp,
+		struct block_device *bdev);
 extern void xfs_free_buftarg(struct xfs_buftarg *);
 extern void xfs_buftarg_wait(struct xfs_buftarg *);
 extern void xfs_buftarg_drain(struct xfs_buftarg *);
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 3a45d5caa28d5..7262716afb215 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -391,26 +391,19 @@ STATIC void
 xfs_close_devices(
 	struct xfs_mount	*mp)
 {
-	struct dax_device *dax_ddev = mp->m_ddev_targp->bt_daxdev;
-
 	if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp) {
 		struct block_device *logdev = mp->m_logdev_targp->bt_bdev;
-		struct dax_device *dax_logdev = mp->m_logdev_targp->bt_daxdev;
 
 		xfs_free_buftarg(mp->m_logdev_targp);
 		xfs_blkdev_put(logdev);
-		fs_put_dax(dax_logdev);
 	}
 	if (mp->m_rtdev_targp) {
 		struct block_device *rtdev = mp->m_rtdev_targp->bt_bdev;
-		struct dax_device *dax_rtdev = mp->m_rtdev_targp->bt_daxdev;
 
 		xfs_free_buftarg(mp->m_rtdev_targp);
 		xfs_blkdev_put(rtdev);
-		fs_put_dax(dax_rtdev);
 	}
 	xfs_free_buftarg(mp->m_ddev_targp);
-	fs_put_dax(dax_ddev);
 }
 
 /*
@@ -428,8 +421,6 @@ xfs_open_devices(
 	struct xfs_mount	*mp)
 {
 	struct block_device	*ddev = mp->m_super->s_bdev;
-	struct dax_device	*dax_ddev = fs_dax_get_by_bdev(ddev);
-	struct dax_device	*dax_logdev = NULL, *dax_rtdev = NULL;
 	struct block_device	*logdev = NULL, *rtdev = NULL;
 	int			error;
 
@@ -439,8 +430,7 @@ xfs_open_devices(
 	if (mp->m_logname) {
 		error = xfs_blkdev_get(mp, mp->m_logname, &logdev);
 		if (error)
-			goto out;
-		dax_logdev = fs_dax_get_by_bdev(logdev);
+			return error;
 	}
 
 	if (mp->m_rtname) {
@@ -454,25 +444,24 @@ xfs_open_devices(
 			error = -EINVAL;
 			goto out_close_rtdev;
 		}
-		dax_rtdev = fs_dax_get_by_bdev(rtdev);
 	}
 
 	/*
 	 * Setup xfs_mount buffer target pointers
 	 */
 	error = -ENOMEM;
-	mp->m_ddev_targp = xfs_alloc_buftarg(mp, ddev, dax_ddev);
+	mp->m_ddev_targp = xfs_alloc_buftarg(mp, ddev);
 	if (!mp->m_ddev_targp)
 		goto out_close_rtdev;
 
 	if (rtdev) {
-		mp->m_rtdev_targp = xfs_alloc_buftarg(mp, rtdev, dax_rtdev);
+		mp->m_rtdev_targp = xfs_alloc_buftarg(mp, rtdev);
 		if (!mp->m_rtdev_targp)
 			goto out_free_ddev_targ;
 	}
 
 	if (logdev && logdev != ddev) {
-		mp->m_logdev_targp = xfs_alloc_buftarg(mp, logdev, dax_logdev);
+		mp->m_logdev_targp = xfs_alloc_buftarg(mp, logdev);
 		if (!mp->m_logdev_targp)
 			goto out_free_rtdev_targ;
 	} else {
@@ -488,14 +477,9 @@ xfs_open_devices(
 	xfs_free_buftarg(mp->m_ddev_targp);
  out_close_rtdev:
 	xfs_blkdev_put(rtdev);
-	fs_put_dax(dax_rtdev);
  out_close_logdev:
-	if (logdev && logdev != ddev) {
+	if (logdev && logdev != ddev)
 		xfs_blkdev_put(logdev);
-		fs_put_dax(dax_logdev);
-	}
- out:
-	fs_put_dax(dax_ddev);
 	return error;
 }
 
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
