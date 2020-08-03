Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 659A523AE9B
	for <lists.virtualization@lfdr.de>; Mon,  3 Aug 2020 22:59:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2335B87A8D;
	Mon,  3 Aug 2020 20:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BOPm2WvJ9eLx; Mon,  3 Aug 2020 20:59:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B715187766;
	Mon,  3 Aug 2020 20:59:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC525C004C;
	Mon,  3 Aug 2020 20:59:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09F4EC004C
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F3F0D2051A
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNQcnG1Rk2Dm
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 18C60204FF
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596488389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1j0olsHvV0V6+MFf0hWmaE1+y5yyprKXDwwe6dxMow=;
 b=XmnTBV8tkWITxFHZVT9vEJgovxhZl07KfAXpkh0BUW7g09Z8yXq0vHzIP66/V8q2RWaXEi
 ygQ53Sa+YTUKKPCKv4Z6BdqWssGnwR4h4PbNGAX4pyCc0OG1WhfyM3AwR8WUdqosGg5Bjw
 K/6bmwbJIOPTxBP9ZzJJfP/+uo+lzCA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-cLhRGW8SMV-R66CVXx4APA-1; Mon, 03 Aug 2020 16:59:45 -0400
X-MC-Unique: cLhRGW8SMV-R66CVXx4APA-1
Received: by mail-qk1-f200.google.com with SMTP id c202so21216287qkg.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 Aug 2020 13:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=x1j0olsHvV0V6+MFf0hWmaE1+y5yyprKXDwwe6dxMow=;
 b=K1WCP4SrLRhAFYwehy3C5c1Kp5UO2Ygh3wh4SpCu+ksGkLXl4zCfkyCbk1JAQPOyz5
 wCdVNKYYxeDcqTpu+kQ2tVSAMrw63sYZ7v+XH6qQoA7vF1ssikFIbQ69SPTT2JiPEMMf
 zGKWPvxGn4iKly4q6iou2HGuwLysgF6DFrtFuj59J4QdcGlUsxN/GkG89C2H8MQp/W1g
 f/9ADqt34l3/KwbZYMSxg29bNa220WfudMc4OjZd0rjrpWuSpz3D9sQxRIGYXzZx/pZp
 U3Xw4qiGNFPlGUH/blRU54bz9bSlEkeUQ00c0I9VKmNvSVxp9M8vk2O+SiwxsMvOrvof
 OAzQ==
X-Gm-Message-State: AOAM53086oXvATElmoyOJLHP0Nd2YAPzgsEW36CtiPV4TrIuvN/z/ZaO
 OWITLSrlpfki263+t7z3t8sCJoYrL+CubYhq/6UM2XobGPnOyBGO35UannpHKU0FGjbOHYo7oSz
 HcJogS9Kb7PLGBwngJ1bgbbMBhccinbXvVZyygfRM2w==
X-Received: by 2002:a0c:9b96:: with SMTP id o22mr9972996qve.213.1596488385063; 
 Mon, 03 Aug 2020 13:59:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzH9dNDqsUYBKBCOi0Umn0NLw+eC0AYUWS9k8D6ClCP/hrTzlIAavyJN2TlvoS77wfyYVmamA==
X-Received: by 2002:a0c:9b96:: with SMTP id o22mr9972982qve.213.1596488384917; 
 Mon, 03 Aug 2020 13:59:44 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net.
 [79.177.102.128])
 by smtp.gmail.com with ESMTPSA id q13sm19880255qkn.85.2020.08.03.13.59.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 13:59:44 -0700 (PDT)
Date: Mon, 3 Aug 2020 16:59:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/24] virtio_pmem: correct tags for config space fields
Message-ID: <20200803205814.540410-16-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200803205814.540410-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
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

Since this is a modern-only device,
tag config space fields as having little endian-ness.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/uapi/linux/virtio_pmem.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/virtio_pmem.h b/include/uapi/linux/virtio_pmem.h
index b022787ffb94..d676b3620383 100644
--- a/include/uapi/linux/virtio_pmem.h
+++ b/include/uapi/linux/virtio_pmem.h
@@ -15,8 +15,8 @@
 #include <linux/virtio_config.h>
 
 struct virtio_pmem_config {
-	__u64 start;
-	__u64 size;
+	__le64 start;
+	__le64 size;
 };
 
 #define VIRTIO_PMEM_REQ_TYPE_FLUSH      0
-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
