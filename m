Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F2221A617
	for <lists.virtualization@lfdr.de>; Thu,  9 Jul 2020 19:46:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A4A372631D;
	Thu,  9 Jul 2020 17:46:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f3n+wRe6XKr5; Thu,  9 Jul 2020 17:46:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6C9A9228F1;
	Thu,  9 Jul 2020 17:46:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AEA1C016F;
	Thu,  9 Jul 2020 17:46:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3034C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:46:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A1A03882BA
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2Ka4W6bKAKT
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:46:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9EA8487EDB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 17:46:13 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id w3so2745844wmi.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 09 Jul 2020 10:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WOUOFAj8gaRXgS5sweCsL/cD71WeCkTEB0KFrBJobo=;
 b=CvSWq06VbUcXSRnwGyqDxlPEPhqHonrMdhFqWh5wU+7F2EYTLjHQmon8jTG/Er9Oga
 K9zUwv08GqGI/dj1oPeifOcYIJUghMnSKcrS62TjwBLdO1k87bxM6GqW44Lajy21s/2+
 jjgGm/VwZJohS57A+4L2J3n/28TOKy3ZZR+Df+H/y8p8nTeiLTKTW//YvdAc5Xpx793E
 Wc0sELO/g+ZCdC9NNbDx7kILpoBIOilGSVjBay+WBHB87FJrNLDzIE3Y4R2uae1Q360+
 zQmlM8Co6yVmfzXPDgcv+cWm3jlTn46fOJtRqf+/VD1MQQmbBkp4gZWa4SQiTSwFolS+
 Wbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WOUOFAj8gaRXgS5sweCsL/cD71WeCkTEB0KFrBJobo=;
 b=hD0NIDDp5D/9UpBO1bwNRNr0piLLiXQIDzF7DEm1iOi79KnbcsolU/PFH1Hqd7+yEx
 TyCzJef9vV5qpVVGIHuHKbRNuVfRP8DwfeTiEKYPo77Ke6ZDUhy6IpAoxGhUB63DOVFc
 nQJYWiy2fl6Ldj4yPAKBRhXv2cLAUE8XPueMmyD5onGSUtCeaAV6AEB+xT8khC21ysYI
 dSjB0acJfTw8GDnHqPaYbbBvHGf1Kf2FaUZGeCKSz8wFrN1ohrn/5XB63HdlR5gKe6/m
 zVplxb/BabTygsCrEDMjqACm/6L2U/VbiFlbtdltGJen1tpJbyR9P+GcMx0QODXBg43T
 QtLA==
X-Gm-Message-State: AOAM5313gY3+sn49y6BsQLT0MDF7Efz2xKNdr/kNW03aczudYwjntv5N
 i/2Y1RriwWWRfN9z1LDYf365mg==
X-Google-Smtp-Source: ABdhPJw+UQAw1tDMHZVupmnJNtYCNeMbSVRrkvixR673N+nHXclQOrE9d9MM6uM6P20WxHqHRzGBvg==
X-Received: by 2002:a7b:cd10:: with SMTP id f16mr1169293wmj.86.1594316771965; 
 Thu, 09 Jul 2020 10:46:11 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id f15sm6063854wrx.91.2020.07.09.10.46.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 10:46:11 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Subject: [PATCH 12/24] scsi: virtio_scsi: Demote seemingly unintentional
 kerneldoc header
Date: Thu,  9 Jul 2020 18:45:44 +0100
Message-Id: <20200709174556.7651-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200709174556.7651-1-lee.jones@linaro.org>
References: <20200709174556.7651-1-lee.jones@linaro.org>
MIME-Version: 1.0
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lee Jones <lee.jones@linaro.org>
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

This is the only use of kerneldoc in the sourcefile and no
descriptions are provided.

Fixes the following W=1 kernel build warning(s):

 drivers/scsi/virtio_scsi.c:109: warning: Function parameter or member 'vscsi' not described in 'virtscsi_complete_cmd'
 drivers/scsi/virtio_scsi.c:109: warning: Function parameter or member 'buf' not described in 'virtscsi_complete_cmd'

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/virtio_scsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 0e0910c5b9424..56875467e4984 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -100,7 +100,7 @@ static void virtscsi_compute_resid(struct scsi_cmnd *sc, u32 resid)
 		scsi_set_resid(sc, resid);
 }
 
-/**
+/*
  * virtscsi_complete_cmd - finish a scsi_cmd and invoke scsi_done
  *
  * Called with vq_lock held.
-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
