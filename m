Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E3F30F981
	for <lists.virtualization@lfdr.de>; Thu,  4 Feb 2021 18:24:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 297C880790;
	Thu,  4 Feb 2021 17:24:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VmdhA1AW6Kt; Thu,  4 Feb 2021 17:23:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D5AF185CCF;
	Thu,  4 Feb 2021 17:23:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9ECC5C1834;
	Thu,  4 Feb 2021 17:23:51 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 00171C013A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id ECA9485B9D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PvO0kqfu1fBP
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6C5A486D2E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  4 Feb 2021 17:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612459406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EUo8I0b7AavPlrPtY5OvFdMytOb4QXrFAY18JZE4vd8=;
 b=bMMv7E6qHixdkR8Ewjfy86srkV17ECQeBmNqNSw6MHYqyTS8Jqw4BvUErlzPCcgTD+GyoC
 y51cCsKcAfhK56PLut1FXK/mu9Vl3eyeLk3gHPKLSOZmLRvLmy4HmfFjnUydK69PiOtpyo
 8/Pw/3oPv8LP6O4X0a+ugrN4wiqMZVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-eRlPKZeLMvCbkQ8zwhNgmg-1; Thu, 04 Feb 2021 12:23:23 -0500
X-MC-Unique: eRlPKZeLMvCbkQ8zwhNgmg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF116100C611;
 Thu,  4 Feb 2021 17:23:21 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-213.ams2.redhat.com
 [10.36.113.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B83D460C9B;
 Thu,  4 Feb 2021 17:23:19 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH v3 06/13] vringh: add vringh_kiov_length() helper
Date: Thu,  4 Feb 2021 18:22:23 +0100
Message-Id: <20210204172230.85853-7-sgarzare@redhat.com>
In-Reply-To: <20210204172230.85853-1-sgarzare@redhat.com>
References: <20210204172230.85853-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Cc: Laurent Vivier <lvivier@redhat.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, Xie Yongji <xieyongji@bytedance.com>,
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

This new helper returns the total number of bytes covered by
a vringh_kiov.

Suggested-by: Jason Wang <jasowang@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/vringh.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/vringh.h b/include/linux/vringh.h
index 755211ebd195..84db7b8f912f 100644
--- a/include/linux/vringh.h
+++ b/include/linux/vringh.h
@@ -199,6 +199,17 @@ static inline void vringh_kiov_cleanup(struct vringh_kiov *kiov)
 	kiov->iov = NULL;
 }
 
+static inline size_t vringh_kiov_length(struct vringh_kiov *kiov)
+{
+	size_t len = 0;
+	int i;
+
+	for (i = kiov->i; i < kiov->used; i++)
+		len += kiov->iov[i].iov_len;
+
+	return len;
+}
+
 void vringh_kiov_advance(struct vringh_kiov *kiov, size_t len);
 
 int vringh_getdesc_kern(struct vringh *vrh,
-- 
2.29.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
