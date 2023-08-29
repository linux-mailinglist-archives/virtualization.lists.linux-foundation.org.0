Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755878C569
	for <lists.virtualization@lfdr.de>; Tue, 29 Aug 2023 15:32:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6016581FDA;
	Tue, 29 Aug 2023 13:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6016581FDA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pLtT66Re
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 61xBnIXAbQUE; Tue, 29 Aug 2023 13:32:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 0EBA481FDF;
	Tue, 29 Aug 2023 13:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0EBA481FDF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A2A14C0DD3;
	Tue, 29 Aug 2023 13:32:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C8754C0032
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Aug 2023 13:32:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A349660D80
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Aug 2023 13:32:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A349660D80
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=pLtT66Re
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3GohwMG3Nza
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Aug 2023 13:32:28 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BB4460742
 for <virtualization@lists.linux-foundation.org>;
 Tue, 29 Aug 2023 13:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BB4460742
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3C05165722;
 Tue, 29 Aug 2023 13:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE26DC433C9;
 Tue, 29 Aug 2023 13:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693315946;
 bh=9QijeGTlxozfjBzrNSDqt/zF9GOmvBM/ioFMMrZj0M4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pLtT66ReY+l95B8TXsdWCpfgs4jRt0GL9gL2qzdnSFyPrY5xhPJfRXttAd/eigwd4
 GJJLoIbkychLdKFB5ra2NaKWIcdWMjl3loxhDajxrR/HWvpWdYnhY9Z+h4YqouLCI/
 O6wpzBOiUwcipWQDPSqN2L8r3AW2lJOmXbFgDxxT8F7k7Wyk5Bpa52Mn+1sm3BvyD7
 g0Hut204wtlTSMc6Qr12rRpZ3tSEB2ZImY7ESaR3MH7AZZ+94HHRWFwsi0AY3vXqJA
 81ctHOAagKND9PfjnQrSuJ/UymAMFVhgqOsYJWpOb5QHaEzorfmsNZ2OCMzlNQXfvm
 FQTeCVWT+Zbtg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.4 07/17] virtio-mem: convert most
 offline_and_remove_memory() errors to -EBUSY
Date: Tue, 29 Aug 2023 09:31:54 -0400
Message-Id: <20230829133211.519957-7-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230829133211.519957-1-sashal@kernel.org>
References: <20230829133211.519957-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.4.12
Cc: Sasha Levin <sashal@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
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

From: David Hildenbrand <david@redhat.com>

[ Upstream commit ddf409851461f515cc32974714b73efe2e012bde ]

Just like we do with alloc_contig_range(), let's convert all unknown
errors to -EBUSY, but WARN so we can look into the issue. For example,
offline_pages() could fail with -EINTR, which would be unexpected in our
case.

Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230713145551.2824980-3-david@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/virtio/virtio_mem.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index ed15d2a4bd96b..1a76ba2bc118c 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -741,11 +741,15 @@ static int virtio_mem_offline_and_remove_memory(struct virtio_mem *vm,
 		 * immediately instead of waiting.
 		 */
 		virtio_mem_retry(vm);
-	} else {
-		dev_dbg(&vm->vdev->dev,
-			"offlining and removing memory failed: %d\n", rc);
+		return 0;
 	}
-	return rc;
+	dev_dbg(&vm->vdev->dev, "offlining and removing memory failed: %d\n", rc);
+	/*
+	 * We don't really expect this to fail, because we fake-offlined all
+	 * memory already. But it could fail in corner cases.
+	 */
+	WARN_ON_ONCE(rc != -ENOMEM && rc != -EBUSY);
+	return rc == -ENOMEM ? -ENOMEM : -EBUSY;
 }
 
 /*
-- 
2.40.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
