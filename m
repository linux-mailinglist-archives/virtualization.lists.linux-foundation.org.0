Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id ED79119FFBC
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:01:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 74F2620015;
	Mon,  6 Apr 2020 21:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7p3RtPm7INPs; Mon,  6 Apr 2020 21:01:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BA24620018;
	Mon,  6 Apr 2020 21:01:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9E9D6C0177;
	Mon,  6 Apr 2020 21:01:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06F8CC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F1CD485C6F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g3dbv7Y-Ngy8
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 031D685B1C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=EurRmupDo0I0LXwSNyYWafhZStv0HeSEjS8TWjWRNuhnuZirmw5n4NI84wcpk58PMMVE+w
 ZSRbeM7h27lza329tJREfqUoubOslhYWBUdZ0XLah2iwyK9jcewbdZaOmfC4sFqymy9gkd
 2XB5skP0qSCnZUH1EU6GgNvoL+gMl4k=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-vFMM1FUoNOeHwgeVm1whyg-1; Mon, 06 Apr 2020 17:01:51 -0400
X-MC-Unique: vFMM1FUoNOeHwgeVm1whyg-1
Received: by mail-wm1-f70.google.com with SMTP id s9so86265wmh.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RVzro4XtEZaLbEft7JeQy81ssJHBlnUXRCePrLVPDZg=;
 b=C4SesYr7w1Oyfg8lfG23xH6maLMlDgTz6T8R4/TFmmb6ZIIHqJYrP9RWemomf17FT0
 +E4AIc0Lu8FB5Ahj4B/qDr2WH2LMg333yMV4l6v4xxjX59T7SIK6yHeGFwiea8/xKQQX
 RpI8zfS2hDYYqGQ7IPYtZpd1HRWyQtGEYK2y13pEu17PNTIVGITq3w5xggXOUJ2RSfF1
 34PviB4yUuTqz08AXTtGZ7SWb+9qE8oTC7fNZr9vIlgGlYllkefTyF2ryugXbl5FAiJ/
 Uc7yDZMpc1xixhG5nFQRm+q1ssIGQxaapUndwi2kCmV0vPtgosGjNRocyWGqMMJYQ+Nw
 wufQ==
X-Gm-Message-State: AGi0PuY+EdlkcVmG12BY+iSkgb2H2zCdV/9yfNkpYs9DGNaekMUnuDYW
 jasYxxtCLJ0bb6RKBt7iGCAddX+FDppgV4cnw1fJJPU1ebj6J/ifkiHj+9o9J+IhHzuvwH0BD8s
 Wf/ckbHiBzol8uXT8JMZY3j3WwNrA8tDwRpUFZgM78w==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr966451wmm.137.1586206910169;
 Mon, 06 Apr 2020 14:01:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKF+V+023b9Mt80Qjnw/BKYHw0rugCFNMg2KpZ/RzzSTvuJGGHZP6+vFug+XfBPqFNZD9byww==
X-Received: by 2002:a7b:cfc9:: with SMTP id f9mr966428wmm.137.1586206909976;
 Mon, 06 Apr 2020 14:01:49 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id i8sm29713666wrb.41.2020.04.06.14.01.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:01:49 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:01:48 -0400
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
