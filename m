Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E4F118560
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 11:43:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0B4F868B4;
	Tue, 10 Dec 2019 10:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jcmuFCPIghMW; Tue, 10 Dec 2019 10:43:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D97A187609;
	Tue, 10 Dec 2019 10:43:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C38A0C1796;
	Tue, 10 Dec 2019 10:43:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D07EEC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C071387A5F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9KbD2IUz61d
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5DD2987A39
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575974607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oF/SV6ufhESqfSAItJef3FX7tcICe8pVDWWfHQ4TG/0=;
 b=P4vzex2wDDjRdRyqdmmlVxfbqKnvkIbmZ2mIYXwwgWpdhOgyCuPU19RFZrgNPgO2kNOQlY
 /59pYw53eeAZfe/amU/kNv1iB3Let36i0JwEgcxlZl0MdiNdOJPf28sO9bIjZgdXsiNAUQ
 DZZ40I+/9HKKKXuUOe5AJCC4NmC5BXI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-mSeqh8vlMLavF7KqGH6q6w-1; Tue, 10 Dec 2019 05:43:24 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2421DBFB;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE09660568;
 Tue, 10 Dec 2019 10:43:20 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org,
	davem@davemloft.net
Subject: [PATCH net-next v2 4/6] vsock: add vsock_loopback transport
Date: Tue, 10 Dec 2019 11:43:05 +0100
Message-Id: <20191210104307.89346-5-sgarzare@redhat.com>
In-Reply-To: <20191210104307.89346-1-sgarzare@redhat.com>
References: <20191210104307.89346-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: mSeqh8vlMLavF7KqGH6q6w-1
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
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

This patch adds a new vsock_loopback transport to handle local
communication.
This transport is based on the loopback implementation of
virtio_transport, so it uses the virtio_transport_common APIs
to interface with the vsock core.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v1 -> v2:
- fixed reverse christmas tree ordering of local variables [Dave]
- changed 'the_vsock_loopback' in a global static variable [Stefan]
- removed RCU synchronization [Stefan]
  It is not needed because the af_vsock keeps a reference to the module
  as long as there are open sockets assigned to the transport
- removed 'loopback' prefix in 'struct vsock_loopback' fields
---
 MAINTAINERS                    |   1 +
 net/vmw_vsock/Kconfig          |  12 +++
 net/vmw_vsock/Makefile         |   1 +
 net/vmw_vsock/vsock_loopback.c | 180 +++++++++++++++++++++++++++++++++
 4 files changed, 194 insertions(+)
 create mode 100644 net/vmw_vsock/vsock_loopback.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ce7fd2e7aa1a..a28c77ee6b0d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17480,6 +17480,7 @@ F:	net/vmw_vsock/diag.c
 F:	net/vmw_vsock/af_vsock_tap.c
 F:	net/vmw_vsock/virtio_transport_common.c
 F:	net/vmw_vsock/virtio_transport.c
+F:	net/vmw_vsock/vsock_loopback.c
 F:	drivers/net/vsockmon.c
 F:	drivers/vhost/vsock.c
 F:	tools/testing/vsock/
diff --git a/net/vmw_vsock/Kconfig b/net/vmw_vsock/Kconfig
index 8abcb815af2d..56356d2980c8 100644
--- a/net/vmw_vsock/Kconfig
+++ b/net/vmw_vsock/Kconfig
@@ -26,6 +26,18 @@ config VSOCKETS_DIAG
 
 	  Enable this module so userspace applications can query open sockets.
 
+config VSOCKETS_LOOPBACK
+	tristate "Virtual Sockets loopback transport"
+	depends on VSOCKETS
+	default y
+	select VIRTIO_VSOCKETS_COMMON
+	help
+	  This module implements a loopback transport for Virtual Sockets,
+	  using vmw_vsock_virtio_transport_common.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called vsock_loopback. If unsure, say N.
+
 config VMWARE_VMCI_VSOCKETS
 	tristate "VMware VMCI transport for Virtual Sockets"
 	depends on VSOCKETS && VMWARE_VMCI
