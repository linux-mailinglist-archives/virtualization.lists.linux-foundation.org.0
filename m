Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D265A15530F
	for <lists.virtualization@lfdr.de>; Fri,  7 Feb 2020 08:35:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 901D3867A1;
	Fri,  7 Feb 2020 07:35:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9e4nJZHmPhvM; Fri,  7 Feb 2020 07:35:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D9405867C8;
	Fri,  7 Feb 2020 07:35:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CEA5FC013E;
	Fri,  7 Feb 2020 07:35:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17835C013E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 054A887D5E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xk0KPsNL+Lmu
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:35:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1F50687D57
 for <virtualization@lists.linux-foundation.org>;
 Fri,  7 Feb 2020 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581060908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=SKYdikAA+hgb/0T2Zklcmqt1kU5M2t66zJpHfvIrUeY=;
 b=HoZkADGoPfME+L23VXRFKKUcN3mQKfXaXmoXUBdnLMqfnJVUnENVvCmR05kW3El0MRfNB7
 boUIoxh0XHSofjttbUMBJv5LpK6XitUufIOLfqv6qgME6tKFk6IIldihChOAX024hNfaQJ
 KQp2RxEA/OCDvUKoxwy0rfw10Cv6xKM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-2uArzXXXM9SmYolGdbXMag-1; Fri, 07 Feb 2020 02:35:07 -0500
Received: by mail-qt1-f197.google.com with SMTP id o18so1094780qtt.19
 for <virtualization@lists.linux-foundation.org>;
 Thu, 06 Feb 2020 23:35:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=SKYdikAA+hgb/0T2Zklcmqt1kU5M2t66zJpHfvIrUeY=;
 b=m+m3Q4U2fYe0W8vh0t+1qRLQ1/JbHnRWWNXS+yPuVo7uUjwzuiHlxNxp/FdzdxysaM
 8ZOnLUSF3PGpBPTBxKaOFWE/NRuseSwD8qlfNYUw4v4faZ/2alxQRuWVgGWqpVzRmKGy
 5K/rvYeP+H/YNdSA65mRjRzXqGVCkORvgjBX7rXfMzRQPJuAkK6R2z3SzPYX5NmvsvOk
 ztiyUZZws1ihLNb29CoECJdkj1gi0ubbOfAXspC+F9508wVJRoo4SHOaPFFRj9NOfilK
 UT45zZsfBJvUjf10C4tqaikDxOwyYBxExYfEWWDyYhQQHQyChaLoFlMmdM7WCnK2uiKM
 udnw==
X-Gm-Message-State: APjAAAUQAZWBF7puwjDcYgUrBYtUKamUmXVTB2zar0Y4754sIO/a23xm
 cDgIC02b7UrlqywVANNuEybd5LHpHmb/kMAdqzHJ4F/bazs5e8z4LphLJeaJBZAhY1ZHgwNMumU
 7VkWqhuNY73ueF/c7qqPOKP6ycWb8b5dvkmeJwMJbrQ==
X-Received: by 2002:ac8:7607:: with SMTP id t7mr6135761qtq.51.1581060906349;
 Thu, 06 Feb 2020 23:35:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqxkY0S9VVJNL8wo6HngYhCdVY4p0ebnk5lOl5ttMEUPbpIfJZMY14kdE+ZHEy15vyZHaKEXgQ==
X-Received: by 2002:ac8:7607:: with SMTP id t7mr6135749qtq.51.1581060906060;
 Thu, 06 Feb 2020 23:35:06 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id k5sm895159qkk.117.2020.02.06.23.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 23:35:05 -0800 (PST)
Date: Fri, 7 Feb 2020 02:35:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] tools/virtio: option to build an out of tree module
Message-ID: <20200207073327.1205669-1-mst@redhat.com>
MIME-Version: 1.0
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
X-MC-Unique: 2uArzXXXM9SmYolGdbXMag-1
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

Usage:
        make oot # builds vhost_test.ko, vhost.ko
        make oot-clean # cleans out files created

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

changes from v1:
	lots of refactoring
	disable all modules except vhost by default (more of a chance
						     it'll build)
	oot-clean target

 tools/virtio/Makefile | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/virtio/Makefile b/tools/virtio/Makefile
index 8e2a908115c2..f33f32f1d208 100644
--- a/tools/virtio/Makefile
+++ b/tools/virtio/Makefile
@@ -8,7 +8,32 @@ CFLAGS += -g -O2 -Werror -Wall -I. -I../include/ -I ../../usr/include/ -Wno-poin
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
+OOT_KSRC=/lib/modules/$$(uname -r)/build
+OOT_VHOST=`pwd`/../../drivers/vhost
+#Everyone depends on vhost
+#Tweak the below to enable more modules
+OOT_CONFIGS=\
+	CONFIG_VHOST=m \
+	CONFIG_VHOST_NET=n \
+	CONFIG_VHOST_SCSI=n \
+	CONFIG_VHOST_VSOCK=n
+OOT_BUILD=KCFLAGS="-I "${OOT_VHOST} ${MAKE} -C ${OOT_KSRC} V=${V}
+oot-build:
+	echo "UNSUPPORTED! Don't use the resulting modules in production!"
+	${OOT_BUILD} M=`pwd`/vhost_test
+	${OOT_BUILD} M=${OOT_VHOST} ${OOT_CONFIGS}
+
+oot-clean: oot-build
+oot: oot-build
+oot-clean: OOT_BUILD+=clean
+
+.PHONY: all test mod clean vhost oot oot-clean oot-build
 clean:
 	${RM} *.o vringh_test virtio_test vhost_test/*.o vhost_test/.*.cmd \
               vhost_test/Module.symvers vhost_test/modules.order *.d
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
