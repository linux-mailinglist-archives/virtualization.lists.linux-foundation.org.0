Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B90C0430
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 13:28:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 53B90D30;
	Fri, 27 Sep 2019 11:28:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D99ADC90
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:28:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8FA9D8A6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:28:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06E9718C892A;
	Fri, 27 Sep 2019 11:28:20 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-249.ams2.redhat.com
	[10.36.117.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F0E245D9C3;
	Fri, 27 Sep 2019 11:28:16 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [RFC PATCH 08/13] vsock: move vsock_insert_unbound() in the
	vsock_create()
Date: Fri, 27 Sep 2019 13:26:58 +0200
Message-Id: <20190927112703.17745-9-sgarzare@redhat.com>
In-Reply-To: <20190927112703.17745-1-sgarzare@redhat.com>
References: <20190927112703.17745-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Fri, 27 Sep 2019 11:28:20 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

vsock_insert_unbound() was called only when 'sock' parameter of
__vsock_create() was not null. This only happened when
__vsock_create() was called by vsock_create().

In order to simplify the multi-transports support, this patch
moves vsock_insert_unbound() at the end of vsock_create().

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/af_vsock.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index dee69d7ee148..95e6db21e7e1 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -634,9 +634,6 @@ struct sock *__vsock_create(struct net *net,
 		return NULL;
 	}
 
-	if (sock)
-		vsock_insert_unbound(vsk);
-
 	return sk;
 }
 EXPORT_SYMBOL_GPL(__vsock_create);
@@ -1875,6 +1872,8 @@ static const struct proto_ops vsock_stream_ops = {
 static int vsock_create(struct net *net, struct socket *sock,
 			int protocol, int kern)
 {
+	struct sock *sk;
+
 	if (!sock)
 		return -EINVAL;
 
@@ -1894,7 +1893,13 @@ static int vsock_create(struct net *net, struct socket *sock,
 
 	sock->state = SS_UNCONNECTED;
 
-	return __vsock_create(net, sock, NULL, GFP_KERNEL, 0, kern) ? 0 : -ENOMEM;
+	sk = __vsock_create(net, sock, NULL, GFP_KERNEL, 0, kern);
+	if (!sk)
+		return -ENOMEM;
+
+	vsock_insert_unbound(vsock_sk(sk));
+
+	return 0;
 }
 
 static const struct net_proto_family vsock_family_ops = {
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
