Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AACF6E61F6
	for <lists.virtualization@lfdr.de>; Sun, 27 Oct 2019 11:08:20 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DFF50949;
	Sun, 27 Oct 2019 10:08:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E6C0890
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 10:08:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 24C1D63D
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 10:08:13 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
	[209.85.160.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B99F5AFE9
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 10:08:12 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id u23so7707304qtb.22
	for <virtualization@lists.linux-foundation.org>;
	Sun, 27 Oct 2019 03:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition;
	bh=2LKFbpd/57zdcxL2B5zndGKqrGlJbgH02f3Dnv6OaXo=;
	b=UTqh3gpjF6hoV+5URAL6kcfTBzRSOTc6L2QGUvMiExgm1izEhBjIh/4Gp6qpyVDT6C
	ZXDALv0IloMyRjxLlHnobdOw+1PTL/XRHcZtt6uAhuzugJHzCX3RGaT7si5O5C3aobZL
	e0tlCsI5wJfK0ME0EbJVF+VyHAPHCIL72fL56sUW8+WUcNDskzpWvtfBFTZdbiI0t0z3
	pcNDhsmjp2GGsZVermmkOc22jHG7/1mFvGCTUrms4U5bWt7eoEjzXQ1HxHZBOQJu8G7I
	GQpOQEvf4f6uUmpSAvFCsoUj0blVxBPC7TzIgTSmV2p2VCoZ7GNWpsN9R/ZVumF6QRU7
	H9Pg==
X-Gm-Message-State: APjAAAXB/DOJSUDFP4ArHhZhhKBdRKM3BLcQrgTTGgAwRTgJbZw10pio
	ftEbDZfascUNY2bBZaa0p0Q0fyxDC6iVZm930yCc7q+QxHGq1lOLOsaaxP/sVQ0l/1R6MaB5cep
	IzbHdAHqkkdbRuPQYEXRC8ddNLoBdtKGMWbtRcN4JTA==
X-Received: by 2002:ac8:3711:: with SMTP id o17mr12438945qtb.159.1572170891945;
	Sun, 27 Oct 2019 03:08:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4yH+6ZR2wBZq+Jvuc7lC5oL5AYqVi9r9IYLRVIAL0mc77PKJB7RThLM03NDFUqz9i1FUPjw==
X-Received: by 2002:ac8:3711:: with SMTP id o17mr12438933qtb.159.1572170891717;
	Sun, 27 Oct 2019 03:08:11 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	y33sm7072062qta.18.2019.10.27.03.08.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 03:08:11 -0700 (PDT)
Date: Sun, 27 Oct 2019 06:08:07 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_ring: fix stalls for packed rings
Message-ID: <20191027100705.11644-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Marvin Liu <yong.liu@intel.com>, stable@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

From: Marvin Liu <yong.liu@intel.com>

When VIRTIO_F_RING_EVENT_IDX is negotiated, virtio devices can
use virtqueue_enable_cb_delayed_packed to reduce the number of device
interrupts.  At the moment, this is the case for virtio-net when the
napi_tx module parameter is set to false.

In this case, the virtio driver selects an event offset and expects that
the device will send a notification when rolling over the event offset
in the ring.  However, if this roll-over happens before the event
suppression structure update, the notification won't be sent. To address
this race condition the driver needs to check wether the device rolled
over the offset after updating the event suppression structure.

With VIRTIO_F_RING_PACKED, the virtio driver did this by reading the
flags field of the descriptor at the specified offset.

Unfortunately, checking at the event offset isn't reliable: if
descriptors are chained (e.g. when INDIRECT is off) not all descriptors
are overwritten by the device, so it's possible that the device skipped
the specific descriptor driver is checking when writing out used
descriptors. If this happens, the driver won't detect the race condition
and will incorrectly expect the device to send a notification.

For virtio-net, the result will be a TX queue stall, with the
transmission getting blocked forever.

With the packed ring, it isn't easy to find a location which is
guaranteed to change upon the roll-over, except the next device
descriptor, as described in the spec:

        Writes of device and driver descriptors can generally be
        reordered, but each side (driver and device) are only required to
        poll (or test) a single location in memory: the next device descriptor after
        the one they processed previously, in circular order.

while this might be sub-optimal, let's do exactly this for now.

Cc: stable@vger.kernel.org
Cc: Jason Wang <jasowang@redhat.com>
Signed-off-by: Marvin Liu <yong.liu@intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

So this is what I have in my tree now - this is just Marvin's patch
with a tweaked description.


 drivers/virtio/virtio_ring.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index bdc08244a648..a8041e451e9e 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -1499,9 +1499,6 @@ static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
 		 * counter first before updating event flags.
 		 */
 		virtio_wmb(vq->weak_barriers);
-	} else {
-		used_idx = vq->last_used_idx;
-		wrap_counter = vq->packed.used_wrap_counter;
 	}
 
 	if (vq->packed.event_flags_shadow == VRING_PACKED_EVENT_FLAG_DISABLE) {
@@ -1518,7 +1515,9 @@ static bool virtqueue_enable_cb_delayed_packed(struct virtqueue *_vq)
 	 */
 	virtio_mb(vq->weak_barriers);
 
-	if (is_used_desc_packed(vq, used_idx, wrap_counter)) {
+	if (is_used_desc_packed(vq,
+				vq->last_used_idx,
+				vq->packed.used_wrap_counter)) {
 		END_USE(vq);
 		return false;
 	}
-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
