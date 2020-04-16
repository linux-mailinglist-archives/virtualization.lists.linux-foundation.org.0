Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220B1AD058
	for <lists.virtualization@lfdr.de>; Thu, 16 Apr 2020 21:30:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8DF27204E6;
	Thu, 16 Apr 2020 19:30:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYrkjbHeEJAb; Thu, 16 Apr 2020 19:30:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C3D7620437;
	Thu, 16 Apr 2020 19:30:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A79B0C0172;
	Thu, 16 Apr 2020 19:30:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 49CD0C0172
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 19:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2B70587482
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 19:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGu0DorvjH7t
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 19:30:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0674A86D72
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 19:30:42 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id y3so22629194qky.8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 12:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:date:message-id:user-agent:mime-version
 :content-transfer-encoding;
 bh=bvok+DJR+w/O07clfbm1bfWWxM+sE76KMdzs4inEcRU=;
 b=Gir5fWzgI9OwvCgz2ewfueghofsK4vmdeK0/7kmdefhmHIOQ4/xGki3sMhvHSgm9ac
 KX5/LlHIASbYG+goKAIxuedLt4GYL42r6JuL+8+sBBY1lEIw0vvK9lYhlQYe7mo3VORC
 k5FX+sbdHy+yzo6n8fwmb2vhMvpUCY7Itb+bRSc98UclxzahJeprnNHpDFp0vmg9loxf
 m2KCx6HG7CgjEKXroOJ1lyOX77cKT1tNATEvNpkalH0ZjJj3MDt+8M253MTHbD4PkUWL
 +YtCLOVLy/qfCsiZpZULZByx1yl8kp3w0nKBb/Hn4iqI8S5aIOqEWeWG4Co0ASyogADE
 qjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:date:message-id:user-agent
 :mime-version:content-transfer-encoding;
 bh=bvok+DJR+w/O07clfbm1bfWWxM+sE76KMdzs4inEcRU=;
 b=Gg8yh4KU/7698XpmsBK1lOHuGBXg4+7yfQbDm4vELwN1QOJVqM4U8H5tJXEn1MmEJy
 jUnRLa8epM/jJ6C8OMz3o+cee8br8j9GBPvENi0QDZ3VoJ+CV3Woryb372QhagsEOpnJ
 F96pp/qDKUuYGbK3OfEQmMreBoI7NPpEbr0KkAZraB+Y3uttJhN10qG3b1UXYhnsDjVP
 Rl1UCBzBv8ZxKp6IVf+3bTDTcEFUPge/5J67PA3BlcEg/WcXEqoIyjr9qo/cCPUyH+5/
 24PsvdjabstbS3TuA6DEgYmYqkm7tAwHZ+Qbel7ftNHhhGccy3eDu2tT6V8W8gk2FGNs
 qR7A==
X-Gm-Message-State: AGi0PubiSsGrdPpFCFjYWhAjMyCRkg6/A3vGFuSFta65cbfR5sISDEgP
 0kWU5LVYMrodf5WujAb0UXE=
X-Google-Smtp-Source: APiQypJVB4oJUv/6iy5BnUy7pPW5G4zPe6s9KfK71swV8SOB33/BOyXCVS6Aaa7ZY2i4kN5RJXN2CA==
X-Received: by 2002:a37:7302:: with SMTP id o2mr31944173qkc.466.1587065440820; 
 Thu, 16 Apr 2020 12:30:40 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:b:9c3:9e5c:8eff:fe4f:f2d0])
 by smtp.gmail.com with ESMTPSA id b1sm15577426qkf.103.2020.04.16.12.30.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Apr 2020 12:30:39 -0700 (PDT)
Subject: [PATCH] virtio-balloon: Disable free page hinting/reporting if page
 poison is disabled
From: Alexander Duyck <alexander.duyck@gmail.com>
To: jasowang@redhat.com, david@redhat.com, mst@redhat.com
Date: Thu, 16 Apr 2020 12:30:38 -0700
Message-ID: <20200416192809.8763.19308.stgit@localhost.localdomain>
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

If we have free page hinting or page reporting enabled we should disable it
if the pages are poisoned or initialized on free and we cannot notify the
hypervisor.

Fixes: 5d757c8d518d ("virtio-balloon: add support for providing free page reports to host")

Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
---
 drivers/virtio/virtio_balloon.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
index 95d9c2f0a7be..08bc86a6e468 100644
--- a/drivers/virtio/virtio_balloon.c
+++ b/drivers/virtio/virtio_balloon.c
@@ -1110,8 +1110,12 @@ static int virtballoon_validate(struct virtio_device *vdev)
 	/* Tell the host whether we care about poisoned pages. */
 	if (!want_init_on_free() &&
 	    (IS_ENABLED(CONFIG_PAGE_POISONING_NO_SANITY) ||
-	     !page_poisoning_enabled()))
+	     !page_poisoning_enabled())) {
 		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_PAGE_POISON);
+	} else if (!virtio_has_feature(vdev, VIRTIO_BALLOON_F_PAGE_POISON)) {
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_FREE_PAGE_HINT);
+		__virtio_clear_bit(vdev, VIRTIO_BALLOON_F_REPORTING);
+	}
 
 	__virtio_clear_bit(vdev, VIRTIO_F_IOMMU_PLATFORM);
 	return 0;

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
