Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFBB16A745
	for <lists.virtualization@lfdr.de>; Mon, 24 Feb 2020 14:26:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E73AD2049A;
	Mon, 24 Feb 2020 13:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xa7uGmhprvf8; Mon, 24 Feb 2020 13:26:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 99A06204E4;
	Mon, 24 Feb 2020 13:26:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FEEDC0177;
	Mon, 24 Feb 2020 13:26:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9165AC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8DA7F85E13
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Swbj4LV54aA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:26:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 3881F85DFF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 24 Feb 2020 13:26:08 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6DkI-0005jE-6t; Mon, 24 Feb 2020 13:26:06 +0000
Received: from jain.kot-begemot.co.uk ([192.168.3.3])
 by jain.kot-begemot.co.uk with esmtp (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1j6Dk9-0000Yj-0t; Mon, 24 Feb 2020 13:25:57 +0000
From: anton.ivanov@cambridgegreys.com
To: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-um@lists.infradead.org
Subject: [PATCH v3] virtio: Work around frames incorrectly marked as gso
Date: Mon, 24 Feb 2020 13:25:50 +0000
Message-Id: <20200224132550.2083-1-anton.ivanov@cambridgegreys.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Clacks-Overhead: GNU Terry Pratchett
Cc: Anton Ivanov <anton.ivanov@cambridgegreys.com>, eric.dumazet@gmail.com,
 mst@redhat.com
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

From: Anton Ivanov <anton.ivanov@cambridgegreys.com>

Some of the locally generated frames marked as GSO which
arrive at virtio_net_hdr_from_skb() have no GSO_TYPE, no
fragments (data_len = 0) and length significantly shorter
than the MTU (752 in my experiments).

This is observed on raw sockets reading off vEth interfaces
in all 4.x and 5.x kernels. The frames are reported as
invalid, while they are in fact gso-less frames.

The easiest way to reproduce is to connect a User Mode
Linux instance to the host using the vector raw transport
and a vEth interface. Vector raw uses recvmmsg/sendmmsg
with virtio headers on af_packet sockets. When running iperf
between the UML and the host, UML regularly complains about
EINVAL return from recvmmsg.

This patch marks the vnet header as non-GSO instead of
reporting it as invalid.

Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
---
 include/linux/virtio_net.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
index 0d1fe9297ac6..2c99c752cb20 100644
--- a/include/linux/virtio_net.h
+++ b/include/linux/virtio_net.h
@@ -98,10 +98,11 @@ static inline int virtio_net_hdr_from_skb(const struct sk_buff *skb,
 					  bool has_data_valid,
 					  int vlan_hlen)
 {
+	struct skb_shared_info *sinfo = skb_shinfo(skb);
+
 	memset(hdr, 0, sizeof(*hdr));   /* no info leak */
 
-	if (skb_is_gso(skb)) {
-		struct skb_shared_info *sinfo = skb_shinfo(skb);
+	if (skb_is_gso(skb) && sinfo->gso_type) {
 
 		/* This is a hint as to how much should be linear. */
 		hdr->hdr_len = __cpu_to_virtio16(little_endian,
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
