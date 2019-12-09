Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B0811719F
	for <lists.virtualization@lfdr.de>; Mon,  9 Dec 2019 17:29:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2B8A4869C5;
	Mon,  9 Dec 2019 16:29:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AD-iJPLvnTQp; Mon,  9 Dec 2019 16:29:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BB3B869BB;
	Mon,  9 Dec 2019 16:29:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 850C9C0881;
	Mon,  9 Dec 2019 16:29:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D4C87C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id CF3092155B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K48OghSDCzxp
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 1DCC9204DB
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 16:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575908972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NNvyL4Y9eRzqtb2H2E84LxRf2YADQJydGhMMLpn/rvY=;
 b=eKiT5CKGXYXTNvkjJWre2sGI9xoeT5Kq+kXrhSRxgD55Cw5lGTbtuVg2gmFUkAc0ZYQpf9
 ub6AzXx3tu/k9ZUWm44BBpKPmAb3XyUzMSEYke0k5Wa/iY6N1UzL33Km3AJwEZ01CstjgY
 6W9NQnHM+n13xyRm15HnhQ5kFr9p3pY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-3nfcI0APMLyPliYFGFinfQ-1; Mon, 09 Dec 2019 11:29:31 -0500
Received: by mail-qk1-f200.google.com with SMTP id x127so10319238qkb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Dec 2019 08:29:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wQxMVxgAtK5y0CyKs1BCEj6d5vwE3qN67Xvd5FZmfgk=;
 b=CXeF/ssxg47EUimyO9LchRuL1puBWQ4oFKVGvubvjHMWrJPXFcjVymmJwSWXRckMOv
 OASASk6Y8lnpU7xKqnJzw6oS6ocoiNgCUYDR3dmzwLsI06ynmJWX8nR/TpM3G9AGuf7O
 5olzpeRV/ZCT2EBJmusA+arYa2szJ/Zy+HKrf7Qu+TbGa/JxEhftomH1woJK2QDAHwSi
 nxtzkivrZI9qcJbbHkhGqUGsazA9lJ9OEO7ZBG5YexWACwKac28uaR4OyqWPu7Atb6e+
 a32IHvqJm6pBwJlNSDzaxvKGHvWLXpNIohq5j1PZn0bQW0JPUBWuJXHthzBrzI2E8rtc
 qaSw==
X-Gm-Message-State: APjAAAWeT61c766YTu4rHsO37QQleoVMdfhMoSvB3r1Yfby2Kuwhq8Sh
 WM82Yt/CFFW336PoAU8MI8P6uFIu6bL3pkpC2SOYQ0tuMGiXiMGsfrjtUlFM4eaj25sJegQThM7
 F+zY4gsmd9SeSJfieuYvgsvZNHcJI++ikCWx7Uof/xA==
X-Received: by 2002:a05:620a:899:: with SMTP id
 b25mr6205352qka.197.1575908971023; 
 Mon, 09 Dec 2019 08:29:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFUcc6D6y2hR3oAFJBLyCpXqAb6UQCleKthwatt7HxCSSIjpA7ZaRTzyQmAILOaUj4yhzSHQ==
X-Received: by 2002:a05:620a:899:: with SMTP id
 b25mr6205322qka.197.1575908970851; 
 Mon, 09 Dec 2019 08:29:30 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id f19sm420087qkk.69.2019.12.09.08.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 08:29:30 -0800 (PST)
Date: Mon, 9 Dec 2019 11:29:25 -0500
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
X-MC-Unique: 3nfcI0APMLyPliYFGFinfQ-1
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
