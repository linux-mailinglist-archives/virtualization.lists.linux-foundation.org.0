Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 017411A003B
	for <lists.virtualization@lfdr.de>; Mon,  6 Apr 2020 23:35:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A205187D36;
	Mon,  6 Apr 2020 21:35:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlnAk51WI85o; Mon,  6 Apr 2020 21:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 79CA487CBE;
	Mon,  6 Apr 2020 21:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 61F3EC0177;
	Mon,  6 Apr 2020 21:35:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E261C0177
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7AA6E86709
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2iIK8_qwuUG6
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C610186702
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Apr 2020 21:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586208902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=aELiRR02UCobAWlaRF/NxB45erRYqXisJ9NTXotPaG/H/18WSTvpY9XkgvTvfJJ1CgiDCM
 nJ8ZX+GDX/XDfVeQdRetRJVgwewp9mBsge7ixv0YI+Xc9jM+J1AmmZqFO8AhqulLyijysg
 uFL0AJSf2a5GPXhY7Nip4oYzhOjxKhs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-N2gFTf8OM3uT_5kMD1Qywg-1; Mon, 06 Apr 2020 17:35:01 -0400
X-MC-Unique: N2gFTf8OM3uT_5kMD1Qywg-1
Received: by mail-wr1-f69.google.com with SMTP id o10so577798wrj.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 14:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=avaeRkZ1JnKDUOT0Z2Dx4o4wqMo2IiZX1JaGDR9LW2A=;
 b=b5/gNkujHotpPjXPBC4GpJs4tyEgwrWArrk7USL1HWimQ6HfsjYS1gYml106UQJ9AX
 tWay3/BRrwnVW+gcEC0E0UCTHMoxMeX5HdCKviCGTaa6qwJjOVCJmJifqZhcs7AJFKBS
 MF8N13VtPFFhhF5EC2B7t5kPi7UTzSNP6T/TilCMkC/FC0k/1taFJraK2/ThDTjQ/BoB
 B0EmB4ZLrwlxD5dvxIuuHJWWALDTGEKH8MBLdAojiNc9tc6QPqZ55xHbaViLcmysvdmR
 CudZcCGtYOJ+zOLr59NdfOi+BIAOXyC57BK/+ctuIDrrhhZSWJQTsmDp6jUvad2Z54lO
 Mp0g==
X-Gm-Message-State: AGi0PubFlgnzHfW/dh0PwSj4GN2ImXCuK3VUWn9Hbx5I8NODii/yr0Eu
 KYxud7HGPlb9TOn80BX9HncsVVcWwRQRFWSKBmRBvKlRh+O0c9J24RgBersIpOrxBI+3rqPGJaI
 cAKI2mROFFoe6yN3zxqC2qAkWZgn9HKGx4JGbxB2qQA==
X-Received: by 2002:a7b:cd8c:: with SMTP id y12mr1480030wmj.106.1586208900157; 
 Mon, 06 Apr 2020 14:35:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypJxwNpdhgwvijcmYFwK7AjslG9GMzpweTVcwoOVdgae0Vm3Q9It7NJ0w/b7TaK+8UFDmgykOw==
X-Received: by 2002:a7b:cd8c:: with SMTP id y12mr1480011wmj.106.1586208899943; 
 Mon, 06 Apr 2020 14:34:59 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id j11sm1043727wmi.33.2020.04.06.14.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 14:34:59 -0700 (PDT)
Date: Mon, 6 Apr 2020 17:34:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 03/12] tools/virtio: define __KERNEL__
Message-ID: <20200406213314.248038-4-mst@redhat.com>
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
