Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A5477BECD
	for <lists.virtualization@lfdr.de>; Mon, 14 Aug 2023 19:19:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6377161095;
	Mon, 14 Aug 2023 17:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6377161095
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=VCnqWp4x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jkuqf_W2cLxF; Mon, 14 Aug 2023 17:19:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id CB0FC6074C;
	Mon, 14 Aug 2023 17:19:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB0FC6074C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05DCFC008D;
	Mon, 14 Aug 2023 17:19:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D71B8C0032
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Aug 2023 17:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90D2F80ED8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Aug 2023 17:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90D2F80ED8
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256
 header.s=selector2 header.b=VCnqWp4x
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bePfv-GQpL9J
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Aug 2023 17:19:18 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::622])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7854980B27
 for <virtualization@lists.linux-foundation.org>;
 Mon, 14 Aug 2023 17:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7854980B27
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7S53tO1gTj/0RxdBKzOyJKbRPf1aBk0HLs2MhlzHAKB91ex8Drl+5gmL4QwbxaL1QqtN4TyPCrsE889Tgrfi9H0htSSRsoqlgEyBDZsG3IWVUgJEkjSanj4s0jQxTPSqAhelC61ZYhSQveKQWES+ykamorz8J/V21fyrbfUmgqG8yz//cRjLDLvESj+AtuTtRc0OzGVIp+g5uMmWNB+EeV0XFiyO/g8WcsVmJEGPXVTyUQaesFMi0gFqxI2xSe8TnserZ3K4zyKYNl84mVFp56z6da8EWR150KfEjr/fLASVdEp7S1d+B+vBHmS5MbqY48XhN1c+tjoXEZwGJMncA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pq4YPk9nydhooGv5RPJtB0dcUvyoZqngaV5k8FJms+4=;
 b=j4lfjobRWIJe3Wd8rnjoEeIqrCd+2Ea8OUYmuuVPoyBiOoJPteuDlmBu9mli7mSVEdacGVbcNb4QC/z6GytX+PdfkSGMwTVLEXQULfmmHlkQYgBpKTtxJNJrCj0oBv7VPG+SLSJuQdJdezNXwdZmG252xy63HNKdeO5Bio0LY9dOV6Ee39HvEztE0fbjG9GDfdtPBPjzVf23XRb3y0+ptq6LeVftgTgHq5j1BzanM/LC84EIBITNoEg+aK4R2u83YRLOSjhHsvg5yd31Os/tyQbs2XVle7xno42uLM2pUj01/jmSYkxcgZ4gf56vZL8ZB8RuDCCupiUEon7f1lc8Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pq4YPk9nydhooGv5RPJtB0dcUvyoZqngaV5k8FJms+4=;
 b=VCnqWp4x/2thrFV92WhUCtNB1DO1+x0HJ9UCfEogZ2XX0pzqSyva/H2TXi8UjzPpj6isal1PVnGaknncPywocBbWYWAHGwoz5QkrYDOrc9uJhdZQlTWPCYN3D0HsLW9c0I27+EffQutuhpLJOxWLG1R5ulRZGevbE11eLjA171B6ZAFYqzMQXWGiYkRorpoNaRPMx3gJRqGOELm6JU7a5ppPEbXHycDJ4RPneoxrTzYs1NlPHSMcAXUsuWrcCKbk+5jVjXeFn1YoeYKZ04YDT08B3FbkFkbQnUmypwoUDPJQTMZsFvAjXSy4CIurZVDwP7rE+VX7RqpUBWqVr9Tp/g==
Received: from CH2PR03CA0007.namprd03.prod.outlook.com (2603:10b6:610:59::17)
 by CH0PR12MB5282.namprd12.prod.outlook.com (2603:10b6:610:d5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 17:19:15 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::5e) by CH2PR03CA0007.outlook.office365.com
 (2603:10b6:610:59::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 17:19:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 17:19:15 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Mon, 14 Aug 2023
 10:19:04 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Mon, 14 Aug 2023 10:19:04 -0700
Received: from vdi.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Mon, 14 Aug 2023 10:19:02 -0700
To: <virtualization@lists.linux-foundation.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH net v1] virtio_net: Introduce skb_vnet_common_hdr to avoid
 typecasting
