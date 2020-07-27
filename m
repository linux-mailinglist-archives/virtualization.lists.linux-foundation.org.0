Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D9222F444
	for <lists.virtualization@lfdr.de>; Mon, 27 Jul 2020 18:04:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E955C8761B;
	Mon, 27 Jul 2020 16:04:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZ6746dYlIRP; Mon, 27 Jul 2020 16:04:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 006CE876EF;
	Mon, 27 Jul 2020 16:04:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ACC04C0864;
	Mon, 27 Jul 2020 16:04:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1DE92C004D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jul 2020 16:04:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A705850E6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jul 2020 16:03:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LmQ6nJ_6SGLW
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jul 2020 16:03:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6E67B8506A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jul 2020 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595865831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=PzdX7wVbIx8ObG6INsApXS+qCsher40rhMpcw3UMWXc=;
 b=C9ao3gKvfoNuUMcRGrMc7tMkjGYRjWCXTWvMFBhQYmWvVdr/XY6BThbNLZ4jJ5VQyF+S2N
 fN9NU2QRSAhHgL/Bz48vuAiG51njMHeKQw+CUwadmOXlLVWV2FX8N2zfqC/gXyZUzdXFgU
 J0RWURWiu8YAxSw3sIyzLo4FTa6QwCY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-F3ddXNSuPVWwPs1kizS4dg-1; Mon, 27 Jul 2020 12:03:48 -0400
X-MC-Unique: F3ddXNSuPVWwPs1kizS4dg-1
Received: by mail-wr1-f70.google.com with SMTP id w7so1798786wre.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Jul 2020 09:03:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=PzdX7wVbIx8ObG6INsApXS+qCsher40rhMpcw3UMWXc=;
 b=IINJk3kwm2ylAavu/hhtLjxqDMsCN6xcderRwyL3tdhLuWfnl/OJwbroZ/7HH2TccY
 xLkbhq5Sq0PJOCZXckCC2wIoWdWRumnM3+fkkj1HS9qpyvvLph6nwhXTVnfMA0ATxENE
 QnC5WTiCTsGX30l62Efij/w7AcaS1PU5gTPKK7qjQUMJ7a6Q/+r6YbIqBg45n4vlDpz6
 5bFaSLYfnAU+079jDuYM7iHX/9NmZUrALtRq4yDNcRg+B2qjxs5lAXQyEJoH6exN50ME
 0iF5SjppJyjM/1Ypw52o92yNmz+FMqTLr/2Kl4X0O1HDXaceFYMRxcmddwf73tEXUxpa
 /Hvg==
X-Gm-Message-State: AOAM532Tz07GZGqxJIGUkGz0B8FQCis5DhTWYh6ikYeeJjgVvKRufp/U
 hz2nbaPw95iKYqUDMG2pxb6+2TNeMniM2UC2SLf32P7IWBcNUJetmBJrd1gZ7y+lZ0wPx8l/O+f
 vnOmdm/sdPQW+WgeB4SMGt/FR5WqJ3tF/FdqNaKS2hQ==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr22476411wra.118.1595865827365; 
 Mon, 27 Jul 2020 09:03:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7Ef1D9xDtsNFK+f9eP9IKT0MLwb1s7S8Er/1M1xlErxN9gFMzZ7/LwGj3k9MKPcujJZ0e8g==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr22476396wra.118.1595865827149; 
 Mon, 27 Jul 2020 09:03:47 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id z63sm111712wmb.2.2020.07.27.09.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 09:03:46 -0700 (PDT)
Date: Mon, 27 Jul 2020 12:03:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_balloon: fix up endian-ness for free cmd id
Message-ID: <20200727160310.102494-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Liang Li <liang.z.li@intel.com>, stable@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Alexander Duyck <alexander.duyck@gmail.com>
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

free cmd id is read using virtio endian, spec says all fields
in balloon are LE. Fix it up.

Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Cc: stable@vger.kernel.org
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 774deb65a9bb..798ec304fe3e 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -578,10 +578,14 @@ static int init_vqs(struct virtio_balloon *vb)
 static u32 virtio_balloon_cmd_id_received(struct virtio_balloon *vb)
 {
 	if (test_and_clear_bit(VIRTIO_BALLOON_CONFIG_READ_CMD_ID,
-			       &vb->config_read_bitmap))
+			       &vb->config_read_bitmap)) {
 		virtio_cread(vb->vdev, struct virtio_balloon_config,
 			     free_page_hint_cmd_id,
 			     &vb->cmd_id_received_cache);
+		/* Legacy balloon config space is LE, unlike all other devices. */
+		if (!virtio_has_feature(vb->vdev, VIRTIO_F_VERSION_1))
+			vb->cmd_id_received_cache = le32_to_cpu((__force __le32)vb->cmd_id_received_cache);
+	}
 
 	return vb->cmd_id_received_cache;
 }
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
