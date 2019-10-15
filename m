Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BE7D7957
	for <lists.virtualization@lfdr.de>; Tue, 15 Oct 2019 17:01:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CB7C6E25;
	Tue, 15 Oct 2019 15:01:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C4CFEE1F
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 15:01:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 83DB68C2
	for <virtualization@lists.linux-foundation.org>;
	Tue, 15 Oct 2019 15:01:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C47B9308A98C;
	Tue, 15 Oct 2019 15:00:59 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CE31194BE;
	Tue, 15 Oct 2019 15:00:52 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: virtualization@lists.linux-foundation.org
Subject: [PATCH] vsock/virtio: remove unused 'work' field from 'struct
	virtio_vsock_pkt'
Date: Tue, 15 Oct 2019 17:00:51 +0200
Message-Id: <20191015150051.104631-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 15 Oct 2019 15:00:59 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefan Hajnoczi <stefanha@redhat.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

The 'work' field was introduced with commit 06a8fc78367d0
("VSOCK: Introduce virtio_vsock_common.ko")
but it is never used in the code, so we can remove it to save
memory allocated in the per-packet 'struct virtio_vsock_pkt'

Suggested-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/linux/virtio_vsock.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/virtio_vsock.h b/include/linux/virtio_vsock.h
index 4c7781f4b29b..07875ccc7bb5 100644
--- a/include/linux/virtio_vsock.h
+++ b/include/linux/virtio_vsock.h
@@ -48,7 +48,6 @@ struct virtio_vsock_sock {
 
 struct virtio_vsock_pkt {
 	struct virtio_vsock_hdr	hdr;
-	struct work_struct work;
 	struct list_head list;
 	/* socket refcnt not held, only use for cancellation */
 	struct vsock_sock *vsk;
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
