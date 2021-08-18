Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8652A3EF8BA
	for <lists.virtualization@lfdr.de>; Wed, 18 Aug 2021 05:36:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00C824023B;
	Wed, 18 Aug 2021 03:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FCEHpaS2WcHP; Wed, 18 Aug 2021 03:36:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 917B340530;
	Wed, 18 Aug 2021 03:36:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 00032C000E;
	Wed, 18 Aug 2021 03:36:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CADA9C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB53660683
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aLr9Rp9NPdfY
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:35:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B486A606D3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Aug 2021 03:35:58 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id e19so934447pla.10
 for <virtualization@lists.linux-foundation.org>;
 Tue, 17 Aug 2021 20:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoTD+9gdzWVQQgsWt1rt2oOyKjIz9skCn5yxqOmC3zo=;
 b=pVeg7w7P875hbyg3bTn84brdJTkJ8iFc7UK5zIrFpTJ8irRojNeSsVZKELAr1Myctn
 EqII4735e2rObDRI3Yd56bHjnL9ZWIB60ctbOgg09/wHWMN2bB/HcLyQlOVGJZYWCM5h
 482t0+BrLDhliLZR/jRD466g0KeMFwG+QO8RhauTw0lMnZ5rSgoEUZGKJDpFW9AAxJjn
 m3I6R8zzO5gATxEiD2CYqmL/wzrIlkMzDrtUheaLlSNB5UK8I06zIDvtncy+QFfxuwUv
 Q5sqUZOcIrwpQPCtWuoGZOSghergP2bJRY+na3GilNXjzWmDeYxuwywrh0NQv+1ndK9k
 NphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EoTD+9gdzWVQQgsWt1rt2oOyKjIz9skCn5yxqOmC3zo=;
 b=SvKlbhjSSTit4z2vl70zVHVPJ3i/orVx8gHdTGAuhlx2rgONAluzSobMh8tVKgrknr
 hJCdqzzQ6Rfp1pwLxYuFcGED2l9LT09GOcK1cLsdoBKGpewlTDQwApptEpcKqDxxpkQP
 meq3eoMHwRIKio+dwJKwp947d+1D+aiV0mCF8p/0FYgvhudLKziinMNczJdoCwulexLH
 4D2cSLhcEuJoWWEVON+1dB2YM1byUCKsZ6aKDM3TuezMyKYPROhJhX1NaG5XHKbOUpqT
 c/AZd5YlgdWMTyWogHXcEt1gVhTqnKQxNR//I5CB80WPZ+rVp0Ume1wSPHysIJrCJkIQ
 Wwjg==
X-Gm-Message-State: AOAM532G1xAkR9pZ+QxpPwdYibj8oDurALk20fQK0iIdi7zv5YFoP5aI
 gZ2pA+TZZ8w0Kzvb5Gz5Nbw7iQ==
X-Google-Smtp-Source: ABdhPJy7/RHf3X+g1zoSTwUZ+x+dwqR2Mme5lAt2zkS8vxqJXUy6l+yqqb3nxmP7N//YmDMbzSNIfQ==
X-Received: by 2002:a17:90b:1950:: with SMTP id
 nk16mr7099560pjb.11.1629257757974; 
 Tue, 17 Aug 2021 20:35:57 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id j5sm3431254pjv.56.2021.08.17.20.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 20:35:57 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wolfram Sang <wsa@kernel.org>, Jie Deng <jie.deng@intel.com>,
 Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH] i2c: virtio: Update i2c-adapter's of_node
Date: Wed, 18 Aug 2021 09:05:50 +0530
Message-Id: <376bd0a3a34e8f0de297103dd2f711bb236a8615.1629257677.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Cc: arnd@kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
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

Set of-node of the adapter to the virtio device's of-node to enable
automatic parsing the of the I2C devices, if present in the DT.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/i2c/busses/i2c-virtio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-virtio.c b/drivers/i2c/busses/i2c-virtio.c
index d3e60d9cde10..2dde69cfb9aa 100644
--- a/drivers/i2c/busses/i2c-virtio.c
+++ b/drivers/i2c/busses/i2c-virtio.c
@@ -228,6 +228,7 @@ static int virtio_i2c_probe(struct virtio_device *vdev)
 	vi->adap.algo = &virtio_algorithm;
 	vi->adap.quirks = &virtio_i2c_quirks;
 	vi->adap.dev.parent = &vdev->dev;
+	vi->adap.dev.of_node = vdev->dev.of_node;
 	i2c_set_adapdata(&vi->adap, vi);
 
 	/*
-- 
2.31.1.272.g89b43f80a514

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
