Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCAE16013F
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 01:40:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 38F67855EF;
	Sun, 16 Feb 2020 00:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6pliNUiLNRgS; Sun, 16 Feb 2020 00:40:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C9184855CF;
	Sun, 16 Feb 2020 00:40:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ABBF6C0177;
	Sun, 16 Feb 2020 00:40:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DB756C0177
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 00:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C20A7203FA
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 00:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I5dfcw6qsOjz
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 00:40:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 74548203AB
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 00:40:53 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id 77so12776721oty.6
 for <virtualization@lists.linux-foundation.org>;
 Sat, 15 Feb 2020 16:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xP2d5mrDDYuWOGt0j6R7sVfg2HV+cZtGZwXSSh2x4yQ=;
 b=hWX56Dh/Gge2xHbvgZPqq0cqkBYPxvOKTABmU+RD7KKAyBpKUPo00A8YOVhzTBbar6
 NM3rb9fIi7WDXsxO8va38FgCFIYd7QFHD6vbdMs/5eJmbEkUyIJniod6cxXUtBwLp78D
 feaU16l4g3W4RcIU7oyAk1YFOWXDSAQEZsOLkBLgG/d1BwLEg2B5+q/i6FankzykAS2B
 GaWRLjXh3cOOcyENzTCHlCAQnlYYz3IEAc4yUA5Vtmm/MG9+VlDSlRqkQzjLhrAtqB8m
 99mL8SjnryBPlnJSPca+ileJ1Eon14cG02YQrgVviMngbASQ0dWWIZkcbj2jxSZ5gJxb
 bPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xP2d5mrDDYuWOGt0j6R7sVfg2HV+cZtGZwXSSh2x4yQ=;
 b=t1Nhj4VX9tFyefjzVGZtTDkbjHUgJHrr/XvDEzoXQZbcsg9zEYYlUm1aI/bJfhiscY
 fQgMdVWrkhkDpB0amPephxj7dFeLtd67lMDoS7/4ZHu0t5mHT4+0nY4AnkEj8cj3Za5k
 rrDHnpLKuamCVf0nicR8spcxSv9ZWjmSf3C6cSC6IiXMvADpj8pm9OAG12M2BW/T3I31
 uBycvHefL12EtX1i4i/YVQfJrI/KG2lOCtXc9cgx1MxqsM/ldYXZ4LrzMMS8DMf4Qcwv
 Pnd0V5hzKX1fdHO6Sd7qAyZjkOvnSrOCS6JUpOZeA8jz0IgQH+aL1VonPJH142lmypb6
 hlUA==
X-Gm-Message-State: APjAAAX5LipTLurFFEMhna6E/+EC6Oa7VHrYIifnVBc+3WpXJH0+zGia
 P99lpc0HHLpwXQ+J3xxUQ1M=
X-Google-Smtp-Source: APXvYqyuZpug/NB6vcKcnwbQ/XBPbV0NsCAjTD7xPqll2VAa6KJDhxw+78bpH2GMCYmcCX21JjY0XQ==
X-Received: by 2002:a05:6830:1608:: with SMTP id
 g8mr7101714otr.169.1581813652532; 
 Sat, 15 Feb 2020 16:40:52 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id c12sm3438979oic.27.2020.02.15.16.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 16:40:51 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH] virtio_balloon: Adjust label in virtballoon_probe
Date: Sat, 15 Feb 2020 17:40:39 -0700
Message-Id: <20200216004039.23464-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: clang-built-linux@googlegroups.com,
 Nathan Chancellor <natechancellor@gmail.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

Clang warns when CONFIG_BALLOON_COMPACTION is unset:

../drivers/virtio/virtio_balloon.c:963:1: warning: unused label
'out_del_vqs' [-Wunused-label]
out_del_vqs:
^~~~~~~~~~~~
1 warning generated.

Move the label within the preprocessor block since it is only used when
CONFIG_BALLOON_COMPACTION is set.

Fixes: 1ad6f58ea936 ("virtio_balloon: Fix memory leaks on errors in virtballoon_probe()")
Link: https://github.com/ClangBuiltLinux/linux/issues/886
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/virtio/virtio_balloon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 7bfe365d9372..341458fd95ca 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -959,8 +959,8 @@ static int virtballoon_probe(struct virtio_device *vdev)
 	iput(vb->vb_dev_info.inode);
 out_kern_unmount:
 	kern_unmount(balloon_mnt);
-#endif
 out_del_vqs:
+#endif
 	vdev->config->del_vqs(vdev);
 out_free_vb:
 	kfree(vb);
-- 
2.25.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
