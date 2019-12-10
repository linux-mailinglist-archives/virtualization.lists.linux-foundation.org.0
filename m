Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1C118AC5
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 15:26:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C7A5B22253;
	Tue, 10 Dec 2019 14:26:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQbv2BDMY7RH; Tue, 10 Dec 2019 14:26:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 030FD2263C;
	Tue, 10 Dec 2019 14:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D7B64C0881;
	Tue, 10 Dec 2019 14:26:09 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA0D8C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B965D869E3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWuRNQldsg1P
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:26:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0BD57866A9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575987965;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNvyL4Y9eRzqtb2H2E84LxRf2YADQJydGhMMLpn/rvY=;
 b=h49V75VZ40dKnG5xp4tG1GaLBqB0/z6nJ2AaK7dlpXNWfVa0gSFunPVbfpnRt4knKgtXKA
 etcAQwQIG166i5Qx/aboQJ81+c9qkjofMSVZ8xgId/Zt6xIBfbA+n7PdPQPT0rAu8vMav8
 JYv+iVYm2JHbAUJX3t1DPO75X6Lyq2M=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-FKm4wsRsPn-jxN5juKt0Sg-1; Tue, 10 Dec 2019 09:26:04 -0500
Received: by mail-wm1-f71.google.com with SMTP id g26so658452wmk.6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 06:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQxMVxgAtK5y0CyKs1BCEj6d5vwE3qN67Xvd5FZmfgk=;
 b=lGf9dopPfq2l3SH5fia0OrUK+3JUJj3ZoPQnnmfK5GCWfeFaJBFfQgbc4yNSZlUQ0W
 TT8yGFdr9oaMC7m0UbKlwccpQ4c7DGoHrSlNmk8SeSMyNVJMUXS9eXRdgBNKR8TKgg0S
 QMVcGppC0FPT0lU9sBhJRrhkmyLyOXPZLhVCGVStosVcHjrS3df8B91hHyjkzzdx389D
 8bfdssecL7q4HXVKGIDGQwEfSzMpSk4t8iTlAQwGygozTkiTK8z0ReFN7dO9LDZu1ko7
 VaxhTmJ8nIDX/G+Ra+WwnWHFXxC6GNVTIxfAVFP9kW1ZC9CGVZM9j8ZYypLip9fUXyvT
 ej6Q==
X-Gm-Message-State: APjAAAX7AJAn3t4ezm+T58RdbXVzZb6Jb3G+0olha09JIkKv91siJnHN
 NXGEwY2kfLXA2mMvyTaZValTaxEcUqKYu4LrprBRVLbx2deaIjF8zhMZ7dpYyX21EJF/1YUnaQb
 9qSW+80cPKHRPOPtNyaAwWTQfT9kwWmnOpnT2mQWaug==
X-Received: by 2002:a1c:9e0d:: with SMTP id h13mr5613201wme.110.1575987963557; 
 Tue, 10 Dec 2019 06:26:03 -0800 (PST)
X-Google-Smtp-Source: APXvYqwf8mLK3UiBgavRy2zL8nuLvXVh2JCTOm4jCctkF/rAHV0Vm9bzgDEuAXksgE6XBUivzcDsTA==
X-Received: by 2002:a1c:9e0d:: with SMTP id h13mr5613179wme.110.1575987963411; 
 Tue, 10 Dec 2019 06:26:03 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id u8sm3290027wmm.15.2019.12.10.06.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 06:26:02 -0800 (PST)
Date: Tue, 10 Dec 2019 09:26:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v12 3/3] netronome: use the new txqueue timeout
 argument
Message-ID: <20191210142305.52171-4-mst@redhat.com>
References: <20191210142305.52171-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210142305.52171-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: FKm4wsRsPn-jxN5juKt0Sg-1
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
