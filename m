Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FF23CB33
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:44:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 71D1C8820F;
	Wed,  5 Aug 2020 13:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bJXOqG2+fr+t; Wed,  5 Aug 2020 13:44:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E1DA881B7;
	Wed,  5 Aug 2020 13:44:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01AB4C004C;
	Wed,  5 Aug 2020 13:44:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15878C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1254086880
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2PC8U54zkec
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 92C1284508
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rITNW/NU1Wv42UK2hT0FegE7HEoaDEjHqXI0VXDNUgg=;
 b=bMsYpzCfYJuH8zAVIZwvbfV+orMMPz5LLCQe1ASk62K5Z6MW4fCraR5I53zn4bZCD6vzR4
 HHrmEN3QrV1pJoXUHGE4z4kfypu3nKfYrYm631m/h7PTOFK8eZTS2ygQm9OqiYnO0UlZdO
 h4wjjGPNEiOVd8lwN8KtQFYp62snWHo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-8kCMMK_AP0-esju5KC04mA-1; Wed, 05 Aug 2020 09:44:32 -0400
X-MC-Unique: 8kCMMK_AP0-esju5KC04mA-1
Received: by mail-wm1-f72.google.com with SMTP id p184so646527wmp.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rITNW/NU1Wv42UK2hT0FegE7HEoaDEjHqXI0VXDNUgg=;
 b=Hk94ASz0CsaNfME1y+rNkEnPLhrDFNsjjdKNQKIP0jKGYVqjwLn/Q64xp5oxKGHjjW
 SS6Bo1pGvXQ5i611F9p6H5VTeXPcl7o9SVgr2b2i5AlwIMYvrbLHqVji7rfNlLrMi8Wl
 gZxuYTKGz+NoIV4uqOd/MNTxaJmLwpTZ0zBLu2+FdgL58evZr3a332mmjETgYnuGp2sq
 50yncVovO/U+XKAs6npAnvpMjvJ6T3+VxSLei7Hvr4sX/hCIsytfLUOmqWRP6gq8oKVr
 yb7RY4lA9+x7wJ50Q6Lwyw79yRIsTL6vBrWx0AK/1PaPBXyVKP9RRyl/8waQyHYEL6tf
 YSvQ==
X-Gm-Message-State: AOAM531JWGCgRt+Oc6O2QakpKr8fj+g/v0A6sk/xvtZqKtN2QB7mT2Zs
 RPx7C2SwzDJyNDWg3L1zNRB/GMIvyrSMexXPKHwJS8qmV4nMuS+SrXeeAdQTh5Lsycsfaoy0V++
 XKGMczSv0WpL6sK4i0rWx7W5MThnSp7Xe0aMUOe4Jkw==
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr3561060wmo.91.1596635070888; 
 Wed, 05 Aug 2020 06:44:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcZLOj081T5kxFNjl1P5IaJV7iDG1ay5q9gWzjOmdLhKok8j4JZTnYScNBYJMMxfhLX53FGQ==
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr3561042wmo.91.1596635070706; 
 Wed, 05 Aug 2020 06:44:30 -0700 (PDT)
Received: from redhat.com (bzq-79-180-0-181.red.bezeqint.net. [79.180.0.181])
 by smtp.gmail.com with ESMTPSA id
 g8sm2732859wme.13.2020.08.05.06.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:44:30 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:44:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 27/38] virtio_caif: correct tags for config space fields
Message-ID: <20200805134226.1106164-28-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
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

Tag config space fields as having virtio endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/virtio_caif.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/virtio_caif.h b/include/linux/virtio_caif.h
index 5d2d3124ca3d..ea722479510c 100644
--- a/include/linux/virtio_caif.h
+++ b/include/linux/virtio_caif.h
@@ -11,9 +11,9 @@
 
 #include <linux/types.h>
 struct virtio_caif_transf_config {
-	u16 headroom;
-	u16 tailroom;
-	u32 mtu;
+	__virtio16 headroom;
+	__virtio16 tailroom;
+	__virtio32 mtu;
 	u8 reserved[4];
 };
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
