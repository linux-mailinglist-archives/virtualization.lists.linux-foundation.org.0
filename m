Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E534A118906
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 14:01:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6520A86388;
	Tue, 10 Dec 2019 13:01:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f1l+09rdmEwZ; Tue, 10 Dec 2019 13:01:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C906F860F1;
	Tue, 10 Dec 2019 13:01:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4A0EC0881;
	Tue, 10 Dec 2019 13:01:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA7BDC0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A18D886388
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1uq+PEum8XBY
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id DB42D860F1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575982860;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9e82RZxMOLIpTiokhMnuko25lsVYhsTU5bajYGHD3E0=;
 b=IfIvt0SH/xjNIWxjUbdG2ikYLSZZw1L9EkYKH2tWuUHj7TX6XuBJN/7NsTxiK1uW86AUsi
 px4Ra77di3KVzPMwL14RTpD3lFNFYZYw9At99xRqNGVvZYVZCBPD5Gfakf0dnW5ZvhACWF
 OYEkGSiaa/EusO9ewENOGsqmFHFv7XQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-cgIWgu5TMyqg4k0mkZDvpA-1; Tue, 10 Dec 2019 08:00:56 -0500
Received: by mail-qv1-f72.google.com with SMTP id r8so6775071qvp.3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 05:00:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wrMmlrBt1X+KXyyzVL2v0JpYF8+uVnrQFFbGuDQ2s1k=;
 b=FrfH+y/xcWwwVpf2LXpEq5EJAta7rDEExr4S81B+5cL0gn+WqkkG3eH2IydzIDorx0
 Z2SakKFtwNq/A9wb0TMJnb62N/Snh2VpvWffABunLnrsOskX2tugf+sRl1NhWvfojVwC
 DtwWvn3QTSo0gzZTFA3S0Z1WlvvCWcVfUhQ8iCfUI4Pi+SjOTECxPyGmozvlyUFS1L6J
 xseYu8N74rE00VJz7nLnT0SC6ov7DIUg/VlBBXuQZqPqPC2wVsRoPPFGJCQePiqhCw6Z
 m7YLMJsN+1KUCCj1N1czcJWu5V6776Hn1qqbinOiyX/8Vxozw31soRg1fwfqlcE2DSsL
 Ix8Q==
X-Gm-Message-State: APjAAAXykx3tpCR2LxMXQ71aKUZiWvTdneZgr/U9ak4KwPsDwEn3euF+
 xfRWTsxi4wsvvuIqyYSw1U3DkmURRy+22KvIAAX2ZfwwSuIISrX/WhejAxiiKNzjPwkes9Gqcoj
 XcqtkOEDBKNRRV70GIYd6BBY8esNwTw0FeFG93BJT9Q==
X-Received: by 2002:ae9:ec0a:: with SMTP id h10mr30081124qkg.303.1575982856003; 
 Tue, 10 Dec 2019 05:00:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdPfBVccegJ+sVSh7D3UbOkyDGw8L3+H+QRIw+97A58lq6K5FGQi/nFFUXP/L4WSIDyLcgYg==
X-Received: by 2002:ae9:ec0a:: with SMTP id h10mr30081108qkg.303.1575982855810; 
 Tue, 10 Dec 2019 05:00:55 -0800 (PST)
Received: from redhat.com (bzq-79-181-48-215.red.bezeqint.net. [79.181.48.215])
 by smtp.gmail.com with ESMTPSA id n20sm138085qkk.54.2019.12.10.05.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Dec 2019 05:00:55 -0800 (PST)
Date: Tue, 10 Dec 2019 08:00:50 -0500
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
X-MC-Unique: cgIWgu5TMyqg4k0mkZDvpA-1
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
