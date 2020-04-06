Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 642371A0030
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:34:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0D6EE87AB1;
	Mon,  6 Apr 2020 21:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zImpWYC8NTAd; Mon,  6 Apr 2020 21:34:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A520F87B05;
	Mon,  6 Apr 2020 21:34:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B5BEC0177;
	Mon,  6 Apr 2020 21:34:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C985CC0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id ACA1D20486
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tU8smCaDS7Jt
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 01AF620033
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=dmgQBn4sbk2r/Jqp9spWDO3qFx7op0Qw1eaPRxlzJzP8a/+ksjvI1eVFiF3PiFqUCRcWc2
 nqsyyMT9nqe15hI8M5MWmqkTZLxc/doXwuQlp0XPhrLFu5wy7kPGb+SB65eeLijWNXxPUk
 5+FK3RFRAMn+/klj9GFUV+f5uStXiz8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-HiCot8JPOKCVhUI_ipH-9w-1; Mon, 06 Apr 2020 17:34:34 -0400
X-MC-Unique: HiCot8JPOKCVhUI_ipH-9w-1
Received: by mail-wr1-f72.google.com with SMTP id 91so587394wro.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=TyXiXx2sXBsCggA9zLbUunsy2XgDC2h6iU4JnGyKPRLL/QHz8DKPrf0dBYnA9rYVJ4
 +qEqMFG9eTt3qPpdaY2BSw5hfnJE9K04jPo5RCjwyRwiVUZP7eyqfJe825e0tjJqBE00
 UyFpDXg2ytamd6BWbksDdoIxn4/FmuuioPWtNcWMn7A9CPMAgVdA2HeFaACWaqmYTAVb
 wILrwBapkNVXCqbSWZm0Gv6rIgRB2sDcDEzyDROBJO3NPqi3xD6Hb/rCxU57kZvAgys6
 PxUHUAP4QsPzmDB0hlHNWXKqbQ1F/ZMgXkH7SXM4drD6cDH4NDA/J6bbOv7GnxSZ7LC6
 VqRQ==
X-Gm-Message-State: AGi0PuYCCMQXWTS5zV+OS6/9AvX5TxJgdKD7u7vjeKCWr9+Ar1Nyqspg
 8rMoiOaPDsy3b/1etovOAMasLEd/2xp9+pmapa0bqWYxvsEQvxX/rZbO8WywnXVpZj34g5KPKlY
 oIHmYVwebWQ4Yl1v3vFUDlexUFZcEzv9TSbxbMRszag==
X-Received: by 2002:a7b:cbd2:: with SMTP id n18mr1068235wmi.74.1586208872982; 
 Mon, 06 Apr 2020 14:34:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypKsDLUhGQC/Tn+0qnGfmRAOsV6x9/Q1yC0yzxYjjrHjRbm6CASil7gnkQZHykkq9cDFgqyFnw==
X-Received: by 2002:a7b:cbd2:: with SMTP id n18mr1068219wmi.74.1586208872813; 
 Mon, 06 Apr 2020 14:34:32 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id f16sm992072wmc.37.2020.04.06.14.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:31 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:30 -0400
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
