Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B502EEE85
	for <lists.virtualization@lfdr.de>; Fri,  8 Jan 2021 09:25:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B294D2048B;
	Fri,  8 Jan 2021 08:25:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YlBIOtSrhb21; Fri,  8 Jan 2021 08:24:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2EDF920421;
	Fri,  8 Jan 2021 08:24:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0063BC013A;
	Fri,  8 Jan 2021 08:24:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2B41C013A
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 08:24:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C11AC870A4
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 08:24:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l61dKdTIk-aa
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 08:24:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 811CF87056
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610094294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=D+IuUwBOwg8hNsyqoX4+8hAWhxTgkK/XQNwgdiHxBek=;
 b=NqwWb9kT7G9yMWcjwz7Tx2+xxJGuRfzZmqGMFQ99HXMqKjqmJfSWrkp/WxVE+Q/XxZ4LLW
 j1zgMqWwwqbe1kEnyIFDsPzt9J4n//rDIzN+beXHjpof1CB3s6/nPIpAClDHEYodxy9m9j
 jbFI440WI9pokzaUtXsmFLb4nX7GJ0Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-daqfk_FRPGiSBT6dZBS_dQ-1; Fri, 08 Jan 2021 03:24:52 -0500
X-MC-Unique: daqfk_FRPGiSBT6dZBS_dQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AC2E180A08A;
 Fri,  8 Jan 2021 08:24:51 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-229.pek2.redhat.com [10.72.12.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FA055D9E4;
 Fri,  8 Jan 2021 08:24:44 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH] mlx5: vdpa: fix possible uninitialized var
Date: Fri,  8 Jan 2021 16:24:43 +0800
Message-Id: <20210108082443.5609-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: elic@nvidia.com, linux-kernel@vger.kernel.org,
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

Upstream: posted

When compiling with -Werror=maybe-uninitialized, gcc may complains the
possible uninitialized umem. Fix that.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vdpa/mlx5/net/mlx5_vnet.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/vdpa/mlx5/net/mlx5_vnet.c b/drivers/vdpa/mlx5/net/mlx5_vnet.c
index f1d54814db97..a6ad83d8d8e2 100644
--- a/drivers/vdpa/mlx5/net/mlx5_vnet.c
+++ b/drivers/vdpa/mlx5/net/mlx5_vnet.c
@@ -706,6 +706,9 @@ static void umem_destroy(struct mlx5_vdpa_net *ndev, struct mlx5_vdpa_virtqueue
 	case 3:
 		umem = &mvq->umem3;
 		break;
+	default:
+		WARN(1, "unsupported umem num %d\n", num);
+		return;
 	}
 
 	MLX5_SET(destroy_umem_in, in, opcode, MLX5_CMD_OP_DESTROY_UMEM);
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
