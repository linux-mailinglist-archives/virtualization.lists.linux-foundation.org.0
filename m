Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DF419FFC2
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:02:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 594F32042C;
	Mon,  6 Apr 2020 21:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xJwvseM+oRRs; Mon,  6 Apr 2020 21:02:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 58473203F8;
	Mon,  6 Apr 2020 21:02:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F2A0C0177;
	Mon,  6 Apr 2020 21:02:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6EB04C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5A95085C9D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:02:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2pAM+RyoydFF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0759E85C3B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586206917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=cogNw3yj+I4t6kDKiLm6kMDngYwUXvwj4zlshmGue0vlpnv7LXmApYYJW2zIb24rqACaZs
 hUY9XeF1NmGVWAKt6C/MUoQRjtyG41eJLNBWQnLGaDAPzF5aflH6gjcQlPt8JLCSD5K7pD
 l81GDxQnNar4kTo8B0MjlDLORUF3+Ks=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-eUZ5JO0LPwKTskq2HeBdtg-1; Mon, 06 Apr 2020 17:01:56 -0400
X-MC-Unique: eUZ5JO0LPwKTskq2HeBdtg-1
Received: by mail-wm1-f71.google.com with SMTP id f9so370389wme.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=MXuONGTkp7WWdI21NykSW4Weus8frJCBs+8OKAB5skuts23tcAZNCusawLYu+KjQAD
 af5JT/RHaFZ2eCpbVykfWR1u0DRI/sJ0s9C4oNomsLyah/cHZtdmBn35tBldybW9N8aK
 1rm7pZO5Q3p2+X3PrkvLR3EqiSUaynADIO+HUtIAJYDvBhnTH5fanm0dAtgQi2fWR4bA
 tk2v5FvjQTAd65rNgrxTpuQPMibBm7PdaF2gZ0luEE6E/doC/c7QsS6K5oFtkMwuRSVI
 KPwJYwlIa+zXYOoYdY1I5MWsDn1Kb6fUQxWApMYUA5+IlJX3Yh7ClIZ49z1A5xNBiqOL
 o80g==
X-Gm-Message-State: AGi0PuZfDovsb5xr0KPjfIqYBDzH83jDE2RHTtsFPLKrSrgVimrQHLEZ
 LgvKe+b3c8E6q30jzvl206/hkTLT90MOqTlJBgpUakxhKKf3WWCic62VsU58+I8iw1sHNsxcN+q
 c7Zz8dz4jkgdjfhKMWrhEh132UZ72tEjOYjzWhwinXQ==
X-Received: by 2002:a05:600c:295a:: with SMTP id
 n26mr1077865wmd.16.1586206914192; 
 Mon, 06 Apr 2020 14:01:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ7PmatlCOEaiT44kklJY3XQDVlzCX6CQ5HXBSQbwSxFsprMcnd0G2gWziCsDYMLW7CcKPBfQ==
X-Received: by 2002:a05:600c:295a:: with SMTP id
 n26mr1077851wmd.16.1586206913969; 
 Mon, 06 Apr 2020 14:01:53 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id t124sm975023wmf.19.2020.04.06.14.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:01:53 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:01:52 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 03/12] tools/virtio: define __KERNEL__
Message-ID: <20200406210108.148131-4-mst@redhat.com>
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

Even though we are building in userspace, we are emulating kernel bits.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tools/virtio/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/virtio/Makefile b/tools/virtio/Makefile
index b587b9a7a124..ea6674307507 100644
--- a/tools/virtio/Makefile
+++ b/tools/virtio/Makefile
@@ -4,7 +4,7 @@ test: virtio_test vringh_test
 virtio_test: virtio_ring.o virtio_test.o
 vringh_test: vringh_test.o vringh.o virtio_ring.o
 
-CFLAGS += -g -O2 -Werror -Wall -I. -I../include/ -I ../../usr/include/ -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -include ../../include/linux/kconfig.h
+CFLAGS += -g -O2 -Werror -Wall -I. -I../include/ -I ../../usr/include/ -Wno-pointer-sign -fno-strict-overflow -fno-strict-aliasing -fno-common -MMD -U_FORTIFY_SOURCE -include ../../include/linux/kconfig.h -D__KERNEL__
 vpath %.c ../../drivers/virtio ../../drivers/vhost
 mod:
 	${MAKE} -C `pwd`/../.. M=`pwd`/vhost_test V=${V}
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
