Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F29ED1105D8
	for <lists.virtualization@lfdr.de>; Tue,  3 Dec 2019 21:18:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 831E287C20;
	Tue,  3 Dec 2019 20:18:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eoIJ8DKlT5PP; Tue,  3 Dec 2019 20:18:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 819DC87B1D;
	Tue,  3 Dec 2019 20:18:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60146C1798;
	Tue,  3 Dec 2019 20:18:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA610C087F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B6AC287813
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:18:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4r18HkaNITo
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 735918781C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  3 Dec 2019 20:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575404331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QzfchXBORmVAXVWCchalHt0Yn1js9G37mDNvONQ3Wls=;
 b=BCuAMHPfyZpG8I9aKGXGyLHrazi+WMWRziA54L8OLUR63lFFMJX4KNo4qMZ//xec18ggK6
 qss696NrS7Z15+TTPp6KgBi/bj60ECBf97p0GQLGR1XgRUSAtQ59h8ZUuNDxqjxoN7DmNA
 +J67jEtogTZ1kj7dTcvXqLgr8Acopxk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-97I2ryY6PzW_r2bVAM1QCQ-1; Tue, 03 Dec 2019 15:18:49 -0500
Received: by mail-qv1-f72.google.com with SMTP id e11so2970934qvv.18
 for <virtualization@lists.linux-foundation.org>;
 Tue, 03 Dec 2019 12:18:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1eT8WcO+phWqOZ5pmGdX1qqI1UY1VLfXJPwN7V6jCjo=;
 b=rg7jTB4lF29QvwVozdyQKSiBX0+MEXNEg0f7DKXLvQi9WCHb6UX5ekKiMlLItK5lRt
 dYL4aZ2e4eXaUP+8TGE1Ey8gNAoxZ8QV2dJcpbGMaPzfXk6rdrsZ7bhx9f0M7ciWyDDQ
 Opaw7+y0Pi5ilt5XXrm5U6uPCMNIb7CnfVLjIhv+rT5h7+ki1p+XrrWJCd+W3+sMaPF5
 LLC4efT0IRHx3wA78Jgq0tRqFCGhHh9TRBrAdWrTYxjmDIqjdGY+thQoXFiQOu6i64db
 qYUBEnsep++AaLHn16dQxikulO1DxO2mM2pBVTqjMZfghwEnn3rqcyx3G6MTnMhSDWza
 UipQ==
X-Gm-Message-State: APjAAAXqiSMzIpS2Wu8U9wYdY8py14zgvBjRs7hY9GnB8vf+15ow/OQ+
 DLeRBpYrJFdo1UT2e71r6/y7bpiEHW8e/ZJLbq4eoH7Q/Z/Na6yWkDqg9VU4IPeSxSrc7g54DCn
 YuyzEIMRiRpmOFBcOYvZNnuPo09XKRR1Q3kui0N1RdA==
X-Received: by 2002:ae9:e30e:: with SMTP id v14mr6993495qkf.344.1575404329220; 
 Tue, 03 Dec 2019 12:18:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqysczwdd3R/V/nqPtkylMkEJge0arlFCdi6l3hYYdJyHzUT6UlaH9W1E/8BHEBhaPjqmCAnFg==
X-Received: by 2002:ae9:e30e:: with SMTP id v14mr6993469qkf.344.1575404329019; 
 Tue, 03 Dec 2019 12:18:49 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id s127sm2357687qkc.44.2019.12.03.12.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 12:18:48 -0800 (PST)
Date: Tue, 3 Dec 2019 15:18:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH RFC net-next v8 3/3] netronome: use the new txqueue timeout
 argument
Message-ID: <20191203201804.662066-4-mst@redhat.com>
References: <20191203201804.662066-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191203201804.662066-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: 97I2ryY6PzW_r2bVAM1QCQ-1
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

Changes from v7:
	combine two warnings into one

 drivers/net/ethernet/netronome/nfp/nfp_net_common.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index 41a808b14d76..eb1f9bed4833 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -1323,14 +1323,8 @@ nfp_net_tx_ring_reset(struct nfp_net_dp *dp, struct nfp_net_tx_ring *tx_ring)
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
