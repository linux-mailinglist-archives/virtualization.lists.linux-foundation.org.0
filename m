Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E98FD40F3
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 15:19:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 9CEC71757;
	Fri, 11 Oct 2019 13:19:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 48C7D15D6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:08:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0004C14D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:08:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7F4703067288;
	Fri, 11 Oct 2019 13:08:09 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-54.ams2.redhat.com
	[10.36.117.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE6160A9F;
	Fri, 11 Oct 2019 13:08:07 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 1/2] vsock: add half-closed socket details in the
	implementation notes
Date: Fri, 11 Oct 2019 15:07:57 +0200
Message-Id: <20191011130758.22134-2-sgarzare@redhat.com>
In-Reply-To: <20191011130758.22134-1-sgarzare@redhat.com>
References: <20191011130758.22134-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 11 Oct 2019 13:08:09 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, Adit Ranadive <aditr@vmware.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
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

vmci_transport never allowed half-closed socket on the host side.
Since we want to have the same behaviour across all transports, we
add a section in the "Implementation notes".

Cc: Jorgen Hansen <jhansen@vmware.com>
Cc: Adit Ranadive <aditr@vmware.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 net/vmw_vsock/af_vsock.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/vmw_vsock/af_vsock.c b/net/vmw_vsock/af_vsock.c
index 2ab43b2bba31..27df57c2024b 100644
--- a/net/vmw_vsock/af_vsock.c
+++ b/net/vmw_vsock/af_vsock.c
@@ -83,6 +83,10 @@
  *   TCP_ESTABLISHED - connected
  *   TCP_CLOSING - disconnecting
  *   TCP_LISTEN - listening
+ *
+ * - Half-closed socket is supported only on the guest side. recv() on the host
+ * side should return EOF when the guest closes a connection, also if some
+ * data is still in the receive queue.
  */
 
 #include <linux/types.h>
-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
