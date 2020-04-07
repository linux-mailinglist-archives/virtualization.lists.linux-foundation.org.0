Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C7A1A043E
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:16:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4759588277;
	Tue,  7 Apr 2020 01:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwvXMrg5+9I1; Tue,  7 Apr 2020 01:16:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB45387EAD;
	Tue,  7 Apr 2020 01:16:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D486EC0177;
	Tue,  7 Apr 2020 01:16:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3863AC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 223CA85754
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UqxivIUJ25Bb
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D2D4E85BCF
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=Ljx+eeAUDkXY9CO+4YXdnYj64F/UmSNsc94xmsxceKUYw7wFmaSZ+b8eh92E02NdmC2S/n
 VZX2UwdOZ5DTNCtwvs2/gYSjyPinNoAvsaNneo0UPRt0KwfQHacDBgBATGGNY7XeiRqbH1
 yowuv32CqYbAiukcF/Htlvetb5RV5K0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-00JG-MaJP8OTfi2hSCPW0Q-1; Mon, 06 Apr 2020 21:16:36 -0400
X-MC-Unique: 00JG-MaJP8OTfi2hSCPW0Q-1
Received: by mail-wm1-f72.google.com with SMTP id z24so29782wml.9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=kAQz7VDolrbl/jlJspdGgX7ULs9eYxwa9j7rVc7Qm1WtK/mA/CEKuC1XIi2MgxoaAf
 hA4myzlhogP5rdZUvtHGFtRbYsN/KIdIYQwd3UW2Pxj39BJ4uZSIUIFn0fRA5zpjeaaA
 5Udq6s//hinTSIR2i22cxNostMAfiMzbJH4HfeOksIYJ41TSZA+bIPskkmi5KcMBHDj0
 szIhhWjIXxwQT0cgfhomYCzp3Dz5190ZvmaD7bFalQKnZUpy0FgJNPRbR0HTG4jKXIuQ
 aKoNsVYtivxi+1YXtjKRGqIhxzug9GZ4xzP7kV6KyGtEQzwi6KxT29ftPDImRRu7909o
 +niQ==
X-Gm-Message-State: AGi0PubtNwrargY3oUuehCH5RpiTu96hMzXQbXqN2Gpd4lSeNEMy9Vk/
 ez+wA9JIWgBsEBs2X9kljwneE9PnENcPO8Fkm/yQtx2fnpOEgO5NXYO0s+gAUYi0hTe3DXH1pMO
 m4j/O7ZhiaNtMhS9Pmat/U8NiorNIdGRS3hUsoFASNg==
X-Received: by 2002:a5d:4246:: with SMTP id s6mr2029044wrr.321.1586222194939; 
 Mon, 06 Apr 2020 18:16:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypKWkr4ZqkSRYtTLBgfGpJ5Yb/IYOEqHTM8Xx2O8GLLhIbQ9pozRiRQPOpPSDWHvw3XND59nHQ==
X-Received: by 2002:a5d:4246:: with SMTP id s6mr2029035wrr.321.1586222194738; 
 Mon, 06 Apr 2020 18:16:34 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id e8sm20324384wrw.40.2020.04.06.18.16.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:34 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 03/19] tools/virtio: define __KERNEL__
Message-ID: <20200407011612.478226-4-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
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
