Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 48838689CBC
	for <lists.virtualization@lfdr.de>; Fri,  3 Feb 2023 16:07:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18A1A82202;
	Fri,  3 Feb 2023 15:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18A1A82202
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U7gHGI4+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KCVQhsnhwIq6; Fri,  3 Feb 2023 15:07:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D66F9821F9;
	Fri,  3 Feb 2023 15:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D66F9821F9
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC5D0C002B;
	Fri,  3 Feb 2023 15:07:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A39CC0032
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:07:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 486F440520
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 486F440520
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U7gHGI4+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WvXzuQf1vqgk
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:07:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A49B6403D6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A49B6403D6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=yYE/od14GoUSfS3SrqxEgI5AwVsNpiRxxWihLgbj1lM=; b=U7gHGI4+jFww+bLgY2qB+UJ4Eb
 YA2OMvfnZAc5GIuqbs0dC0b5/ypXraaHVc3zXOzYoz92nlDl6cc9tfrbD8QiR5RuddFZ/24vxgEs3
 tAQvsBOWvRR4DnM/Ts7iPycHDqB8SLxXBlwRo2qrTh3FfGjdSgSWlLXk/MAT7/txciVBFyq66zTF6
 7jbBNwJc5NB1VF8aIBvk7ciGc/6w/kjvXfgX7GT/MIdD5VzKXBo9WHkJeCcWHzlVRUL3orKCIcveH
 k3IsETytcOcYa4M7MebhZowmCK48eVnfXowJXtyuxT4UQQZueio9wZREhVWDQtXDqeIGzpsaH3iWh
 VhCYEFnw==;
Received: from [2001:4bb8:19a:272a:910:bb67:7287:f956] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNxeO-002aht-77; Fri, 03 Feb 2023 15:06:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 05/23] target: use bvec_set_page to initialize bvecs
Date: Fri,  3 Feb 2023 16:06:16 +0100
Message-Id: <20230203150634.3199647-6-hch@lst.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230203150634.3199647-1-hch@lst.de>
References: <20230203150634.3199647-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 Eric Dumazet <edumazet@google.com>, target-devel@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 Sagi Grimberg <sagi@grimberg.me>, linux-scsi@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, io-uring@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Ilya Dryomov <idryomov@gmail.com>,
 Paolo Abeni <pabeni@redhat.com>, devel@lists.orangefs.org,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 ceph-devel@vger.kernel.org, Xiubo Li <xiubli@redhat.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>, linux-nfs@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Chuck Lever <chuck.lever@oracle.com>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
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

Use the bvec_set_page helper to initialize bvecs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
---
 drivers/target/target_core_file.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/target/target_core_file.c b/drivers/target/target_core_file.c
index fd584111da45c0..ce0e000b74fc39 100644
--- a/drivers/target/target_core_file.c
+++ b/drivers/target/target_core_file.c
@@ -281,10 +281,8 @@ fd_execute_rw_aio(struct se_cmd *cmd, struct scatterlist *sgl, u32 sgl_nents,
 		return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
 
 	for_each_sg(sgl, sg, sgl_nents, i) {
-		aio_cmd->bvecs[i].bv_page = sg_page(sg);
-		aio_cmd->bvecs[i].bv_len = sg->length;
-		aio_cmd->bvecs[i].bv_offset = sg->offset;
-
+		bvec_set_page(&aio_cmd->bvecs[i], sg_page(sg), sg->length,
+			      sg->offset);
 		len += sg->length;
 	}
 
@@ -329,10 +327,7 @@ static int fd_do_rw(struct se_cmd *cmd, struct file *fd,
 	}
 
 	for_each_sg(sgl, sg, sgl_nents, i) {
-		bvec[i].bv_page = sg_page(sg);
-		bvec[i].bv_len = sg->length;
-		bvec[i].bv_offset = sg->offset;
-
+		bvec_set_page(&bvec[i], sg_page(sg), sg->length, sg->offset);
 		len += sg->length;
 	}
 
@@ -465,10 +460,9 @@ fd_execute_write_same(struct se_cmd *cmd)
 		return TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
 
 	for (i = 0; i < nolb; i++) {
-		bvec[i].bv_page = sg_page(&cmd->t_data_sg[0]);
-		bvec[i].bv_len = cmd->t_data_sg[0].length;
-		bvec[i].bv_offset = cmd->t_data_sg[0].offset;
-
+		bvec_set_page(&bvec[i], sg_page(&cmd->t_data_sg[0]),
+			      cmd->t_data_sg[0].length,
+			      cmd->t_data_sg[0].offset);
 		len += se_dev->dev_attrib.block_size;
 	}
 
-- 
2.39.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
