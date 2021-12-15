Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F8B475485
	for <lists.virtualization@lfdr.de>; Wed, 15 Dec 2021 09:45:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4044063A;
	Wed, 15 Dec 2021 08:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XO6_jmAKsYws; Wed, 15 Dec 2021 08:45:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 2EE0440930;
	Wed, 15 Dec 2021 08:45:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D3F73C0012;
	Wed, 15 Dec 2021 08:45:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93FD7C0076
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D95E4017C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LWiQPzmQOp0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BD57401D5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Dec 2021 08:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=VXKioZ0ngoixOlm9kT8gh2Q90Eu49c6nMILczVXudqY=; b=raIsqHeM4Y1pfVgeeUOSwXtAMx
 qBAQEOD7u2jKJL1ZSiu3d1BrypKgVr8kfS1wGkb9hJgDb8kLsAnp15ZIe2jkijm+0eOnpdXAch+D9
 ivMQU/ollM0OOOJQGxTJVQ4yN4KQc/Gj3UCKeBLduADpRtifx3l38Vuq8Ivbz3eTxEEuau/4tq7YH
 2xIeyd/LKfmB7Ukv2Rc+0cEjbNsbhKl7EkcRoCtwMKCunMx1/LIP8Y4du5SlP8WCxpQuVkzlsgVYC
 K32iygjSxtMTVs3tlk8uLCbnLcvZO2A6UHCDWULQwiwuZHqR337LW03AlVMNpc/3KTQcvDdaqM4a3
 0GcUTEcA==;
Received: from [2001:4bb8:184:5c65:c56:ed89:c020:6100] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxPuR-00ETyk-Ma; Wed, 15 Dec 2021 08:45:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>
Subject: [PATCH 2/4] dax: simplify dax_synchronous and set_dax_synchronous
Date: Wed, 15 Dec 2021 09:45:06 +0100
Message-Id: <20211215084508.435401-3-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211215084508.435401-1-hch@lst.de>
References: <20211215084508.435401-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta@ionos.com>, Matthew Wilcox <willy@infradead.org>,
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

Remove the pointless wrappers.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
---
 drivers/dax/super.c |  8 ++++----
 include/linux/dax.h | 12 ++----------
 2 files changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index e7152a6c4cc40..e18155f43a635 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -208,17 +208,17 @@ bool dax_write_cache_enabled(struct dax_device *dax_dev)
 }
 EXPORT_SYMBOL_GPL(dax_write_cache_enabled);
 
-bool __dax_synchronous(struct dax_device *dax_dev)
+bool dax_synchronous(struct dax_device *dax_dev)
 {
 	return test_bit(DAXDEV_SYNC, &dax_dev->flags);
 }
-EXPORT_SYMBOL_GPL(__dax_synchronous);
+EXPORT_SYMBOL_GPL(dax_synchronous);
 
-void __set_dax_synchronous(struct dax_device *dax_dev)
+void set_dax_synchronous(struct dax_device *dax_dev)
 {
 	set_bit(DAXDEV_SYNC, &dax_dev->flags);
 }
-EXPORT_SYMBOL_GPL(__set_dax_synchronous);
+EXPORT_SYMBOL_GPL(set_dax_synchronous);
 
 bool dax_alive(struct dax_device *dax_dev)
 {
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 87ae4c9b1d65b..3bd1fdb5d5f4b 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -48,16 +48,8 @@ void put_dax(struct dax_device *dax_dev);
 void kill_dax(struct dax_device *dax_dev);
 void dax_write_cache(struct dax_device *dax_dev, bool wc);
 bool dax_write_cache_enabled(struct dax_device *dax_dev);
-bool __dax_synchronous(struct dax_device *dax_dev);
-static inline bool dax_synchronous(struct dax_device *dax_dev)
-{
-	return  __dax_synchronous(dax_dev);
-}
-void __set_dax_synchronous(struct dax_device *dax_dev);
-static inline void set_dax_synchronous(struct dax_device *dax_dev)
-{
-	__set_dax_synchronous(dax_dev);
-}
+bool dax_synchronous(struct dax_device *dax_dev);
+void set_dax_synchronous(struct dax_device *dax_dev);
 /*
  * Check if given mapping is supported by the file / underlying device.
  */
-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
