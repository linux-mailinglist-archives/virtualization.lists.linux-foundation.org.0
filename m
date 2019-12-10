Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A534511855B
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 11:43:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D9848558A;
	Tue, 10 Dec 2019 10:43:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id di0RlKtqvd7K; Tue, 10 Dec 2019 10:43:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 380B285C05;
	Tue, 10 Dec 2019 10:43:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 155C9C0881;
	Tue, 10 Dec 2019 10:43:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94DC1C1796
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7EB6222176
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dA9Bh-385c8s
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id AE42F220D0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575974600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QeLkFWwrMkorI96amP0PUDWveJeOajJe9WkJWUSYsG8=;
 b=TOYJmSTuD9eHVWARs8Vsgqm7UW/CP76JfBHmyqERWNeeAHyIP051fyqEeJT10NlUPyyqwB
 HnVtvlaM5Rv5B56sX54oNFaGKLZNE1A3OQ4TYV0ts2tv9tvakQLX2rpfssL1TqtZaijjsO
 dUYfgBJdxkcGGB0UyQJxJOXjc2VDM48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-T8h34d17OraQX2hFRsHDTg-1; Tue, 10 Dec 2019 05:43:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68AAD800D5E;
 Tue, 10 Dec 2019 10:43:15 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65FAE60568;
 Tue, 10 Dec 2019 10:43:13 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org,
	davem@davemloft.net
Subject: [PATCH net-next v2 1/6] vsock/virtio_transport_common: remove unused
 virtio header includes
Date: Tue, 10 Dec 2019 11:43:02 +0100
Message-Id: <20191210104307.89346-2-sgarzare@redhat.com>
In-Reply-To: <20191210104307.89346-1-sgarzare@redhat.com>
References: <20191210104307.89346-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: T8h34d17OraQX2hFRsHDTg-1
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
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

We can remove virtio header includes, because virtio_transport_common
doesn't use virtio API, but provides common functions to interface
virtio/vhost transports with the af_vsock core, and to handle
the protocol.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport_common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index e5ea29c6bca7..0e20b0f6eb65 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -11,9 +11,6 @@
 #include <linux/sched/signal.h>
 #include <linux/ctype.h>
 #include <linux/list.h>
-#include <linux/virtio.h>
-#include <linux/virtio_ids.h>
-#include <linux/virtio_config.h>
 #include <linux/virtio_vsock.h>
 #include <uapi/linux/vsockmon.h>
 
-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
