Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 398841E8C40
	for <lists.virtualization@lfdr.de>; Sat, 30 May 2020 01:43:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E5A9C261B4;
	Fri, 29 May 2020 23:43:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arG0uR1fWY-R; Fri, 29 May 2020 23:43:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7362F261F8;
	Fri, 29 May 2020 23:43:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 57741C07FF;
	Fri, 29 May 2020 23:43:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0BF88C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id AA67F89434
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qZRItbhqN5oL
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7A848893EE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 29 May 2020 23:43:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ed19db30001>; Fri, 29 May 2020 16:41:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 29 May 2020 16:43:11 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 29 May 2020 16:43:11 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 29 May
 2020 23:43:11 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 29 May 2020 23:43:11 +0000
Received: from sandstorm.nvidia.com (Not Verified[10.2.87.173]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ed19e0f0002>; Fri, 29 May 2020 16:43:11 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 2/2] vhost: convert get_user_pages() --> pin_user_pages()
Date: Fri, 29 May 2020 16:43:09 -0700
Message-ID: <20200529234309.484480-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200529234309.484480-1-jhubbard@nvidia.com>
References: <20200529234309.484480-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590795699; bh=w393fB7aMdfV2Mn/9DhXAANTn2k/9wVRvrXDZ4wAcPA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=AIidyHaKCFf7Kb9AMouG61nHIQlapNE9AiLsib0QpCDzLvsTwwBRUeW/4GekCvb7F
 smypOSFVsFd+3nRh66RM2eztwXbwv34HZFIIxCxH6UUi9Vfk+SuxiFXQ65SN4/Oyec
 t0wmLYAFAUh8q/OQuepY8cNQQSVBaoRKNXM+2ZyKvm/br5zGAy7GAmhlyThqdzI8F4
 gGIm7rRrqWBXbXJDWLRUKD+2zTb2K76ePxs13DoVdpK+OGjEjrJpmQMXEgxYczFvxI
 h/SDh/NadxwC+Ci7m6OF9cb0f6gLx/1Rhdpx54yYTuyHd+F9BjdY3kDrKXOQg2JVnE
 /C86UeF1NcgJA==
Cc: Jan Kara <jack@suse.cz>, linux-doc@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Dave Chinner <david@fromorbit.com>,
 LKML <linux-kernel@vger.kernel.org>, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Souptick Joarder <jrdr.linux@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 linux-fsdevel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>
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

This code was using get_user_pages*(), in approximately a "Case 5"
scenario (accessing the data within a page), using the categorization
from [1]. That means that it's time to convert the get_user_pages*() +
put_page() calls to pin_user_pages*() + unpin_user_pages() calls.

There is some helpful background in [2]: basically, this is a small
part of fixing a long-standing disconnect between pinning pages, and
file systems' use of those pages.

[1] Documentation/core-api/pin_user_pages.rst

[2] "Explicit pinning of user-space pages":
    https://lwn.net/Articles/807108/

Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: kvm@vger.kernel.org
Cc: virtualization@lists.linux-foundation.org
Cc: netdev@vger.kernel.org
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/vhost/vhost.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 21a59b598ed8..596132a96cd5 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -1762,15 +1762,14 @@ static int set_bit_to_user(int nr, void __user *addr)
 	int bit = nr + (log % PAGE_SIZE) * 8;
 	int r;
 
-	r = get_user_pages_fast(log, 1, FOLL_WRITE, &page);
+	r = pin_user_pages_fast(log, 1, FOLL_WRITE, &page);
 	if (r < 0)
 		return r;
 	BUG_ON(r != 1);
 	base = kmap_atomic(page);
 	set_bit(bit, base);
 	kunmap_atomic(base);
-	set_page_dirty_lock(page);
-	put_page(page);
+	unpin_user_pages_dirty_lock(&page, 1, true);
 	return 0;
 }
 
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
