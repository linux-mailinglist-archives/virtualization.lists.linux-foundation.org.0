Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EFA1A03F4
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:07:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 62A3086909;
	Tue,  7 Apr 2020 01:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ndw0BCfM4rv0; Tue,  7 Apr 2020 01:07:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD0448690E;
	Tue,  7 Apr 2020 01:07:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BB602C0177;
	Tue,  7 Apr 2020 01:07:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1329C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E77A3868E4
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlfzPT4i-3zs
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 659C58690E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586221656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=W6aFPOhT2qEICG/tcZSWe0F1ktdB7Ca/YZudpUCtMP5i1pKbrUlHD1FQOAHmqNtVE/d1G0
 NC+bc7vXmhqvC6wWPubCnGyYfEBVNJGE/Q3NDUe7sE2wxwGgXZuSypEbvS8jX0XbLPQz4L
 xIijs0m8qFECP1J0p5aNILhlTpV9VAQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-pCUv-DThPZWrscY_WMtZuA-1; Mon, 06 Apr 2020 21:07:35 -0400
X-MC-Unique: pCUv-DThPZWrscY_WMtZuA-1
Received: by mail-wr1-f72.google.com with SMTP id m15so870857wrb.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=hPJLSOOe0G/6MVtQc/wU37zCLqI84WHp9DX2GrsmaYZOySaq1GrmzktcoRTCJoDQlA
 LnfPRL+LYkdwsVR3uHrzc4d/wgkn3YZtVDeSK2He3usJ0cB+J7cneGfjHsal4oXwUVMN
 58r6ptCPQbK1zz4gzftkvmaO7/1PIAIJKwiJ8ZGzUxj4dCCqnVOIKW9Tjo0+g1aTGCGt
 wgBtMI9/S3PgHQxyjvGqMR27EUXgy6EFPQpnw51ih41nz5I0V4RaHTxqwTy6QndxrhDO
 9KV2TraCRAHQAFxQ+tC/tJm2mG6e8q6sopmyL90Enzsu6OUt4vSUwW2TTSBpQEWryELR
 LVbw==
X-Gm-Message-State: AGi0PuanUH//inphkcP7PnNkN2Ryl3UYkOVAjjvrw31PPrdo441ikuDZ
 ieH6OGj7HoILVn/lbrVVakD9m1XxJWW7c3XfT4+1CvHOyuRt+Fv/dYoCZlnCKF5YEYJAQB7V/bS
 6X19/aTVRkp5ZH6IyQklZQ5VZFmJ6rvXXcXxKh7RLVw==
X-Received: by 2002:a1c:2842:: with SMTP id o63mr1697293wmo.73.1586221654166; 
 Mon, 06 Apr 2020 18:07:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypIxuMMzBcs/LvUTLzcWLGFp2EnijdskDTwCLcN2NKwovn4HRWiTvfYCo9g/8VdEVNOsiDnXLg==
X-Received: by 2002:a1c:2842:: with SMTP id o63mr1697272wmo.73.1586221653949; 
 Mon, 06 Apr 2020 18:07:33 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id y22sm105023wma.18.2020.04.06.18.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:07:33 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:07:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 03/19] tools/virtio: define __KERNEL__
Message-ID: <20200407010700.446571-4-mst@redhat.com>
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
