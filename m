Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BAB7563C
	for <lists.virtualization@lfdr.de>; Thu, 25 Jul 2019 19:51:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B75E0E19;
	Thu, 25 Jul 2019 17:50:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E56CEDDF
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 17:50:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A6F197C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 17:50:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40F5C309265B;
	Thu, 25 Jul 2019 17:50:56 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-187.ams2.redhat.com
	[10.36.117.187])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E1B0E5C6DA;
	Thu, 25 Jul 2019 17:50:54 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: virtualization@lists.linux-foundation.org, mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH 2/4] virtio_pci: Define virtio_pci_cap64
Date: Thu, 25 Jul 2019 18:50:42 +0100
Message-Id: <20190725175044.29303-3-dgilbert@redhat.com>
In-Reply-To: <20190725175044.29303-1-dgilbert@redhat.com>
References: <20190725175044.29303-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Thu, 25 Jul 2019 17:50:56 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: sebastien.boeuf@intel.com, vgoyal@redhat.com, stefanha@redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Define 'virtio_pci_cap64' to allow capabilities to describe
memory regions larger than, or with an offset larger than 4GiB.

This will be used by the shared memory region capability.

Defined in virtio spec commit 8100dcfcd622 ("pci: Define virtio_pci_cap64")

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/uapi/linux/virtio_pci.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
index 9defe4a124c5..11e508719dfd 100644
--- a/include/uapi/linux/virtio_pci.h
+++ b/include/uapi/linux/virtio_pci.h
@@ -127,6 +127,12 @@ struct virtio_pci_cap {
 	__le32 length;		/* Length of the structure, in bytes. */
 };
 
+struct virtio_pci_cap64 {
+	struct virtio_pci_cap cap;
+	__le32 offset_hi;	/* Most sig 32 bits of offset */
+	__le32 length_hi;	/* Most sig 32 bits of length */
+};
+
 struct virtio_pci_notify_cap {
 	struct virtio_pci_cap cap;
 	__le32 notify_off_multiplier;	/* Multiplier for queue_notify_off. */
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
