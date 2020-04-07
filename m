Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 601881A0448
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 03:16:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2207C84F76;
	Tue,  7 Apr 2020 01:16:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RpEAqFz8t1KZ; Tue,  7 Apr 2020 01:16:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B5568850ED;
	Tue,  7 Apr 2020 01:16:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0CADC0177;
	Tue,  7 Apr 2020 01:16:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5282AC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4F085823EE
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tzG0an79wZuI
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id C13598233E
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 01:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586222208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cpBCN9COwU5b1SJmxmkerQbIPy9Gv4aGbfqwyHnqUyE=;
 b=Ga1WPGqAyrZjAkdDu9C5i3pOECZAXxLMm7GoMkMsYgXI7ltPuC2nCwofQKMpb5+4Fjk9Ti
 AEZrBGwX8e5HqyToNNp0EcYKaIeX9zm1MZSvGID/Kt5569Gv08lKs5Dvi7jo6jMJVyzggH
 /lpXqIPgvRPvshHMUqgf1AkqmXMT5pE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-qAnYJcziNm6qsN-lmQNe0w-1; Mon, 06 Apr 2020 21:16:47 -0400
X-MC-Unique: qAnYJcziNm6qsN-lmQNe0w-1
Received: by mail-wm1-f69.google.com with SMTP id o26so45688wmh.1
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Apr 2020 18:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cpBCN9COwU5b1SJmxmkerQbIPy9Gv4aGbfqwyHnqUyE=;
 b=iC08qHdj+Vvxd+A0/bqDb6oyG3kSwDhVj39Al0mUSgYQT/nJfQEDQ+ON+5Z0jwsAFM
 pziUKOFimhvzuhVccgk6/9XA2YJmyfp+oMPARpOVehhH5gzO1pfavLnQ1aWFbUu4DzIm
 OeN5WcK0kgUTwNsIARdG6zjKN2ecZ6zPjwZ2q2vZwWHoVw+AKHZU0aNqMjpJcmFzqTmX
 0lWgTzh2FudQ/3m1DBhn9m964Fp4fmLVDiyUBU9a103dMarRHAmQB3UjlX2akhxE/Zm4
 nWdAcNWhfak4hnTsmuw/72pA2T+7TFGHr6lOhn5TpChA5/ywEXyT5+vbuB2+cRyr/tbl
 1owA==
X-Gm-Message-State: AGi0PuYGXo9JuJCuU3t9FFyT4nedxQHv/8Wc9azusN5OgDdLLUP7BfdZ
 aWXB2EYyXfG2l88fRz+kU1UUk6BAj8RdbAmR0DLe9lvYULxErmTU7ab+RjjIhaklydZnicRlmze
 ZiAEu6yYqY8cldDo+WB4iw++OL0rPfS+88zZu0R+pvQ==
X-Received: by 2002:a05:600c:20c6:: with SMTP id
 y6mr673322wmm.131.1586222206034; 
 Mon, 06 Apr 2020 18:16:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypKsYIs3Qr5PkXmap2E0hCjkxv5++0RLSpqWIlZfkMmuv1j2DVhSfHZ98voqjkQnNwsmVYs5Tg==
X-Received: by 2002:a05:600c:20c6:: with SMTP id
 y6mr673314wmm.131.1586222205877; 
 Mon, 06 Apr 2020 18:16:45 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
 by smtp.gmail.com with ESMTPSA id s66sm98326wme.40.2020.04.06.18.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Apr 2020 18:16:45 -0700 (PDT)
Date: Mon, 6 Apr 2020 21:16:44 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v8 08/19] virtio_input: pull in slab.h
Message-ID: <20200407011612.478226-9-mst@redhat.com>
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

In preparation to virtio header changes, include slab.h directly as
this module is using it.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_input.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index 5ae529671b3d..efaf65b0f42d 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -3,6 +3,7 @@
 #include <linux/virtio.h>
 #include <linux/virtio_config.h>
 #include <linux/input.h>
+#include <linux/slab.h>
 
 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
