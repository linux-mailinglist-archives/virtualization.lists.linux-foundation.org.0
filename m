Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938F1B7B82
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 18:24:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E9ADA86519;
	Fri, 24 Apr 2020 16:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id duWS38ypKHza; Fri, 24 Apr 2020 16:24:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E35C2864B3;
	Fri, 24 Apr 2020 16:24:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B57C6C0175;
	Fri, 24 Apr 2020 16:24:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04183C0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 16:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E7E738648E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 16:24:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fQC+UeznS1xu
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 16:24:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 207C186443
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 16:24:17 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id fb4so4943837qvb.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 09:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=5xiOMT/BYFio8gk7L4mxEGHbH/1D/dauxLv6g8kuV3o=;
 b=KGcGAicOxX0bZsg6vkphIwdL/IRw61ccLA2HSnDTmtRbyDtWeTvfhQBQT6LGtbgB7P
 hdtCwy37xAlSwbY3ywI0hSBCQNGjUHgSdaOUjhchyj0K44GZuqXN8T+zi/boDAI7ki56
 D9vjhuirzBpTlfL1F+Htos1gr/HPWQiZ6Mi7lPy4n2MeaKCw5LvBws0DowzmYiwBroye
 TCq0B2Ynw2i2GewjUPkk73geXhmbTU1aC17EgZi7b9ugki1z3gbqOS7QWjK+iCETf6qI
 3Gd+6OAsjKS60s1s/iM0M5qaNUVTYzIpTk/2KBDyuc8hLwK7pHrhkYzybte0woP7rwN7
 qOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=5xiOMT/BYFio8gk7L4mxEGHbH/1D/dauxLv6g8kuV3o=;
 b=F4weGnGEgOMG4zAjAW8tY8QhqIsOTMMY76dAy6idg/qhBbp7PEtP9BD7smn40TZvxw
 w66EqIY3RhU+A+HON+EbvaC8DGCdbNRLiPapqp3XN8/2ZcbR6TG+cycUHQ7Ik1NeKGj6
 5XXZya48k3Ks3EXCLL6bH0toAeaHVklerinolIFOtNzqlAJlo9Yp0dj6uQJ8KRv9wffj
 +UMBZrCGD67TnDqwvipHxxkDYjbUehCbkgkBjwHO7tsushvrN7YzEVGmE7yj+WxMhue7
 kZsKC9tLW9j93UGuxsGltYNMZ+T61g8wxwbVnFFCA47/w99BbiOpm7vSl7MeFlZa0bl+
 zPXQ==
X-Gm-Message-State: AGi0PuZ2Ntnx1FWUZRog+L6Zzpz/OM6YhxqwLiEDvuha144oC48yvB9/
 oyozlyDLNW3H3+ueTq9S8F4=
X-Google-Smtp-Source: APiQypIh/qtFO9lHWxvK1GzrWvygfsKblupUc7qxqc+2rye/fphuJi7smb2fg30q9muf2uX+4fTF4g==
X-Received: by 2002:a0c:8444:: with SMTP id l62mr10267172qva.239.1587745455951; 
 Fri, 24 Apr 2020 09:24:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id z18sm4328496qtz.77.2020.04.24.09.24.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Apr 2020 09:24:15 -0700 (PDT)
Subject: [PATCH v2] virtio-balloon: Disable free page reporting if page
 poison reporting is not enabled
From: Alexander Duyck <alexander.duyck@gmail.com>
To: jasowang@redhat.com, mst@redhat.com, david@redhat.com
Date: Fri, 24 Apr 2020 09:24:14 -0700
Message-ID: <20200424162103.6681.436.stgit@localhost.localdomain>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Cc: virtio-dev@lists.oasis-open.org, virtualization@lists.linux-foundation.org
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

From: Alexander Duyck <alexander.h.duyck@linux.intel.com>

We should disable free page reporting if page poisoning is enabled in the
kernel but we cannot report it via the balloon interface. This way we can
avoid the possibility of corrupting guest memory. Normally the page poison
reporting feature should always be present when free page reporting is
enabled on the hypervisor, however this allows us to correctly handle a
case of the virtio-balloon device being possibly misconfigured.

Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---

Changes since v1:
Originally this patch also modified free page hinting, that has been removed.
Updated patch title and description.
Added a comment explaining reasoning for disabling free page reporting.

 drivers/virtio/virtio_balloon.c |    9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 51086a5afdd4..1f157d2f4952 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -1107,11 +1107,18 @@ static int virtballoon_restore(struct virtio_device *vdev)
 
 static int virtballoon_validate(struct virtio_device *vdev)
 {
-	/* Tell the host whether we care about poisoned pages. */
+	/*
+	 * Inform the hypervisor that our pages are poisoned or
+	 * initialized. If we cannot do that then we should disable
+	 * page reporting as it could potentially change the contents
+	 * of our free pages.
+	 */
 	if (!want_init_on_free() &&
 	    (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
 	     !page_poisoning_enabled()))
 		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
+	else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON))
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
 
 	__virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
 	return 0;

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