Date: Mon, 14 Aug 2023 13:18:45 -0400
Message-ID: <20230814171845.65930-1-feliu@nvidia.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|CH0PR12MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eab1326-62dc-46e7-dc61-08db9cea95e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /jgI8NVtwmqFYj1wSVKdDzOzrCwVsNgYFSXm5oLfnWcw9144bmg38AfF5DAB4bay0QVIWSyS/iEezp7JVHC8TCBb3+EQiPL0j1MbcNL++U6RjD/BsbpFiqa8LhEx4r2/+E2S3GeNiIO2MZfxo8FtQapcbR91HOC7llX3OzxAUIuuTKVc0wBrcUliUlfnGJSfR/f0KLZi/7WEIVJ/X0VNlMzDqwT/8sLu+OPH0abTyJhxN5CbSXqsQitZ3vUpZiSZOKNhyUvhE3I9dN5L3y/ab0imQ8YUzW71tz0cwGxD7gIyh9X4vw6DLB4XRMuA5NmKDAPZtzFTOp/Lurk3DCrhpmA6z+uUgrOwf9ncytfIQJI4kdgtU8lnQGhydpHxE7qhs1b93rFM8fKgEoM2zzT4510Jlxx00WiXi6Z8Vz2H/O1qn5jftE/MsGjtNmaa9i4QsKkh8WpLzq2g+nsyS+T2zQeKZbuBuvSetence/xNYi015+T077/F95obFaLoTlR5aI+lLOfWDpq0g9N/uoKQJQUBKqexpA9nuHh3uxIfhomvy1gpkVjRieQG1WiiYbWEasAMOfNlXC4yAf97Z1d/YQf9idaBl1OPns2EIOYxYwRiXy7METa7DLI36zgUN0BS5HdgI8QGV5/VB+s8dGIT+1lYQ9UfxBRP986/q/pl6D3ZoUXnfTngIPkqBXHWN9CmV7hsewaOidho63Ou2IZVtgekhDu5+TTAeRlRH57QTgDUs9NNnf8dWbo8ZSNKeJ1k
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(186006)(1800799006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(83380400001)(336012)(36756003)(426003)(47076005)(36860700001)(66899021)(86362001)(40480700001)(41300700001)(82740400003)(478600001)(7636003)(356005)(316002)(54906003)(70206006)(70586007)(8676002)(8936002)(5660300002)(4326008)(110136005)(40460700003)(2616005)(1076003)(107886003)(26005)(7696005)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 17:19:15.2825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eab1326-62dc-46e7-dc61-08db9cea95e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5282
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Jiri Pirko <jiri@nvidia.com>,
 Bodong Wang <bodong@nvidia.com>
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
From: Feng Liu via Virtualization <virtualization@lists.linux-foundation.org>
Reply-To: Feng Liu <feliu@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

The virtio_net driver currently deals with different versions and types
of virtio net headers, such as virtio_net_hdr_mrg_rxbuf,
virtio_net_hdr_v1_hash, etc. Due to these variations, the code relies
on multiple type casts to convert memory between different structures,
potentially leading to bugs when there are changes in these structures.

Introduces the "struct skb_vnet_common_hdr" as a unifying header
structure using a union. With this approach, various virtio net header
structures can be converted by accessing different members of this
structure, thus eliminating the need for type casting and reducing the
risk of potential bugs.

For example following code:
static struct sk_buff *page_to_skb(struct virtnet_info *vi,
		struct receive_queue *rq,
		struct page *page, unsigned int offset,
		unsigned int len, unsigned int truesize,
		unsigned int headroom)
{
[...]
	struct virtio_net_hdr_mrg_rxbuf *hdr;
[...]
	hdr_len = vi->hdr_len;
[...]
ok:
	hdr = skb_vnet_hdr(skb);
	memcpy(hdr, hdr_p, hdr_len);
[...]
}

When VIRTIO_NET_F_HASH_REPORT feature is enabled, hdr_len = 20
But the sizeof(*hdr) is 12,
memcpy(hdr, hdr_p, hdr_len); will copy 20 bytes to the hdr,
which make a potential risk of bug. And this risk can be avoided by
introducing struct virtio_net_hdr_mrg_rxbuf.

Signed-off-by: Feng Liu <feliu@nvidia.com>
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
---
 drivers/net/virtio_net.c        | 29 ++++++++++++++++-------------
 include/uapi/linux/virtio_net.h |  7 +++++++
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 1270c8d23463..6ce0fbcabda9 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -344,9 +344,10 @@ static int rxq2vq(int rxq)
 	return rxq * 2;
 }
 
