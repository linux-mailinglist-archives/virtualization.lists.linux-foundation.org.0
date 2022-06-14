Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E413054A467
	for <lists.virtualization@lfdr.de>; Tue, 14 Jun 2022 04:08:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 011A7408D1;
	Tue, 14 Jun 2022 02:08:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hTxjUnyhHLwj; Tue, 14 Jun 2022 02:08:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C91894053E;
	Tue, 14 Jun 2022 02:08:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CF36C002D;
	Tue, 14 Jun 2022 02:08:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C67AC002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D97441675
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnXuY0-k4BRC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:08:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F4D6415D0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 14 Jun 2022 02:08:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 70B56B8169D;
 Tue, 14 Jun 2022 02:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4B3C36AFE;
 Tue, 14 Jun 2022 02:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655172529;
 bh=Wo2mUQZHnzCIU3apbtY6/KfmGqw52MDcmLbzbLVt4mc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=faiAnWSS2+opOGak9XHQkaPz8jhG7Dgt+Kf5YTnQHxWeceZFiCt/O+BKmdjrwG4j4
 VzEcP/lPJpkX0o/0SYLepn30a9uYxvaGBrRvjYtzVsrsDpjYeo29oD5TgenJo1NRp/
 +vtLpvAFZ8uoFqyOcUvLmMiKz+jMlIHbz3X2chc//NRKMNTZUQ4AkvijMqPKSKrOGK
 NqlOQOWJ7q1QzQygii2/jSF7Qe+uZdNLU7JLY+LZvuTWhwt815YmNEuMJg3amqLKO/
 lIfJGNNJRKR5IDczOkT1RnWFK94+wuMF5WjQ+dYFzSDvmcNU5awMAvVQTOma4eTxu6
 ersW6/jJYI6og==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 22/29] virtio-mmio: fix missing put_device() when
 vm_cmdline_parent registration failed
Date: Mon, 13 Jun 2022 22:08:08 -0400
Message-Id: <20220614020815.1099999-22-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220614020815.1099999-1-sashal@kernel.org>
References: <20220614020815.1099999-1-sashal@kernel.org>
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
index 238383ff1064..5c970e6f664c 100644
--- a/drivers/virtio/virtio_mmio.c
+++ b/drivers/virtio/virtio_mmio.c
@@ -689,6 +689,7 @@ static int vm_cmdline_set(const char *device,
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
