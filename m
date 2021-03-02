Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 792B13297A4
	for <lists.virtualization@lfdr.de>; Tue,  2 Mar 2021 10:14:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B97BF83BA9;
	Tue,  2 Mar 2021 09:14:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lfMn7Mam6dfB; Tue,  2 Mar 2021 09:14:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2C1C83CF2;
	Tue,  2 Mar 2021 09:14:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34B67C0001;
	Tue,  2 Mar 2021 09:14:37 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 707F4C0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 09:14:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BC46069D
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 09:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iTG1q3MxnoOC
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 09:14:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA41D6065C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Mar 2021 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614676473;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc; bh=WYVZDzb7gHIYm3imGALkt41Cwtj1qA0Mv6difRe4t9U=;
 b=XhLeTgA7vUhVdWKHRbs0IY5gswglJJ9S12a80c+L1YASfHS3xKcs++1c2dvUxg85JTxXlJ
 LgDLoVlC+wC7LVehcRh70cRkS0TVmTIzMMl/2Px7n7WXZRNgqrN5WT7rDVATU/lKT7wlWn
 9ltO9UqBzuJYhYnB8C1PG9dRx6W/hVM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-mQrM1frOMlG3b2oYMD35iA-1; Tue, 02 Mar 2021 04:14:31 -0500
X-MC-Unique: mQrM1frOMlG3b2oYMD35iA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EB3D1005501;
 Tue,  2 Mar 2021 09:14:30 +0000 (UTC)
Received: from hp-dl380pg8-01.lab.eng.pek2.redhat.com
 (hp-dl380pg8-01.lab.eng.pek2.redhat.com [10.73.8.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2383D10016FA;
 Tue,  2 Mar 2021 09:14:20 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	kvm@vger.kernel.org
Subject: [PATCH] vhost-vdpa: honor CAP_IPC_LOCK
Date: Tue,  2 Mar 2021 04:14:18 -0500
Message-Id: <20210302091418.7226-1-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

When CAP_IPC_LOCK is set we should not check locked memory against
rlimit as what has been implemented in mlock().

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 drivers/vhost/vdpa.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index ef688c8c0e0e..e93572e2e344 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -638,7 +638,8 @@ static int vhost_vdpa_process_iotlb_update(struct vhost_vdpa *v,
 	mmap_read_lock(dev->mm);
 
 	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
-	if (npages + atomic64_read(&dev->mm->pinned_vm) > lock_limit) {
+	if (!capable(CAP_IPC_LOCK) &&
+	    (npages + atomic64_read(&dev->mm->pinned_vm) > lock_limit)) {
 		ret = -ENOMEM;
 		goto unlock;
 	}
-- 
2.18.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
