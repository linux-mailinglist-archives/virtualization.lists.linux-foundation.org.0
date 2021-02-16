Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D831C847
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 10:46:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C3A86F580
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 09:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CeUAM7Z6gIa for <lists.virtualization@lfdr.de>;
	Tue, 16 Feb 2021 09:46:29 +0000 (UTC)
Received: by smtp3.osuosl.org (Postfix, from userid 1001)
	id A289D6F597; Tue, 16 Feb 2021 09:46:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9FBB6F4FD;
	Tue, 16 Feb 2021 09:46:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6D4EC013A;
	Tue, 16 Feb 2021 09:46:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5CBA1C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4B4E68673D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FOClSaEmhkKk
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:46:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5C2778670A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613468774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ULZ9mxEQQ5U088rlkJrSxlHpglsfEQ5hn0PApjo9dE8=;
 b=LJU2amcONPnBHL+2cI0r8H5X+MeM6YQBbenJpmM4xBlmAhZOPGVyO/YT1uF2DhiiqTckII
 9501Dby3peYn3BVXYeNvTSFtZ0Za7AQlra5jpJ4SYmFPakcP1wdtd5p/rNgtuMBy1QRavv
 bYGvQihbiPOgCkp40qgJ4/ygVelNYHM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-cX6kWrRxOIm8XKId-k-NiA-1; Tue, 16 Feb 2021 04:46:12 -0500
X-MC-Unique: cX6kWrRxOIm8XKId-k-NiA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DB02801965;
 Tue, 16 Feb 2021 09:46:11 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B745C5C6AB;
 Tue, 16 Feb 2021 09:46:09 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [RFC PATCH 09/10] vhost/vdpa: use get_config_size callback in
 vhost_vdpa_config_validate()
Date: Tue, 16 Feb 2021 10:44:53 +0100
Message-Id: <20210216094454.82106-10-sgarzare@redhat.com>
In-Reply-To: <20210216094454.82106-1-sgarzare@redhat.com>
References: <20210216094454.82106-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>
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

Let's use the new 'get_config_size()' callback available instead of
using the 'virtio_id' to get the size of the device config space.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vdpa.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 544f8582a42b..21eea2be5afa 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -188,13 +188,8 @@ static long vhost_vdpa_set_status(struct vhost_vdpa *v, u8 __user *statusp)
 static ssize_t vhost_vdpa_config_validate(struct vhost_vdpa *v,
 					  struct vhost_vdpa_config *c)
 {
-	u32 size = 0;
-
-	switch (v->virtio_id) {
-	case VIRTIO_ID_NET:
-		size = sizeof(struct virtio_net_config);
-		break;
-	}
+	struct vdpa_device *vdpa = v->vdpa;
+	u32 size = vdpa->config->get_config_size(vdpa);
 
 	if (c->len == 0)
 		return -EINVAL;
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
