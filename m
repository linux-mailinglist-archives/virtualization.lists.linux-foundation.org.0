Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B5A19DB9
	for <lists.virtualization@lfdr.de>; Fri, 10 May 2019 15:00:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6477AEA5;
	Fri, 10 May 2019 12:59:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7EEF9E9C
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 12:59:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2451C1FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 12:59:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA505309264F;
	Fri, 10 May 2019 12:59:36 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-202.ams2.redhat.com
	[10.36.117.202])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F96A5D70D;
	Fri, 10 May 2019 12:59:33 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 8/8] vsock/virtio: make the RX buffer size tunable
Date: Fri, 10 May 2019 14:58:43 +0200
Message-Id: <20190510125843.95587-9-sgarzare@redhat.com>
In-Reply-To: <20190510125843.95587-1-sgarzare@redhat.com>
References: <20190510125843.95587-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 10 May 2019 12:59:36 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

The RX buffer size determines the memory consumption of the
vsock/virtio guest driver, so we make it tunable through
a module parameter.

The size allowed are between 4 KB and 64 KB in order to be
compatible with old host drivers.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/virtio_vsock.h     |  1 +
 net/vmw_vsock/virtio_transport.c | 27 ++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
index 5a9d25be72df..b9f8c3d91f80 100644
--- a/include/linux/virtio_vsock.h
+++ b/include/linux/virtio_vsock.h
@@ -13,6 +13,7 @@
 #define VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE	(1024 * 64)
 #define VIRTIO_VSOCK_MAX_BUF_SIZE		0xFFFFFFFFUL
 #define VIRTIO_VSOCK_MAX_PKT_BUF_SIZE		(1024 * 64)
+#define VIRTIO_VSOCK_MIN_PKT_BUF_SIZE		(1024 * 4)
 
 enum {
 	VSOCK_VQ_RX     = 0, /* for host to guest data */
diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index af1d2ce12f54..732398b4e28f 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -66,6 +66,31 @@ struct virtio_vsock {
 	u32 guest_cid;
 };
 
+static unsigned int rx_buf_size = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE;
+
+static int param_set_rx_buf_size(const char *val, const struct kernel_param *kp)
+{
+	unsigned int size;
+	int ret;
+
+	ret = kstrtouint(val, 0, &size);
+	if (ret)
+		return ret;
+
+	if (size < VIRTIO_VSOCK_MIN_PKT_BUF_SIZE ||
+	    size > VIRTIO_VSOCK_MAX_PKT_BUF_SIZE)
+		return -EINVAL;
+
+	return param_set_uint(val, kp);
+};
+
+static const struct kernel_param_ops param_ops_rx_buf_size = {
+	.set = param_set_rx_buf_size,
+	.get = param_get_uint,
+};
+
+module_param_cb(rx_buf_size, &param_ops_rx_buf_size, &rx_buf_size, 0644);
+
 static struct virtio_vsock *virtio_vsock_get(void)
 {
 	return the_virtio_vsock;
@@ -261,7 +286,7 @@ virtio_transport_cancel_pkt(struct vsock_sock *vsk)
 
 static void virtio_vsock_rx_fill(struct virtio_vsock *vsock)
 {
-	int buf_len = VIRTIO_VSOCK_DEFAULT_RX_BUF_SIZE;
+	int buf_len = rx_buf_size;
 	struct virtio_vsock_pkt *pkt;
 	struct scatterlist hdr, buf, *sgs[2];
 	struct virtqueue *vq;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
