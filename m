Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBF3DFF2B
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 12:11:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3801F83AF2;
	Wed,  4 Aug 2021 10:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YxNT7-ch3Ub9; Wed,  4 Aug 2021 10:10:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 016DE83AF1;
	Wed,  4 Aug 2021 10:10:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 80486C001F;
	Wed,  4 Aug 2021 10:10:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C2F2C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D8A360685
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xizxmZzIEDVW
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD6DA60647
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=GMfM9EsZUBHncaik750rjQrck1K0EDt7Zyd8DyDsQR8=; b=tr+JWjNanWktxua2tu8KBEVQPM
 VyctgS15pe259rzKfF5Cnl9zsGOZwGuYm9KKXEG9KkVU/OXjXmoutUxD3KtVa1hc7sIzDOL0xBHg6
 ouWKg49YE/w0a3I/5CyE5im2/IkgIt5h36qDG6iEVKLdm0bYYEaWZQNNpQ3/ly3BhHTT+VGChTRSA
 t1t4AV538fKbiuL2Yzgst/hi/JUFHCOzwHqdzg8ut46IDHJ3Z60UfyB0/ffmOuu7Ku3k+weyK559G
 73X58xMPec7XJUSNLOyS/qJ7yYdzHQEljjfYG426vMaByMMBIZ1fvI2CSO1n9hwhGNLZQ/aY/Dvn+
 uR6ZApew==;
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBDoj-005g7I-Ho; Wed, 04 Aug 2021 10:08:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 15/15] nvme: use bvec_virt
Date: Wed,  4 Aug 2021 11:56:34 +0200
Message-Id: <20210804095634.460779-16-hch@lst.de>
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
 drivers/nvme/host/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index dfd9dec0c1f6..02ce94b2906b 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -968,12 +968,11 @@ void nvme_cleanup_cmd(struct request *req)
 {
 	if (req->rq_flags & RQF_SPECIAL_PAYLOAD) {
 		struct nvme_ctrl *ctrl = nvme_req(req)->ctrl;
-		struct page *page = req->special_vec.bv_page;
 
-		if (page == ctrl->discard_page)
+		if (req->special_vec.bv_page == ctrl->discard_page)
 			clear_bit_unlock(0, &ctrl->discard_page_busy);
 		else
-			kfree(page_address(page) + req->special_vec.bv_offset);
+			kfree(bvec_virt(&req->special_vec));
 	}
 }
 EXPORT_SYMBOL_GPL(nvme_cleanup_cmd);
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
