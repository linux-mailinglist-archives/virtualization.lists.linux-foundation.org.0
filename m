Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D06A31A03FA
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:07:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 812ED8690E;
	Tue,  7 Apr 2020 01:07:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bTevQ945v92i; Tue,  7 Apr 2020 01:07:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2994686914;
	Tue,  7 Apr 2020 01:07:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0B23DC0177;
	Tue,  7 Apr 2020 01:07:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ED99C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4E3F386911
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6ERMJzUOjoYu
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 9361286909
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QXdHnCPN9IKDzYXh6cSCK96yIk733FWewogK2tGBIaQ=;
 b=dK/Zi+rnNWx4b3yPSx+Lvb03MEKPlNzVSJkXlpvKWM1Lec6StEtC7q/h1FXfnK3AWNgZVi
 //WmF3BIxPVVSQCW+d6OnPoC0BuiIOl5Ild3yKMZcC4WuIa053ziETj3qRTuDtLfaNpqQ6
 GDLXItYJ0816nQ61Ww55yxJ8JTMDlQI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-uvxxY0S9Peu-iNpJiSb5Qg-1; Mon, 06 Apr 2020 21:07:40 -0400
X-MC-Unique: uvxxY0S9Peu-iNpJiSb5Qg-1
Received: by mail-wr1-f71.google.com with SMTP id u16so849700wrp.14
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QXdHnCPN9IKDzYXh6cSCK96yIk733FWewogK2tGBIaQ=;
 b=d3IuwaMCcu43RfAuJZRmg/TINWWoxVSpfivG2lHkmvhyDyvwz+jDqib3ziqEhYTUse
 91LnX7jAFB5ViH1z7WNs67ELUVJePXS48QbIneWhQxMkQZaVgI/toL7NRxTUc0T/jhm3
 3m1XVsC/8AyTdxk0BT4fmKQ+MmnGCFjx1hEcOXduIFjDjwmT6XusYTJACAjE14OqpT2P
 XHLbqS3PYK/B8wX9Wwl+R/97aqHRg5fWqEvC0g/9ZxZsmAIqyY8y2QFIdIZvB/VC2KjT
 eKuFLQ85xUCK7FrSgel9WWlwfaZunqxttjyXs4NqqcTExYuk41KqMBgAfhYEhSYPfMzg
 bMvg==
X-Gm-Message-State: AGi0PuZOtD4xcwa3bPPUozhjDXL0VxLreULs7nJpf7ugQEDtoi152mnG
 lkW74zvin+SzijJce6uBWQnqTREFxSoBn/9/PXOdOfF754OK5+Y9eWMzNdAOXp9W5KIvH18Gl+S
 vgiU3R0uVvUkC2Dj1/oF+H/OJFT3luXfLClVFtsMupg==
X-Received: by 2002:adf:9b96:: with SMTP id d22mr2187309wrc.249.1586221658595; 
 Mon, 06 Apr 2020 18:07:38 -0700 (PDT)
X-Google-Smtp-Source: APiQypK4RDCslYo3i2lHvzOQqU7u0oLmj6vW5yEO0Z36UmKBoS+EK0dWhGTEZV4YpT9+RwLo5TAivQ==
X-Received: by 2002:adf:9b96:: with SMTP id d22mr2187292wrc.249.1586221658447; 
 Mon, 06 Apr 2020 18:07:38 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id w204sm123674wma.1.2020.04.06.18.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:37 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/19] virtgpu: pull in uaccess.h
Message-ID: <20200407010700.446571-6-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, virtualization@lists.linux-foundation.org
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

In preparation to virtio header changes, include uaccess.h directly as
this file is using copy to/from user.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpu/drm/virtio/virtgpu_ioctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_ioctl.c b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
index 205ec4abae2b..2342a8baa5f8 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -27,6 +27,7 @@
 
 #include <linux/file.h>
 #include <linux/sync_file.h>
+#include <linux/uacess.h>
 
 #include <drm/drm_file.h>
 #include <drm/virtgpu_drm.h>
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
