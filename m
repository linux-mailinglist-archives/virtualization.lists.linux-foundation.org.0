Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0AE1CB1F
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 16:57:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6784BD8F;
	Tue, 14 May 2019 14:57:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 49C12AA5
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 14:57:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 00E08893
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 14:57:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EB5A307EA98;
	Tue, 14 May 2019 14:57:46 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (unknown [10.65.16.148])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 966CF5D6A6;
	Tue, 14 May 2019 14:57:23 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-acpi@vger.kernel.org,
	qemu-devel@nongnu.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org
Subject: [PATCH v9 4/7] dm: enable synchronous dax
Date: Tue, 14 May 2019 20:24:19 +0530
Message-Id: <20190514145422.16923-5-pagupta@redhat.com>
In-Reply-To: <20190514145422.16923-1-pagupta@redhat.com>
References: <20190514145422.16923-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 14 May 2019 14:57:46 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, jack@suse.cz, mst@redhat.com, david@fromorbit.com,
	lcapitulino@redhat.com, adilger.kernel@dilger.ca,
	zwisler@kernel.org, aarcange@redhat.com, dave.jiang@intel.com,
	jstaron@google.com, darrick.wong@oracle.com,
	vishal.l.verma@intel.com, willy@infradead.org, hch@infradead.org,
	jmoyer@redhat.com, nilal@redhat.com, lenb@kernel.org,
	kilobyte@angband.pl, riel@surriel.com, yuval.shaia@oracle.com,
	stefanha@redhat.com, pbonzini@redhat.com,
	dan.j.williams@intel.com, tytso@mit.edu,
	xiaoguangrong.eric@gmail.com, cohuck@redhat.com,
	rjw@rjwysocki.net, imammedo@redhat.com
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

 This patch sets dax device 'DAXDEV_SYNC' flag if all the target
 devices of device mapper support synchrononous DAX. If device
 mapper consists of both synchronous and asynchronous dax devices,
 we don't set 'DAXDEV_SYNC' flag. 

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 drivers/md/dm-table.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index cde3b49b2a91..1cce626ff576 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -886,10 +886,17 @@ static int device_supports_dax(struct dm_target *ti, struct dm_dev *dev,
 	return bdev_dax_supported(dev->bdev, PAGE_SIZE);
 }
 
+static int device_synchronous(struct dm_target *ti, struct dm_dev *dev,
+			       sector_t start, sector_t len, void *data)
+{
+	return dax_synchronous(dev->dax_dev);
+}
+
 static bool dm_table_supports_dax(struct dm_table *t)
 {
 	struct dm_target *ti;
 	unsigned i;
+	bool dax_sync = true;
 
 	/* Ensure that all targets support DAX. */
 	for (i = 0; i < dm_table_get_num_targets(t); i++) {
@@ -901,7 +908,14 @@ static bool dm_table_supports_dax(struct dm_table *t)
 		if (!ti->type->iterate_devices ||
 		    !ti->type->iterate_devices(ti, device_supports_dax, NULL))
 			return false;
+
+		/* Check devices support synchronous DAX */
+		if (dax_sync &&
+		    !ti->type->iterate_devices(ti, device_synchronous, NULL))
+			dax_sync = false;
 	}
+	if (dax_sync)
+		set_dax_synchronous(t->md->dax_dev);
 
 	return true;
 }
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
