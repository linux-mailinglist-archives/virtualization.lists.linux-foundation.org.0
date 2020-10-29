Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C768829EBC0
	for <lists.virtualization@lfdr.de>; Thu, 29 Oct 2020 13:21:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7B56986B51;
	Thu, 29 Oct 2020 12:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymUIBNUCeHd2; Thu, 29 Oct 2020 12:21:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17DC686B9E;
	Thu, 29 Oct 2020 12:21:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EC761C0051;
	Thu, 29 Oct 2020 12:21:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6CCD8C1AD7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 583B186AE9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dbKrrurC9SNF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:20:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2672A864C4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 29 Oct 2020 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603974057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uu1tSUlQesEvUDOvu71K/Re9PS7yCI/Ckixv81heB68=;
 b=ZARaOZwXk2tdvQ87DctXpNfKApSyyKozzfPjo/sdgrxK4B0q7n76fnlHRHgbn2caUs9asd
 xQsRe0PkINLkYkj/FQnRqkp3KzKhV96J1rPMKB5q/WxgCXo0FBPJZsLr6dvrw9NeC6oP4c
 5b9IGamyi2KmJBpamkUZSmKBBU1Ef4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-JN7Y5NHFNI29WG7XpYQt1g-1; Thu, 29 Oct 2020 08:20:55 -0400
X-MC-Unique: JN7Y5NHFNI29WG7XpYQt1g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9152287952A;
 Thu, 29 Oct 2020 12:20:54 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-113-197.ams2.redhat.com
 [10.36.113.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2BD3B6266E;
 Thu, 29 Oct 2020 12:20:52 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] vdpasim: fix MAC address configuration
Date: Thu, 29 Oct 2020 13:20:49 +0100
Message-Id: <20201029122050.776445-2-lvivier@redhat.com>
In-Reply-To: <20201029122050.776445-1-lvivier@redhat.com>
References: <20201029122050.776445-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Laurent Vivier <lvivier@redhat.com>,
 virtualization@lists.linux-foundation.org,
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

vdpa_sim generates a ramdom MAC address but it is never used by upper
layers because the VIRTIO_NET_F_MAC bit is not set in the features list.

Because of that, virtio-net always regenerates a random MAC address each
time it is loaded whereas the address should only change on vdpa_sim
load/unload.

Fix that by adding VIRTIO_NET_F_MAC in the features list of vdpa_sim.

Fixes: 2c53d0f64c06 ("vdpasim: vDPA device simulator")
Cc: jasowang@redhat.com
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 2629911c29bb..7f8ebc9924ac 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -60,7 +60,8 @@ struct vdpasim_virtqueue {
 
 static u64 vdpasim_features = (1ULL << VIRTIO_F_ANY_LAYOUT) |
 			      (1ULL << VIRTIO_F_VERSION_1)  |
-			      (1ULL << VIRTIO_F_ACCESS_PLATFORM);
+			      (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
+			      (1ULL << VIRTIO_NET_F_MAC);
 
 /* State of each vdpasim device */
 struct vdpasim {
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
