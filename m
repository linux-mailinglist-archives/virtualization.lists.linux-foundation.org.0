Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C86DAC92
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 14:44:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 513251508;
	Thu, 17 Oct 2019 12:44:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C43761525
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 12:44:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7CCC4831
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 12:44:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1713D300C5A9;
	Thu, 17 Oct 2019 12:44:11 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-195.ams2.redhat.com
	[10.36.117.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9FE075D9CA;
	Thu, 17 Oct 2019 12:44:09 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 1/2] vsock/virtio: send a credit update when buffer size
	is changed
Date: Thu, 17 Oct 2019 14:44:02 +0200
Message-Id: <20191017124403.266242-2-sgarzare@redhat.com>
In-Reply-To: <20191017124403.266242-1-sgarzare@redhat.com>
References: <20191017124403.266242-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 17 Oct 2019 12:44:11 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

When the user application set a new buffer size value, we should
update the remote peer about this change, since it uses this
information to calculate the credit available.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/virtio_transport_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
index a666ef8fc54e..db127a69f5c3 100644
--- a/net/vmw_vsock/virtio_transport_common.c
+++ b/net/vmw_vsock/virtio_transport_common.c
@@ -458,6 +458,9 @@ void virtio_transport_set_buffer_size(struct vsock_sock *vsk, u64 val)
 		vvs->buf_size_max = val;
 	vvs->buf_size = val;
 	vvs->buf_alloc = val;
+
+	virtio_transport_send_credit_update(vsk, VIRTIO_VSOCK_TYPE_STREAM,
+					    NULL);
 }
 EXPORT_SYMBOL_GPL(virtio_transport_set_buffer_size);
 
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
