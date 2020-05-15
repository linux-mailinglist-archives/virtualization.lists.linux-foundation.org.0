Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 540241D4AA0
	for <lists.virtualization@lfdr.de>; Fri, 15 May 2020 12:14:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F080320461;
	Fri, 15 May 2020 10:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdCiNr+ImeSt; Fri, 15 May 2020 10:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CCCA8267D6;
	Fri, 15 May 2020 10:14:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A8355C0178;
	Fri, 15 May 2020 10:14:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFFC1C016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:14:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AC7A987B99
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:14:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTihyRjNg4hL
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:14:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1AE3C87B83
 for <virtualization@lists.linux-foundation.org>;
 Fri, 15 May 2020 10:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589537665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lUc3PuOX813Luq3FUqNVTnGhB/o6E0eeOYPacW9Z1Gk=;
 b=Etbk/Aq/HDlE8LdSj/DGBgE0ypMARfAV9zNCAiCPvt3RZ0WtJN0sKz+iV0zaIZ2YSOALYa
 sweKMYLiSugGvhrIQHlrnIjEIBu5Va0khCAdOfhua92/sRO430mStfu04ADPtmdAZlDhVo
 eea14aUxpAdNGr+BzZPZdmVUBEis1x0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-t0_WzsGWPv2-7atizBRpXg-1; Fri, 15 May 2020 06:14:23 -0400
X-MC-Unique: t0_WzsGWPv2-7atizBRpXg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55031835B44;
 Fri, 15 May 2020 10:14:21 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-114-77.ams2.redhat.com [10.36.114.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA02360FB9;
 Fri, 15 May 2020 10:14:12 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/15] virtio-mem: Don't rely on implicit compiler padding
 for requests
Date: Fri, 15 May 2020 12:14:02 +0200
Message-Id: <20200515101402.16597-1-david@redhat.com>
In-Reply-To: <20200507140139.17083-1-david@redhat.com>
References: <20200507140139.17083-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: virtio-dev@lists.oasis-open.org, kvm@vger.kernel.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, teawater <teawaterz@linux.alibaba.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
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

The compiler will add padding after the last member, make that explicit.
The size of a request is always 24 bytes. The size of a response always
10 bytes. Add compile-time checks.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: teawater <teawaterz@linux.alibaba.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Something I noticed while working on the spec (which proves that writing a
virtio-spec makes sense :) ).

---
 drivers/virtio/virtio_mem.c     | 3 +++
 include/uapi/linux/virtio_mem.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 9e523db3bee1..f658fe9149be 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -1770,6 +1770,9 @@ static int virtio_mem_probe(struct virtio_device *vdev)
 	struct virtio_mem *vm;
 	int rc = -EINVAL;
 
+	BUILD_BUG_ON(sizeof(struct virtio_mem_req) != 24);
+	BUILD_BUG_ON(sizeof(struct virtio_mem_resp) != 10);
+
 	vdev->priv = vm = kzalloc(sizeof(*vm), GFP_KERNEL);
 	if (!vm)
 		return -ENOMEM;
diff --git a/include/uapi/linux/virtio_mem.h b/include/uapi/linux/virtio_mem.h
index e0a9dc7397c3..a455c488a995 100644
--- a/include/uapi/linux/virtio_mem.h
+++ b/include/uapi/linux/virtio_mem.h
@@ -103,16 +103,19 @@
 struct virtio_mem_req_plug {
 	__virtio64 addr;
 	__virtio16 nb_blocks;
+	__virtio16 padding[3];
 };
 
 struct virtio_mem_req_unplug {
 	__virtio64 addr;
 	__virtio16 nb_blocks;
+	__virtio16 padding[3];
 };
 
 struct virtio_mem_req_state {
 	__virtio64 addr;
 	__virtio16 nb_blocks;
+	__virtio16 padding[3];
 };
 
 struct virtio_mem_req {
-- 
2.25.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
