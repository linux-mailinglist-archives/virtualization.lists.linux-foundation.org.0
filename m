Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE44F50AB
	for <lists.virtualization@lfdr.de>; Fri,  8 Nov 2019 17:09:10 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB0D7E5B;
	Fri,  8 Nov 2019 16:09:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 14B5BE4C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 16:09:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 945EAEC
	for <virtualization@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 16:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573229340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=K93xC4W4XxB9V/XDY2JHTux4Xj+XQzupJKYWOTL6WL8=;
	b=X5UJYgdvhYXZ/Zq9RMnaJlCsyx6puYr37fUNIrl4u34VKCdzscUuyEQ4OqGt/uumzP36+0
	dcKMKavT7Ssiqhx2wJdc5Jd7jshmjS9I+GOexB8LBYSsSFdRb2uQFjF18PRSJNP3UFBmhU
	Z5+1KBmPlZxEClvF+20qZ8QMmPlAu6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-ko3GzfECMG-Z6GrtGtEBvw-1; Fri, 08 Nov 2019 11:08:57 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EDCC1005500;
	Fri,  8 Nov 2019 16:08:55 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-238.ams2.redhat.com
	[10.36.117.238])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E69AC60BE2;
	Fri,  8 Nov 2019 16:08:50 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH] vsock/virtio: fix sock refcnt holding during the shutdown
Date: Fri,  8 Nov 2019 17:08:50 +0100
Message-Id: <20191108160850.51278-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: ko3GzfECMG-Z6GrtGtEBvw-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>
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

The "42f5cda5eaf4" commit rightly set SOCK_DONE on peer shutdown,
but there is an issue if we receive the SHUTDOWN(RDWR) while the
virtio_transport_close_timeout() is scheduled.
In this case, when the timeout fires, the SOCK_DONE is already
set and the virtio_transport_close_timeout() will not call
virtio_transport_reset() and virtio_transport_do_close().
This causes that both sockets remain open and will never be released,
preventing the unloading of [virtio|vhost]_transport modules.

This patch fixes this issue, calling virtio_transport_reset() and
virtio_transport_do_close() when we receive the SHUTDOWN(RDWR)
and there is nothing left to read.

Fixes: 42f5cda5eaf4 ("vsock/virtio: set SOCK_DONE on peer shutdown")
Cc: Stephen Barber <smbarber@chromium.org>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport_common.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index 481f7f8a1655..fb2060dffb0a 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -947,9 +947,11 @@ virtio_transport_recv_connected(struct sock *sk,
 		if (le32_to_cpu(pkt->hdr.flags) & VIRTIO_VSOCK_SHUTDOWN_SEND)
 			vsk->peer_shutdown |= SEND_SHUTDOWN;
 		if (vsk->peer_shutdown == SHUTDOWN_MASK &&
-		    vsock_stream_has_data(vsk) <= 0) {
-			sock_set_flag(sk, SOCK_DONE);
-			sk->sk_state = TCP_CLOSING;
+		    vsock_stream_has_data(vsk) <= 0 &&
+		    !sock_flag(sk, SOCK_DONE)) {
+			(void)virtio_transport_reset(vsk, NULL);
+
+			virtio_transport_do_close(vsk, true);
 		}
 		if (le32_to_cpu(pkt->hdr.flags))
 			sk->sk_state_change(sk);
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
