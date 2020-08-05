Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2F723CB0B
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:39:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B2D492034F;
	Wed,  5 Aug 2020 13:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 609UE0GY1c91; Wed,  5 Aug 2020 13:39:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0B0A120343;
	Wed,  5 Aug 2020 13:39:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED9A9C004C;
	Wed,  5 Aug 2020 13:38:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CDEFBC004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B5E6885625
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98vlbwVSbLtZ
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:38:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E6185855CB
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596634736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=nsePUp5bwDzPkeGMt9DhuoyzhxlPvsYKTxQ+QKtzY8M=;
 b=HSjPGDNRXvI0K3rnlZeBjV06upD3Dawu5Y6K65n16DbUBGg3ePorOujesAgUyqbowrbJE9
 l5GxfgvECPoV9wi6f8uzfWH0YXX34HyI/tLHwOjO6wTEPR7KSLpP4AEikqiJjeZ/Seqn9/
 XYhnALd3CJVGRyEXUg1DPPE7rZR76hI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-6M2tFbOGNXSMU-i4BJRksA-1; Wed, 05 Aug 2020 09:38:54 -0400
X-MC-Unique: 6M2tFbOGNXSMU-i4BJRksA-1
Received: by mail-wr1-f71.google.com with SMTP id w7so13640688wrt.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:38:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=nsePUp5bwDzPkeGMt9DhuoyzhxlPvsYKTxQ+QKtzY8M=;
 b=TJPikuiDo7o5MyAZoqv2jSay/Fe29AoAxa/A/FA0wQw71T00BaZzvxesd0sHwXjiIp
 /ZkqWuYwWwSQg1ZRRZmLrl6rQOggpYA4HDporNYOWrbSC/+MKxKSxvVW8zHGzTIP8p+8
 9kM0/tixl8ApERgIzG4N8ZXhyj2NF8nD0j+8s72EEBlmiqgrR8C20e97eazr4lOkco7d
 HLvEXaJcISRiGarHkF6YBOyCJniYuENb0NSV8DCDpYVeNAcsCdQHBvqgyuMakOo+BdtL
 hUvCc7+sJiGa7O9TuKNuSj5jYgFX5KzIO3daYy7Sjx43Qb7EEhNqo+p8Q2h6DYHOqC88
 OsLQ==
X-Gm-Message-State: AOAM530fltkTHeUtphNRf2kZAXzCBazpQGy2paWE4ljor6/bFmdZ8sGX
 kDXuGc8xw3kCgSjBadLe4+1WdgobAxe30PEgwgB+FrKJ5AQI43GvwT2sDFYMfUSWuUbmjebCwoZ
 yzddYY7AsRCbcGfx8azNmOGXfJuPntpE29jmPrLtgSQ==
X-Received: by 2002:adf:f486:: with SMTP id l6mr2832110wro.265.1596634733652; 
 Wed, 05 Aug 2020 06:38:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrJHbiAkvwUZChxw62cK2kQ+h4SfhhoyHmbeMJJ3IoB9ua448nhQGhAU9Dt58uSQD6O7qCdw==
X-Received: by 2002:adf:f486:: with SMTP id l6mr2832102wro.265.1596634733486; 
 Wed, 05 Aug 2020 06:38:53 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id w1sm2855531wmc.18.2020.08.05.06.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:38:52 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:38:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_net: use LE accessors for speed/duplex
Message-ID: <20200805133843.1105808-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 virtualization@lists.linux-foundation.org, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
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

Speed and duplex config fields depend on VIRTIO_NET_F_SPEED_DUPLEX
which being 63>31 depends on VIRTIO_F_VERSION_1.

Accordingly, use LE accessors for these fields.

Reported-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/net/virtio_net.c        | 9 +++++----
 include/uapi/linux/virtio_net.h | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
index ba38765dc490..0934b1ec5320 100644
--- a/drivers/net/virtio_net.c
+++ b/drivers/net/virtio_net.c
@@ -2264,12 +2264,13 @@ static void virtnet_update_settings(struct virtnet_info *vi)
 	if (!virtio_has_feature(vi->vdev, VIRTIO_NET_F_SPEED_DUPLEX))
 		return;
 
-	speed = virtio_cread32(vi->vdev, offsetof(struct virtio_net_config,
-						  speed));
+	virtio_cread_le(vi->vdev, struct virtio_net_config, speed, &speed);
+
 	if (ethtool_validate_speed(speed))
 		vi->speed = speed;
-	duplex = virtio_cread8(vi->vdev, offsetof(struct virtio_net_config,
-						  duplex));
+
+	virtio_cread_le(vi->vdev, struct virtio_net_config, duplex, &duplex);
+
 	if (ethtool_validate_duplex(duplex))
 		vi->duplex = duplex;
 }
diff --git a/include/uapi/linux/virtio_net.h b/include/uapi/linux/virtio_net.h
index 27d996f29dd1..3f55a4215f11 100644
--- a/include/uapi/linux/virtio_net.h
+++ b/include/uapi/linux/virtio_net.h
@@ -99,7 +99,7 @@ struct virtio_net_config {
 	 * speed, in units of 1Mb. All values 0 to INT_MAX are legal.
 	 * Any other value stands for unknown.
 	 */
-	__virtio32 speed;
+	__le32 speed;
 	/*
 	 * 0x00 - half duplex
 	 * 0x01 - full duplex
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
