Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 728321F1288
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 07:45:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4179287AC2;
	Mon,  8 Jun 2020 05:45:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dt7OPSbHsqYu; Mon,  8 Jun 2020 05:45:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AB9B187E34;
	Mon,  8 Jun 2020 05:45:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8082FC016F;
	Mon,  8 Jun 2020 05:45:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7CB42C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6A47520486
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:45:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wclydK67FqL4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:45:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 44F1D20133
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 05:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591595129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ez7Dws5UfJEZt/nF/P3hd8sxkPeP7mYHFdp1Ir5GgJQ=;
 b=WDpbgqQ5OAlO0SkQm+Nq+oCMUb7qpBiPKhBRtM0xDFWeAaIp5DJ1jTwMf+ZnaixztZAsv3
 SGZ+Yt2WJk1WeD9PeOtFHL7yFRNeDV5Fuh+6nRAGx6Hp2UvMvLjhSjKGpsGDoUUuFBNVS1
 sR4ZLGAHqsNYuIf738W0ZTbBuroweyc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-tLPMMdnyNjOkZJvbmD5qeQ-1; Mon, 08 Jun 2020 01:45:27 -0400
X-MC-Unique: tLPMMdnyNjOkZJvbmD5qeQ-1
Received: by mail-wr1-f70.google.com with SMTP id w16so6677272wru.18
 for <virtualization@lists.linux-foundation.org>;
 Sun, 07 Jun 2020 22:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=ez7Dws5UfJEZt/nF/P3hd8sxkPeP7mYHFdp1Ir5GgJQ=;
 b=KDkxBszhqC49FkE2ROn7ws/WWcbyfKrlEhH3rbcj1RcMa8Zit5vOqRJR4fAxyMqWRU
 H1O2VraagRsEiMRB/nkDaffF+yj+Fhju95uwOY7Zmgp9BLZ9IB5z6ZMSKzuJ06dU1hwn
 jwCXw4/lSiVSuoOL68i72if/+po0IAsaDFlS6Ky1/A8IkDZCYLQKmoihRdvxXyYh36jo
 CJ+aWthhox3cAGkkMeBlsWD4aXzoDcLE8Qt8bDoHxMkaW0ur4v0NQ4fmllwTR/rm6y6j
 si8rP9pqMTh6J1dbncMbgCJ2o/M65SWs9ZlNYGax/2IHZlNfqwxWuQFO58hcbLuQozT9
 szXA==
X-Gm-Message-State: AOAM531yGUZ7zxrQQw4IlP/Q3dmP6Nhz5owoiskN8sBcKBNx0TKohw7W
 OWbjumlrWLkDrHy9hwVDO/gg5X46BJ+lkxAXiCKi4rHQ8YU+GwLx4xbeOmyoCvSBb8Dn2MQX2Z5
 Qud2R80U80HSareidVlxqvdU6rLnNgMO0rzSW+coO/Q==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr13172741wmc.10.1591595126087; 
 Sun, 07 Jun 2020 22:45:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEIxwo/TLPKQznbdhpqOhXK0+Kt5d6VZ/+K6/mxUvM5HR7j5GwB8GO7qmXBD6gO6AIzOG84Q==
X-Received: by 2002:a1c:7215:: with SMTP id n21mr13172711wmc.10.1591595125755; 
 Sun, 07 Jun 2020 22:45:25 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 l17sm22316198wrq.17.2020.06.07.22.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2020 22:45:25 -0700 (PDT)
Date: Mon, 8 Jun 2020 01:45:22 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio-mem: drop unnecessary initialization
Message-ID: <20200608054517.708167-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 virtualization@lists.linux-foundation.org, kernel test robot <lkp@intel.com>
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

rc is initialized to -ENIVAL but that's never used. Drop it.

Fixes: 5f1f79bbc9e2 ("virtio-mem: Paravirtualized memory hotplug")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index f658fe9149be..2f357142ea5e 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1768,7 +1768,7 @@ static void virtio_mem_delete_resource(struct virtio_mem *vm)
 static int virtio_mem_probe(struct virtio_device *vdev)
 {
 	struct virtio_mem *vm;
-	int rc = -EINVAL;
+	int rc;
 
 	BUILD_BUG_ON(sizeof(struct virtio_mem_req) != 24);
 	BUILD_BUG_ON(sizeof(struct virtio_mem_resp) != 10);
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
