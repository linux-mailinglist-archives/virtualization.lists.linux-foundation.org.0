Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8100921B362
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 12:48:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0DCDD88C4C;
	Fri, 10 Jul 2020 10:48:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ozrJgTJWAwX6; Fri, 10 Jul 2020 10:48:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6388E895FC;
	Fri, 10 Jul 2020 10:48:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47498C08A9;
	Fri, 10 Jul 2020 10:48:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C32CC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 27A428980D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W1iI4VfTuMbi
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6344E89671
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594378126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=iyQ7Mdq+cHsZNfXMcFEBHnbLg0y1+f956n6Psm19Z3A=;
 b=borQPyJgomHRKpuo3XQLjFIVt4xuaYRaIVYqtLKPkfe7NONbMM9SzMYOCZQjLMgYrssXju
 lPtYio4iYSgxeS24jjdi++aby6qajKbSxZX8XPdMoOEX0wxCBIOYiyW+xDIPjNXLtYF2n+
 DgcUvqIuVqrpuazn18+eWvF3QOBrL/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-_GsHB5X2Mf-Sd4Q-eJfB_w-1; Fri, 10 Jul 2020 06:48:44 -0400
X-MC-Unique: _GsHB5X2Mf-Sd4Q-eJfB_w-1
Received: by mail-wr1-f71.google.com with SMTP id j5so5671613wro.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 03:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=iyQ7Mdq+cHsZNfXMcFEBHnbLg0y1+f956n6Psm19Z3A=;
 b=YJ1EuzM8ISPOnIfZemtrsA2Tah5jMOmO7BiJAzuYZPJtCsEOmhBReFXcjY427h2GGM
 1HllJQy0PjW4xyyz+Q0TkNHIOJDl+GVqEOUgHf78k/KLg8K8fErr/qFDhGHe2uU5jF7R
 IPzpG5VCzC/kJ8W6jvzJavDRosVjH2ItL+xG8T49FbaML+hcgS7T0siWTGMkkjPgKLzD
 83XKxfbvJhrGu1oqRtiKmNupGNi2r+sVN+k3CGmvJclyX4sN7eak4jVzKF1GfyjOAOpu
 08rfkXkPRYCoOLSXC96H0+HbteGA7s6/7xQpa/0XzmVDnTCJYqnKp7L7DAPE2OemaBCM
 xOsQ==
X-Gm-Message-State: AOAM531K7YW0o2JjaYD84g8RzdE2qcarOyuBbCXicfPkKUnzR1hRslma
 dJ+SdYCshav51fHkk+wmhtJc04/YZzTT0ctWQezcOCz9iLm4Vnu8qGSRsOhHV5fiSIl3grZE1+A
 aOl5if4sLzfzOXx6kklTVz4viSTO0PrAKCTKRrePwqQ==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr4281124wmb.113.1594378123167; 
 Fri, 10 Jul 2020 03:48:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnW96UmADFr3lBKu+J51FwC7hW91yxrY9fm+6R2FmCNMnZCpNPJGpddYdjDEzeRnojHSJuXQ==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr4281109wmb.113.1594378123028; 
 Fri, 10 Jul 2020 03:48:43 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 w13sm9528434wrr.67.2020.07.10.03.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:48:42 -0700 (PDT)
Date: Fri, 10 Jul 2020 06:48:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_balloon: fix sparse warning
Message-ID: <20200710104837.405966-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org
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

balloon uses virtio32_to_cpu instead of cpu_to_virtio32
to convert a native endian number to virtio.
No practical difference but makes sparse warn.
Fix it up.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index fc7301406540..5d4b891bf84f 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -596,7 +596,7 @@ static int send_cmd_id_start(struct virtio_balloon *vb)
 	while (virtqueue_get_buf(vq, &unused))
 		;
 
-	vb->cmd_id_active = virtio32_to_cpu(vb->vdev,
+	vb->cmd_id_active = cpu_to_virtio32(vb->vdev,
 					virtio_balloon_cmd_id_received(vb));
 	sg_init_one(&sg, &vb->cmd_id_active, sizeof(vb->cmd_id_active));
 	err = virtqueue_add_outbuf(vq, &sg, 1, &vb->cmd_id_active, GFP_KERNEL);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
