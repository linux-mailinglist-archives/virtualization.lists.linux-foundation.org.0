Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B2D732DCC
	for <lists.virtualization@lfdr.de>; Fri, 16 Jun 2023 12:27:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F372B83CD1;
	Fri, 16 Jun 2023 10:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F372B83CD1
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kJoHwIKv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Evflo8TPRZuv; Fri, 16 Jun 2023 10:27:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C8D9783F12;
	Fri, 16 Jun 2023 10:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C8D9783F12
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EF0EC0037;
	Fri, 16 Jun 2023 10:27:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D1AAC0029
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jun 2023 10:27:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 479A740BE4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jun 2023 10:27:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 479A740BE4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=kJoHwIKv
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUpxmx1MhxwM
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jun 2023 10:27:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEF9E40BE2
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AEF9E40BE2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 16 Jun 2023 10:27:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E942863708;
 Fri, 16 Jun 2023 10:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E07EC433CA;
 Fri, 16 Jun 2023 10:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686911269;
 bh=dn5j7Vy0jR4DMgOQyC3ikE20OKqZTT31zJIwWxDUmwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kJoHwIKvL3mzgti39/RXbbstgFIYYnawMpVWcLu5Ky6yfUEUoNmaS12NI/HWhK8la
 KTlcZ3rQD0NdX+W/T5f1/kXumGcXh19HfFNte38LRz1ayLK32Sv8TfC/ZjoGHuVcvd
 HQmE94W6lxKIG7Tpyc8vRELJzNn045RRkwY4mPQMFWvIKSL5UeDn1STAEIZN4fahY6
 +mriVQ4rEo6AuS+k6n1uWt/I3lhEmjfvBdXBuYLZ2zOYIECupGieHlLpNb6LjN8lE8
 sRnnFt9le4kSDu8Bdy7XTf9wpn23hVN5Znf5yFzDrbA6HwJRP46vuYwuRq8Q0cYAHI
 b/12vRATueGGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 15/16] vhost_vdpa: tell vqs about the negotiated
Date: Fri, 16 Jun 2023 06:27:18 -0400
Message-Id: <20230616102721.673775-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102721.673775-1-sashal@kernel.org>
References: <20230616102721.673775-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.117
Cc: Sasha Levin <sashal@kernel.org>, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
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

From: Shannon Nelson <shannon.nelson@amd.com>

[ Upstream commit 376daf317753ccb6b1ecbdece66018f7f6313a7f ]

As is done in the net, iscsi, and vsock vhost support, let the vdpa vqs
know about the features that have been negotiated.  This allows vhost
to more safely make decisions based on the features, such as when using
PACKED vs split queues.

Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230424225031.18947-2-shannon.nelson@amd.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/vhost/vdpa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 299a995326185..1f9670e6ecec2 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -278,7 +278,10 @@ static long vhost_vdpa_set_features(struct vhost_vdpa *v, u64 __user *featurep)
 {
 	struct vdpa_device *vdpa = v->vdpa;
 	const struct vdpa_config_ops *ops = vdpa->config;
+	struct vhost_dev *d = &v->vdev;
+	u64 actual_features;
 	u64 features;
+	int i;
 
 	/*
 	 * It's not allowed to change the features after they have
@@ -293,6 +296,16 @@ static long vhost_vdpa_set_features(struct vhost_vdpa *v, u64 __user *featurep)
 	if (vdpa_set_features(vdpa, features))
 		return -EINVAL;
 
+	/* let the vqs know what has been configured */
+	actual_features = ops->get_driver_features(vdpa);
+	for (i = 0; i < d->nvqs; ++i) {
+		struct vhost_virtqueue *vq = d->vqs[i];
+
+		mutex_lock(&vq->mutex);
+		vq->acked_features = actual_features;
+		mutex_unlock(&vq->mutex);
+	}
+
 	return 0;
 }
 
-- 
2.39.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
