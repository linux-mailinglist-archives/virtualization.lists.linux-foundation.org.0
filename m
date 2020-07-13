Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A39C021D114
	for <lists.virtualization@lfdr.de>; Mon, 13 Jul 2020 10:00:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 12B1726EF8;
	Mon, 13 Jul 2020 08:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6T+HZUw-GFOn; Mon, 13 Jul 2020 08:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 602682736F;
	Mon, 13 Jul 2020 08:00:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4BB06C0733;
	Mon, 13 Jul 2020 08:00:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79F9BC0733
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6095089440
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M6oLVhmSa-N8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:00:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6A5B189473
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 08:00:22 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id z13so14746942wrw.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 13 Jul 2020 01:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Rdi1fn55oJRjGxXwkklTmogqfEUJsJsRerMOamXHaW8=;
 b=xG84ESEPY2lyGkY8G3VX2aiONMR/r/3yXXU8Ta21b0wA6zz3XMFtSIHNCjCs0bTBHK
 G5q8Swe5hq0HnP9h4kP5ZXzxYba7ujJNr+RVaBw7m602pCRSHAaMFx9ILu4FcFAdl3qe
 DH7MnrZ75VZbl6KERQaaM3uO7rDDH+bV0M7/mCu7Ef55H15L49S4qiZVr+w1SGeu4JTU
 W0KrMmD/easJVAmBZJyLN1N2htq7B+EZQJQ55+7jgKhsB5qbbX01rl6jjAYMbuxLsqVU
 JyCFL67oZFgOF8F1zONuNAh3H9BwR1H92HHMQEm3rWyGxBQPcjsiVeru8237+Djxq8sc
 xBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rdi1fn55oJRjGxXwkklTmogqfEUJsJsRerMOamXHaW8=;
 b=RQvkgGfCbDbFp2BTnYA/9MeNp0eW/Emnf0yvbejxmG/dzQWN6jBWxUfv6DDMzciiCP
 AECCNgMkg3z28s5yuPxyw6HaHB51KUTT38UoiE+yV7Ln2vOjhhbldzbBosNRve9pCoOt
 Ha/BH2cTKJaAEoruTEmz+HtNnZ/WlZBFrDimhJ/sa3SwfAWgnVOcPYhAiXuRiDkNU1bW
 CCpt25V8SkVDQBDx8gx3ZGuCnp4xPNHofECcmYWZzayCfcKeFJUCSpFUYGIQosWDtDKx
 vjpx/RXCSIiB1886j2HtGz+ByEJFsHNvU2mPSouUCmLbFxKVztiXPVTf/HMlIR9/GNXa
 fmRQ==
X-Gm-Message-State: AOAM531Bf281Ii5PrR2nswWQxQiXcGsfHnyGjLdadw10f1/VJBLQ48yn
 Oa23Q+ifKpWI9VjwiVddpA99xg==
X-Google-Smtp-Source: ABdhPJyLmfDaLTHwczipJR7031zJ1+pDQDmw8+mAafd5uDPNU+5mEJrH3X1NKEW0ppTUl/z4FSnHSQ==
X-Received: by 2002:adf:eec2:: with SMTP id a2mr77055761wrp.127.1594627220806; 
 Mon, 13 Jul 2020 01:00:20 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
 by smtp.gmail.com with ESMTPSA id 33sm24383549wri.16.2020.07.13.01.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 01:00:20 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: jejb@linux.ibm.com,
	martin.petersen@oracle.com
Subject: [PATCH v2 12/24] scsi: virtio_scsi: Demote seemingly unintentional
 kerneldoc header
Date: Mon, 13 Jul 2020 08:59:49 +0100
Message-Id: <20200713080001.128044-13-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713080001.128044-1-lee.jones@linaro.org>
References: <20200713080001.128044-1-lee.jones@linaro.org>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
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
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: virtualization@lists.linux-foundation.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
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
