Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 369A024151A
	for <lists.virtualization@lfdr.de>; Tue, 11 Aug 2020 04:57:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 534DF85B11;
	Tue, 11 Aug 2020 02:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rGekvMOoVWkW; Tue, 11 Aug 2020 02:57:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A4B9C85B9A;
	Tue, 11 Aug 2020 02:57:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DA95C004D;
	Tue, 11 Aug 2020 02:57:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1E88C004D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A65AD203A9
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvnSnNW+pBFC
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 80B8A2039B
 for <virtualization@lists.linux-foundation.org>;
 Tue, 11 Aug 2020 02:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597114643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gB1D7C4hvQqDFOcHKw0JNPnq0YeyU1fjAmMz+o7ISzU=;
 b=EhrBn9o4Vcu64CiDb7TLgPTe41PPmUaBQKjhsQ03auZCIjvt/2C9MXwHZCfxF2T/UpoL51
 Ya9YvxabSatfSNmEzpE50pCYs9uy0Fw934f/UZrPCTSTwo0I+xLJXzSYnWqrXSKcruhFKz
 DKOBZSkNZs8OzxnhmbyvWyy9M972Br8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-3uLo0afoNNalLgNZdUqtJQ-1; Mon, 10 Aug 2020 22:57:21 -0400
X-MC-Unique: 3uLo0afoNNalLgNZdUqtJQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32B1E57;
 Tue, 11 Aug 2020 02:57:20 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-186.pek2.redhat.com [10.72.13.186])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E3191A7CF;
 Tue, 11 Aug 2020 02:57:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com
Subject: [PATCH 2/2] vDPA: add Eli Cohen as mellanox vDPA driver supporter
Date: Tue, 11 Aug 2020 10:57:10 +0800
Message-Id: <20200811025710.7775-2-jasowang@redhat.com>
In-Reply-To: <20200811025710.7775-1-jasowang@redhat.com>
References: <20200811025710.7775-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Eli Cohen <eli@mellanox.com>
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

Cc: Eli Cohen <eli@mellanox.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 314398f0e276..ed1851413fcc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18186,6 +18186,12 @@ S:	Maintained
 F:	drivers/vdpa/
 F:	include/linux/vdpa.h
 
+MELLANOX VDPA DRIVERS
+M:	Eli Cohen <eli@mellanox.com>
+L:	virtualization@lists.linux-foundation.org
+S:	Supported
+F:	drivers/vdpa/mlx5/
+
 VIRTIO BALLOON
 M:	"Michael S. Tsirkin" <mst@redhat.com>
 M:	David Hildenbrand <david@redhat.com>
-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
