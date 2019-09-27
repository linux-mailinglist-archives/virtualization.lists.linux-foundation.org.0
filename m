Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD46C0416
	for <lists.virtualization@lfdr.de>; Fri, 27 Sep 2019 13:27:25 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A454FC9A;
	Fri, 27 Sep 2019 11:27:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3080FC77
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:27:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A0A328A8
	for <virtualization@lists.linux-foundation.org>;
	Fri, 27 Sep 2019 11:27:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E42E0C05975D;
	Fri, 27 Sep 2019 11:27:16 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-249.ams2.redhat.com
	[10.36.117.249])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D2685D9C9;
	Fri, 27 Sep 2019 11:27:04 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [RFC PATCH 00/13] vsock: add multi-transports support
Date: Fri, 27 Sep 2019 13:26:50 +0200
Message-Id: <20190927112703.17745-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 27 Sep 2019 11:27:17 +0000 (UTC)
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

Hi all,
this series adds the multi-transports support to vsock, following
this proposal:
https://www.spinics.net/lists/netdev/msg575792.html

With the multi-transports support, we can use vsock with nested VMs
(using also different hypervisors) loading both guest->host and
host->guest transports at the same time.
Before this series, vmci-transport supported this behavior but only
using VMware hypervisor on L0, L1, etc.

The first 8 patches are cleanups and preparations, maybe some of
these can go regardless of this series.

Patch 9 changes the hvs_remote_addr_init(). setting the
VMADDR_CID_HOST as remote CID instead of VMADDR_CID_ANY to make
the choice of transport to be used work properly.
@Dexuan Could this change break anything?

Patch 10 adds multi-transports support.
RFC:
- I'd like to move MODULE_ALIAS_NETPROTO(PF_VSOCK) to af_vsock.c.
  @Jorgen could this break the VMware products?

- DGRAM sockets are handled as before, I don't know if make sense
  work on it now, or when another transport will support DGRAM.
  The big issues here is that we cannot link 1-1 a socket to
  transport as for stream sockets since DGRAM is not
  connection-oriented.

Patches 11 and 12 maybe can be merged with patch 10.
Patch 11 maybe is tricky, but it allows to have vmci_transport and
vhost_vsock loaded at the same time and it also alleviates the
problem of having MODULE_ALIAS_NETPROTO(PF_VSOCK) in vmci_transport.c
Patch 12 prevents the transport modules unloading while sockets are
assigned to them.

Patch 13 fixes an issue in the bind() logic discoverable only with
the new multi-transport support.

I've tested this series with nested KVM (vsock-transport [L0,L1],
virtio-transport[L1,L2]) and with VMware (L0) + KVM (L1)
(vmci-transport [L0,L1], vhost-transport [L1], virtio-transport[L2]).

@Dexuan please can you test on HyperV that I didn't break anything
even without nested VMs?
I'll try to setup a Windows host where to test the nested VMs.

Thanks in advance for your comments and suggestions,
Stefano

Stefano Garzarella (13):
  vsock/vmci: remove unused VSOCK_DEFAULT_CONNECT_TIMEOUT
  vsock: remove vm_sockets_get_local_cid()
  vsock: remove include/linux/vm_sockets.h file
  vsock: add 'transport' member in the struct vsock_sock
  vsock/virtio: add transport parameter to the
    virtio_transport_reset_no_sock()
  vsock: add 'struct vsock_sock *' param to vsock_core_get_transport()
  vsock: handle buffer_size sockopts in the core
  vsock: move vsock_insert_unbound() in the vsock_create()
  hv_sock: set VMADDR_CID_HOST in the hvs_remote_addr_init()
  vsock: add multi-transports support
  vsock: add 'transport_hg' to handle g2h\h2g transports
  vsock: prevent transport modules unloading
  vsock: fix bind() behaviour taking care of CID

 drivers/vhost/vsock.c                   |  96 +++---
 include/linux/virtio_vsock.h            |  18 +-
 include/linux/vm_sockets.h              |  15 -
 include/net/af_vsock.h                  |  35 ++-
 include/net/vsock_addr.h                |   2 +-
 net/vmw_vsock/af_vsock.c                | 374 ++++++++++++++++++------
 net/vmw_vsock/hyperv_transport.c        |  68 ++---
 net/vmw_vsock/virtio_transport.c        | 177 ++++++-----
 net/vmw_vsock/virtio_transport_common.c | 127 +++-----
 net/vmw_vsock/vmci_transport.c          | 123 +++-----
 net/vmw_vsock/vmci_transport.h          |   3 -
 net/vmw_vsock/vmci_transport_notify.h   |   1 -
 12 files changed, 555 insertions(+), 484 deletions(-)
 delete mode 100644 include/linux/vm_sockets.h

-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
