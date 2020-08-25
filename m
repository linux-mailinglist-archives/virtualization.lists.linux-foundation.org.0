Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC9D25192E
	for <lists.virtualization@lfdr.de>; Tue, 25 Aug 2020 15:06:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id EB12988177;
	Tue, 25 Aug 2020 13:05:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xDMRPuRojUPN; Tue, 25 Aug 2020 13:05:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 55AD288164;
	Tue, 25 Aug 2020 13:05:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2D9CBC0051;
	Tue, 25 Aug 2020 13:05:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AE3EC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 13:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 257698815D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 13:05:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QLTQ7AVNX7Z1
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 13:05:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 01D3F88152
 for <virtualization@lists.linux-foundation.org>;
 Tue, 25 Aug 2020 13:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598360754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=44/rFMQFZre8hi2KWPAM7jK3g3yR2EVE42MjQnT9WTk=;
 b=Oyk5MiKseWq+DvKUzd0orJ/lYCtEzdge0cHTIniboic3PyaYM1pJtmbSu3yVfPrqt2NLQo
 dNbo9gwn3p46f1Si1+6yoIBHYSpMfkA79Xr9K8UntUcOVcwwCRYoJXS7TvbqHOLlzEY74Z
 k1UIbb+i+PrYUJ3Q4A0wgYrmyBIwC78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-uof_C0V9OaSdF-Gh1snzxw-1; Tue, 25 Aug 2020 09:05:50 -0400
X-MC-Unique: uof_C0V9OaSdF-Gh1snzxw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21FBD84639C;
 Tue, 25 Aug 2020 13:05:49 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-152.ams2.redhat.com
 [10.36.113.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 053F960C0F;
 Tue, 25 Aug 2020 13:05:44 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] vhost-iotlb: fix vhost_iotlb_itree_next() documentation
Date: Tue, 25 Aug 2020 15:05:43 +0200
Message-Id: <20200825130543.43308-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

This patch contains trivial changes for the vhost_iotlb_itree_next()
documentation, fixing the function name and the description of
first argument (@map).

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/iotlb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/iotlb.c b/drivers/vhost/iotlb.c
index 1f0ca6e44410..34aec4ba331e 100644
--- a/drivers/vhost/iotlb.c
+++ b/drivers/vhost/iotlb.c
@@ -159,8 +159,8 @@ vhost_iotlb_itree_first(struct vhost_iotlb *iotlb, u64 start, u64 last)
 EXPORT_SYMBOL_GPL(vhost_iotlb_itree_first);
 
 /**
- * vhost_iotlb_itree_first - return the next overlapped range
- * @iotlb: the IOTLB
+ * vhost_iotlb_itree_next - return the next overlapped range
+ * @map: the starting map node
  * @start: start of IOVA range
  * @end: end of IOVA range
  */
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
