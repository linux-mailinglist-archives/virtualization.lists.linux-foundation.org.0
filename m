Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E031C843
	for <lists.virtualization@lfdr.de>; Tue, 16 Feb 2021 10:45:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 26BC884B08;
	Tue, 16 Feb 2021 09:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OvttvjuVQO0b; Tue, 16 Feb 2021 09:45:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AA4A5847E5;
	Tue, 16 Feb 2021 09:45:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 887FDC0FA7;
	Tue, 16 Feb 2021 09:45:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93579C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 885698670A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CnDafnySQNS7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:45:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6760386741
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Feb 2021 09:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613468742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HBRaTQc7Ttw1kohIDA1m2qTU6L8be75odJdy+4tgCL8=;
 b=LQop7jixI3dp3ed+TmkJx6L/FRb5xPcmt/SaBVhw16xi+C4wNW0Uh23eHS3iUq+E6g+Ghl
 zvbuSPQYThfgaC9XfVC5PqkDSDUYrEsEjOH1xXkjnm5K5hwDWcPNhter8WgSlIBwqawDMD
 jsKc1Bs5riZF/7Sh2E0jJ4pwsZrxqDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-LEkPaDiQMqOnRTuseGIZ_A-1; Tue, 16 Feb 2021 04:45:40 -0500
X-MC-Unique: LEkPaDiQMqOnRTuseGIZ_A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18ED5801962;
 Tue, 16 Feb 2021 09:45:39 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-212.ams2.redhat.com
 [10.36.113.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA50F1851D;
 Tue, 16 Feb 2021 09:45:37 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [RFC PATCH 06/10] virtio_vdpa: use vdpa_set_config()
Date: Tue, 16 Feb 2021 10:44:50 +0100
Message-Id: <20210216094454.82106-7-sgarzare@redhat.com>
In-Reply-To: <20210216094454.82106-1-sgarzare@redhat.com>
References: <20210216094454.82106-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

Instead of calling the 'set_config' callback directly, we call the
new vdpa_set_config() helper which also checks the parameters.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/virtio/virtio_vdpa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_vdpa.c b/drivers/virtio/virtio_vdpa.c
index e28acf482e0c..2f1c4a2dd241 100644
--- a/drivers/virtio/virtio_vdpa.c
+++ b/drivers/virtio/virtio_vdpa.c
@@ -65,9 +65,8 @@ static void virtio_vdpa_set(struct virtio_device *vdev, unsigned offset,
 			    const void *buf, unsigned len)
 {
 	struct vdpa_device *vdpa = vd_get_vdpa(vdev);
-	const struct vdpa_config_ops *ops = vdpa->config;
 
-	ops->set_config(vdpa, offset, buf, len);
+	vdpa_set_config(vdpa, offset, buf, len);
 }
 
 static u32 virtio_vdpa_generation(struct virtio_device *vdev)
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
