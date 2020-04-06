Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BBF1A010D
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 00:26:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2970986781;
	Mon,  6 Apr 2020 22:26:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q_pWd0Z4zP9P; Mon,  6 Apr 2020 22:26:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A6AE086640;
	Mon,  6 Apr 2020 22:26:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B773C0177;
	Mon,  6 Apr 2020 22:26:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0C0B2C1D89
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F3DEA86781
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LLbsU44utS1A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7D76986640
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 22:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586211998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=S+0R2o6ZEKZNr/JUkjhNiNeMUP7mtXLWBBztM0MZ/1IolJwfS8WjMeg7q0UK1LnGWAHZsi
 6U0RwGMa6RrpTscF0Q108dL2roxMRvPxUKTbMzk5yBaUVGiBcsEk5w70d5ky5oahlFPJv2
 Inm2A9xcvIdyD5PdeRs9A+qoPNU/r28=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-43ZCxwHIOc64-3Ah6xk_CQ-1; Mon, 06 Apr 2020 18:26:37 -0400
X-MC-Unique: 43ZCxwHIOc64-3Ah6xk_CQ-1
Received: by mail-wm1-f72.google.com with SMTP id a4so471437wmb.3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 15:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=F682+mrTRRcpqGrl/UYibgzU2GPu35+/79TfNnp5lfjCypAlHK92pSqWbGFd/bXur/
 6QC7fe3qHvc5cYtt2yehMHpi3T+e3xoiPnawiZGN8YAqnS5I+8ordAPkoxY/GFPuagCq
 NkrsGweOWJk93OQPGQb9x2RhaarXFVEaIIcxWNPRZJQUDXc5RCaebn3l+3ss17gLTLRU
 kaTpYvoR7E/9iQ2GCVZl0Zj6pIgO9Meq/hywd+/TV+ykukwNt5p7+Oji7M1ey8ZpAgP0
 amS6EtiCtXfi0TZmVJdJmGdgOyMlhvqI2bONTiy8XWdIvcUy9Vg4R+dlnZGDIALUCXbb
 jFbQ==
X-Gm-Message-State: AGi0PubuQZt347QpfL0q4K8hAfpqMPALSmbWbe8kcMVRh8pwOCN3mXma
 kGaKU3i+ROWSBhzFzI5zKUgdlYKgcQe66g3C+suDy53yCmMsddsLM0mPWqSqguYXRz8QCIzhz09
 L7bPAuWkypk4r55mKbci+0hpCuBBhFpcW8YqaGQhvKw==
X-Received: by 2002:a05:6000:1090:: with SMTP id
 y16mr1356896wrw.281.1586211995905; 
 Mon, 06 Apr 2020 15:26:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypJBiJSqYUen7mSSXRpaMA2RRUCKg7gFj+QtdLfzH0FWN8clj2+GZO3iVNHgzn10ZwwLLS/ApQ==
X-Received: by 2002:a05:6000:1090:: with SMTP id
 y16mr1356886wrw.281.1586211995761; 
 Mon, 06 Apr 2020 15:26:35 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id z3sm1162290wma.22.2020.04.06.15.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 15:26:35 -0700 (PDT)
Date: Mon, 6 Apr 2020 18:26:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/12] tools/virtio: define __KERNEL__
Message-ID: <20200406222507.281867-4-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
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
