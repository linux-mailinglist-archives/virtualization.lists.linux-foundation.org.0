Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D836D48852A
	for <lists.virtualization@lfdr.de>; Sat,  8 Jan 2022 19:00:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8841D81417;
	Sat,  8 Jan 2022 18:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r99JmvzV7VmL; Sat,  8 Jan 2022 18:00:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 6E30681416;
	Sat,  8 Jan 2022 18:00:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D71BEC0070;
	Sat,  8 Jan 2022 18:00:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2049BC001E
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Jan 2022 18:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE8D7605EA
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Jan 2022 18:00:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86hTXiIJo1XJ
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Jan 2022 18:00:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB0FC60071
 for <virtualization@lists.linux-foundation.org>;
 Sat,  8 Jan 2022 18:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641664847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=pzEFHr83S9POpRQq4pM/eG49Pxi7C/LXxl9tC2D25S0=;
 b=dO+TVk+uejQ28qt9jKPZiJVZ+N2lgAiwr2uHAPQ761J4Flxga8KzsHd9EBYdU8YL/L+7Om
 S7UwenhCzClSryMXPJKBhD7DyRVdVS4/gqoDn/mn9eHDyC1OYApRBoD7nLiCTG4ZNQRc6U
 hE5qh1Ix481CrRzL4+UA+40XLWTsEQM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-ZQMfvHjfNNmYPfMRHCJyPA-1; Sat, 08 Jan 2022 13:00:46 -0500
X-MC-Unique: ZQMfvHjfNNmYPfMRHCJyPA-1
Received: by mail-wm1-f69.google.com with SMTP id
 r65-20020a1c4444000000b003478a458f01so3312295wma.4
 for <virtualization@lists.linux-foundation.org>;
 Sat, 08 Jan 2022 10:00:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=pzEFHr83S9POpRQq4pM/eG49Pxi7C/LXxl9tC2D25S0=;
 b=x37LYvKfKbePcvCQkBh306HxgvBr8lMOnKPaCyqUjHdXqhUPSuMQ/9G4JeMDqVkpS5
 lKjsqxxQFdDoABYqS5fcoY/qTo0lkhA24cFsPpQ1Zwg+y1LEmaFNsMBraCirIt93D7ZD
 8nYkETYXTHR7Tkn0QK+GNIvKGvwKrson5vE7BrCM7sOiuT34MHi4GS1n5Zl0tG4UikH1
 JKF3ErF1ATdgvJfxAalguq0vPaWHcKx8R2+IJi/0csl7dean+jKwnwD/30GvT49ZKHB9
 nCy4Jny8k/r1CuR3Bn1VV0HGhkWRJps36wc/cSGTvLWqRXBXP+MuEXI/r03WNLMnvpN7
 IFgg==
X-Gm-Message-State: AOAM530bQMNNR1Ut8a8DGG0Izm64S7qrefyuKgtZXIaMNaAya/88/ELy
 1f4coQm3DQtrtCqBL2IaXEX6UOpUckcRGTN0LaGRwm7pAdAUIy/WFaGJnhbOlbdRkv3VFh8FL5D
 C+eJp88ogfTvpvCCVyLzuBFS981COAtptaD+rXlZl4A==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr56753427wrz.666.1641664845470; 
 Sat, 08 Jan 2022 10:00:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwz9GxLhfeBhj5hp36+qSVZeY0MnNgIW7wIVNb8K+OXWilRMvLTYxibFK7C1W6P4qkC6t8P/Q==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr56753418wrz.666.1641664845266; 
 Sat, 08 Jan 2022 10:00:45 -0800 (PST)
Received: from redhat.com ([2a10:800d:b77b:0:4c0a:9a47:da3d:38fd])
 by smtp.gmail.com with ESMTPSA id l26sm2173403wrz.44.2022.01.08.10.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 10:00:44 -0800 (PST)
Date: Sat, 8 Jan 2022 13:00:43 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vdpa/mlx5: fix endian-ness for max vqs
Message-ID: <20220108180041.4601-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Eli Cohen <elic@nvidia.com>, kernel test robot <lkp@intel.com>,
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

sparse warnings: (new ones prefixed by >>)
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:1247:23: sparse: sparse: cast to restricted __le16
>> drivers/vdpa/mlx5/net/mlx5_vnet.c:1247:23: sparse: sparse: cast from restricted __virtio16

> 1247                  num = le16_to_cpu(ndev->config.max_virtqueue_pairs);

Address this using the appropriate wrapper.

Fixes: 7620d51af29a ("vdpa/mlx5: Support configuring max data virtqueue")
Cc: "Eli Cohen" <elic@nvidia.com>
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index 84b1919015ce..d1ff65065fb1 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -1242,7 +1242,8 @@ static int create_rqt(struct mlx5_vdpa_net *ndev)
 	if (!(ndev->mvdev.actual_features & BIT_ULL(VIRTIO_NET_F_MQ)))
 		num = 1;
 	else
-		num = le16_to_cpu(ndev->config.max_virtqueue_pairs);
+		num = mlx5vdpa16_to_cpu(&ndev->mvdev,
+					ndev->config.max_virtqueue_pairs);
 
 	max_rqt = min_t(int, roundup_pow_of_two(num),
 			1 << MLX5_CAP_GEN(ndev->mvdev.mdev, log_max_rqt_size));
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
