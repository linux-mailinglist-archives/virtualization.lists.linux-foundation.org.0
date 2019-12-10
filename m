Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E28C811891C
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:05:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 674DC2046A;
	Tue, 10 Dec 2019 13:05:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feEHAPkQxijJ; Tue, 10 Dec 2019 13:04:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BC5C520368;
	Tue, 10 Dec 2019 13:04:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8728EC0881;
	Tue, 10 Dec 2019 13:04:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA860C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C87F488084
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ac-ZlmRRTS0T
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:04:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E9A9F86DDB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575983095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9e82RZxMOLIpTiokhMnuko25lsVYhsTU5bajYGHD3E0=;
 b=bSSi2zCqQ9mdv5wLcEQ+jRJ1JpUe8RBXJGGf9q1vXHqulhpWQke9+F0whRjZ9RDI69NGs6
 g8jjJmvmbEJQGLmJpO278o4dNm5QFRDAlA4SzblePLygpSipyHPSCqJYENv8wsVtr0Vvvg
 fhH41OG3FXZj/0o4ZRBQAJX7hAFAP4g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-XyXeVtRSNE-SqQ5M7HCLCQ-1; Tue, 10 Dec 2019 08:04:53 -0500
Received: by mail-qv1-f71.google.com with SMTP id z9so6746556qvo.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 05:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wrMmlrBt1X+KXyyzVL2v0JpYF8+uVnrQFFbGuDQ2s1k=;
 b=UqSdAc9ghCbHp+CE329OhyYVtCJx1Q+b2ss60ZMbQyqKFK9KRWYXwwc8WvK3dD/1IH
 O/qw8WdzUMNEWFXuF2xNwHNnV/YRUPNbZ+WITx5oTYwq5D/kTAl8pzHJl9dOvtj2uwss
 uMvfx8z5XhfC+stfsBhffbp8QnQWSgf077Ee3GgK2msgqCh1IPjsWiX2y5YdFnhuDmuP
 CcT/KVIFWMqVxW+4YEiKbY9L0aEHxEIpbWv7h3X80NiXfALT0kuvXaXkYKEq7YbtSu1u
 YQOdMMZ1qklcGjJduMBsktsOX9G1EM4qM/1ARFc1W0WY+1EJmSgi5iGZFku+5v9locsE
 Sx+A==
X-Gm-Message-State: APjAAAUj1z+r9/BB9M9cJohjCYEsGkTfemEny/hNFdeClNgrNuBzueFj
 fvmZoRXlJNAYmt8OVqSbAqjvBE3OYrxCe4openxDf4MqGaW0exoJTDuE8Y66anE+T7uXZvyBVmh
 eLv8xdWchJaHFbtTspjtI9pq0sDRN0mFPi4vFv/B7QA==
X-Received: by 2002:ac8:24c3:: with SMTP id t3mr4913483qtt.297.1575983091844; 
 Tue, 10 Dec 2019 05:04:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyvRMy+oBS/dEnpWmTMEn7uoVJylDeK7fazqXG08ZonVvSCZh4f/q1+l6V4b3jvu8EyJI4OOg==
X-Received: by 2002:ac8:24c3:: with SMTP id t3mr4913348qtt.297.1575983090215; 
 Tue, 10 Dec 2019 05:04:50 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id t38sm1070453qta.78.2019.12.10.05.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 05:04:49 -0800 (PST)
Date: Tue, 10 Dec 2019 08:04:45 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org, Julio Faracco <jcfaracco@gmail.com>
Subject: [PATCH net-next v10 3/3] netronome: use the new txqueue timeout
 argument
Message-ID: <20191210130014.47179-4-mst@redhat.com>
References: <20191210130014.47179-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20191210130014.47179-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-MC-Unique: XyXeVtRSNE-SqQ5M7HCLCQ-1
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
