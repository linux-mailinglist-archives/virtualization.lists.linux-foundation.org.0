Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8A11855D
	for <lists.virtualization@lfdr.de>; Tue, 10 Dec 2019 11:43:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id C8BCE220D0;
	Tue, 10 Dec 2019 10:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11OfVXuldgr7; Tue, 10 Dec 2019 10:43:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id EA64622176;
	Tue, 10 Dec 2019 10:43:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BFF10C0881;
	Tue, 10 Dec 2019 10:43:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88ED1C0881
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 72E2687A4D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gEzcnNvDJMOn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id DCE7887A39
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Dec 2019 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575974600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mP35JmqQ9E99xN9+azImIkT0EtvsAAz/WVB37DGVDWA=;
 b=d3Huc3K284Yk1+DcR889vt20p2Dy9IiJTKmtnBh5K7VCNtSi655zAz3LbWzDXzSGuahn30
 q3gh9/qMrQ0G3lNgPJePfJQaCwhYNtaKatBDjDvqei6ZsUD0l/4jPSJbKetWD1GPKHL6fX
 WUgD8a9WPobEfpNOZ+vglJWez1/hiV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-bddPvOfPNauR0dU7DHbVGQ-1; Tue, 10 Dec 2019 05:43:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11167802B7D;
 Tue, 10 Dec 2019 10:43:13 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F18F60568;
 Tue, 10 Dec 2019 10:43:07 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org,
	davem@davemloft.net
Subject: [PATCH net-next v2 0/6] vsock: add local transport support
Date: Tue, 10 Dec 2019 11:43:01 +0100
Message-Id: <20191210104307.89346-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: bddPvOfPNauR0dU7DHbVGQ-1
X-Mimecast-Spam-Score: 0
Cc: kvm@vger.kernel.org, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
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

v2:
 - style fixes [Dave]
 - removed RCU sync and changed 'the_vsock_loopback' in a global
   static variable [Stefan]
 - use G2H transport when local transport is not loaded and remote cid
   is VMADDR_CID_LOCAL [Stefan]
 - rebased on net-next

v1: https://patchwork.kernel.org/cover/11251735/

This series introduces a new transport (vsock_loopback) to handle
local communication.
This could be useful to test vsock core itself and to allow developers
to test their applications without launching a VM.

Before this series, vmci and virtio transports allowed this behavior,
but only in the guest.
We are moving the loopback handling in a new transport, because it
might be useful to provide this feature also in the host or when
no H2G/G2H transports (hyperv, virtio, vmci) are loaded.

The user can use the loopback with the new VMADDR_CID_LOCAL (that
replaces VMADDR_CID_RESERVED) in any condition.
Otherwise, if the G2H transport is loaded, it can also use the guest
local CID as previously supported by vmci and virtio transports.
If G2H transport is not loaded, the user can also use VMADDR_CID_HOST
for local communication.

Patch 1 is a cleanup to build virtio_transport_common without virtio
Patch 2 adds the new VMADDR_CID_LOCAL, replacing VMADDR_CID_RESERVED
Patch 3 adds a new feature flag to register a loopback transport
Patch 4 adds the new vsock_loopback transport based on the loopback
        implementation of virtio_transport
Patch 5 implements the logic to use the local transport for loopback
        communication
Patch 6 removes the loopback from virtio_transport

Stefano Garzarella (6):
  vsock/virtio_transport_common: remove unused virtio header includes
  vsock: add VMADDR_CID_LOCAL definition
  vsock: add local transport support in the vsock core
  vsock: add vsock_loopback transport
  vsock: use local transport when it is loaded
  vsock/virtio: remove loopback handling

 MAINTAINERS                             |   1 +
 include/net/af_vsock.h                  |   2 +
 include/uapi/linux/vm_sockets.h         |   8 +-
 net/vmw_vsock/Kconfig                   |  12 ++
 net/vmw_vsock/Makefile                  |   1 +
 net/vmw_vsock/af_vsock.c                |  45 +++++-
 net/vmw_vsock/virtio_transport.c        |  61 +-------
 net/vmw_vsock/virtio_transport_common.c |   3 -
 net/vmw_vsock/vmci_transport.c          |   2 +-
 net/vmw_vsock/vsock_loopback.c          | 180 ++++++++++++++++++++++++
 10 files changed, 243 insertions(+), 72 deletions(-)
 create mode 100644 net/vmw_vsock/vsock_loopback.c

-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
