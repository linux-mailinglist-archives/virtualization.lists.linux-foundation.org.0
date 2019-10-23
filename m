Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF8E16C3
	for <lists.virtualization@lfdr.de>; Wed, 23 Oct 2019 11:56:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 50981EB4;
	Wed, 23 Oct 2019 09:56:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D738AEA8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:56:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
	[207.211.31.81])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id AE13D14D
	for <virtualization@lists.linux-foundation.org>;
	Wed, 23 Oct 2019 09:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571824571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding;
	bh=PjIrWxilILjTXJMM4pZ+a2frsZYLFCvzVYmdT4dKHeA=;
	b=b5zDXq8J97LwC5WX8PDjo+cfJdZZOnEezlbTMRhRHpU2HUGLbaQxaw+As7v+urTLtBvPCO
	jM5JM27+/lVGh8aIP74TVhqRuUiISgaAurfsQFsZZn7yRTifKcU5ghkF4R+odbPzYeFbAN
	WSNSePJTMlPVIAqAazHXU5EXB1LqDpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-45-AIB5fJO8MnCfZd5pS6ln_A-1; Wed, 23 Oct 2019 05:56:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B56EC1800DD0;
	Wed, 23 Oct 2019 09:56:05 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BEEB5C1B2;
	Wed, 23 Oct 2019 09:55:54 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 00/14] vsock: add multi-transports support
Date: Wed, 23 Oct 2019 11:55:40 +0200
Message-Id: <20191023095554.11340-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: AIB5fJO8MnCfZd5pS6ln_A-1
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

This series adds the multi-transports support to vsock, following
this proposal: https://www.spinics.net/lists/netdev/msg575792.html

With the multi-transports support, we can use VSOCK with nested VMs
(using also different hypervisors) loading both guest->host and
host->guest transports at the same time.
Before this series, vmci-transport supported this behavior but only
using VMware hypervisor on L0, L1, etc.

RFC: https://patchwork.ozlabs.org/cover/1168442/
RFC -> v1:
- Added R-b/A-b from Dexuan and Stefan
- Fixed comments and typos in several patches (Stefan)
- Patch 7: changed .notify_buffer_size return to void (Stefan)
- Added patch 8 to simplify the API exposed to the transports (Stefan)
- Patch 11:
  + documented VSOCK_TRANSPORT_F_* flags (Stefan)
  + fixed vsock_assign_transport() when the socket is already assigned
  + moved features outside of struct vsock_transport, and used as
    parameter of vsock_core_register() as a preparation of Patch 12
- Removed "vsock: add 'transport_hg' to handle g2h\h2g transports" patch
- Added patch 12 to register vmci_transport only when VMCI guest/host
  are active

The first 9 patches are cleanups and preparations, maybe some of
these can go regardless of this series.

Patch 10 changes the hvs_remote_addr_init(). setting the
VMADDR_CID_HOST as remote CID instead of VMADDR_CID_ANY to make
the choice of transport to be used work properly.

Patch 11 adds multi-transports support.

Patch 12 touch a little bit the vmci_transport and the vmci driver
to register the vmci_transport only when there are active host/guest.

Patch 13 prevents the transport modules unloading while sockets are
assigned to them.

Patch 14 fixes an issue in the bind() logic discoverable only with
the new multi-transport support.

I've tested this series with nested KVM (vsock-transport [L0,L1],
virtio-transport[L1,L2]) and with VMware (L0) + KVM (L1)
(vmci-transport [L0,L1], vhost-transport [L1], virtio-transport[L2]).

Dexuan successfully tested the RFC series on HyperV with a Linux guest.

Stefano Garzarella (14):
  vsock/vmci: remove unused VSOCK_DEFAULT_CONNECT_TIMEOUT
  vsock: remove vm_sockets_get_local_cid()
  vsock: remove include/linux/vm_sockets.h file
  vsock: add 'transport' member in the struct vsock_sock
  vsock/virtio: add transport parameter to the
    virtio_transport_reset_no_sock()
  vsock: add 'struct vsock_sock *' param to vsock_core_get_transport()
  vsock: handle buffer_size sockopts in the core
  vsock: add vsock_create_connected() called by transports
  vsock: move vsock_insert_unbound() in the vsock_create()
  hv_sock: set VMADDR_CID_HOST in the hvs_remote_addr_init()
  vsock: add multi-transports support
  vsock/vmci: register vmci_transport only when VMCI guest/host are
    active
  vsock: prevent transport modules unloading
  vsock: fix bind() behaviour taking care of CID

 drivers/misc/vmw_vmci/vmci_driver.c     |  50 ++++
 drivers/misc/vmw_vmci/vmci_driver.h     |   2 +
 drivers/misc/vmw_vmci/vmci_guest.c      |   2 +
 drivers/misc/vmw_vmci/vmci_host.c       |   7 +
 drivers/vhost/vsock.c                   |  96 +++---
 include/linux/virtio_vsock.h            |  18 +-
 include/linux/vm_sockets.h              |  15 -
 include/linux/vmw_vmci_api.h            |   2 +
 include/net/af_vsock.h                  |  44 +--
 include/net/vsock_addr.h                |   2 +-
 net/vmw_vsock/af_vsock.c                | 376 ++++++++++++++++++------
 net/vmw_vsock/hyperv_transport.c        |  70 ++---
 net/vmw_vsock/virtio_transport.c        | 177 ++++++-----
 net/vmw_vsock/virtio_transport_common.c | 131 +++------
 net/vmw_vsock/vmci_transport.c          | 137 +++------
 net/vmw_vsock/vmci_transport.h          |   3 -
 net/vmw_vsock/vmci_transport_notify.h   |   1 -
 17 files changed, 627 insertions(+), 506 deletions(-)
 delete mode 100644 include/linux/vm_sockets.h

-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
