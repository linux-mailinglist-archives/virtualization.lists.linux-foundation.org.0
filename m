Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A0DE1701
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:58:30 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8356EC6;
	Wed, 23 Oct 2019 09:58:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1B40AEB2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A3C3E87E
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=EqP3dJ1brA8cGs8/CpAJOebSHgUeA3445b36b/tPldY=;
	b=bGQafF94Ck8ePqBhwFS7/Y4CoaEexh4606NxCyDAy867lY9Z9HBjLLf/WAzPUvlE/sgf1S
	NazwyGBKs4wVdS+2kx/qvVt8KzVax9TFpIP8mMhZBOB90eCIQlar696MQYHU52r+CQ6Wzi
	pZoXkVbdJHtd/AVNFoXqbso9FaoHrFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-154-qOIRmXb2Pr6t1CnVGBFM1A-1; Wed, 23 Oct 2019 05:58:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 226C6107AD33;
	Wed, 23 Oct 2019 09:58:00 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BF2B05C1B2;
	Wed, 23 Oct 2019 09:57:56 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 09/14] vsock: move vsock_insert_unbound() in the
	vsock_create()
Date: Wed, 23 Oct 2019 11:55:49 +0200
Message-Id: <20191023095554.11340-10-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-1-sgarzare@redhat.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: qOIRmXb2Pr6t1CnVGBFM1A-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>,
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
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

Reviewed-by: Dexuan Cui <decui@microsoft.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/af_vsock.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 95878bed2c67..d89381166028 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -634,9 +634,6 @@ static struct sock *__vsock_create(struct net *net,
 		return NULL;
 	}
 
-	if (sock)
-		vsock_insert_unbound(vsk);
-
 	return sk;
 }
 
@@ -1889,6 +1886,8 @@ static const struct proto_ops vsock_stream_ops = {
 static int vsock_create(struct net *net, struct socket *sock,
 			int protocol, int kern)
 {
+	struct sock *sk;
+
 	if (!sock)
 		return -EINVAL;
 
@@ -1908,7 +1907,13 @@ static int vsock_create(struct net *net, struct socket *sock,
 
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
