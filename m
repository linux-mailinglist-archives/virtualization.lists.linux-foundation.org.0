Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6821B4C7
	for <lists.virtualization@lfdr.de>; Fri, 10 Jul 2020 14:13:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 660D5898BB;
	Fri, 10 Jul 2020 12:13:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ieiHeFEl4SGg; Fri, 10 Jul 2020 12:13:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71418898EA;
	Fri, 10 Jul 2020 12:13:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59871C016F;
	Fri, 10 Jul 2020 12:13:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8C4CCC077B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 21CDB25B04
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:13:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVxw07RRs5Ue
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:12:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 63E6E23B44
 for <virtualization@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 12:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594383175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=m8g5K4VLg4BTneoyfPTMeQatQmDnDh/9EQUZe3BPx8E=;
 b=Gt6crJkwrnFfJ5q9etrC5hxZT7c/TN15B1uz2b1H2sijEcTXt3UwlNQIVgl4BIKrAsHo7c
 R3isRYtiZpCdO/i3SJv3+E9owJM4aU6FvXeAV6lziFYLg6OE7X99QtqJavyQZySzZFxpaX
 DLxK7GzbazEjJFUwYGvIg0xXrOuMwd0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-L0O2jgtJMHOaw7DzDpvHNQ-1; Fri, 10 Jul 2020 08:12:54 -0400
X-MC-Unique: L0O2jgtJMHOaw7DzDpvHNQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BBC0B102C7F1;
 Fri, 10 Jul 2020 12:12:52 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1E0A5C6C0;
 Fri, 10 Jul 2020 12:12:44 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH] vsock/virtio: annotate 'the_virtio_vsock' RCU pointer
Date: Fri, 10 Jul 2020 14:12:43 +0200
Message-Id: <20200710121243.120096-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>
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

Commit 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free
on the_virtio_vsock") starts to use RCU to protect 'the_virtio_vsock'
pointer, but we forgot to annotate it.

This patch adds the annotation to fix the following sparse errors:

    net/vmw_vsock/virtio_transport.c:73:17: error: incompatible types in comparison expression (different address spaces):
    net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock [noderef] __rcu *
    net/vmw_vsock/virtio_transport.c:73:17:    struct virtio_vsock *
    net/vmw_vsock/virtio_transport.c:171:17: error: incompatible types in comparison expression (different address spaces):
    net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock [noderef] __rcu *
    net/vmw_vsock/virtio_transport.c:171:17:    struct virtio_vsock *
    net/vmw_vsock/virtio_transport.c:207:17: error: incompatible types in comparison expression (different address spaces):
    net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock [noderef] __rcu *
    net/vmw_vsock/virtio_transport.c:207:17:    struct virtio_vsock *
    net/vmw_vsock/virtio_transport.c:561:13: error: incompatible types in comparison expression (different address spaces):
    net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock [noderef] __rcu *
    net/vmw_vsock/virtio_transport.c:561:13:    struct virtio_vsock *
    net/vmw_vsock/virtio_transport.c:612:9: error: incompatible types in comparison expression (different address spaces):
    net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock [noderef] __rcu *
    net/vmw_vsock/virtio_transport.c:612:9:    struct virtio_vsock *
    net/vmw_vsock/virtio_transport.c:631:9: error: incompatible types in comparison expression (different address spaces):
    net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock [noderef] __rcu *
    net/vmw_vsock/virtio_transport.c:631:9:    struct virtio_vsock *

Fixes: 0deab087b16a ("vsock/virtio: use RCU to avoid use-after-free on the_virtio_vsock")
Reported-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index dfbaf6bd8b1c..2700a63ab095 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -22,7 +22,7 @@
 #include <net/af_vsock.h>
 
 static struct workqueue_struct *virtio_vsock_workqueue;
-static struct virtio_vsock *the_virtio_vsock;
+static struct virtio_vsock __rcu *the_virtio_vsock;
 static DEFINE_MUTEX(the_virtio_vsock_mutex); /* protects the_virtio_vsock */
 
 struct virtio_vsock {
-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
