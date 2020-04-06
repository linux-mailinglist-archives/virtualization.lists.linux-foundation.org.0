Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B221A002D
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 757D4860FE;
	Mon,  6 Apr 2020 21:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OFoYm0_ihna0; Mon,  6 Apr 2020 21:34:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6CE138651A;
	Mon,  6 Apr 2020 21:34:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41532C0177;
	Mon,  6 Apr 2020 21:34:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1772FC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F3C7220033
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7jEnbimptXDe
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 1E80B20000
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=IeA1XZyrGqZQtY10/txBI1Uhkj35kjrXxFfenqctyLOI4qfyBQZCfXoYWO9YlxI6foYyOM
 19+8mkQKIYvZ1t8Ji5Hz761LUn0aOx6bs8xKp1H1oPZdGt+/4B30qr0Q/kaFQB9XC8zQeM
 dB1ja3wj76fBPnbKSyLmGeI907/i7OA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-mX2Br3YKPlK8RMr6onSTAQ-1; Mon, 06 Apr 2020 17:34:29 -0400
X-MC-Unique: mX2Br3YKPlK8RMr6onSTAQ-1
Received: by mail-wr1-f70.google.com with SMTP id a10so590784wra.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=JXXQHzqRc2lpCiDIeDYRl8T2PUkQgMEAuCsT8OU36sAT0wL/LDpiTKSMUFmOv2dt3l
 F78v+CxW5Jvcoimj6OEpnDbHS4LqLbPK1EGGbsuGClutLctNenLeyiJplKyMw+psgux0
 OfCQORH27iv2rwmP0FpHKgresZ9bd25MMzgPCW6jFeyVE/DXIJyuRGLmS4u+BJM49P89
 083jJ5JVC2Kk2m4CjY6GLBuuJ/scZZy8y0Uq8xB+WAWq7Bq6gmnp+NT3nYlFCsvOyU9x
 /VfBnaGcN5NyzyrKpUiVk7YldpEFLuwk8RvH6FPvW0Yt8CIC5zrfxnB9k5B/HYTJx7QP
 LfCg==
X-Gm-Message-State: AGi0PuYGd9tZpiP93nXT16FBp/Tt51tuuIPI376m4yuZJ2lSVddxOPit
 aoPe0X7Nkq7vAwhdakijgPfnelmasLkUEwG541FOqy/UadtXz9SNPI6jjeHWT5YNlqHhJyhL9aB
 1k8ig92hf5YXN4EismuoICtPwJjgaSYw39DbN8Z8llg==
X-Received: by 2002:a05:6000:114f:: with SMTP id
 d15mr1365290wrx.143.1586208868473; 
 Mon, 06 Apr 2020 14:34:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypJe1ynXEfR0D8AoRMCthmTYYN49hldiZJCK3rhyOo8SLO63KDBiOBd6vs5GGxz/vmOhazUDXA==
X-Received: by 2002:a05:6000:114f:: with SMTP id
 d15mr1365275wrx.143.1586208868311; 
 Mon, 06 Apr 2020 14:34:28 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id a15sm1046768wme.17.2020.04.06.14.34.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:27 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/12] tools/virtio: define aligned attribute
Message-ID: <20200406210108.148131-2-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
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

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tools/virtio/linux/compiler.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/virtio/linux/compiler.h b/tools/virtio/linux/compiler.h
index 903dc9c4bd11..2c51bccb97bb 100644
--- a/tools/virtio/linux/compiler.h
+++ b/tools/virtio/linux/compiler.h
@@ -7,4 +7,5 @@
 
 #define READ_ONCE(var) (*((volatile typeof(var) *)(&(var))))
 
+#define __aligned(x) __attribute((__aligned__(x)))
 #endif
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
