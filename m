Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765644A8B9
	for <lists.virtualization@lfdr.de>; Tue,  9 Nov 2021 09:34:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66E4780ED7;
	Tue,  9 Nov 2021 08:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HTxJvsBkZ0ZJ; Tue,  9 Nov 2021 08:34:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1CB6C80EDC;
	Tue,  9 Nov 2021 08:34:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6A95C0039;
	Tue,  9 Nov 2021 08:34:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF793C001F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC895402FE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8TJL9v9m9Se
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBFE74031E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Nov 2021 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=w7OlGcun90+irmAPYzmTcZBOPYBcRc9XENfZ6+Mb9vU=; b=jWJH7gRabA1nTyzMlvOyrMmL6A
 d1snCm4OAtdG9l96Fl8SdKPajWndw2wLlbGdJcqzIZuESJlOdHsiUq58YLz9LH9Mlp11mSyTq/37f
 Gi5Fa9czKxgBGgLurjuhXBCqhQIk4HYDrJnbGc3S00AjlhI2SdXjzPkKbqK8qebbUvMI1X9wwVq1t
 f0JNoiiUP0y6wny2CDC5c6gmSjssHyPwLn85K617F9BzrxUekruJ3zUtV7YSU7uoqQs4ZIlHoyAFH
 JXb42BtJPPQnrHsObmA6aGnKjFyz7ZK36uY2Eok7JXO3qbtMsmSl0/btVmQrUctSho4PyptJVK4HM
 KAEOcvJw==;
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMZe-000s6P-H3; Tue, 09 Nov 2021 08:33:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH 19/29] ext2: cleanup the dax handling in ext2_fill_super
Date: Tue,  9 Nov 2021 09:32:59 +0100
Message-Id: <20211109083309.584081-20-hch@lst.de>
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

Only call fs_dax_get_by_bdev once the sbi has been allocated and remove
the need for the dax_dev local variable.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext2/super.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/fs/ext2/super.c b/fs/ext2/super.c
index a964066a80aa7..7e23482862e69 100644
--- a/fs/ext2/super.c
+++ b/fs/ext2/super.c
@@ -802,7 +802,6 @@ static unsigned long descriptor_loc(struct super_block *sb,
 
 static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 {
-	struct dax_device *dax_dev = fs_dax_get_by_bdev(sb->s_bdev);
 	struct buffer_head * bh;
 	struct ext2_sb_info * sbi;
 	struct ext2_super_block * es;
@@ -822,17 +821,17 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 
 	sbi = kzalloc(sizeof(*sbi), GFP_KERNEL);
 	if (!sbi)
-		goto failed;
+		return -ENOMEM;
 
 	sbi->s_blockgroup_lock =
 		kzalloc(sizeof(struct blockgroup_lock), GFP_KERNEL);
 	if (!sbi->s_blockgroup_lock) {
 		kfree(sbi);
-		goto failed;
+		return -ENOMEM;
 	}
 	sb->s_fs_info = sbi;
 	sbi->s_sb_block = sb_block;
-	sbi->s_daxdev = dax_dev;
+	sbi->s_daxdev = fs_dax_get_by_bdev(sb->s_bdev);
 
 	spin_lock_init(&sbi->s_lock);
 	ret = -EINVAL;
@@ -946,7 +945,7 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 	blocksize = BLOCK_SIZE << le32_to_cpu(sbi->s_es->s_log_block_size);
 
 	if (test_opt(sb, DAX)) {
-		if (!dax_dev) {
+		if (!sbi->s_daxdev) {
 			ext2_msg(sb, KERN_ERR,
 				"DAX unsupported by block device. Turning off DAX.");
 			clear_opt(sbi->s_mount_opt, DAX);
@@ -1201,11 +1200,10 @@ static int ext2_fill_super(struct super_block *sb, void *data, int silent)
 failed_mount:
 	brelse(bh);
 failed_sbi:
+	fs_put_dax(sbi->s_daxdev);
 	sb->s_fs_info = NULL;
 	kfree(sbi->s_blockgroup_lock);
 	kfree(sbi);
-failed:
-	fs_put_dax(dax_dev);
 	return ret;
 }
 
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
