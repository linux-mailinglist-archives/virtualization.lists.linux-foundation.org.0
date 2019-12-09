Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1D211719E
	for <lists.virtualization@lfdr.de>; Mon,  9 Dec 2019 17:29:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 742FB869C5;
	Mon,  9 Dec 2019 16:29:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prKVmL6cFOPw; Mon,  9 Dec 2019 16:29:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DBF4F869BB;
	Mon,  9 Dec 2019 16:29:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFC81C1796;
	Mon,  9 Dec 2019 16:29:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14370C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 034AA880C5
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LcIiTesvg-Nj
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 448AC87F81
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575908963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNvyL4Y9eRzqtb2H2E84LxRf2YADQJydGhMMLpn/rvY=;
 b=OplCVjKrQSFLDMx/tmvrPsGWR7m0hGjhyqJ0G5TJ73BOQTEuNV+rxXwF87MkIL0jP46S2S
 GDltfyvLtnRarPiz42sRnEy0j41hE+ibyd27us4fB+KjX8PowXkqeDgiagb1EAoMsNb39I
 xeY4GH+iwxjBxDr4s8Qpyuv5XUmh1t0=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-XLKAEc7HOI6ckCz-lcOhBw-1; Mon, 09 Dec 2019 11:29:22 -0500
Received: by mail-qk1-f200.google.com with SMTP id x71so5290549qka.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Dec 2019 08:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQxMVxgAtK5y0CyKs1BCEj6d5vwE3qN67Xvd5FZmfgk=;
 b=QYqXgBlViczIGizUz6nIu1bvXIc0a3A8s5tvwgw42r/dKJ0yUZbd89ErrCHKFd3m+b
 JgfPINtaV47YHAF9KJiBO1OSmibSpJeF0AC3wIfMie8al6EfSp4iAkUowOFLpE/R/8a0
 Dgfe4Ur4hvSgKtjr52P+OHLgW0OdxkBvks7FOwE7laMg4lC4R/l7qe0BDgcAtbscRbs1
 zOrM9fdOhyA6KFzw/rX363e1RYwkAUy4yn1zmsazfHHeFki9Mi7YN58AnmtMPdkSj2L7
 TkCWQjqmI4rMJ92TSsYtY+AUDJFsYGg3ngPAp5Do9cfhqHZJvtUlAbkAybHmheiVS8dZ
 9T3w==
X-Gm-Message-State: APjAAAXogh8Q4kp2qwWSxHTiPFQEy4DhR76ZmKZCKOGIyq/fuA0ZLCYw
 nF+WuYFri91Mw330caiCJqBLILiq5lDdMQswHvLp3xAobLgIep5kNQvvlG2E52KSrQaT7aYN2No
 f0rfmYC8so8v3rqGqIyNbFU12mdIiNCS4uqXhTHshZw==
X-Received: by 2002:ac8:7699:: with SMTP id g25mr14525702qtr.75.1575908962219; 
 Mon, 09 Dec 2019 08:29:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBHx4JNZAzW5zOl78IJTl/Z39c+yCCpUqxZ1MccFYIr6NFhza1xXBFpnvMlezVfnTZjFAmuw==
X-Received: by 2002:ac8:7699:: with SMTP id g25mr14525689qtr.75.1575908962077; 
 Mon, 09 Dec 2019 08:29:22 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id x19sm19777qtm.47.2019.12.09.08.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 08:29:21 -0800 (PST)
Date: Mon, 9 Dec 2019 11:29:16 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v9 3/3] netronome: use the new txqueue timeout
 argument
Message-ID: <20191209162727.10113-4-mst@redhat.com>
References: <20191209162727.10113-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191209162727.10113-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: XLKAEc7HOI6ckCz-lcOhBw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
Cc: dnmendes76@gmail.com, Jakub Kicinski <jakub.kicinski@netronome.com>,
 mst@redhat.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, davem@davemloft.net
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
---
 drivers/net/ethernet/netronome/nfp/nfp_net_common.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index bd305fc6ed5a..d4eeb3b3cf35 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -1324,14 +1324,8 @@ nfp_net_tx_ring_reset(struct nfp_net_dp *dp, struct nfp_net_tx_ring *tx_ring)
 static void nfp_net_tx_timeout(struct net_device *netdev, unsigned int txqueue)
 {
 	struct nfp_net *nn = netdev_priv(netdev);
-	int i;
 
-	for (i = 0; i < nn->dp.netdev->real_num_tx_queues; i++) {
-		if (!netif_tx_queue_stopped(netdev_get_tx_queue(netdev, i)))
-			continue;
-		nn_warn(nn, "TX timeout on ring: %d\n", i);
-	}
-	nn_warn(nn, "TX watchdog timeout\n");
+	nn_warn(nn, "TX watchdog timeout on ring: %u\n", txqueue);
 }
 
 /* Receive processing
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
