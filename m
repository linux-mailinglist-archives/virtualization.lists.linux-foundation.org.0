Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7D1A043F
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:16:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 692A285DDC;
	Tue,  7 Apr 2020 01:16:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v4mQcjZhcgjr; Tue,  7 Apr 2020 01:16:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54A5C85C06;
	Tue,  7 Apr 2020 01:16:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A999C1AE2;
	Tue,  7 Apr 2020 01:16:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D8BC6C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C820C84F76
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hj9XlvI5vIN7
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AE72982241
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l4t0rXeJXf/7Is8eR7dpPgB8JuUv5NDEJCaYkFwA7To=;
 b=ffyuNgfUypVREmgVNaL+CrGAxV+dMbIlOhImOp6K78b83xD+/mQ2r2uW2m52+tHI+vWf6X
 JrHiQfKISCuPs7iJDW+30MoYWyYh69fbnBW1Zw7fbisPe6bYsnAULl61egq+d444s4Avtt
 wCDeb14yRyZLoNIoJ7Jnz3XLGKCS/iQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-66LToe17NGqPduxTVdhw1A-1; Mon, 06 Apr 2020 21:16:40 -0400
X-MC-Unique: 66LToe17NGqPduxTVdhw1A-1
Received: by mail-wm1-f72.google.com with SMTP id f9so32861wme.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=l4t0rXeJXf/7Is8eR7dpPgB8JuUv5NDEJCaYkFwA7To=;
 b=c4jJQqpbuyQlL1YJTv5a0kF0N//lNFsRdqBpIYOqqpEmUuhoIqnyHB7yfC4smrKJDk
 rJbjnGMqU/x2+3wKYAnxgCqlqQsYsQbBya6hUTKkYpaDkiST+P9cYr0XN/nrYeX9lf0G
 5nVOPXe4mXS6uwLfj2u4QXAoaF3c2u52oBPoCW85vN6+M4CzxDpz8MceVFD0yOsoAMWV
 FG4rb3LjK2HNtcdrOtgl9iyL7mCeg6CT4oLPFF3EMhNBJuCT72vNxK9HE41Kwhqq/2eQ
 8TZVr1DfO4ksLrxNyJgBGNPsjC87xuAiQ5Ywp/o+mdux9lwgl3fk1W7G1svURwLTUSKY
 3lrQ==
X-Gm-Message-State: AGi0PuabY128pHqjEfSdynMyPR+pWBn/L3pdyk7Q0p2lLrXo2uTesWVk
 8xi6wjgm5mgkTMJmVtAd946WvqUqFqwXs9ptL2QYm3tmdi79EhQWguESHI3WZMmF4/RLlfgcEtc
 iRynBIY/c/yWJf3YsUAryiSGpfk8Bs+mIemUg5kz0Gw==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr1972464wme.159.1586222199752; 
 Mon, 06 Apr 2020 18:16:39 -0700 (PDT)
X-Google-Smtp-Source: APiQypLzgPCpeHBVPTtA2sAbQBKCKQ2qzZXjvqfsDhPpYNlRvmHlEV5qibDafwbRFUM0lCv6VFnpwg==
X-Received: by 2002:a1c:a553:: with SMTP id o80mr1972456wme.159.1586222199594; 
 Mon, 06 Apr 2020 18:16:39 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id g186sm99764wmg.36.2020.04.06.18.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:38 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:37 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 05/19] virtgpu: pull in uaccess.h
Message-ID: <20200407011612.478226-6-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
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
index 205ec4abae2b..289dabbce477 100644
--- a/drivers/gpu/drm/virtio/virtgpu_ioctl.c
+++ b/drivers/gpu/drm/virtio/virtgpu_ioctl.c
@@ -27,6 +27,7 @@
 
 #include <linux/file.h>
 #include <linux/sync_file.h>
+#include <linux/uaccess.h>
 
 #include <drm/drm_file.h>
 #include <drm/virtgpu_drm.h>
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
