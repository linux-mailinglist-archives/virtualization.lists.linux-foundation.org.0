Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F263374AF
	for <lists.virtualization@lfdr.de>; Thu, 11 Mar 2021 14:53:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83B954EC53;
	Thu, 11 Mar 2021 13:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ctzf6noI8-Qx; Thu, 11 Mar 2021 13:53:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38E9A4D7A3;
	Thu, 11 Mar 2021 13:53:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD655C0001;
	Thu, 11 Mar 2021 13:53:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3833C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0696431D0
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ddRMQCQnMcT
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0954C43022
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 13:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615470790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fU0jQeEMLvNYK1r/S5O2kpHjVv1Rt/n95eYPSXJ6zNc=;
 b=TrY285NsEEDtUEhBSyDxxILPBkdzEkekv+kaa+EK0ZDYzEpwXt7fpbmkhKAw0MB1OqjXaM
 QldTxXIYtV7U8fsJEpYq+WEzsavPKUNiKh5BOrAbT+XjhdyGZcIb2z5MD8bKTdGNOvlB36
 mWmHxR6B5T3WXHcF9bXLYZcMAbnFxQA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-VpN4r4CWMkiQ9mULivpb2w-1; Thu, 11 Mar 2021 08:53:07 -0500
X-MC-Unique: VpN4r4CWMkiQ9mULivpb2w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1A3B83DBE2;
 Thu, 11 Mar 2021 13:53:05 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-146.ams2.redhat.com
 [10.36.113.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 213AF196E3;
 Thu, 11 Mar 2021 13:53:03 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH 1/2] vhost-vdpa: fix use-after-free of v->config_ctx
Date: Thu, 11 Mar 2021 14:52:56 +0100
Message-Id: <20210311135257.109460-2-sgarzare@redhat.com>
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

When the 'v->config_ctx' eventfd_ctx reference is released we didn't
set it to NULL. So if the same character device (e.g. /dev/vhost-vdpa-0)
is re-opened, the 'v->config_ctx' is invalid and calling again
vhost_vdpa_config_put() causes use-after-free issues like the
following refcount_t underflow:

    refcount_t: underflow; use-after-free.
    WARNING: CPU: 2 PID: 872 at lib/refcount.c:28 refcount_warn_saturate+0xae/0xf0
    RIP: 0010:refcount_warn_saturate+0xae/0xf0
    Call Trace:
     eventfd_ctx_put+0x5b/0x70
     vhost_vdpa_release+0xcd/0x150 [vhost_vdpa]
     __fput+0x8e/0x240
     ____fput+0xe/0x10
     task_work_run+0x66/0xa0
     exit_to_user_mode_prepare+0x118/0x120
     syscall_exit_to_user_mode+0x21/0x50
     ? __x64_sys_close+0x12/0x40
     do_syscall_64+0x45/0x50
     entry_SYSCALL_64_after_hwframe+0x44/0xae

Fixes: 776f395004d8 ("vhost_vdpa: Support config interrupt in vdpa")
Cc: lingshan.zhu@intel.com
Cc: stable@vger.kernel.org
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 drivers/vhost/vdpa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index ef688c8c0e0e..00796e4ecfdf 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -308,8 +308,10 @@ static long vhost_vdpa_get_vring_num(struct vhost_vdpa *v, u16 __user *argp)
 
 static void vhost_vdpa_config_put(struct vhost_vdpa *v)
 {
-	if (v->config_ctx)
+	if (v->config_ctx) {
 		eventfd_ctx_put(v->config_ctx);
+		v->config_ctx = NULL;
+	}
 }
 
 static long vhost_vdpa_set_config_call(struct vhost_vdpa *v, u32 __user *argp)
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
