Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4EE1B229F
	for <lists.virtualization@lfdr.de>; Tue, 21 Apr 2020 11:25:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 282C9883B6;
	Tue, 21 Apr 2020 09:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAJ6-WXBgLaq; Tue, 21 Apr 2020 09:25:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AEC48883A4;
	Tue, 21 Apr 2020 09:25:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9A330C1DC9;
	Tue, 21 Apr 2020 09:25:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1659FC0175
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 09:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 127892210F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 09:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0DfbEKQUIGR
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 09:25:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 41F9D20379
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Apr 2020 09:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587461138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=s6kZIJazKnfeWw9rqRwxCTiV7lo+E1jRmgFL7mG8v1w=;
 b=hFrB+g2XxsiiTZHIEyg6eIYtANPAkk2JGYl/AdD3UQHgMIZ291xXRXyb+pxetQOqJC4qiZ
 D40wI9wkp0Qu5eU+FKb57JqUBV6EaE1t+oQQkCwgiBHri+8xhmgjvRqUV1Tq4Ufq8kpSo9
 OkWe5PGUzz5rWQAXxi7S6yRR4tu/BCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-pZMfjWLMOayjYnBl4uIC7Q-1; Tue, 21 Apr 2020 05:25:36 -0400
X-MC-Unique: pZMfjWLMOayjYnBl4uIC7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFCE48017F3;
 Tue, 21 Apr 2020 09:25:34 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-101.ams2.redhat.com
 [10.36.114.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A499A60C87;
 Tue, 21 Apr 2020 09:25:28 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net] vsock/virtio: postpone packet delivery to monitoring
 devices
Date: Tue, 21 Apr 2020 11:25:27 +0200
Message-Id: <20200421092527.41651-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Gerard Garcia <ggarcia@deic.uab.cat>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>
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

We delivering packets to monitoring devices, before to check if
the virtqueue has enough space.

If the virtqueue is full, the transmitting packet is queued up
and it will be sent in the next iteration. This causes the same
packet to be delivered multiple times to monitoring devices.

This patch fixes this issue, postponing the packet delivery
to monitoring devices, only when it is properly queued in the
virqueue.

Fixes: 82dfb540aeb2 ("VSOCK: Add virtio vsock vsockmon hooks")
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index dfbaf6bd8b1c..d8db837a96fe 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -115,8 +115,6 @@ virtio_transport_send_pkt_work(struct work_struct *work)
 		list_del_init(&pkt->list);
 		spin_unlock_bh(&vsock->send_pkt_list_lock);
 
-		virtio_transport_deliver_tap_pkt(pkt);
-
 		reply = pkt->reply;
 
 		sg_init_one(&hdr, &pkt->hdr, sizeof(pkt->hdr));
@@ -137,6 +135,11 @@ virtio_transport_send_pkt_work(struct work_struct *work)
 			break;
 		}
 
+		/* Deliver to monitoring devices all correctly transmitted
+		 * packets.
+		 */
+		virtio_transport_deliver_tap_pkt(pkt);
+
 		if (reply) {
 			struct virtqueue *rx_vq = vsock->vqs[VSOCK_VQ_RX];
 			int val;
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
