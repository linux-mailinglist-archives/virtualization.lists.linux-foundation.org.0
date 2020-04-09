Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 603FA1A3B52
	for <lists.virtualization@lfdr.de>; Thu,  9 Apr 2020 22:29:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 160D187F40;
	Thu,  9 Apr 2020 20:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R2jQ2cPu6Unn; Thu,  9 Apr 2020 20:29:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 36D8384718;
	Thu,  9 Apr 2020 20:29:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17732C089F;
	Thu,  9 Apr 2020 20:29:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD942C0177
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id CC5CD87E09
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:28:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q92DhzlAzV8h
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:28:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DD7F987C9F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Apr 2020 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586464134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=bMeEAF8ikRSF8tzmPg03tQqSmmh0LSA2vooaQUzRW3Q=;
 b=HpHutjuLsSf8d6yUCwro5yMmEXTIYbS4+jinVF53BixOGTeBNiq1SdIfxvTcC7kE6cAwwp
 LET1F/1Atd/Bksodk+CkAf61JJfWOQP1av5qh1qZayc83YnHIfY8wyuuPjbWqJf5b2mDcw
 InLZAkWJc5ov+YlZ3SMkMiDeNv8dgQM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-Gl7Qlfd7One6eBhlGND7Kg-1; Thu, 09 Apr 2020 16:28:53 -0400
X-MC-Unique: Gl7Qlfd7One6eBhlGND7Kg-1
Received: by mail-wr1-f71.google.com with SMTP id y6so7240914wrq.21
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Apr 2020 13:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=bMeEAF8ikRSF8tzmPg03tQqSmmh0LSA2vooaQUzRW3Q=;
 b=kujoQGW7ziMNdbfTLPS2Vt6cBVD8Z+tZWV1d6hspehcs0cg5v2LFf8u3OJsAaMrzWn
 4dL1j0MAuOEz/mukI74vkyKBhA9Iz5GbOYyNNPobq/C8JomHp5dMFccNXbSJJ7VjRS9p
 6kPugJnD8UCXiD7agrPeHfWcz2qsjTfsSmcLXIqPDN9+6vyHeYefoGttyo9qsID/nBj1
 XiK/yJUE4LH7cb1GaXXhJ72phenjPPUrw+XjlOpawgUfwSjwMbTso630HJKzOq0Y2RM9
 tmHwWjm/Kr/DVCHc5+C7qJEftQ/IdeP9Byfw3kDhT6pLq7jvTOIYSHFHWDR7DAsTKoUm
 AomA==
X-Gm-Message-State: AGi0Pub9xRYu2UTPjPQPb8wAfKQmZdIxjn04PQFk70S85F0qzctASsr4
 1x2u/iRbVwzUaSkx3qFQxgjxDp5dT0zJSnvRI24hMQmjTs/HxWqVOv3xHk9R5KYhzi5dVAM0a0y
 cJvutE/0vAHyFiQb5MhAqgYoduQFaCe69KTDTZpmsEg==
X-Received: by 2002:adf:eed1:: with SMTP id a17mr879992wrp.287.1586464131936; 
 Thu, 09 Apr 2020 13:28:51 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNn3RyOEcDrD6y8m+kaEcsbwziqz3QQkLPQ+QKzSv0QJhgUW1mk0pmUaP+kkcnSLyMEA1ftw==
X-Received: by 2002:adf:eed1:: with SMTP id a17mr879972wrp.287.1586464131731; 
 Thu, 09 Apr 2020 13:28:51 -0700 (PDT)
Received: from redhat.com (bzq-109-67-97-76.red.bezeqint.net. [109.67.97.76])
 by smtp.gmail.com with ESMTPSA id
 t67sm5404037wmg.40.2020.04.09.13.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 13:28:51 -0700 (PDT)
Date: Thu, 9 Apr 2020 16:28:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vdpa: allow a 32 bit vq alignment
Message-ID: <20200409202825.10115-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Arnd Bergmann <arnd@arndb.de>, virtualization@lists.linux-foundation.org
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

get_vq_align returns u16 now, but that's not enough for
systems/devices with 64K pages. All callers assign it to
a u32 variable anyway, so let's just change the return
value type to u32.

Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Reported-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vdpa/ifcvf/ifcvf_main.c  | 2 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c | 2 +-
 include/linux/vdpa.h             | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/vdpa/ifcvf/ifcvf_main.c b/drivers/vdpa/ifcvf/ifcvf_main.c
index 28d9e5de5675..abf6a061cab6 100644
--- a/drivers/vdpa/ifcvf/ifcvf_main.c
+++ b/drivers/vdpa/ifcvf/ifcvf_main.c
@@ -226,7 +226,7 @@ static u32 ifcvf_vdpa_get_vendor_id(struct vdpa_device *vdpa_dev)
 	return IFCVF_SUBSYS_VENDOR_ID;
 }
 
-static u16 ifcvf_vdpa_get_vq_align(struct vdpa_device *vdpa_dev)
+static u32 ifcvf_vdpa_get_vq_align(struct vdpa_device *vdpa_dev)
 {
 	return IFCVF_QUEUE_ALIGNMENT;
 }
diff --git a/drivers/vdpa/vdpa_sim/vdpa_sim.c b/drivers/vdpa/vdpa_sim/vdpa_sim.c
index 72863d01a12a..7957d2d41fc4 100644
--- a/drivers/vdpa/vdpa_sim/vdpa_sim.c
+++ b/drivers/vdpa/vdpa_sim/vdpa_sim.c
@@ -435,7 +435,7 @@ static u64 vdpasim_get_vq_state(struct vdpa_device *vdpa, u16 idx)
 	return vrh->last_avail_idx;
 }
 
-static u16 vdpasim_get_vq_align(struct vdpa_device *vdpa)
+static u32 vdpasim_get_vq_align(struct vdpa_device *vdpa)
 {
 	return VDPASIM_QUEUE_ALIGN;
 }
diff --git a/include/linux/vdpa.h b/include/linux/vdpa.h
index 733acfb7ef84..5453af87a33e 100644
--- a/include/linux/vdpa.h
+++ b/include/linux/vdpa.h
@@ -164,7 +164,7 @@ struct vdpa_config_ops {
 	u64 (*get_vq_state)(struct vdpa_device *vdev, u16 idx);
 
 	/* Device ops */
-	u16 (*get_vq_align)(struct vdpa_device *vdev);
+	u32 (*get_vq_align)(struct vdpa_device *vdev);
 	u64 (*get_features)(struct vdpa_device *vdev);
 	int (*set_features)(struct vdpa_device *vdev, u64 features);
 	void (*set_config_cb)(struct vdpa_device *vdev,
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
