Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 526ED379EC3
	for <lists.virtualization@lfdr.de>; Tue, 11 May 2021 06:43:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFEC84503;
	Tue, 11 May 2021 04:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pCsF6vWJ6FqK; Tue, 11 May 2021 04:43:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F8B844DB;
	Tue, 11 May 2021 04:43:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7FE00C0001;
	Tue, 11 May 2021 04:43:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC6CEC000D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 04:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BC6D844DB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 04:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZyGjinZ1Fj3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 04:43:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E5A7B84472
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 May 2021 04:43:25 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id n84so10351216wma.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 May 2021 21:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5pOfhSU30/+74TWykEgYzzcECzknBZN+gG9Fp9jV4LM=;
 b=nh8fG27gkiOXB9Nd6Ql5AKT5b4yZ4SDOzi0e2MCZrznnSTBwvbi3UvjCMFYtvSaa5e
 T5aL7BE9xtRQRhLITeB3qJFmGhMcI2W79nl6PLA8YvU4Mhhm1zyShXvMLKwy62DHATZL
 deNH+G75y8mvkk3t3ZPupo6Mop+VgxQ1XhVfVkLLJ6lonX3bRpoevXYxsuFmxrfwQWNC
 9V/KziU2Eu967HWhLsQJq/0+fpFxuiw3xvw7fZo5uiMybxBVxXT2SxRxDVKSGKstA2jh
 OhohXmo5shuPLwlqD7ikkEvUQiQjGWXdUEAqvLWNSoHSAYPK/hzkqwIiwmg4gmZFxMaq
 pF8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5pOfhSU30/+74TWykEgYzzcECzknBZN+gG9Fp9jV4LM=;
 b=DXQNGffcHdXiWAJCwts0idqp6dIvUcf4GdmShiSBqhX46knRQJisS490h5VJgyGUf3
 5zISs26IXSg+OPKZRfcwBwlwlyhiCBZNJLPRF31sRZvjxo+jWqxRB3EdiUANzCBFge9K
 RBnLwP5QUZClKDPF45GyU1FicCwQF6CpP0cXKjAaKdnqCohx/tLn7+T1ZW3c1d8qTsot
 7C1DrHgsuSbebazcP3tnLAH7S1Z9nSDKjVvdXhhEx68P6QWOkdAETUUBuFFzzO8c+OZe
 9RYfWQm0759nIKUNNJrqb9vYnKalWYw9rqxMl9kJxA3AfMr6NyVnAxc6ElImS4K3ru/n
 X5+Q==
X-Gm-Message-State: AOAM53315/CF+YL7JYl9Q16Nsq5n1wxfGq1m20lSJ6+03cVWf27nFxg7
 jRQ/Iak6p/5Lyxbmihy9MqABIysCpgWW2Q==
X-Google-Smtp-Source: ABdhPJxz2fUN2Ek72KoGClY3cxAT8P1LdAZMCqfO5EoKr2QEdfTvTaJ0vok4Mb2bs3QB8c0H7KV+3A==
X-Received: by 2002:a1c:7dd1:: with SMTP id y200mr2960343wmc.81.1620708204150; 
 Mon, 10 May 2021 21:43:24 -0700 (PDT)
Received: from f1.Home (bzq-79-180-42-161.red.bezeqint.net. [79.180.42.161])
 by smtp.gmail.com with ESMTPSA id a9sm22360520wmj.1.2021.05.10.21.43.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 21:43:23 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: davem@davemloft.net, kuba@kernel.org, mst@redhat.com, jasowang@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 3/4] tun: define feature bit for USO support
Date: Tue, 11 May 2021 07:42:52 +0300
Message-Id: <20210511044253.469034-4-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511044253.469034-1-yuri.benditovich@daynix.com>
References: <20210511044253.469034-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Cc: yan@daynix.com
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

User mode software can probe this bit to check whether the
USO feature is supported by TUN/TAP device.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 include/uapi/linux/if_tun.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/if_tun.h b/include/uapi/linux/if_tun.h
index 454ae31b93c7..24f246920dd5 100644
--- a/include/uapi/linux/if_tun.h
+++ b/include/uapi/linux/if_tun.h
@@ -88,6 +88,7 @@
 #define TUN_F_TSO6	0x04	/* I can handle TSO for IPv6 packets */
 #define TUN_F_TSO_ECN	0x08	/* I can handle TSO with ECN bits. */
 #define TUN_F_UFO	0x10	/* I can handle UFO packets */
+#define TUN_F_USO	0x20	/* I can handle USO packets */
 
 /* Protocol info prepended to the packets (when IFF_NO_PI is not set) */
 #define TUN_PKT_STRIP	0x0001
-- 
2.26.3

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
