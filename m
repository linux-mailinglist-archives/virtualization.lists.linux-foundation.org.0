Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 678E613E74A
	for <lists.virtualization@lfdr.de>; Thu, 16 Jan 2020 18:24:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 18C2586594;
	Thu, 16 Jan 2020 17:24:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1UgOctU0i-mU; Thu, 16 Jan 2020 17:24:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0AC3B86529;
	Thu, 16 Jan 2020 17:24:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F341DC077D;
	Thu, 16 Jan 2020 17:24:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 146BEC077D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0C94D20387
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UB-r6kPN6NP
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 196CB21552
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579195485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=L1usH87y9Hi/ZiYHMXoHuhdmW1E/8d47ArLsZBDzX7o=;
 b=XJinJ0kCHyHfEdMKr9DwZZk5Js+UaAI/mIyiqZFM7u+NaTHK0Gp9c8GYI/bKEw3ftfisH4
 Tomc0I9edkmGHe3lL1XoUx7YOn42wgRqabaQzsWz/zHet9DZabRo/JzqNrEqwHAkkMYLqw
 MmMwUVWa3qCol1gNEMzhsOG0tFeEthQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-dO0yLECUNPe09s1O855Low-1; Thu, 16 Jan 2020 12:24:44 -0500
X-MC-Unique: dO0yLECUNPe09s1O855Low-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 397941137843;
 Thu, 16 Jan 2020 17:24:42 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-242.ams2.redhat.com
 [10.36.117.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ACF8C5C28F;
 Thu, 16 Jan 2020 17:24:30 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net,
	netdev@vger.kernel.org
Subject: [PATCH net-next 0/3] vsock: support network namespace
Date: Thu, 16 Jan 2020 18:24:25 +0100
Message-Id: <20200116172428.311437-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
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

RFC -> v1:
 * added 'netns' module param to vsock.ko to enable the
   network namespace support (disabled by default)
 * added 'vsock_net_eq()' to check the "net" assigned to a socket
   only when 'netns' support is enabled

RFC: https://patchwork.ozlabs.org/cover/1202235/

Now that we have multi-transport upstream, I started to take a look to
support network namespace in vsock.

As we partially discussed in the multi-transport proposal [1], it could
be nice to support network namespace in vsock to reach the following
goals:
- isolate host applications from guest applications using the same ports
  with CID_ANY
- assign the same CID of VMs running in different network namespaces
- partition VMs between VMMs or at finer granularity

This new feature is disabled by default, because it changes vsock's
behavior with network namespaces and could break existing applications.
It can be enabled with the new 'netns' module parameter of vsock.ko.

This implementation provides the following behavior:
- packets received from the host (received by G2H transports) are
  assigned to the default netns (init_net)
- packets received from the guest (received by H2G - vhost-vsock) are
  assigned to the netns of the process that opens /dev/vhost-vsock
  (usually the VMM, qemu in my tests, opens the /dev/vhost-vsock)
    - for vmci I need some suggestions, because I don't know how to do
      and test the same in the vmci driver, for now vmci uses the
      init_net
- loopback packets are exchanged only in the same netns

I tested the series in this way:
l0_host$ qemu-system-x86_64 -m 4G -M accel=kvm -smp 4 \
            -drive file=/tmp/vsockvm0.img,if=virtio --nographic \
            -device vhost-vsock-pci,guest-cid=3

l1_vm$ echo 1 > /sys/module/vsock/parameters/netns

l1_vm$ ip netns add ns1
l1_vm$ ip netns add ns2
 # same CID on different netns
l1_vm$ ip netns exec ns1 qemu-system-x86_64 -m 1G -M accel=kvm -smp 2 \
            -drive file=/tmp/vsockvm1.img,if=virtio --nographic \
            -device vhost-vsock-pci,guest-cid=4
l1_vm$ ip netns exec ns2 qemu-system-x86_64 -m 1G -M accel=kvm -smp 2 \
            -drive file=/tmp/vsockvm2.img,if=virtio --nographic \
            -device vhost-vsock-pci,guest-cid=4

 # all iperf3 listen on CID_ANY and port 5201, but in different netns
l1_vm$ ./iperf3 --vsock -s # connection from l0 or guests started
                           # on default netns (init_net)
l1_vm$ ip netns exec ns1 ./iperf3 --vsock -s
l1_vm$ ip netns exec ns1 ./iperf3 --vsock -s

l0_host$ ./iperf3 --vsock -c 3
l2_vm1$ ./iperf3 --vsock -c 2
l2_vm2$ ./iperf3 --vsock -c 2

[1] https://www.spinics.net/lists/netdev/msg575792.html

Stefano Garzarella (3):
  vsock: add network namespace support
  vsock/virtio_transport_common: handle netns of received packets
  vhost/vsock: use netns of process that opens the vhost-vsock device

 drivers/vhost/vsock.c                   | 29 ++++++++++++-----
 include/linux/virtio_vsock.h            |  2 ++
 include/net/af_vsock.h                  |  7 +++--
 net/vmw_vsock/af_vsock.c                | 41 +++++++++++++++++++------
 net/vmw_vsock/hyperv_transport.c        |  5 +--
 net/vmw_vsock/virtio_transport.c        |  2 ++
 net/vmw_vsock/virtio_transport_common.c | 12 ++++++--
 net/vmw_vsock/vmci_transport.c          |  5 +--
 8 files changed, 78 insertions(+), 25 deletions(-)

-- 
2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
