Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2026321B401
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 13:31:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8224896F0;
	Fri, 10 Jul 2020 11:31:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mjjfkIcGINz6; Fri, 10 Jul 2020 11:31:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DBC0D896B0;
	Fri, 10 Jul 2020 11:31:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C88D1C016F;
	Fri, 10 Jul 2020 11:31:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70E20C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 11:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 308682C291
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 11:31:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCbO6Z88jZKV
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 11:31:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 61916227AD
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594380700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5Ofr2MCGvPvfpwIdGlSnpSEf1nx+bNb0i5ZzaI9/r3g=;
 b=bv/MelxTLZZoYtoRHHh+LvBobGCCSsYVArnopuVBNPgLGe62ajrsEJpvugdm1P4/cm5DSh
 Mvwqlt2BZUgVEfYapSb8BhlqHYAO3Tsf6iKUQUzTZCgtQbqcHQ9RyNj2YV7p4d5CaZQl0R
 C8hJv22GKvKFyyOJfVGEb1gBoos1gGI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-9_aLEwKYN6iQyUlEloVCSA-1; Fri, 10 Jul 2020 07:31:39 -0400
X-MC-Unique: 9_aLEwKYN6iQyUlEloVCSA-1
Received: by mail-wr1-f72.google.com with SMTP id j5so5790808wro.6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 04:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=5Ofr2MCGvPvfpwIdGlSnpSEf1nx+bNb0i5ZzaI9/r3g=;
 b=c1FyHduPrl+drj9o6TtEveBP0xhzMNkrhbatkHUYrqE4XUBckuDE5fTQwJ8vTRYpf1
 O8FOFHsYlIK3F0MRZfdIAp/NWy0pUjmJzWJ6I8nuGNayUGu2LqlJM8a3ObgxHC5BExnC
 sZVF4HQJEep/AA+BXcDpkpSEfSpWgGVT7nwCfGWUjT1lgsCYsv06d0E2Xuq48yOrfvBq
 uoA0mdACOvZBqrwwB0xhYkqUyEU+MUebjSPXzZHymTAlk4qTqRKaz86uGhVbXyk1Vl+l
 lQCMP+oh+wUTdIEXInzn9i8k4m6M4iBYi/UuGURT0Fz9q6VZEa/GqWcmYd1yvqOzcl2c
 O9YQ==
X-Gm-Message-State: AOAM530Bb3mXZActMlw+jSspGpEEwbJCL0twhVAblDS4WnCW90kvlpZg
 7OpetgpNKmjeTnAGMYgyfU2AdMuain1CgUkyXM7MkhCiyONWD9ToWeY+gx6nLfO35w2rFghar2t
 +aRoUXZ33nbxcGZj6kuL1nznoEm1AJP/yUCBMp8jAOg==
X-Received: by 2002:adf:ea06:: with SMTP id q6mr65083186wrm.69.1594380698302; 
 Fri, 10 Jul 2020 04:31:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4g++MZXIVwdtMKOQxK6lrsv51Rp7rwp+FV4RYaCSdZuYHSZRZ0n8HTomwQMFHmG03mUFrHg==
X-Received: by 2002:adf:ea06:: with SMTP id q6mr65083170wrm.69.1594380698095; 
 Fri, 10 Jul 2020 04:31:38 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 o21sm8912958wmh.18.2020.07.10.04.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2020 04:31:37 -0700 (PDT)
Date: Fri, 10 Jul 2020 07:31:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_balloon: clear modern features under legacy
Message-ID: <20200710113046.421366-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org,
 Alexander Duyck <alexander.duyck@gmail.com>, stable@vger.kernel.org
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

Page reporting features were never supported by legacy hypervisors.
Supporting them poses a problem: should we use native endian-ness (like
current code assumes)? Or little endian-ness like the virtio spec says?
Rather than try to figure out, and since results of
incorrect endian-ness are dire, let's just block this configuration.

Cc: stable@vger.kernel.org
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_balloon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 5d4b891bf84f..b9bc03345157 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -1107,6 +1107,15 @@ static int virtballoon_restore(struct virtio_device *vdev)
 
 static int virtballoon_validate(struct virtio_device *vdev)
 {
+	/*
+	 * Legacy devices never specified how modern features should behave.
+	 * E.g. which endian-ness to use? Better not to assume anything.
+	 */
+	if (!virtio_has_feature(vdev, VIRTIO_F_VERSION_1)) {
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
+	}
 	/*
 	 * Inform the hypervisor that our pages are poisoned or
 	 * initialized. If we cannot do that then we should disable
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
