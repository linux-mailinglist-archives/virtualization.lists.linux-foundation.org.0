Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D85F118942
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:09:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4680D85F4D;
	Tue, 10 Dec 2019 13:09:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F_y-kGUzK5bQ; Tue, 10 Dec 2019 13:09:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D2F2C85F50;
	Tue, 10 Dec 2019 13:09:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3B71C1796;
	Tue, 10 Dec 2019 13:09:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0539BC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E61AA88127
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PbUKkHmOdj3P
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9307687F0C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575983382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNvyL4Y9eRzqtb2H2E84LxRf2YADQJydGhMMLpn/rvY=;
 b=Io2ffSOod8xFckXmJTf21LRP27vOFrCF9tb7ARgIMno9ISuQXTu+HgNIj74t+By9X5sYKW
 ep25mrnAh8n6WZ8pqPDQx4INl1YYMTEuNNAIqtzX+hDicQtHG48UmZ67MpM0Nr9iJMg4M0
 KNiwEqzC3gdLZXzdy+rr1KdI6S3aIHg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-fVmwa2uPPDunS9HVtym6sw-1; Tue, 10 Dec 2019 08:09:38 -0500
Received: by mail-qt1-f197.google.com with SMTP id d18so601539qtp.16
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 05:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQxMVxgAtK5y0CyKs1BCEj6d5vwE3qN67Xvd5FZmfgk=;
 b=IJGmfxa5Yv5olEl1bSaJ+CMaWXgpV3xeMIMHk+q+vi/nVTEF+cVDqSk3GIqsejThPp
 NYE/cX1dhJSENVGayk/nnd0iMCioY6f8Lhg00Nz+72CjOoGxyMuqTF+pSHKH7zEFoVnM
 GhyPbC0cfTk3nXyXApFs74KYSwHrxSImQ6QX5KrJYYZ8JozKLKa4Xz74TJjRTWv8/Gmp
 91ONX4OGOqQTTi2ofhZ48klPqF4pD0OkSb1r6CxP1t5xpDaFbRo2ChzWXYm6LHJhNo4+
 yRPNNYdrqgVZ31LWMuT460Ru4BGPmyFhXATgV1JTELYI8rJJoHV632FUJfGs0WTQQQCf
 /eLQ==
X-Gm-Message-State: APjAAAXAiD4JUwRLN3F3uESo8Mi2uZpA8DsjdsFKzLYPqRBn6D7Ig3hJ
 aobJiiLTPKCTgJECH3lDLVKDHp1Bwe8una/DdW43jGOCicJ6XlGXpDAMSizQWfUCair87wOMpf4
 hW/J+jFvB9ni7LArR07mEl3ypfo5EGcCESTaicpsOKA==
X-Received: by 2002:ac8:1348:: with SMTP id f8mr30477638qtj.159.1575983378429; 
 Tue, 10 Dec 2019 05:09:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqxzCxpfTPGAXiCVPIWJAs4HLWH6sVbFeBsTubfL0QW4kVTGuGgosmmYsXqgQxz0BbX7tFuG7A==
X-Received: by 2002:ac8:1348:: with SMTP id f8mr30477630qtj.159.1575983378295; 
 Tue, 10 Dec 2019 05:09:38 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id o187sm903287qkf.26.2019.12.10.05.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 05:09:37 -0800 (PST)
Date: Tue, 10 Dec 2019 08:09:32 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v11 3/3] netronome: use the new txqueue timeout
 argument
Message-ID: <20191210130837.47913-4-mst@redhat.com>
References: <20191210130837.47913-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210130837.47913-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: fVmwa2uPPDunS9HVtym6sw-1
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
