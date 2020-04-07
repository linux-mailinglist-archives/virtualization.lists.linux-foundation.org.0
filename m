Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B01A03F2
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:07:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CABF186918;
	Tue,  7 Apr 2020 01:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDu-7GV2uEYA; Tue,  7 Apr 2020 01:07:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6D3C8868FE;
	Tue,  7 Apr 2020 01:07:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F2F5C0177;
	Tue,  7 Apr 2020 01:07:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC842C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 96C8F204D4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IF8dkda66osw
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 1465B204AE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=GX/h+EpVkua1mfROezja09Uwhx3/HAlrRAFn+EWpxlMpnfqUugkH4yu4GyT1h9UYWXdxM3
 ope21J5X7jtka8IMcLq+qZsq+1Zq62gdBLDBnSENX3Qrn4qeya1Z3WKsrltQ7p1LIIg5+w
 fjt06b4vxUZqc8435DBHJss2Bj0gwis=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-xRsmuGQONyedsK2mO3FcZg-1; Mon, 06 Apr 2020 21:07:31 -0400
X-MC-Unique: xRsmuGQONyedsK2mO3FcZg-1
Received: by mail-wr1-f70.google.com with SMTP id 88so867357wrq.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=s5OZIYLdAMXeTPKPamFk2a+/ENwU+SVj63lBESJnoA+I7FTioyivjW8ZtSIms1jrMD
 RozytkdygJK/1ihXwiahz0WiwAy1A01SiERnHdib1DRXweGyWzY34rw+GOv51MD4/XmT
 cioHW780hkBkhvwiBpX58y5VYLiFS9I0qzKussVkTDx8tMEx1G5FrAaqNxMLFY5ajFZC
 ki/y7Yrgpkm3Wwn/zVBzloSNZLjVStQhX1x8ZX9nmfOj5zuDn9ZUkCrHCN1yNuP2Ne6Y
 YJe0hCndhuSSxuX8tHEnUPNz2AgxHbaN9eNm7DnyqBBrcOar2gQ1qsxsmpu1buF+St7l
 5VzQ==
X-Gm-Message-State: AGi0Pub/+7s2hrmI93BSMej7etVcRAllAsKAEQrEAt6YiYAdzKObi7BF
 Xsm4AF9AuQ6CxlLd0X+QRqiFnEked991YxTtAm/qghK3OnnNzaKZlnJhqUgRQkeK7nlkoxKAzkI
 uQKO3K1ztGQ4XI9rRQor2rSM1Y9FF61lYW6Ij+kMLnw==
X-Received: by 2002:a1c:3b89:: with SMTP id i131mr1711437wma.35.1586221649906; 
 Mon, 06 Apr 2020 18:07:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypKRKCipQIbm0Oc75IuaidBz2+PAGMeLuXFO4ovUk5KL+Lv7hqtVJIPPSzVzZ64HpueelPbnaw==
X-Received: by 2002:a1c:3b89:: with SMTP id i131mr1711426wma.35.1586221649698; 
 Mon, 06 Apr 2020 18:07:29 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id p21sm78244wmg.34.2020.04.06.18.07.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:29 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/19] tools/virtio: define aligned attribute
Message-ID: <20200407010700.446571-2-mst@redhat.com>
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
