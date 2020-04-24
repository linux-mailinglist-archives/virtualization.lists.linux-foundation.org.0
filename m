Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4221B78D8
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 17:09:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E79FC86CD7;
	Fri, 24 Apr 2020 15:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDbitmGzmBVj; Fri, 24 Apr 2020 15:09:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 77F3986CA6;
	Fri, 24 Apr 2020 15:09:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6BC97C0175;
	Fri, 24 Apr 2020 15:09:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46861C0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4054486CA6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ctZb1Kukjo8h
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4E3E186CF9
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587740939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ARp1QaZyc6uSRKz56nM+3cPhl3dHwuu6PrNTP1aVNwk=;
 b=hzurbsJFfPu3BKCkx3LJ2B/hxXMYN4C5POjzICpd6nzFd62CK48h01bv7fPGQxLq0tjBRk
 wYBrYeMegsYV9Y3QOReSKPGWo2OFEkn4q1PFCCZw1x4D6KjXMbNGgwkySOJitfvuKP1q2m
 qrgbCtpuiabH1zLpi6qucjszjZJ0/ZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-DmiyAjRKOj64EzmUgW8ULQ-1; Fri, 24 Apr 2020 11:08:57 -0400
X-MC-Unique: DmiyAjRKOj64EzmUgW8ULQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F8F3100A8D3;
 Fri, 24 Apr 2020 15:08:39 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-43.ams2.redhat.com
 [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 324695D750;
 Fri, 24 Apr 2020 15:08:37 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net v2 2/2] vsock/virtio: fix multiple packet delivery to
 monitoring devices
Date: Fri, 24 Apr 2020 17:08:30 +0200
Message-Id: <20200424150830.183113-3-sgarzare@redhat.com>
In-Reply-To: <20200424150830.183113-1-sgarzare@redhat.com>
References: <20200424150830.183113-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
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

In virtio_transport.c, if the virtqueue is full, the transmitting
packet is queued up and it will be sent in the next iteration.
This causes the same packet to be delivered multiple times to
monitoring devices.

We want to continue to deliver packets to monitoring devices before
it is put in the virtqueue, to avoid that replies can appear in the
packet capture before the transmitted packet.

This patch fixes the issue, adding a new flag (tap_delivered) in
struct virtio_vsock_pkt, to check if the packet is already delivered
to monitoring devices.

In vhost/vsock.c, we are splitting packets, so we must set
'tap_delivered' to false when we queue up the same virtio_vsock_pkt
to handle the remaining bytes.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vsock.c                   | 6 ++++++
 include/linux/virtio_vsock.h            | 1 +
 net/vmw_vsock/virtio_transport_common.c | 4 ++++
 3 files changed, 11 insertions(+)

diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
index 18aff350a405..11f066c76a25 100644
--- a/drivers/vhost/vsock.c
+++ b/drivers/vhost/vsock.c
@@ -196,6 +196,12 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
 		 * to send it with the next available buffer.
 		 */
 		if (pkt->off < pkt->len) {
+			/* We are queueing the same virtio_vsock_pkt to handle
+			 * the remaining bytes, and we want to deliver it
+			 * to monitoring devices in the next iteration.
+			 */
+			pkt->tap_delivered = false;
+
 			spin_lock_bh(&vsock->send_pkt_list_lock);
 			list_add(&pkt->list, &vsock->send_pkt_list);
 			spin_unlock_bh(&vsock->send_pkt_list_lock);
diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
index 71c81e0dc8f2..dc636b727179 100644
--- a/include/linux/virtio_vsock.h
+++ b/include/linux/virtio_vsock.h
@@ -48,6 +48,7 @@ struct virtio_vsock_pkt {
 	u32 len;
 	u32 off;
 	bool reply;
+	bool tap_delivered;
 };
 
 struct virtio_vsock_pkt_info {
diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 709038a4783e..69efc891885f 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -157,7 +157,11 @@ static struct sk_buff *virtio_transport_build_skb(void *opaque)
 
 void virtio_transport_deliver_tap_pkt(struct virtio_vsock_pkt *pkt)
 {
+	if (pkt->tap_delivered)
+		return;
+
 	vsock_deliver_tap(virtio_transport_build_skb, pkt);
+	pkt->tap_delivered = true;
 }
 EXPORT_SYMBOL_GPL(virtio_transport_deliver_tap_pkt);
 
-- 
2.25.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