-static inline struct virtio_net_hdr_mrg_rxbuf *skb_vnet_hdr(struct sk_buff *skb)
+static inline struct virtio_net_common_hdr *
+skb_vnet_common_hdr(struct sk_buff *skb)
 {
-	return (struct virtio_net_hdr_mrg_rxbuf *)skb->cb;
+	return (struct virtio_net_common_hdr *)skb->cb;
 }
 
 /*
@@ -469,7 +470,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 				   unsigned int headroom)
 {
 	struct sk_buff *skb;
-	struct virtio_net_hdr_mrg_rxbuf *hdr;
+	struct virtio_net_common_hdr *hdr;
 	unsigned int copy, hdr_len, hdr_padded_len;
 	struct page *page_to_free = NULL;
 	int tailroom, shinfo_size;
@@ -554,7 +555,7 @@ static struct sk_buff *page_to_skb(struct virtnet_info *vi,
 		give_pages(rq, page);
 
 ok:
-	hdr = skb_vnet_hdr(skb);
+	hdr = skb_vnet_common_hdr(skb);
 	memcpy(hdr, hdr_p, hdr_len);
 	if (page_to_free)
 		put_page(page_to_free);
@@ -966,7 +967,7 @@ static struct sk_buff *receive_small_build_skb(struct virtnet_info *vi,
 		return NULL;
 
 	buf += header_offset;
-	memcpy(skb_vnet_hdr(skb), buf, vi->hdr_len);
+	memcpy(skb_vnet_common_hdr(skb), buf, vi->hdr_len);
 
 	return skb;
 }
@@ -1577,7 +1578,8 @@ static void receive_buf(struct virtnet_info *vi, struct receive_queue *rq,
 {
 	struct net_device *dev = vi->dev;
 	struct sk_buff *skb;
-	struct virtio_net_hdr_mrg_rxbuf *hdr;
+	struct virtio_net_common_hdr *common_hdr;
+	struct virtio_net_hdr_mrg_rxbuf	*mrg_hdr;
 
 	if (unlikely(len < vi->hdr_len + ETH_HLEN)) {
 		pr_debug("%s: short packet %i\n", dev->name, len);
@@ -1597,18 +1599,19 @@ static void receive_buf(struct virtnet_info *vi, struct receive_queue *rq,
 	if (unlikely(!skb))
 		return;
 
-	hdr = skb_vnet_hdr(skb);
+	common_hdr = skb_vnet_common_hdr(skb);
 	if (dev->features & NETIF_F_RXHASH && vi->has_rss_hash_report)
-		virtio_skb_set_hash((const struct virtio_net_hdr_v1_hash *)hdr, skb);
+		virtio_skb_set_hash(&common_hdr->hash_v1_hdr, skb);
 
-	if (hdr->hdr.flags & VIRTIO_NET_HDR_F_DATA_VALID)
+	mrg_hdr = &common_hdr->mrg_hdr;
+	if (mrg_hdr->hdr.flags & VIRTIO_NET_HDR_F_DATA_VALID)
 		skb->ip_summed = CHECKSUM_UNNECESSARY;
 
-	if (virtio_net_hdr_to_skb(skb, &hdr->hdr,
+	if (virtio_net_hdr_to_skb(skb, &mrg_hdr->hdr,
 				  virtio_is_little_endian(vi->vdev))) {
 		net_warn_ratelimited("%s: bad gso: type: %u, size: %u\n",
-				     dev->name, hdr->hdr.gso_type,
-				     hdr->hdr.gso_size);
+				     dev->name, mrg_hdr->hdr.gso_type,
+				     mrg_hdr->hdr.gso_size);
 		goto frame_err;
 	}
 
@@ -2105,7 +2108,7 @@ static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
 	if (can_push)
 		hdr = (struct virtio_net_hdr_mrg_rxbuf *)(skb->data - hdr_len);
 	else
-		hdr = skb_vnet_hdr(skb);
+		hdr = &skb_vnet_common_hdr(skb)->mrg_hdr;
 
 	if (virtio_net_hdr_from_skb(skb, &hdr->hdr,
 				    virtio_is_little_endian(vi->vdev), false,
diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 12c1c9699935..db40f93ae8b3 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -201,6 +201,13 @@ struct virtio_net_hdr_mrg_rxbuf {
 	struct virtio_net_hdr hdr;
 	__virtio16 num_buffers;	/* Number of merged rx buffers */
 };
+
+struct virtio_net_common_hdr {
+	union {
+		struct virtio_net_hdr_mrg_rxbuf	mrg_hdr;
+		struct virtio_net_hdr_v1_hash hash_v1_hdr;
+	};
+};
 #endif /* ...VIRTIO_NET_NO_LEGACY */
 
 /*
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