diff --git a/net/vmw_vsock/Makefile b/net/vmw_vsock/Makefile
index 7c6f9a0b67b0..6a943ec95c4a 100644
--- a/net/vmw_vsock/Makefile
+++ b/net/vmw_vsock/Makefile
@@ -5,6 +5,7 @@ obj-$(CONFIG_VMWARE_VMCI_VSOCKETS) += vmw_vsock_vmci_transport.o
 obj-$(CONFIG_VIRTIO_VSOCKETS) += vmw_vsock_virtio_transport.o
 obj-$(CONFIG_VIRTIO_VSOCKETS_COMMON) += vmw_vsock_virtio_transport_common.o
 obj-$(CONFIG_HYPERV_VSOCKETS) += hv_sock.o
+obj-$(CONFIG_VSOCKETS_LOOPBACK) += vsock_loopback.o
 
 vsock-y += af_vsock.o af_vsock_tap.o vsock_addr.o
 
diff --git a/net/vmw_vsock/vsock_loopback.c b/net/vmw_vsock/vsock_loopback.c
new file mode 100644
index 000000000000..a45f7ffca8c5
--- /dev/null
+++ b/net/vmw_vsock/vsock_loopback.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* loopback transport for vsock using virtio_transport_common APIs
+ *
+ * Copyright (C) 2013-2019 Red Hat, Inc.
+ * Authors: Asias He <asias@redhat.com>
+ *          Stefan Hajnoczi <stefanha@redhat.com>
+ *          Stefano Garzarella <sgarzare@redhat.com>
+ *
+ */
+#include <linux/spinlock.h>
+#include <linux/module.h>
+#include <linux/list.h>
+#include <linux/virtio_vsock.h>
+
+struct vsock_loopback {
+	struct workqueue_struct *workqueue;
+
+	spinlock_t pkt_list_lock; /* protects pkt_list */
+	struct list_head pkt_list;
+	struct work_struct pkt_work;
+};
+
+static struct vsock_loopback the_vsock_loopback;
+
+static u32 vsock_loopback_get_local_cid(void)
+{
+	return VMADDR_CID_LOCAL;
+}
+
+static int vsock_loopback_send_pkt(struct virtio_vsock_pkt *pkt)
+{
+	struct vsock_loopback *vsock = &the_vsock_loopback;
+	int len = pkt->len;
+
+	spin_lock_bh(&vsock->pkt_list_lock);
+	list_add_tail(&pkt->list, &vsock->pkt_list);
+	spin_unlock_bh(&vsock->pkt_list_lock);
+
+	queue_work(vsock->workqueue, &vsock->pkt_work);
+
+	return len;
+}
+
+static int vsock_loopback_cancel_pkt(struct vsock_sock *vsk)
+{
+	struct vsock_loopback *vsock = &the_vsock_loopback;
+	struct virtio_vsock_pkt *pkt, *n;
+	LIST_HEAD(freeme);
+
+	spin_lock_bh(&vsock->pkt_list_lock);
+	list_for_each_entry_safe(pkt, n, &vsock->pkt_list, list) {
+		if (pkt->vsk != vsk)
+			continue;
+		list_move(&pkt->list, &freeme);
+	}
+	spin_unlock_bh(&vsock->pkt_list_lock);
+
+	list_for_each_entry_safe(pkt, n, &freeme, list) {
+		list_del(&pkt->list);
+		virtio_transport_free_pkt(pkt);
+	}
+
+	return 0;
+}
+
+static struct virtio_transport loopback_transport = {
+	.transport = {
+		.module                   = THIS_MODULE,
+
+		.get_local_cid            = vsock_loopback_get_local_cid,
+
+		.init                     = virtio_transport_do_socket_init,
+		.destruct                 = virtio_transport_destruct,
+		.release                  = virtio_transport_release,
+		.connect                  = virtio_transport_connect,
+		.shutdown                 = virtio_transport_shutdown,
+		.cancel_pkt               = vsock_loopback_cancel_pkt,
+
+		.dgram_bind               = virtio_transport_dgram_bind,
+		.dgram_dequeue            = virtio_transport_dgram_dequeue,
+		.dgram_enqueue            = virtio_transport_dgram_enqueue,
+		.dgram_allow              = virtio_transport_dgram_allow,
+
+		.stream_dequeue           = virtio_transport_stream_dequeue,
+		.stream_enqueue           = virtio_transport_stream_enqueue,
+		.stream_has_data          = virtio_transport_stream_has_data,
+		.stream_has_space         = virtio_transport_stream_has_space,
+		.stream_rcvhiwat          = virtio_transport_stream_rcvhiwat,
+		.stream_is_active         = virtio_transport_stream_is_active,
+		.stream_allow             = virtio_transport_stream_allow,
+
+		.notify_poll_in           = virtio_transport_notify_poll_in,
+		.notify_poll_out          = virtio_transport_notify_poll_out,
+		.notify_recv_init         = virtio_transport_notify_recv_init,
+		.notify_recv_pre_block    = virtio_transport_notify_recv_pre_block,
+		.notify_recv_pre_dequeue  = virtio_transport_notify_recv_pre_dequeue,
+		.notify_recv_post_dequeue = virtio_transport_notify_recv_post_dequeue,
+		.notify_send_init         = virtio_transport_notify_send_init,
+		.notify_send_pre_block    = virtio_transport_notify_send_pre_block,
+		.notify_send_pre_enqueue  = virtio_transport_notify_send_pre_enqueue,
+		.notify_send_post_enqueue = virtio_transport_notify_send_post_enqueue,
+		.notify_buffer_size       = virtio_transport_notify_buffer_size,
+	},
+
+	.send_pkt = vsock_loopback_send_pkt,
+};
+
+static void vsock_loopback_work(struct work_struct *work)
+{
+	struct vsock_loopback *vsock =
+		container_of(work, struct vsock_loopback, pkt_work);
+	LIST_HEAD(pkts);
+
+	spin_lock_bh(&vsock->pkt_list_lock);
+	list_splice_init(&vsock->pkt_list, &pkts);
+	spin_unlock_bh(&vsock->pkt_list_lock);
+
+	while (!list_empty(&pkts)) {
+		struct virtio_vsock_pkt *pkt;
+
+		pkt = list_first_entry(&pkts, struct virtio_vsock_pkt, list);
+		list_del_init(&pkt->list);
+
+		virtio_transport_deliver_tap_pkt(pkt);
+		virtio_transport_recv_pkt(&loopback_transport, pkt);
+	}
+}
+
+static int __init vsock_loopback_init(void)
+{
+	struct vsock_loopback *vsock = &the_vsock_loopback;
+	int ret;
+
+	vsock->workqueue = alloc_workqueue("vsock-loopback", 0, 0);
+	if (!vsock->workqueue)
+		return -ENOMEM;
+
+	spin_lock_init(&vsock->pkt_list_lock);
+	INIT_LIST_HEAD(&vsock->pkt_list);
+	INIT_WORK(&vsock->pkt_work, vsock_loopback_work);
+
+	ret = vsock_core_register(&loopback_transport.transport,
+				  VSOCK_TRANSPORT_F_LOCAL);
+	if (ret)
+		goto out_wq;
+
+	return 0;
+
+out_wq:
+	destroy_workqueue(vsock->workqueue);
+	return ret;
+}
+
+static void __exit vsock_loopback_exit(void)
+{
+	struct vsock_loopback *vsock = &the_vsock_loopback;
+	struct virtio_vsock_pkt *pkt;
+
+	vsock_core_unregister(&loopback_transport.transport);
+
+	flush_work(&vsock->pkt_work);
+
+	spin_lock_bh(&vsock->pkt_list_lock);
+	while (!list_empty(&vsock->pkt_list)) {
+		pkt = list_first_entry(&vsock->pkt_list,
+				       struct virtio_vsock_pkt, list);
+		list_del(&pkt->list);
+		virtio_transport_free_pkt(pkt);
+	}
+	spin_unlock_bh(&vsock->pkt_list_lock);
+
+	destroy_workqueue(vsock->workqueue);
+}
+
+module_init(vsock_loopback_init);
+module_exit(vsock_loopback_exit);
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Stefano Garzarella <sgarzare@redhat.com>");
+MODULE_DESCRIPTION("loopback transport for vsock");
+MODULE_ALIAS_NETPROTO(PF_VSOCK);
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
