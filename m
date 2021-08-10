Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F82B3DFEB4
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 12:02:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C05D240105;
	Wed,  4 Aug 2021 10:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id szV5X8WgPQtt; Wed,  4 Aug 2021 10:01:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6517C40339;
	Wed,  4 Aug 2021 10:01:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1043C001F;
	Wed,  4 Aug 2021 10:01:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3F240C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E4C04058A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bH7J2MxXXYiC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 910CA4052F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=tt1taHmY3o8vbuA2AsPbb7cVrfeK82HOf8oIyKb3FTc=; b=hQD8KAYgeD+mcu3L+5xHSLBo6v
 KqojgNbYvl2wtrtH74G2n7RfNh4yKrQ6VFFH0zqcE312iaQ3rdaOtuiLLhlgi6inMl2tvjqN44r72
 8uFEgjIi2C8hWo+D6boAKH/PyxlyQ5HOTIkyPuBK6Mf0/D9MQC28Vfvk98Wd/tCkX5OPbz8e9hns7
 iFrSC8YNN3h2HIBA7MnCkr1wp7PIx30YO2pOm1Jvv0UyrDjAotS7zcZNT86qxhTcottNy1CIKwe7E
 eBqYoK9R7/9DBi0elNYmpi9Zu1wOHzahpeNqX2Mbv82BVMilP4Ziw9RJf0cJQZV2KmrCwCOqyBakx
 asS/u03g==;
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBDga-005f7A-CF; Wed, 04 Aug 2021 09:59:54 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 04/15] dm-ebs: use bvec_virt
Date: Wed,  4 Aug 2021 11:56:23 +0200
Message-Id: <20210804095634.460779-5-hch@lst.de>
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
 drivers/md/dm-ebs-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-ebs-target.c b/drivers/md/dm-ebs-target.c
index 71475a2410be..0c509dae0ff8 100644
--- a/drivers/md/dm-ebs-target.c
+++ b/drivers/md/dm-ebs-target.c
@@ -74,7 +74,7 @@ static int __ebs_rw_bvec(struct ebs_c *ec, int rw, struct bio_vec *bv, struct bv
 	if (unlikely(!bv->bv_page || !bv_len))
 		return -EIO;
 
-	pa = page_address(bv->bv_page) + bv->bv_offset;
+	pa = bvec_virt(bv);
 
 	/* Handle overlapping page <-> blocks */
 	while (bv_len) {
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
