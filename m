Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id F161023CB27
	for <lists.virtualization@lfdr.de>; Wed,  5 Aug 2020 15:44:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A465188223;
	Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3oo9im4tii8t; Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 223098820B;
	Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 048E7C0051;
	Wed,  5 Aug 2020 13:44:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EFDD2C004C
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DC99A20401
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLjsyTfiYtkd
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 58CBC2152A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Aug 2020 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596635044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Cgzc7fKo8GoNarTDetAApPhaV9xAvssaIfGNymLUTzM=;
 b=c7CE5pwXkjoLBzIUOVmPE0iwre+3b/FPrxcvNPBQ63yz4VC/lSg7SX9UEAgx1r7rKDldQm
 Uxh6WeGlkMWvjTdeFmFw7jID/JKpZkTL8wIpCUdEbDyGymqFCJStNtxhW8VcedUsas6aIr
 +lVIyH759PMbwR4NZxn7Axu/7SkhI2Q=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-3bwFrZKbPeezNkj0md0-tA-1; Wed, 05 Aug 2020 09:44:00 -0400
X-MC-Unique: 3bwFrZKbPeezNkj0md0-tA-1
Received: by mail-wm1-f71.google.com with SMTP id g72so2472104wme.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Aug 2020 06:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Cgzc7fKo8GoNarTDetAApPhaV9xAvssaIfGNymLUTzM=;
 b=MitLke3OM1SVCuIRBfVZ9yCuhVAH7vrKEtpxXeHfZ0Nl1mED38Ssod9uywXy52fis7
 xseZF4GnGRhxY1BucAFNjD9JtiBZYSPvtJ3mSow8uNhRHqdCs+YUPwS/wXeHlNF4Tec8
 b3XYH7TBSoZTNiTc4Taf2aDRT3lCI8eL0rSN37LE6FYG1s5xWgMbRU8MRtKmGuATgueg
 db5rxYBkp6qIkDdGxOQkIao97tYL30MsRSx6MAobvTaz7RnZKFTAKmh1TDKIzOCa2F+y
 icVA41MSBiRX9BV6YJpNP0ijY/AGqqjCxHdvtvPDx5e5DvE0KX9ZXApxuaAKaaep/GCr
 9URA==
X-Gm-Message-State: AOAM5320fASvCBGLyhYBToO9uZajFfbVXQjmqnJkV+GlPmXKtaMzlZGt
 c2tGzmkmpBu/VOLu/MMgNeKtEPpt1NpmugtGqtI9En1KGEgzpu/pfgwkJbkoH6OUEKzt2WLN58N
 fhDBoEqBJXsOaTZlT5kc7sJpOOMO/+qeYxSMu/b2ZYg==
X-Received: by 2002:adf:f847:: with SMTP id d7mr2742205wrq.328.1596635039289; 
 Wed, 05 Aug 2020 06:43:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRqO12QcUwDk9o3YsfPdSGZy8iXhCreHkQXWrlBGFyjkXszT12U4qC7xxUD0DhWva5Aj2v4Q==
X-Received: by 2002:adf:f847:: with SMTP id d7mr2742192wrq.328.1596635039093; 
 Wed, 05 Aug 2020 06:43:59 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
 by smtp.gmail.com with ESMTPSA id p8sm3005021wrq.9.2020.08.05.06.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:43:58 -0700 (PDT)
Date: Wed, 5 Aug 2020 09:43:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/38] virtio_pmem: correct tags for config space fields
Message-ID: <20200805134226.1106164-16-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Cornelia Huck <cohuck@redhat.com>,
 virtualization@lists.linux-foundation.org
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
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
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
