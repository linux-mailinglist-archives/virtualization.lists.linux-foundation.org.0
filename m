Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A586E59C7
	for <lists.virtualization@lfdr.de>; Tue, 18 Apr 2023 08:53:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F8DE81B14;
	Tue, 18 Apr 2023 06:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F8DE81B14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0u0W-E6xI0Fe; Tue, 18 Apr 2023 06:53:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0099181E44;
	Tue, 18 Apr 2023 06:53:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0099181E44
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C83F4C002A;
	Tue, 18 Apr 2023 06:53:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E841DC008A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4928818AC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4928818AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dqx-AP3XiTbR
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9611181A47
Received: from out30-124.freemail.mail.aliyun.com
 (out30-124.freemail.mail.aliyun.com [115.124.30.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9611181A47
 for <virtualization@lists.linux-foundation.org>;
 Tue, 18 Apr 2023 06:53:41 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R411e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018045192;
 MF=xuanzhuo@linux.alibaba.com; NM=1; PH=DS; RN=13; SR=0;
 TI=SMTPD_---0VgOLSH8_1681800815; 
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com
 fp:SMTPD_---0VgOLSH8_1681800815) by smtp.aliyun-inc.com;
 Tue, 18 Apr 2023 14:53:36 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next v2 08/14] virtio_net: auto release xdp shinfo
Date: Tue, 18 Apr 2023 14:53:21 +0800
Message-Id: <20230418065327.72281-9-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20230418065327.72281-1-xuanzhuo@linux.alibaba.com>
References: <20230418065327.72281-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: d931ac25730a
Cc: Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 virtualization@lists.linux-foundation.org, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

virtnet_build_xdp_buff_mrg() and virtnet_xdp_handler() auto
release xdp shinfo then the caller no need to careful the xdp shinfo.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/net/virtio_net.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index e2eade87d2d4..266c1670beda 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -834,7 +834,7 @@ static int virtnet_xdp_handler(struct bpf_prog *xdp_prog, struct xdp_buff *xdp,
 		xdpf = xdp_convert_buff_to_frame(xdp);
 		if (unlikely(!xdpf)) {
 			netdev_dbg(dev, "convert buff to frame failed for xdp\n");
-			return VIRTNET_XDP_RES_DROP;
+			goto drop;
 		}
 
 		err = virtnet_xdp_xmit(dev, 1, &xdpf, 0);
@@ -842,7 +842,7 @@ static int virtnet_xdp_handler(struct bpf_prog *xdp_prog, struct xdp_buff *xdp,
 			xdp_return_frame_rx_napi(xdpf);
 		} else if (unlikely(err < 0)) {
 			trace_xdp_exception(dev, xdp_prog, act);
-			return VIRTNET_XDP_RES_DROP;
+			goto drop;
 		}
 
 		*xdp_xmit |= VIRTIO_XDP_TX;
@@ -852,7 +852,7 @@ static int virtnet_xdp_handler(struct bpf_prog *xdp_prog, struct xdp_buff *xdp,
 		stats->xdp_redirects++;
 		err = xdp_do_redirect(dev, xdp, xdp_prog);
 		if (err)
-			return VIRTNET_XDP_RES_DROP;
+			goto drop;
 
 		*xdp_xmit |= VIRTIO_XDP_REDIR;
 		return VIRTNET_XDP_RES_CONSUMED;
@@ -864,8 +864,12 @@ static int virtnet_xdp_handler(struct bpf_prog *xdp_prog, struct xdp_buff *xdp,
 		trace_xdp_exception(dev, xdp_prog, act);
 		fallthrough;
 	case XDP_DROP:
-		return VIRTNET_XDP_RES_DROP;
+		break;
 	}
+
+drop:
+	put_xdp_frags(xdp);
+	return VIRTNET_XDP_RES_DROP;
 }
 
 static unsigned int virtnet_get_headroom(struct virtnet_info *vi)
@@ -1201,7 +1205,7 @@ static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
 				 dev->name, *num_buf,
 				 virtio16_to_cpu(vi->vdev, hdr->num_buffers));
 			dev->stats.rx_length_errors++;
-			return -EINVAL;
+			goto err;
 		}
 
 		stats->bytes += len;
@@ -1220,7 +1224,7 @@ static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
 			pr_debug("%s: rx error: len %u exceeds truesize %lu\n",
 				 dev->name, len, (unsigned long)(truesize - room));
 			dev->stats.rx_length_errors++;
-			return -EINVAL;
+			goto err;
 		}
 
 		frag = &shinfo->frags[shinfo->nr_frags++];
@@ -1235,6 +1239,10 @@ static int virtnet_build_xdp_buff_mrg(struct net_device *dev,
 
 	*xdp_frags_truesize = xdp_frags_truesz;
 	return 0;
+
+err:
+	put_xdp_frags(xdp);
+	return -EINVAL;
 }
 
 static void *mergeable_xdp_prepare(struct virtnet_info *vi,
@@ -1364,7 +1372,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 		err = virtnet_build_xdp_buff_mrg(dev, vi, rq, &xdp, data, len, frame_sz,
 						 &num_buf, &xdp_frags_truesz, stats);
 		if (unlikely(err))
-			goto err_xdp_frags;
+			goto err_xdp;
 
 		act = virtnet_xdp_handler(xdp_prog, &xdp, dev, xdp_xmit, stats);
 
@@ -1372,7 +1380,7 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 		case VIRTNET_XDP_RES_PASS:
 			head_skb = build_skb_from_xdp_buff(dev, vi, &xdp, xdp_frags_truesz);
 			if (unlikely(!head_skb))
-				goto err_xdp_frags;
+				goto err_xdp;
 
 			rcu_read_unlock();
 			return head_skb;
@@ -1382,11 +1390,8 @@ static struct sk_buff *receive_mergeable(struct net_device *dev,
 			goto xdp_xmit;
 
 		case VIRTNET_XDP_RES_DROP:
-			break;
+			goto err_xdp;
 		}
-err_xdp_frags:
-		put_xdp_frags(&xdp);
-		goto err_xdp;
 	}
 	rcu_read_unlock();
 
-- 
2.32.0.3.g01195cf9f

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
