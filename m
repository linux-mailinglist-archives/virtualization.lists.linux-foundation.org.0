Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF023DFF29
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 12:10:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0CE574011B;
	Wed,  4 Aug 2021 10:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EQueQylwqVhK; Wed,  4 Aug 2021 10:10:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4E6AD403EF;
	Wed,  4 Aug 2021 10:10:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38BD4C0025;
	Wed,  4 Aug 2021 10:10:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3F1BC000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 914C0606EB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 03BvB-R79TLt
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED4CB60685
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=6DgUtwKNyR1a0g7YYdfnNpZ/CC1UQP+ErbVil3kCh1c=; b=hZg7Heuoi1cW7PM8NkA+rSJm9t
 I2KlL1Sq8tSDfak/FYjW0iTlFpdM5JzQt+VxoIwm3u6Cf0t5JALt5DeWfL4rLzTCjZs067eyLYZLM
 oAktJ5QR1BLAByF6wFWgdt4Vf1Khj9xH1AL98dEMW+T87DmVpV4fRP4C7bDFj9sy6O3iVhyU//xl6
 P6JCchl+81L6Iok4jXIyH34HXYiPyikdLQOYd+laX0rbeAjKMSfl89ueQtR3ycxjZ4FbfjSD8Ew5Y
 CAibi0DxATQ3bTiNdF5b7p1AIZ6NMjq/rlAWEiXu+FBq1odEVzUr/20Am2cHt5372vzKoxOhgZisY
 TVzqe11g==;
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBDnx-005g2S-Sm; Wed, 04 Aug 2021 10:07:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 14/15] dcssblk: use bvec_virt
Date: Wed,  4 Aug 2021 11:56:33 +0200
Message-Id: <20210804095634.460779-15-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804095634.460779-1-hch@lst.de>
References: <20210804095634.460779-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: Jan Hoeppner <hoeppner@linux.ibm.com>, Mike Snitzer <snitzer@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 Song Liu <song@kernel.org>, dm-devel@redhat.com,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Ilya Dryomov <idryomov@gmail.com>, linux-um@lists.infradead.org,
 Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, Stefan Haberland <sth@linux.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 ceph-devel@vger.kernel.org, linux-block@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, Phillip Lougher <phillip@squashfs.org.uk>
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

Use bvec_virt instead of open coding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/s390/block/dcssblk.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/s390/block/dcssblk.c b/drivers/s390/block/dcssblk.c
index 29180bdf0977..5be3d1c39a78 100644
--- a/drivers/s390/block/dcssblk.c
+++ b/drivers/s390/block/dcssblk.c
@@ -892,8 +892,7 @@ dcssblk_submit_bio(struct bio *bio)
 
 	index = (bio->bi_iter.bi_sector >> 3);
 	bio_for_each_segment(bvec, bio, iter) {
-		page_addr = (unsigned long)
-			page_address(bvec.bv_page) + bvec.bv_offset;
+		page_addr = (unsigned long)bvec_virt(&bvec);
 		source_addr = dev_info->start + (index<<12) + bytes_done;
 		if (unlikely((page_addr & 4095) != 0) || (bvec.bv_len & 4095) != 0)
 			// More paranoia.
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
