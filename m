Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9660772
	for <lists.virtualization@lfdr.de>; Fri,  5 Jul 2019 16:09:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B631713F3;
	Fri,  5 Jul 2019 14:09:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 68ACC129D
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 14:09:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1438388E
	for <virtualization@lists.linux-foundation.org>;
	Fri,  5 Jul 2019 14:09:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61E4A30C5859;
	Fri,  5 Jul 2019 14:09:21 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (ovpn-116-58.sin2.redhat.com
	[10.67.116.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D98318657;
	Fri,  5 Jul 2019 14:08:42 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: dm-devel@redhat.com, linux-nvdimm@lists.01.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	kvm@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-acpi@vger.kernel.org, qemu-devel@nongnu.org,
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org
Subject: [PATCH v15 5/7] dax: check synchronous mapping is supported
Date: Fri,  5 Jul 2019 19:33:26 +0530
Message-Id: <20190705140328.20190-6-pagupta@redhat.com>
In-Reply-To: <20190705140328.20190-1-pagupta@redhat.com>
References: <20190705140328.20190-1-pagupta@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 05 Jul 2019 14:09:36 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, rdunlap@infradead.org, jack@suse.cz, snitzer@redhat.com,
	mst@redhat.com, david@fromorbit.com, lcapitulino@redhat.com,
	adilger.kernel@dilger.ca, zwisler@kernel.org,
	aarcange@redhat.com, dave.jiang@intel.com, jstaron@google.com,
	darrick.wong@oracle.com, vishal.l.verma@intel.com,
	willy@infradead.org, hch@infradead.org, jmoyer@redhat.com,
	nilal@redhat.com, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval.shaia@oracle.com, stefanha@redhat.com,
	pbonzini@redhat.com, dan.j.williams@intel.com, tytso@mit.edu,
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

This patch introduces 'daxdev_mapping_supported' helper
which checks if 'MAP_SYNC' is supported with filesystem
mapping. It also checks if corresponding dax_device is
synchronous. Virtio pmem device is asynchronous and
does not not support VM_SYNC.

Suggested-by: Jan Kara <jack@suse.cz>
Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
Reviewed-by: Jan Kara <jack@suse.cz>
---
 include/linux/dax.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/dax.h b/include/linux/dax.h
index 86fc55c99b58..d1bea3979b5a 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -53,6 +53,18 @@ static inline void set_dax_synchronous(struct dax_device *dax_dev)
 {
 	__set_dax_synchronous(dax_dev);
 }
+/*
+ * Check if given mapping is supported by the file / underlying device.
+ */
+static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
+					     struct dax_device *dax_dev)
+{
+	if (!(vma->vm_flags & VM_SYNC))
+		return true;
+	if (!IS_DAX(file_inode(vma->vm_file)))
+		return false;
+	return dax_synchronous(dax_dev);
+}
 #else
 static inline struct dax_device *dax_get_by_host(const char *host)
 {
@@ -87,6 +99,11 @@ static inline bool dax_synchronous(struct dax_device *dax_dev)
 static inline void set_dax_synchronous(struct dax_device *dax_dev)
 {
 }
+static inline bool daxdev_mapping_supported(struct vm_area_struct *vma,
+				struct dax_device *dax_dev)
+{
+	return !(vma->vm_flags & VM_SYNC);
+}
 #endif
 
 struct writeback_control;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
