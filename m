Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B66B812FCAE
	for <lists.virtualization@lfdr.de>; Fri,  3 Jan 2020 19:41:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3B48584AE3;
	Fri,  3 Jan 2020 18:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43zu9mx7N8dl; Fri,  3 Jan 2020 18:41:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDFDF840FF;
	Fri,  3 Jan 2020 18:41:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 94361C077D;
	Fri,  3 Jan 2020 18:41:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B525C077D
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 16A8E84AE3
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:41:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 97JBjc4zdkdE
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:40:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8E14E840FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  3 Jan 2020 18:40:59 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id r11so23802365pgf.1
 for <virtualization@lists.linux-foundation.org>;
 Fri, 03 Jan 2020 10:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yKojHRAj36mCSvlGfKC/lxiFlQ2VNMN7NXDBZFEcT0=;
 b=Z8pdKwxYhL1cfFkp/upyWXYolcbCknhGm5k9RGLodaksgPBJ7Vcaln7swMkMIqELN2
 orOxT2gVdRZmy70mlrXiez7WWXjpQyjg2pIEh6DeXiTIQxdD9YJwsNbR1QitCGlAOTGV
 z5bOmITbvPOzUoE2aX6hV0/+8QxkC6k+EcVGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3yKojHRAj36mCSvlGfKC/lxiFlQ2VNMN7NXDBZFEcT0=;
 b=rtpCNUKU0/f6AA5lSQSVX9K1eNrHG5mpmy4gXh1d/Y5fcbguumpscoNQuzDGxM+13l
 dGEG3LJmsB+eousm72V3q4ugKGWS2uzm57CfdvjDetovMdWI/UDaITU33keErN25LR8z
 EV2K79nAE0wwE3iEGhokpIVm2N4wYq+Cw3K4KIA6rB4/K9wNaJncBwM5USfG+7+hvjIx
 vEmcDIo41JFhtHpNEHudVlXDq8vTkKC4uko/IFCL8kD/aFAOyxPUz5SX1WgukWhOUjcR
 t4w2IFR/ofVG5pWCb+t4uDuQZH48/1kPbMEBgEqh/ONaAZLRKNfi1wtkQZ4RdTtmMFJ2
 B8TQ==
X-Gm-Message-State: APjAAAVDWRzj0A3XtGrwvcZR825LW07fcocADYn4AwLu31rCua/DMM80
 z1Z8wKGoCZzh52LuHJxLjpR6GIplXnc=
X-Google-Smtp-Source: APXvYqxVrwljxI2HL4rX6u24eEYQxy1UkCjmds5LXYbgMUrQNwd631RCc++jZ5SN+KXZIn30/Ya4Ww==
X-Received: by 2002:aa7:8b5a:: with SMTP id i26mr43991113pfd.214.1578076859098; 
 Fri, 03 Jan 2020 10:40:59 -0800 (PST)
Received: from localhost ([2620:15c:202:201:bfdf:e7dd:b034:6ac7])
 by smtp.gmail.com with ESMTPSA id w38sm66207847pgk.45.2020.01.03.10.40.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2020 10:40:58 -0800 (PST)
From: Daniel Verkamp <dverkamp@chromium.org>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v2 1/2] virtio-balloon: initialize all vq callbacks
Date: Fri,  3 Jan 2020 10:40:43 -0800
Message-Id: <20200103184044.73568-1-dverkamp@chromium.org>
X-Mailer: git-send-email 2.24.1.735.g03f4e72817-goog
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 stable@vger.kernel.org
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

Ensure that elements of the callbacks array that correspond to
unavailable features are set to NULL; previously, they would be left
uninitialized.

Since the corresponding names array elements were explicitly set to
NULL, the uninitialized callback pointers would not actually be
dereferenced; however, the uninitialized callbacks elements would still
be read in vp_find_vqs_msix() and used to calculate the number of MSI-X
vectors required.

Cc: stable@vger.kernel.org
Fixes: 86a559787e6f ("virtio-balloon: VIRTIO_BALLOON_F_FREE_PAGE_HINT")
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: Daniel Verkamp <dverkamp@chromium.org>
---

v1:
https://lists.linuxfoundation.org/pipermail/virtualization/2019-December/044829.html

Changes from v1:
- Clarified "array" in commit message to "callbacks array"

 drivers/virtio/virtio_balloon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 93f995f6cf36..8e400ece9273 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -475,7 +475,9 @@ static int init_vqs(struct virtio_balloon *vb)
 	names[VIRTIO_BALLOON_VQ_INFLATE] = "inflate";
 	callbacks[VIRTIO_BALLOON_VQ_DEFLATE] = balloon_ack;
 	names[VIRTIO_BALLOON_VQ_DEFLATE] = "deflate";
+	callbacks[VIRTIO_BALLOON_VQ_STATS] = NULL;
 	names[VIRTIO_BALLOON_VQ_STATS] = NULL;
+	callbacks[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 	names[VIRTIO_BALLOON_VQ_FREE_PAGE] = NULL;
 
 	if (virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_STATS_VQ)) {
-- 
2.24.1.735.g03f4e72817-goog

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
