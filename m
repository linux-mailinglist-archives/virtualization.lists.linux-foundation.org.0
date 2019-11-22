Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BDD1069D0
	for <lists.virtualization@lfdr.de>; Fri, 22 Nov 2019 11:20:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E8D468733F;
	Fri, 22 Nov 2019 10:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3BHPMcfkCIf; Fri, 22 Nov 2019 10:20:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 820E187200;
	Fri, 22 Nov 2019 10:20:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5039DC18DA;
	Fri, 22 Nov 2019 10:20:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 501D6C18DA
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 38160880CB
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:20:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ed-eQKTWrEzU
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:20:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E9A0A87E7D
 for <virtualization@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574418023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZWq3HtktWgJiFGS3sKMs6SJfF4IhV0hkiIXQfhIWWkw=;
 b=ABeki+SiYm+oP9XUe8/M+uq9C52JcoEYO66iidJsvBDesu4J+XYxo82O0yAG5wo1x77KW4
 d5qjnpgi96T1mlJvk+E61gq4vMHCyXvOIitVRuWRcrBoxnFsKqBotpocUolmQFH85U2890
 D90LAeyvwWH3u7l2+QFfI/fuyoiCQU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-t6X-cLIQOaisNykJdAq6Fw-1; Fri, 22 Nov 2019 05:20:19 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93475107ACC4;
 Fri, 22 Nov 2019 10:20:18 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-116.ams2.redhat.com
 [10.36.117.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A10014145;
 Fri, 22 Nov 2019 10:20:11 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH] MAINTAINERS: Add myself as maintainer of virtio-vsock
Date: Fri, 22 Nov 2019 11:20:10 +0100
Message-Id: <20191122102010.14346-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: t6X-cLIQOaisNykJdAq6Fw-1
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

Since I'm actively working on vsock and virtio/vhost transports,
Stefan suggested to help him to maintain it.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 993d4e1d4974..077c4ba438cb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17212,6 +17212,7 @@ F:	virt/lib/
 
 VIRTIO AND VHOST VSOCK DRIVER
 M:	Stefan Hajnoczi <stefanha@redhat.com>
+M:	Stefano Garzarella <sgarzare@redhat.com>
 L:	kvm@vger.kernel.org
 L:	virtualization@lists.linux-foundation.org
 L:	netdev@vger.kernel.org
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
