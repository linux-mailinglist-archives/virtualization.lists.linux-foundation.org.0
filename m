Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7351F375C
	for <lists.virtualization@lfdr.de>; Tue,  9 Jun 2020 11:55:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4266A886C3;
	Tue,  9 Jun 2020 09:55:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1XwTzGf4-Hah; Tue,  9 Jun 2020 09:55:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C168B886BB;
	Tue,  9 Jun 2020 09:55:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A894AC016F;
	Tue,  9 Jun 2020 09:55:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AC5F1C016F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 950B1886C3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:55:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5sGp1HrKmdIv
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:55:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E0B23886BB
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Jun 2020 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591696499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=4uQuFZE858ZtA1kxzlQrkbfz4UDM1Xi81yVG0teJSpc=;
 b=fhdNibbVykWH6CZReVgtTXcHOKJ9bHRwxmOuzv0WGKH9XZYGLrg+onnPHNUIs/lmUBgbgE
 2DPONsv8b3XpLZJyoRPyKinAt9SofC+3/WEJcEhv9ykqcKadLgMfSlM409mFb05Q67XNb3
 IGwFDsjDbk8ukuuIikAPMoSjtV6LuFc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-81-1zAy6A5kMCu3Q_IB0Tedfg-1; Tue, 09 Jun 2020 05:54:57 -0400
X-MC-Unique: 1zAy6A5kMCu3Q_IB0Tedfg-1
Received: by mail-wr1-f72.google.com with SMTP id w16so8372242wru.18
 for <virtualization@lists.linux-foundation.org>;
 Tue, 09 Jun 2020 02:54:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=4uQuFZE858ZtA1kxzlQrkbfz4UDM1Xi81yVG0teJSpc=;
 b=anlhESsogtiwmPRkR6XIjKgSkDtag1Rqze6gM/2QP6ZP/pWdNgvCIKWuKwF0fasRRr
 IZ4RwrpyUsMRZyfnXfdrAKUPGYBwlnqUIONT1wMyanRjlqAXYgSgkx5KjQHRcMfMfjYG
 b4Io8PWnM/mENbeAkUOJBSToVUmEQYCiE0P4zKaA7pjuxRAqZWOXxAxThml4bOzbErnS
 DafQNLZf9ohRlpWfilsQfjq9LQz9hjswrZwG0oYgFt+JTriNHbcQiLtJAtRvXnPzaZfB
 gWdI5+9M6hpAnYkubSASWfOCa1ffQFF2jmTmUKdCwGu/wRAEowZrN9tNyA22/l7kWlbF
 zDSQ==
X-Gm-Message-State: AOAM530SQlIT8a0B02aAAsxK9iX7D7hIKpptqAZZwFpXjwGafurzceGw
 3PIA5lue7khid70ZQKPIYnZom0y/5fQquwOHkLCwYSi3p4zOS8X7thu8Wqet9BYxT+q7K7xV6U+
 Ude1oqyfw7usJtMitEVvY0e4I4mO7mrm8PoPIKizJgQ==
X-Received: by 2002:adf:f552:: with SMTP id j18mr3307190wrp.279.1591696496853; 
 Tue, 09 Jun 2020 02:54:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCbImdPZKhsgwExIy/WRmfb9dy+Hxq4t3PJbaH5t/zLpLqfOCP8FZP3A9tvZhzrBR8Z4U76w==
X-Received: by 2002:adf:f552:: with SMTP id j18mr3307186wrp.279.1591696496718; 
 Tue, 09 Jun 2020 02:54:56 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id x186sm2380539wmg.8.2020.06.09.02.54.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 02:54:56 -0700 (PDT)
Date: Tue, 9 Jun 2020 05:54:55 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] virtio_mem: fix printk format
Message-ID: <20200609095453.865827-1-mst@redhat.com>
MIME-Version: 1.0
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

Fixes: 676fa9ba893e ("virtio_mem: convert device block size into 64bit")
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 7b1bece8a331..50c689f25045 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1717,8 +1717,8 @@ static int virtio_mem_init(struct virtio_mem *vm)
 		 (unsigned long long)vm->device_block_size);
 	dev_info(&vm->vdev->dev, "memory block size: 0x%lx",
 		 memory_block_size_bytes());
-	dev_info(&vm->vdev->dev, "subblock size: 0x%x",
-		 vm->subblock_size);
+	dev_info(&vm->vdev->dev, "subblock size: 0x%llx",
+		 (unsigned long long)vm->subblock_size);
 	if (vm->nid != NUMA_NO_NODE)
 		dev_info(&vm->vdev->dev, "nid: %d", vm->nid);
 
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
