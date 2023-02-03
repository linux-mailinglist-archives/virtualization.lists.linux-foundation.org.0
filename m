Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B70689CC7
	for <lists.virtualization@lfdr.de>; Fri,  3 Feb 2023 16:08:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 914E0612E9;
	Fri,  3 Feb 2023 15:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 914E0612E9
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=41bYhxy4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rPgl1mjLgj9a; Fri,  3 Feb 2023 15:08:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 60F55612EC;
	Fri,  3 Feb 2023 15:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60F55612EC
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED50AC0083;
	Fri,  3 Feb 2023 15:08:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 031BDC0032
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDC9B821E8
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:08:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC9B821E8
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20210309 header.b=41bYhxy4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QskK7MKn_DqY
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:08:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 296A3821E6
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 296A3821E6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Feb 2023 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=kORmqO/9LhO3glrNFnQu4Hg9yMGINb4dC3Y3cN2SyCY=; b=41bYhxy4j/IlMzxFEoHx+Uxb/Q
 AoA7/uGEehM9h47lmjn1p7wMCxt9YN2chQRTwM9T0U2R33+6P5uw3dFU034X2phyy1FaKZr6D6uZm
 Iyou7KFZCyjd3dhhg9p+jbvkL4Nxb6yurGLVKQNvr7SNXOMsbnNpwH65HvZRyfpPA1+nugxrw2oX8
 3pBDdo50wrWXKZ0GhYhG/bn2vy2Q2l9fNSxBr73HSlVDIWqwtCuv2e6F0W3sVOzyMhe3c85OjeDqi
 nGFDVsH+onY5nUtibJnC/vm3UzB7E89Fvv+DR2t9yt7brPMGQYvg04XXc1+uC6uVfGrrzMou4bMyC
 6VNrGmvQ==;
Received: from [2001:4bb8:19a:272a:910:bb67:7287:f956] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1pNxf1-002b5b-7k; Fri, 03 Feb 2023 15:07:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 16/23] orangefs: use bvec_set_{page, folio} to initialize bvecs
Date: Fri,  3 Feb 2023 16:06:27 +0100
Message-Id: <20230203150634.3199647-17-hch@lst.de>
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

Use the bvec_set_page and bvec_set_folio helpers to initialize bvecs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/orangefs/inode.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index 4df56089438664..215f6cb3dc4129 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -49,10 +49,8 @@ static int orangefs_writepage_locked(struct page *page,
 	/* Should've been handled in orangefs_invalidate_folio. */
 	WARN_ON(off == len || off + wlen > len);
 
-	bv.bv_page = page;
-	bv.bv_len = wlen;
-	bv.bv_offset = off % PAGE_SIZE;
 	WARN_ON(wlen == 0);
+	bvec_set_page(&bv, page, wlen, off % PAGE_SIZE);
 	iov_iter_bvec(&iter, ITER_SOURCE, &bv, 1, wlen);
 
 	ret = wait_for_direct_io(ORANGEFS_IO_WRITE, inode, &off, &iter, wlen,
@@ -102,15 +100,11 @@ static int orangefs_writepages_work(struct orangefs_writepages *ow,
 
 	for (i = 0; i < ow->npages; i++) {
 		set_page_writeback(ow->pages[i]);
-		ow->bv[i].bv_page = ow->pages[i];
-		ow->bv[i].bv_len = min(page_offset(ow->pages[i]) + PAGE_SIZE,
-		    ow->off + ow->len) -
-		    max(ow->off, page_offset(ow->pages[i]));
-		if (i == 0)
-			ow->bv[i].bv_offset = ow->off -
-			    page_offset(ow->pages[i]);
-		else
-			ow->bv[i].bv_offset = 0;
+		bvec_set_page(&ow->bv[i], ow->pages[i],
+			      min(page_offset(ow->pages[i]) + PAGE_SIZE,
+			          ow->off + ow->len) -
+			      max(ow->off, page_offset(ow->pages[i])),
+			      i == 0 ? ow->off - page_offset(ow->pages[i]) : 0);
 	}
 	iov_iter_bvec(&iter, ITER_SOURCE, ow->bv, ow->npages, ow->len);
 
@@ -300,9 +294,7 @@ static int orangefs_read_folio(struct file *file, struct folio *folio)
 		orangefs_launder_folio(folio);
 
 	off = folio_pos(folio);
-	bv.bv_page = &folio->page;
-	bv.bv_len = folio_size(folio);
-	bv.bv_offset = 0;
+	bvec_set_folio(&bv, folio, folio_size(folio), 0);
 	iov_iter_bvec(&iter, ITER_DEST, &bv, 1, folio_size(folio));
 
 	ret = wait_for_direct_io(ORANGEFS_IO_READ, inode, &off, &iter,
-- 
2.39.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
