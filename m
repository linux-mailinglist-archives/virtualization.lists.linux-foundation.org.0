Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E54811CB627
	for <lists.virtualization@lfdr.de>; Fri,  8 May 2020 19:40:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 45A0D22744;
	Fri,  8 May 2020 17:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PlF-hCjajQnl; Fri,  8 May 2020 17:40:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 699FA22703;
	Fri,  8 May 2020 17:40:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41DCDC07FF;
	Fri,  8 May 2020 17:40:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA67BC07FF
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 17:40:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B8E6A87C9E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 17:40:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MT0wZ4mpPlKf
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 17:40:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EBCBF87D0E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  8 May 2020 17:40:09 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id y19so1136508qvv.4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 08 May 2020 10:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=lapAMM55icaAhAxVnw1p69bjUJKfw7QEoWrV8LrNxfQ=;
 b=iUXKyKtsl6Ro7lMQmyiKYyei5joC5DIUWbIXCwCcYFg8RPP3/4GD0zxWXYCdXPOcKq
 HwZIQSPsN4zb6ngN+I2H50TxDPWrqtWFxV57f3XA3J0jKbL09E6S8/l5w5Z83hpQDcXA
 9TAkSTOqXupVF/QYJyLcRmoqvnK90DMJkvaFWiiMJ9VjUPAgRa42s0rU4DBHgNiSpNN7
 fKr0/BOgVikroIh+1DUgM3UY4NPAA1dtor8nKN5hmFpAENdbvfHEcxHi2Hm+DgEqsIEd
 1a+dUgPhjilDr2Xi/IQIUUmZGCGFj2AiPmimarxyP/lDDAqVNgqg6xKemSUbmCnZlB7h
 Y9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=lapAMM55icaAhAxVnw1p69bjUJKfw7QEoWrV8LrNxfQ=;
 b=ezN5ghSUxO22pi/HPoI2OhRkcZei2IjxyZIKKTApxaufvabyTQWMSXbjG6VrN/ce6F
 KvxwXrj6DjrBB0UIF3+k/cIKa7mQa3/EhwUmqUSRHtpk1KLfXQqo+QZShYMZMtrnds6n
 /YT9noKsp+/ezkm5yR2C2KIRi6re2VR0TWwyC0B4t5gAUG7+N7zEsfXo44KWCA5FUbg1
 5rVIB4l/rSgVjmLBfSffERaGZ42GuLEC16QmWElbVbPT+eduodb2Jf4XZp67CB0+ocMQ
 Jin3CULmgGF4cZcIJXd+xFn/L/HEIbDP+kZDhVrloNix9kwWD2t8UPzGagBUUtLrbwiL
 Jj/Q==
X-Gm-Message-State: AGi0PuasLBRB1uE2d7LhiUeP3XVaj+iKddaiqw2dTi7Px4mAJTk3wPP4
 DsFf6nDlm9aXftefPYQm8Xs=
X-Google-Smtp-Source: APiQypI4vhLNmy2yKIMks55wovVXJsOHSpso0J7Zbl/SSGzTY5vG2MoEjwMBnrh7o1WGzqv8DCp1ug==
X-Received: by 2002:a05:6214:54c:: with SMTP id
 ci12mr3938136qvb.50.1588959608792; 
 Fri, 08 May 2020 10:40:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id b198sm753349qkg.37.2020.05.08.10.40.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 May 2020 10:40:08 -0700 (PDT)
Subject: [PATCH v2 resubmit] virtio-balloon: Disable free page reporting if
 page poison reporting is not enabled
From: Alexander Duyck <alexander.duyck@gmail.com>
To: jasowang@redhat.com, david@redhat.com, mst@redhat.com
Date: Fri, 08 May 2020 10:40:06 -0700
Message-ID: <20200508173732.17877.85060.stgit@localhost.localdomain>
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

We should disable free page reporting if page poisoning is enabled but we
cannot report it via the balloon interface. This way we can avoid the
possibility of corrupting guest memory. Normally the page poisoning feature
should always be present when free page reporting is enabled on the
hypervisor, however this allows us to correctly handle a case of the
virtio-balloon device being possibly misconfigured.

Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---

Changes since v1:
Originally this patch also modified free page hinting, that has been removed.
Updated patch title and description.
Added a comment explaining reasoning for disabling free page reporting.

Resbumitting v2 w/ Ack from David Hildebrand.

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
