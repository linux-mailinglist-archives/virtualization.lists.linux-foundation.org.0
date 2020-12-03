Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6DE2CDBD1
	for <lists.virtualization@lfdr.de>; Thu,  3 Dec 2020 18:07:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E94CC87B39;
	Thu,  3 Dec 2020 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ApqZjuZA8xpe; Thu,  3 Dec 2020 17:07:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2CA8D879D2;
	Thu,  3 Dec 2020 17:07:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 162F6C163C;
	Thu,  3 Dec 2020 17:07:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72965C0FA7
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 60ECD87923
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGTUvZ9r4VpM
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8B8748777D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  3 Dec 2020 17:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607015254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q+DtPcNrkAVlytmGf4lB/estLQSwJ5Xy0BaXAW7yudY=;
 b=KoXMTKtZpQGVUnjpfDIm2un/nQYvwpg7wgIRUG2Qj3OIJiHf0RjWokiUoLKUnsuipYcxHu
 +SwvWFzhO5SMw8f4I8HgtlKcg/z1Yto08JDPzAOJ37DwLlwNQItLsOvJZjKHm2ghQj83iw
 dNSMMHjuKSmKPsVVtq6LRf1L27xjBeQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-o4izIjauPieiOA3G1Acj5g-1; Thu, 03 Dec 2020 12:07:30 -0500
X-MC-Unique: o4izIjauPieiOA3G1Acj5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C28819611AA;
 Thu,  3 Dec 2020 17:07:28 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-142.ams2.redhat.com
 [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42BE05D9CA;
 Thu,  3 Dec 2020 17:07:25 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3 14/19] vdpa_sim: add set_config callback in vdpasim_dev_attr
Date: Thu,  3 Dec 2020 18:05:06 +0100
Message-Id: <20201203170511.216407-15-sgarzare@redhat.com>
In-Reply-To: <20201203170511.216407-1-sgarzare@redhat.com>
References: <20201203170511.216407-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 Shahaf Shuler <shahafs@nvidia.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <elic@nvidia.com>, Oren Duer <oren@nvidia.com>
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

The set_config callback can be used by the device to parse the
config structure modified by the driver.

The callback will be invoked, if set, in vdpasim_set_config() after
copying bytes from caller buffer into vdpasim->config buffer.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index f935ade0806b..03a8717f80ea 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -70,6 +70,7 @@ struct vdpasim_dev_attr {
 
 	work_func_t work_fn;
 	void (*get_config)(struct vdpasim *vdpasim, void *config);
+	void (*set_config)(struct vdpasim *vdpasim, const void *config);
 };
 
 /* State of each vdpasim device */
@@ -598,7 +599,15 @@ static void vdpasim_get_config(struct vdpa_device *vdpa, unsigned int offset,
 static void vdpasim_set_config(struct vdpa_device *vdpa, unsigned int offset,
 			     const void *buf, unsigned int len)
 {
-	/* No writable config supportted by vdpasim */
+	struct vdpasim *vdpasim = vdpa_to_sim(vdpa);
+
+	if (offset + len > vdpasim->dev_attr.config_size)
+		return;
+
+	memcpy(vdpasim->config + offset, buf, len);
+
+	if (vdpasim->dev_attr.set_config)
+		vdpasim->dev_attr.set_config(vdpasim, vdpasim->config);
 }
 
 static u32 vdpasim_get_generation(struct vdpa_device *vdpa)
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
