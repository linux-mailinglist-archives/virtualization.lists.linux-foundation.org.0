Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CCA21B36A
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 12:49:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0648F88555;
	Fri, 10 Jul 2020 10:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Iiwn7YFDnlT; Fri, 10 Jul 2020 10:49:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9B1B788581;
	Fri, 10 Jul 2020 10:49:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A381C016F;
	Fri, 10 Jul 2020 10:49:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 197C8C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0946988564
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6cCyhKJ6dUm
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1EA8D88555
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 10:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594378136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=zH+SoJc9FA+IxVxr5cux+vmHnM4kK2aczPlNcB2fA0g=;
 b=GVnyIem8Rc/LebOyLDXJmWiZQrlDorG1nSYF4iG1Ku+EsaODON8fC6GBM3gFkqcHoJ5cA5
 ETuRqtgRyowzQRY0GCdbKcQ2hQPG8mtq40BIPBAtQzic0hY0mahw/gymxYmEQ6UtXHtO1F
 ppjEDPnO22gFpSxTnmSRCH6/LJxNcPY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-cG6z9eeaPX-bkO3F6cDvDQ-1; Fri, 10 Jul 2020 06:48:55 -0400
X-MC-Unique: cG6z9eeaPX-bkO3F6cDvDQ-1
Received: by mail-wm1-f69.google.com with SMTP id s134so6255831wme.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 03:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=zH+SoJc9FA+IxVxr5cux+vmHnM4kK2aczPlNcB2fA0g=;
 b=cpfIMqWHdFQGvJGEVmtLvpCdWNX4Z+55xMxLGe7RoH8adsE7Mrz6lmiOx+U8X5Y/Kf
 pr83+nBW1My62JhjdXnRST4rJfleGgU+HSwNwWvvENknhR8jdABNc8YG2ESSF/tyI/PG
 iEh7PAwUm/cekX2rwa5XsADhvCHm1Ej76NruyRgAg35rhT2xtvrs0D9dkgk8EnMUm4i2
 5HlvllnTKvF+eLRmj5S7YZ3pb62y4l62jW6jsMKbCTXZiIWkLOMGeLaBWnnmjBx5P/5d
 i7JIhi3655IUi1dntEanKp1a55IwD343zCEezlsRNYIVtN8uqKYFSJsi5+fJ4CNiUC7q
 G/tQ==
X-Gm-Message-State: AOAM53149fvRQqrgB0e9DcWg3dKvtMnsAtiq7ccMTCD4/pSbDxDzzaz1
 CxLkL8UZiMUrAsK6RQcm2ryC/4XaPJ6P/hIdE3TM3C8AZZqVt+vkOtmZLXxaGh1ikdZBF3QN5J1
 FsWbUW3I5GBrnhmCY3yIFQ6QxDuHg9uEOfinMN7Znuw==
X-Received: by 2002:a05:6000:1143:: with SMTP id
 d3mr55214240wrx.235.1594378134132; 
 Fri, 10 Jul 2020 03:48:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyw4fIgUrx6Lb8RIpTWJ39EeNc2fRHHzE0+AdkrVCaNR8Aj75HUF42WJR8yehI/TNv6QqsbOQ==
X-Received: by 2002:a05:6000:1143:: with SMTP id
 d3mr55214221wrx.235.1594378133933; 
 Fri, 10 Jul 2020 03:48:53 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 68sm8898710wmz.40.2020.07.10.03.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 03:48:53 -0700 (PDT)
Date: Fri, 10 Jul 2020 06:48:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] vhost/scsi: fix up req type endian-ness
Message-ID: <20200710104849.406023-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

vhost/scsi doesn't handle type conversion correctly
for request type when using virtio 1.0 and up for BE,
or cross-endian platforms.

Fix it up using vhost_32_to_cpu.

Cc: stable@vger.kernel.org
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/vhost/scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 6fb4d7ecfa19..b22adf03f584 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1215,7 +1215,7 @@ vhost_scsi_ctl_handle_vq(struct vhost_scsi *vs, struct vhost_virtqueue *vq)
 			continue;
 		}
 
-		switch (v_req.type) {
+		switch (vhost32_to_cpu(vq, v_req.type)) {
 		case VIRTIO_SCSI_T_TMF:
 			vc.req = &v_req.tmf;
 			vc.req_size = sizeof(struct virtio_scsi_ctrl_tmf_req);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
