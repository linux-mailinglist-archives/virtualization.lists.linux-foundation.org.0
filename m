Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A83BB153FB4
	for <lists.virtualization@lfdr.de>; Thu,  6 Feb 2020 09:01:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5E5E284506;
	Thu,  6 Feb 2020 08:01:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ijOsXgL5DLQl; Thu,  6 Feb 2020 08:01:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AD7B385B25;
	Thu,  6 Feb 2020 08:01:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7ABA2C1D87;
	Thu,  6 Feb 2020 08:01:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C13B5C013E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ACC828485E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MhsRP5PJ5Tz4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:01:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2A82D84506
 for <virtualization@lists.linux-foundation.org>;
 Thu,  6 Feb 2020 08:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580976095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=3tlkCnjb8Q/VM9TgB9qGpS6MVMK6ymwvGChTp9CUmG0=;
 b=ipAhYCmDSN0UBlMX5cPDdJrir+4BZywU9dOZGedArSGiYk4Soh0sdy1SUtG2YR1P8cuy1c
 6qtQ/tswqqmmAfEhpOu4zuMwHTPjHOdFvyk0zjr/oYqYvpc6tBT1JvK8kprm0SenksyMWf
 dAF3CUzZpNqkWx5Aw8RF6BDX8acLYOY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-X4S56hDOMw-kidONMKDJ4A-1; Thu, 06 Feb 2020 03:01:34 -0500
Received: by mail-qt1-f197.google.com with SMTP id p12so3284829qtu.6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 00:01:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=3tlkCnjb8Q/VM9TgB9qGpS6MVMK6ymwvGChTp9CUmG0=;
 b=s2dlPAIxSfjORol5dgNwZ4f6JlojI7wS4RUlwYDHx2Eq3c9ZA1Rp0WZhCbgFmBl+V1
 tgK+wDeePUTkYydOntBNKOahrqJqopCSyXuxlxqK3v4mkLNgn7XsP6NZE2uE9tWpdtK+
 UwJN5gmHweOhHs8JQs6HxutTBAfGCt6+oxnAHtCP+4eyNo+r/2lnHYluljHSnE02ChfJ
 DiieS5vrd8Z9od87kSqf+Q5Uc6tx+Rcq2kxQgRNp9oc/xdv8KJPrqA3W5xyWLs2qkHl/
 tI+7oW2Q8/VyitO2ouAIQEBPJden8TbNpgMWMq5VhqGu2aT6bGzUyKZrfaHFLvzy2VbO
 qVPA==
X-Gm-Message-State: APjAAAWMdZI0HDVHNjZC8CL1kB2ONaqCNqhAgYIUHdKi00S6ZoDhuciU
 +zxW5DZF7ck9onFGD39niatO922jpjalqZdG7AhLlKBYAqd8512PJ0a307X4Wj76kkue6EEJtuu
 /wfNdZ6tFuS9G0Pbqic3vl9Cww5B5Eril7WEuad7nYw==
X-Received: by 2002:a0c:fe8d:: with SMTP id d13mr1308098qvs.217.1580976093801; 
 Thu, 06 Feb 2020 00:01:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqzDBfxSmanieDzWEXWVdX/CjC3Q/5KbnOAyJYXWTLuPb+oEDUAw9pAoLQDK+qxgWVtcbdYfBw==
X-Received: by 2002:a0c:fe8d:: with SMTP id d13mr1308083qvs.217.1580976093498; 
 Thu, 06 Feb 2020 00:01:33 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id m16sm1025713qka.8.2020.02.06.00.01.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 00:01:32 -0800 (PST)
Date: Thu, 6 Feb 2020 03:01:30 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] tools/virtio: option to build an out of tree module
Message-ID: <20200206080125.1178242-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: X4S56hDOMw-kidONMKDJ4A-1
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

Handy for testing with distro kernels.
Warn that the resulting module is completely unsupported,
and isn't intended for production use.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tools/virtio/Makefile | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tools/virtio/Makefile b/tools/virtio/Makefile
index 8e2a908115c2..94106cde49e3 100644
--- a/tools/virtio/Makefile
+++ b/tools/virtio/Makefile
@@ -8,7 +8,18 @@ CFLAGS += -g -O2 -Werror -Wall -I. -I../include/ -I ../../usr/include/ -Wno-poin
 vpath %.c ../../drivers/virtio ../../drivers/vhost
 mod:
 	${MAKE} -C `pwd`/../.. M=`pwd`/vhost_test V=${V}
-.PHONY: all test mod clean
+
+#oot: build vhost as an out of tree module for a distro kernel
+#no effort is taken to make it actually build or work, but tends to mostly work
+#if the distro kernel is very close to upstream
+#unsupported! this is a development tool only, don't use the
+#resulting modules in production!
+oot:
+	echo "UNSUPPORTED! Don't use the resulting modules in production!"
+	KCFLAGS="-I "`pwd`/../../drivers/vhost ${MAKE} -C /usr/src/kernels/$$(uname -r) M=`pwd`/vhost_test V=${V}
+	KCFLAGS="-I "`pwd`/../../drivers/vhost ${MAKE} -C /usr/src/kernels/$$(uname -r) M=`pwd`/../../drivers/vhost V=${V} CONFIG_VHOST_VSOCK=n
+
+.PHONY: all test mod clean vhost oot
 clean:
 	${RM} *.o vringh_test virtio_test vhost_test/*.o vhost_test/.*.cmd \
               vhost_test/Module.symvers vhost_test/modules.order *.d
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
