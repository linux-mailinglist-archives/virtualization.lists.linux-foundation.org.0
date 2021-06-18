Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 667213ACC59
	for <lists.virtualization@lfdr.de>; Fri, 18 Jun 2021 15:35:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06E4E83B13;
	Fri, 18 Jun 2021 13:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggCC3H90wfvW; Fri, 18 Jun 2021 13:35:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DFCF383B1F;
	Fri, 18 Jun 2021 13:35:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A4DDC000B;
	Fri, 18 Jun 2021 13:35:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD9E3C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B967560ADF
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ig2pFQAE0r6v
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 282AE60ADE
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624023343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNf5vH386FO3DWWUo5p1LYSZTTqClAjh9OQpi5Mkgi4=;
 b=Jq91v4f5UvacvR7GsMM3sLv0iITkFirI8IMr63spbaUwOEoQcLmFdzhGwpatYlhq2BEqY/
 f9av+XeK1deI7PTB3BD0rHfLLR1U46vN7I+x/J+W8ImTdgEu7uZD19yEMICtw5L2caXhw6
 yEQnHeWIltGV4ENKA8ibeP4o3tbfmq4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-bIgTEk-2MLa1Sv1-0Ih9yA-1; Fri, 18 Jun 2021 09:35:39 -0400
X-MC-Unique: bIgTEk-2MLa1Sv1-0Ih9yA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E391100C661;
 Fri, 18 Jun 2021 13:35:38 +0000 (UTC)
Received: from steredhat.lan (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7A9410023B5;
 Fri, 18 Jun 2021 13:35:34 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 1/3] vsock: rename vsock_has_data()
Date: Fri, 18 Jun 2021 15:35:24 +0200
Message-Id: <20210618133526.300347-2-sgarzare@redhat.com>
In-Reply-To: <20210618133526.300347-1-sgarzare@redhat.com>
References: <20210618133526.300347-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 "David S. Miller" <davem@davemloft.net>
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

vsock_has_data() is used only by STREAM and SEQPACKET sockets,
so let's rename it to vsock_connectible_has_data(), using the same
nomenclature (connectible) used in other functions after the
introduction of SEQPACKET.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/af_vsock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 67954afef4e1..de8249483081 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -860,7 +860,7 @@ s64 vsock_stream_has_data(struct vsock_sock *vsk)
 }
 EXPORT_SYMBOL_GPL(vsock_stream_has_data);
 
-static s64 vsock_has_data(struct vsock_sock *vsk)
+static s64 vsock_connectible_has_data(struct vsock_sock *vsk)
 {
 	struct sock *sk = sk_vsock(vsk);
 
@@ -1880,7 +1880,7 @@ static int vsock_wait_data(struct sock *sk, struct wait_queue_entry *wait,
 	err = 0;
 	transport = vsk->transport;
 
-	while ((data = vsock_has_data(vsk)) == 0) {
+	while ((data = vsock_connectible_has_data(vsk)) == 0) {
 		prepare_to_wait(sk_sleep(sk), wait, TASK_INTERRUPTIBLE);
 
 		if (sk->sk_err != 0 ||
-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
