Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3685B860F1
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 13:36:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B00F7C8B;
	Thu,  8 Aug 2019 11:36:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id BA27BDC0
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 11:36:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 77C64875
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 11:36:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 092BD309BDAA;
	Thu,  8 Aug 2019 11:36:19 +0000 (UTC)
Received: from dhcp201-121.englab.pnq.redhat.com (unknown [10.65.16.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8631C61B61;
	Thu,  8 Aug 2019 11:36:16 +0000 (UTC)
From: Pankaj Gupta <pagupta@redhat.com>
To: amit@kernel.org,
	mst@redhat.com
Subject: [PATCH v2 2/2] virtio_ring: packed ring: fix
	virtqueue_detach_unused_buf
Date: Thu,  8 Aug 2019 17:06:06 +0530
Message-Id: <20190808113606.19504-3-pagupta@redhat.com>
In-Reply-To: <20190808113606.19504-1-pagupta@redhat.com>
References: <20190808113606.19504-1-pagupta@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 08 Aug 2019 11:36:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: pagupta@redhat.com, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

This patch makes packed ring code compatible with split ring in function
'virtqueue_detach_unused_buf_*'.

Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
---
 drivers/virtio/virtio_ring.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index c8be1c4f5b55..1b98a6777b7e 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1534,6 +1534,11 @@ static void *virtqueue_detach_unused_buf_packed(struct virtqueue *_vq)
 	for (i = 0; i < vq->packed.vring.num; i++) {
 		if (!vq->packed.desc_state[i].data)
 			continue;
+		vq->packed.next_avail_idx--;
+		if (vq->packed.next_avail_idx < 0) {
+			vq->packed.next_avail_idx = vq->packed.vring.num - 1;
+			vq->packed.avail_wrap_counter ^= 1;
+		}
 		/* detach_buf clears data, so grab it now. */
 		buf = vq->packed.desc_state[i].data;
 		detach_buf_packed(vq, i, NULL);
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
