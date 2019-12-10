Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8CE11893C
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:09:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8F07A857D6;
	Tue, 10 Dec 2019 13:09:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rW-Db4nXC7ow; Tue, 10 Dec 2019 13:09:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 283C685F37;
	Tue, 10 Dec 2019 13:09:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 12FE1C0881;
	Tue, 10 Dec 2019 13:09:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E0FF0C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CA3A388127
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vm42OalhfHw5
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5537987F0C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575983365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNvyL4Y9eRzqtb2H2E84LxRf2YADQJydGhMMLpn/rvY=;
 b=i8ohfh20OiFjRcrmIMX+7VPcH8sqk/OLeXfzv5GYWsRq2z1CHTjSy2w42mTY4J+HQtMX7F
 o/HZvqIeh57NXt/HJxaLbbX0p7sTVSPYze3jMHMEMID7SWifQOB7F1acN+2c4uFmfUf8/d
 phvrJ5lOBRckI8e+0PNSUqwIzFWCrps=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-Uhe5Df-hNOmLxhmPgwseKQ-1; Tue, 10 Dec 2019 08:09:23 -0500
Received: by mail-qv1-f71.google.com with SMTP id z9so6755395qvo.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 05:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQxMVxgAtK5y0CyKs1BCEj6d5vwE3qN67Xvd5FZmfgk=;
 b=IhDxDdBPC4WY0e0+6HTWrXZyCYnSXAhzW00LV4FPN1VAZv44+Ymn/pN4BXQOkH3R4h
 PBjKsLhGNQ6/WB3F/dn9dB/NLVGsCaKgjB42/K62/XRWcZRd+kgc0hjIq+ge/9GbcASN
 qVRnWR15C9e1s36ZAJ0CSfvVLc+e8r8kozutZZQHt/3Iw8qywYTsLGtCoK5/FizRmA+M
 Ql0i8yPTBUcOpRaAXFfw3MEV12PskIErHLXWpKXQDF8P4fAAaHj6zAjH8A2zP1mNvD2F
 6WOxdvx5jJu+XuYy7GAIdRViL4BEIZby4s+eJw7iDL1C5VTiZkAvO5df/rUxBWXScy4S
 T3Gg==
X-Gm-Message-State: APjAAAW6ts2h+xRiD/1gQC9XKjHmV9cn1x1Qs2YivgoKj3DusyeTyR3B
 9Ftmjk9U8Di6XXGASQNkJQAJHdWIYmX48Szj08kAITIYBHiqAGAjpw58xbqc3YJCHhNDWT7oIHr
 m4AsMC2NeA6WQ2gsAvwM841kJy4TnF3p/sdQiQDBw5A==
X-Received: by 2002:a05:620a:911:: with SMTP id
 v17mr12704476qkv.251.1575983363389; 
 Tue, 10 Dec 2019 05:09:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7ER+Suti7b7WGSHiGKo0njA6UpaXbA4+jGOZ4LZZhkiLlbT0G0TM3FUm0G1znF25VZZnGAw==
X-Received: by 2002:a05:620a:911:: with SMTP id
 v17mr12704462qkv.251.1575983363208; 
 Tue, 10 Dec 2019 05:09:23 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id x32sm1074057qtx.84.2019.12.10.05.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 05:09:22 -0800 (PST)
Date: Tue, 10 Dec 2019 08:09:17 -0500
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
X-MC-Unique: Uhe5Df-hNOmLxhmPgwseKQ-1
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
