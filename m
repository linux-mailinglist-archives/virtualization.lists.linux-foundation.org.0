Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 993991A03FB
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:07:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E081620508;
	Tue,  7 Apr 2020 01:07:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VAiF+eAOHRz0; Tue,  7 Apr 2020 01:07:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4C0FF20788;
	Tue,  7 Apr 2020 01:07:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36604C0177;
	Tue,  7 Apr 2020 01:07:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BE66EC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BAB9486920
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8J-yc4vhNtZ5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0DBF08691E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cpBCN9COwU5b1SJmxmkerQbIPy9Gv4aGbfqwyHnqUyE=;
 b=REwQbc/L+C8nZYjlGeq4Ambib98M+juUt7ysvWHBZFNzpdZwrr60czFHsdxn8IZkVn3ftK
 FxJCQyMztVUvWr2gZrozaPTsj5Bs6mUX3Cih4xfCgo/t0hhKlrfscImOTWSOqgMnZ9kzuv
 jHlPwIXd0DfNAST+JkSqGqqlWkCLhEI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-D6OlB-ywMKW29sO_7_YbQA-1; Mon, 06 Apr 2020 21:07:46 -0400
X-MC-Unique: D6OlB-ywMKW29sO_7_YbQA-1
Received: by mail-wm1-f71.google.com with SMTP id f81so37546wmf.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cpBCN9COwU5b1SJmxmkerQbIPy9Gv4aGbfqwyHnqUyE=;
 b=i2nTOZ2c4RfO2SBoN+aEZzEye64mxXmRPEOV41unVodLqaDIRdpbZKdEl+UGPbUTEw
 y9xcmZLBrlIW3DegjVD0QqBiivtBlbKPpvfkF3D9cYQpkzrvYmEz4WBpIryEfoDLZzs8
 SbK+Zng974ldSJ4y7yog0JkyKTbLwVoDlnahhTKs0OIK9MuwBdAgcr86shLEyMeX7EaL
 DtzHYDdkJ/vSuCUoUOzMS2kahvwNSFoQ0yWDOzbmtx7KEmpPZmd22Xx/JG1lgJTn0qER
 M84IrTwBzAjPe/mG3cSLsJTZlW8og+0/1do4b4AFCpqCiuzVJpgLpfVyB6ove15PCy+k
 UR4A==
X-Gm-Message-State: AGi0PubcBg46xmCo1eIc6mP97njcnt8QvL5quN+Y5lGuC05gp0hg6Q7q
 LIRafcCP0Wfs8zGGm0pKCm0btdpr3SpZCFy3isRsCCPiov5uhltz23iGJ2avCjVwbAh9JrPMpsz
 Ix47Z41Ivyq0RlVl7ZrCSbeOZJlr2QfU6F4930h/ZdA==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr1782783wmj.111.1586221665027; 
 Mon, 06 Apr 2020 18:07:45 -0700 (PDT)
X-Google-Smtp-Source: APiQypKyn156xrUom9RCaQHtlxGxcH01DdoyrI1XR/UsjKHBvJZinnqUjeq2WfAbQgmW4gpjj0GFNQ==
X-Received: by 2002:a7b:cdf7:: with SMTP id p23mr1782774wmj.111.1586221664872; 
 Mon, 06 Apr 2020 18:07:44 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f14sm118556wmb.3.2020.04.06.18.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:44 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/19] virtio_input: pull in slab.h
Message-ID: <20200407010700.446571-9-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
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

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index 5ae529671b3d..efaf65b0f42d 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -3,6 +3,7 @@
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/input.h>
+#include <linux/slab.h>
 
 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
