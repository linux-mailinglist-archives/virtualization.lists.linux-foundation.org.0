Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 450463374B0
	for <lists.virtualization@lfdr.de>; Thu, 11 Mar 2021 14:53:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D59E5431D7;
	Thu, 11 Mar 2021 13:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id smsM-408yVNC; Thu, 11 Mar 2021 13:53:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id A526C431E8;
	Thu, 11 Mar 2021 13:53:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A667C0012;
	Thu, 11 Mar 2021 13:53:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C2BAC0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67FA3431D0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peKYSoUoVqjC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C46D6431D6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615470793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/SLu3G915tlJOckjof4gpfwcAaXUH6EnQojMQamSVhA=;
 b=aZSI5Gy49Y8nSBSET6/xsYyfhlhi0LGq+LyfoALSHHpts5+EMBCBAOaWhrbZKQG/Iyc6WG
 l6gO5OjkZpln531fglUWQujsqVOMl6xhR0b1iTqJkG0zRK0OJyoj6jvdgIVKcDyttUjgrN
 fIYdsBUyfExRKlO454n5VIWCl/1wY/g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-2UF2uV0rPn6GuFfzEiwXzw-1; Thu, 11 Mar 2021 08:53:09 -0500
X-MC-Unique: 2UF2uV0rPn6GuFfzEiwXzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAE518030DB;
 Thu, 11 Mar 2021 13:53:07 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-146.ams2.redhat.com
 [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D923196E3;
 Thu, 11 Mar 2021 13:53:06 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 2/2] vhost-vdpa: set v->config_ctx to NULL if
 eventfd_ctx_fdget() fails
Date: Thu, 11 Mar 2021 14:52:57 +0100
Message-Id: <20210311135257.109460-3-sgarzare@redhat.com>
In-Reply-To: <20210311135257.109460-1-sgarzare@redhat.com>
References: <20210311135257.109460-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Zhu Lingshan <lingshan.zhu@intel.com>
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

In vhost_vdpa_set_config_call() if eventfd_ctx_fdget() fails the
'v->config_ctx' contains an error instead of a valid pointer.

Since we consider 'v->config_ctx' valid if it is not NULL, we should
set it to NULL in this case to avoid to use an invalid pointer in
other functions such as vhost_vdpa_config_put().

Fixes: 776f395004d8 ("vhost_vdpa: Support config interrupt in vdpa")
Cc: lingshan.zhu@intel.com
Cc: stable@vger.kernel.org
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vdpa.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index 00796e4ecfdf..f9ecdce5468a 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -331,8 +331,12 @@ static long vhost_vdpa_set_config_call(struct vhost_vdpa *v, u32 __user *argp)
 	if (!IS_ERR_OR_NULL(ctx))
 		eventfd_ctx_put(ctx);
 
-	if (IS_ERR(v->config_ctx))
-		return PTR_ERR(v->config_ctx);
+	if (IS_ERR(v->config_ctx)) {
+		long ret = PTR_ERR(v->config_ctx);
+
+		v->config_ctx = NULL;
+		return ret;
+	}
 
 	v->vdpa->config->set_config_cb(v->vdpa, &cb);
 
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
