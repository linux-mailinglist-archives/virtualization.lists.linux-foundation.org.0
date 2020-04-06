Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3911A0039
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:35:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2FC6087C02;
	Mon,  6 Apr 2020 21:35:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KlCcv3oFPCP6; Mon,  6 Apr 2020 21:35:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E6A4B87CBE;
	Mon,  6 Apr 2020 21:35:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D975FC0177;
	Mon,  6 Apr 2020 21:35:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68A2AC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 553032079A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2qYDMi2Z-xzS
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 05BFD204B0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=bx8YSRIFv23bHpQfQYwM6k1cOxm72n5YZ92rbNnESxAmfUB7q0vOlqhKf0TNyyz+ubVkFe
 Ju5NZW0JbLUZvImz0lICI3mIFDdgt5N/nNNoQ5OFcmHvYXiuP/TwwBIxWk0xSvr0/3dF1E
 o6P4DAL0/ZET769V/S5KvfkzOs/AlAg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-TCYwxEM3NdKZEKNy-AMJbw-1; Mon, 06 Apr 2020 17:34:57 -0400
X-MC-Unique: TCYwxEM3NdKZEKNy-AMJbw-1
Received: by mail-wm1-f70.google.com with SMTP id n127so412688wme.4
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=ZybrDK2z6gz43tNGdfur+CbJSEioXuHopuboldl89iIVanNu6bPrXPBnznMUzF1ohh
 uxjpm2hQlXS7ZyEuREg/Ct+LtgMSZKZvjDs1xOl+q5BVNH20dfjT6oUMn/4p1cqhbcvL
 vj8inWIKQt0201pwd49BjrrkPWhW1i7vFCq05Km1iSnrcGcQ/ZIomAO82GHcxLgK1O/c
 F/Wp1OjwDbvuA2Iff/v6EwW7V1MEgGWFXb/At6Sl8o4Q56qqCGgdQ3gejpTWKbOK/gdQ
 pmZOCuqqSeCINTUOaIr53cZUbkM2Wt6ixbHS5QAzmLE7gPWM9a0GnY6uQRUhUZckzYIC
 cUTQ==
X-Gm-Message-State: AGi0PubFNfif36YRQhtH6re935SpnFIASp9BEjbzIunf+KaWmT3ndNiU
 16hcCC16qNb4yDKp0ZIvruJNUUNwUk6wfsIS2G1A+0rbzlElCPYdqPwSj134EZh2eozNpVGwu/v
 duRe2Cd9HUhEQCnyTsTLLrjlekmT1WWjoqwt7GNG7Sg==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr1437811wrr.198.1586208896202; 
 Mon, 06 Apr 2020 14:34:56 -0700 (PDT)
X-Google-Smtp-Source: APiQypLbeJ9XsXl+eX1MV9WTo/7Oa/xVm1oXSJ/RbY9U+Dj3CwqdzCsppgpS5TrfjoQ3IXNAATglfQ==
X-Received: by 2002:adf:fc01:: with SMTP id i1mr1437799wrr.198.1586208896068; 
 Mon, 06 Apr 2020 14:34:56 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id h10sm29241051wrq.33.2020.04.06.14.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:55 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 01/12] tools/virtio: define aligned attribute
Message-ID: <20200406213314.248038-2-mst@redhat.com>
References: <20200406213314.248038-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406213314.248038-1-mst@redhat.com>
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
