Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D893DFEA5
	for <lists.virtualization@lfdr.de>; Wed,  4 Aug 2021 12:01:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C6BD60636;
	Wed,  4 Aug 2021 10:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bHjeDrjkB99A; Wed,  4 Aug 2021 10:01:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1E7FA6061C;
	Wed,  4 Aug 2021 10:01:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AF871C000E;
	Wed,  4 Aug 2021 10:01:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B3D8C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D29540588
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YiPWzonC63WA
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C467C4052F
 for <virtualization@lists.linux-foundation.org>;
 Wed,  4 Aug 2021 10:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=C7BNoQnfAhpf1wqghahug1gwysuiZ4tUzmHR/Uv5INQ=; b=DjcorNtLkts0oP6dnpTQfumsvp
 O2P1/zhII9l+7JUkGtZMN2Pn1xTz0ZLBQgMMVSZityRrbsgwhAkYOjzhRRwjxHzFnaLs33AHuOS0f
 3+v2K+PBrXa476TIP8IbNnljuGnrm+SbD9rl5MQwqfsq2is6VruACOLulFtvIYbB+zAWHWjcwxGNF
 Ew5/GSbbMlxTpikTCQjGda88tmEsu5PwVMA3zd0BwewYOk6UeHdzz7NlslL6lXnktoKPgsn1ZtEU5
 gX4nbrwsXi8O41tKqVUHrft0/km/Fas41l1i1kIVNcS5jAgBmoAAV1jnnV2ZJQO8q54pLY2hOG6nR
 FsMBFdRQ==;
Received: from [2a02:1205:5023:1f80:c068:bd3d:78b3:7d37] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBDfi-005f2N-DE; Wed, 04 Aug 2021 09:59:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Subject: [PATCH 03/15] dm: make EBS depend on !HIGHMEM
Date: Wed,  4 Aug 2021 11:56:22 +0200
Message-Id: <20210804095634.460779-4-hch@lst.de>
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

__ebs_rw_bvec use page_address on the submitted bios data, and thus
can't deal with highmem.  Disable the target on highmem configs.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/Kconfig b/drivers/md/Kconfig
index 0602e82a9516..ecc559c60d40 100644
--- a/drivers/md/Kconfig
+++ b/drivers/md/Kconfig
@@ -340,7 +340,7 @@ config DM_WRITECACHE
 
 config DM_EBS
 	tristate "Emulated block size target (EXPERIMENTAL)"
-	depends on BLK_DEV_DM
+	depends on BLK_DEV_DM && !HIGHMEM
 	select DM_BUFIO
 	help
 	  dm-ebs emulates smaller logical block size on backing devices
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
