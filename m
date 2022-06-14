Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8773354A417
	for <lists.virtualization@lfdr.de>; Tue, 14 Jun 2022 04:06:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 318E9416F7;
	Tue, 14 Jun 2022 02:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SfN3LSIsvejc; Tue, 14 Jun 2022 02:06:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C83AB416D7;
	Tue, 14 Jun 2022 02:06:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34F6AC0081;
	Tue, 14 Jun 2022 02:06:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 98F5BC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:06:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A2CC4158B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:06:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbMFLPpkmAAT
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:06:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1B5741675
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:06:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 70C4C60DBB;
 Tue, 14 Jun 2022 02:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EB32C3411E;
 Tue, 14 Jun 2022 02:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172404;
 bh=EN2LSdwrHyUj4sryCNoBl23CVmDro7Q1flq5/ck1sI4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qXCa+HSGs1vud3/FanQQFn17xTKreolJKbry2G0ZAH+KOeCFH40KquCTHOfaVMHV1
 k7u7BOZMkkSFAXR+DrV41axsVFjthOtvFQss1v/huPuwYIBJWg1J2DBf0jzBfsfPwi
 orR2HNJx2Lz4UgDCXJPLr92+eBrhwdXykmnYedYoiVtkTw8I8wIDD7D3V2UEmMZIHP
 WLQLBT4uqO2zFTG+FDrdxNmU3T0VSk0GSNzh/xrdPjac7z3l3rkaJqNnMUFR1mupXX
 IKTxDV6LtjkKt6FOwAtXgqSsRZT7QAyExBgntwHv2w1Gzph1QZCVKV+djD06sTAAB5
 fFIZrMO6glIIg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.17 28/43] virtio-mmio: fix missing put_device() when
 vm_cmdline_parent registration failed
Date: Mon, 13 Jun 2022 22:05:47 -0400
Message-Id: <20220614020602.1098943-28-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020602.1098943-1-sashal@kernel.org>
References: <20220614020602.1098943-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Sasha Levin <sashal@kernel.org>, virtualization@lists.linux-foundation.org,
 chengkaitao <pilgrimtao@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>
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

From: chengkaitao <pilgrimtao@gmail.com>

[ Upstream commit a58a7f97ba11391d2d0d408e0b24f38d86ae748e ]

The reference must be released when device_register(&vm_cmdline_parent)
failed. Add the corresponding 'put_device()' in the error handling path.

Signed-off-by: chengkaitao <pilgrimtao@gmail.com>
Message-Id: <20220602005542.16489-1-chengkaitao@didiglobal.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_mmio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virtio/virtio_mmio.c b/drivers/virtio/virtio_mmio.c
index 56128b9c46eb..1dd396d4bebb 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -688,6 +688,7 @@ static int vm_cmdline_set(const char *device,
 	if (!vm_cmdline_parent_registered) {
 		err = device_register(&vm_cmdline_parent);
 		if (err) {
+			put_device(&vm_cmdline_parent);
 			pr_err("Failed to register parent device!\n");
 			return err;
 		}
-- 
2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
