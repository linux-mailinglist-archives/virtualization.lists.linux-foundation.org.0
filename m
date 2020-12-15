Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD2E2DAF3D
	for <lists.virtualization@lfdr.de>; Tue, 15 Dec 2020 15:45:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 761CF2E144;
	Tue, 15 Dec 2020 14:45:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q2VMWCspLJNC; Tue, 15 Dec 2020 14:45:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 87B452150A;
	Tue, 15 Dec 2020 14:45:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 727CCC013B;
	Tue, 15 Dec 2020 14:45:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 185B1C013B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id EEF322150A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8jK9JyefWL9H
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:45:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by silver.osuosl.org (Postfix) with ESMTPS id 0C367207B0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 15 Dec 2020 14:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608043516;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9F5ax3wxxKnYiaE8zVcc5355IGbGaIsPxUJUJWPdgeU=;
 b=jEHMQdNxByhe0NuCbtBzEZHtWo1LVlya/A9W3WRxhzSMvlM6WMFFo+cO91HaKEp24EQzog
 V5S0ZtcrelF6NW6bX6fVmJzsj0I4LEKU2T3IpdCd5srkFdiMI8vfkmhShZYsZIKZ77s0cr
 2N3w9doOBLqjUfPzYgUO4K50L8+Xih4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-vTW-QsZwNDiQt6mv3qkHiA-1; Tue, 15 Dec 2020 09:45:14 -0500
X-MC-Unique: vTW-QsZwNDiQt6mv3qkHiA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C1D6801AC1;
 Tue, 15 Dec 2020 14:45:13 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-115-49.ams2.redhat.com
 [10.36.115.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E426B60C0F;
 Tue, 15 Dec 2020 14:45:08 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v4 13/18] vdpa_sim: add set_config callback in vdpasim_dev_attr
Date: Tue, 15 Dec 2020 15:42:51 +0100
Message-Id: <20201215144256.155342-14-sgarzare@redhat.com>
In-Reply-To: <20201215144256.155342-1-sgarzare@redhat.com>
References: <20201215144256.155342-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Shahaf Shuler <shahafs@nvidia.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <elic@nvidia.com>,
 Oren Duer <oren@nvidia.com>
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

Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 5eadcd19ab6f..e219aa852ef8 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -78,6 +78,7 @@ struct vdpasim_dev_attr {
 
 	work_func_t work_fn;
 	void (*get_config)(struct vdpasim *vdpasim, void *config);
+	void (*set_config)(struct vdpasim *vdpasim, const void *config);
 };
 
 /* State of each vdpasim device */
@@ -606,7 +607,15 @@ static void vdpasim_get_config(struct vdpa_device *vdpa, unsigned int offset,
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
