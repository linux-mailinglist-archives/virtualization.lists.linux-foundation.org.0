Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7318E1C6848
	for <lists.virtualization@lfdr.de>; Wed,  6 May 2020 08:16:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 03471876F6;
	Wed,  6 May 2020 06:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uZ-zNrnoppXj; Wed,  6 May 2020 06:16:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D10D4876E3;
	Wed,  6 May 2020 06:16:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9813C0859;
	Wed,  6 May 2020 06:16:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D060C0859
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 29DBE87B8E
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-GwXCzHjUlX
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4FDC587A3A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  6 May 2020 06:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588745810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AfWTvjFJDL5wYV2ZbXSYiOFLkMGDFarHl694AF23Z14=;
 b=LwDvbua63iUwD4JJBQq2ujj5TGHipyy8wHnkCMvN9oKMAcKbl7Ytn8SOBtkOQ/Fhjtg0BW
 JlkcVOehnCfYbknVytqE5pOUW+I+jNLDaKK0BBl3FP/CUpfv3e2FgRcqwNkZ+R/b68H3yW
 KQCIil+2PKhcVHrpMnVlg3Brr/lsa6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-Uxs1rhM2N06BGeh0kM_DQw-1; Wed, 06 May 2020 02:16:48 -0400
X-MC-Unique: Uxs1rhM2N06BGeh0kM_DQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23811464;
 Wed,  6 May 2020 06:16:47 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-165.pek2.redhat.com [10.72.13.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2EEFF5C241;
 Wed,  6 May 2020 06:16:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH net-next 2/2] virtio-net: fix the XDP truesize calculation for
 mergeable buffers
Date: Wed,  6 May 2020 14:16:33 +0800
Message-Id: <20200506061633.16327-2-jasowang@redhat.com>
In-Reply-To: <20200506061633.16327-1-jasowang@redhat.com>
References: <20200506061633.16327-1-jasowang@redhat.com>
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

We should not exclude headroom and tailroom when XDP is set. So this
patch fixes this by initializing the truesize from PAGE_SIZE when XDP
is set.

Cc: Jesper Dangaard Brouer <brouer@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/net/virtio_net.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index 98dd75b665a5..3f3aa8308918 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -1184,7 +1184,7 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
 	char *buf;
 	void *ctx;
 	int err;
-	unsigned int len, hole;
+	unsigned int len, hole, truesize;
 
 	/* Extra tailroom is needed to satisfy XDP's assumption. This
 	 * means rx frags coalescing won't work, but consider we've
@@ -1194,6 +1194,7 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
 	if (unlikely(!skb_page_frag_refill(len + room, alloc_frag, gfp)))
 		return -ENOMEM;
 
+	truesize = headroom ? PAGE_SIZE : len;
 	buf = (char *)page_address(alloc_frag->page) + alloc_frag->offset;
 	buf += headroom; /* advance address leaving hole at front of pkt */
 	get_page(alloc_frag->page);
@@ -1205,11 +1206,12 @@ static int add_recvbuf_mergeable(struct virtnet_info *vi,
 		 * the current buffer.
 		 */
 		len += hole;
+		truesize += hole;
 		alloc_frag->offset += hole;
 	}
 
 	sg_init_one(rq->sg, buf, len);
-	ctx = mergeable_len_to_ctx(len, headroom);
+	ctx = mergeable_len_to_ctx(truesize, headroom);
 	err = virtqueue_add_inbuf_ctx(rq->vq, rq->sg, 1, buf, ctx, gfp);
 	if (err < 0)
 		put_page(virt_to_head_page(buf));
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
