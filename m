Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D61C6847
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 08:16:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 98500876E4;
	Wed,  6 May 2020 06:16:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVp7Mz-RCz5Y; Wed,  6 May 2020 06:16:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A9AB9876EB;
	Wed,  6 May 2020 06:16:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7BF87C0863;
	Wed,  6 May 2020 06:16:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C594BC0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A8997876E4
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5u5HKLmPKTIF
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D525C876E3
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588745808;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9cPGlRr13R9dEpHsCHTbKzUmba6essHkh9NkHk5FoYQ=;
 b=i59nsQnXXKKJ5S4BEVPJ98gY8k3YkRjplXbnXCpFypjRDzXu9WO/jIK9Z0OD1ZwFMpkvJw
 l43KVe8SDaoLiK8dPPpa1YiTLCSqqJ2US0qfNdMS7wS94vlGYrBSxqiDdo4GArAj4wvFMh
 YWAjaLgft+Of5qSYnDRJ+9u2h2gv830=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-IzUrd-WrNhCFIgkZxw2F0w-1; Wed, 06 May 2020 02:16:44 -0400
X-MC-Unique: IzUrd-WrNhCFIgkZxw2F0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2B97EC1A0;
 Wed,  6 May 2020 06:16:43 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-165.pek2.redhat.com [10.72.13.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70BBC5C1D4;
 Wed,  6 May 2020 06:16:35 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH net-next 1/2] virtio-net: don't reserve space for vnet header
 for XDP
Date: Wed,  6 May 2020 14:16:32 +0800
Message-Id: <20200506061633.16327-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org,
 Jesper Dangaard Brouer <brouer@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

We tried to reserve space for vnet header before
xdp.data_hard_start. But this is useless since the packet could be
modified by XDP which may invalidate the information stored in the
header and there's no way for XDP to know the existence of the vnet
header currently.

So let's just not reserve space for vnet header in this case.

Cc: Jesper Dangaard Brouer <brouer@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 11f722460513..98dd75b665a5 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -684,8 +684,8 @@ static struct sk_buff *receive_small(struct net_device *dev,
 			page = xdp_page;
 		}
 
-		xdp.data_hard_start = buf + VIRTNET_RX_PAD + vi->hdr_len;
-		xdp.data = xdp.data_hard_start + xdp_headroom;
+		xdp.data_hard_start = buf + VIRTNET_RX_PAD;
+		xdp.data = xdp.data_hard_start + xdp_headroom + vi->hdr_len;
 		xdp.data_end = xdp.data + len;
 		xdp.data_meta = xdp.data;
 		xdp.rxq = &rq->xdp_rxq;
@@ -845,7 +845,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 		 * the descriptor on if we get an XDP_TX return code.
 		 */
 		data = page_address(xdp_page) + offset;
-		xdp.data_hard_start = data - VIRTIO_XDP_HEADROOM + vi->hdr_len;
+		xdp.data_hard_start = data - VIRTIO_XDP_HEADROOM;
 		xdp.data = data + vi->hdr_len;
 		xdp.data_end = xdp.data + (len - vi->hdr_len);
 		xdp.data_meta = xdp.data;
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
