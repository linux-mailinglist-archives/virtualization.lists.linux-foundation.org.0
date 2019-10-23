Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 069D1E16C5
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:56:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8055EEB6;
	Wed, 23 Oct 2019 09:56:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1B296EA8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:56:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id A48BC14D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=aPIIe5WRZMPBUYONsseioAXZoYWf/JAlNNMg8lPt4/Q=;
	b=azPWANGdvj4l7XN7Fvr1B/9iA+AJyk8SeV3A7cvN3uLpWd84r4Xq13Dn4zJx7pNUo6yoS9
	QrhcL7LU8enuJ978G/bzo17GQRjWC4aLgdVmb9lAagq3mAS7sOJ99ziUxYWfZfflBLcNlZ
	2uM8/WKV2zH0Bl3BnSmQ8kP7cluHtbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-378-FiyjSVSIOxmusT0AUBY3yw-1; Wed, 23 Oct 2019 05:56:16 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87C66107AD33;
	Wed, 23 Oct 2019 09:56:14 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 11CFC5C1B2;
	Wed, 23 Oct 2019 09:56:05 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 01/14] vsock/vmci: remove unused
	VSOCK_DEFAULT_CONNECT_TIMEOUT
Date: Wed, 23 Oct 2019 11:55:41 +0200
Message-Id: <20191023095554.11340-2-sgarzare@redhat.com>
In-Reply-To: <20191023095554.11340-1-sgarzare@redhat.com>
References: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: FiyjSVSIOxmusT0AUBY3yw-1
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

The VSOCK_DEFAULT_CONNECT_TIMEOUT definition was introduced with
commit d021c344051af ("VSOCK: Introduce VM Sockets"), but it is
never used in the net/vmw_vsock/vmci_transport.c.

VSOCK_DEFAULT_CONNECT_TIMEOUT is used and defined in
net/vmw_vsock/af_vsock.c

Cc: Jorgen Hansen <jhansen@vmware.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/vmci_transport.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/net/vmw_vsock/vmci_transport.c b/net/vmw_vsock/vmci_transport.c
index 8c9c4ed90fa7..f8e3131ac480 100644
--- a/net/vmw_vsock/vmci_transport.c
+++ b/net/vmw_vsock/vmci_transport.c
@@ -78,11 +78,6 @@ static int PROTOCOL_OVERRIDE = -1;
 #define VMCI_TRANSPORT_DEFAULT_QP_SIZE       262144
 #define VMCI_TRANSPORT_DEFAULT_QP_SIZE_MAX   262144
 
-/* The default peer timeout indicates how long we will wait for a peer response
- * to a control message.
- */
-#define VSOCK_DEFAULT_CONNECT_TIMEOUT (2 * HZ)
-
 /* Helper function to convert from a VMCI error code to a VSock error code. */
 
 static s32 vmci_transport_error_to_vsock_error(s32 vmci_error)
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
