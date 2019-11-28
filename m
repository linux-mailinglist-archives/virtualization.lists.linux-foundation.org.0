Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 457EA10CD92
	for <lists.virtualization@lfdr.de>; Thu, 28 Nov 2019 18:15:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E32B787AD2;
	Thu, 28 Nov 2019 17:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iS1wbOlWCSwW; Thu, 28 Nov 2019 17:15:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8A494878EA;
	Thu, 28 Nov 2019 17:15:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FFAAC0881;
	Thu, 28 Nov 2019 17:15:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45077C0881
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2E72C86519
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdeJZG8YLLx2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 31E978618D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 17:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574961331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9JTXqexhPJCr/NYp8eLm2gzq1RhmqcIBI6fHhWivQDE=;
 b=e1INEXf8jA8qZ7bf1Z4/sjdlq7+jJTwRHITA3Q9gNy6ZsgGQsSbDvEQNo04ftpqL5MVCSB
 ks+lS8RLjcOJceRMJrDakiT+W2Wj3S+wAILVjmcIa0GecMzm1XOIU/WL8M2yPI41w1GMvo
 VLh3HvyHaAWj9+s8faVVoCixq5XmogM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-2CitP0_oPIi5IxNIq7mh5g-1; Thu, 28 Nov 2019 12:15:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50567107ACCC;
 Thu, 28 Nov 2019 17:15:28 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-168.ams2.redhat.com
 [10.36.117.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A8A4600CA;
 Thu, 28 Nov 2019 17:15:19 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [RFC PATCH 0/3] vsock: support network namespace
Date: Thu, 28 Nov 2019 18:15:16 +0100
Message-Id: <20191128171519.203979-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 2CitP0_oPIi5IxNIq7mh5g-1
X-Mimecast-Spam-Score: 0
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Jorgen Hansen <jhansen@vmware.com>
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

Hi,
now that we have multi-transport upstream, I started to take a look to
support network namespace (netns) in vsock.

As we partially discussed in the multi-transport proposal [1], it could
be nice to support network namespace in vsock to reach the following
goals:
- isolate host applications from guest applications using the same ports
  with CID_ANY
- assign the same CID of VMs running in different network namespaces
- partition VMs between VMMs or at finer granularity

This preliminary implementation provides the following behavior:
- packets received from the host (received by G2H transports) are
  assigned to the default netns (init_net)
- packets received from the guest (received by H2G - vhost-vsock) are
  assigned to the netns of the process that opens /dev/vhost-vsock
  (usually the VMM, qemu in my tests, opens the /dev/vhost-vsock)
    - for vmci I need some suggestions, because I don't know how to do
      and test the same in the vmci driver, for now vmci uses the
      init_net
- loopback packets are exchanged only in the same netns

Questions:
1. Should we make configurable the netns (now it is init_net) where
   packets from the host should be delivered?
2. Should we provide an ioctl in vhost-vsock to configure the netns
   to use? (instead of using the netns of the process that opens
   /dev/vhost-vsock)
3. Should we provide a way to disable the netns support in vsock?
4. Jorgen: Do you think can be useful support it in vmci host
   driver?

I tested the series in this way:
l0_host$ qemu-system-x86_64 -m 4G -M accel=kvm -smp 4 \
            -drive file=/tmp/vsockvm0.img,if=virtio --nographic \
            -device vhost-vsock-pci,guest-cid=3

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

This series is on top of the vsock-loopback series (not yet merged),
and it is available in the Git repository at:

  git://github.com/stefano-garzarella/linux.git vsock-netns

Any comments are really appreciated!

Thanks,
Stefano

[1] https://www.spinics.net/lists/netdev/msg575792.html

Stefano Garzarella (3):
  vsock: add network namespace support
  vsock/virtio_transport_common: handle netns of received packets
  vhost/vsock: use netns of process that opens the vhost-vsock device

 drivers/vhost/vsock.c                   | 29 ++++++++++++++++-------
 include/linux/virtio_vsock.h            |  2 ++
 include/net/af_vsock.h                  |  6 +++--
 net/vmw_vsock/af_vsock.c                | 31 ++++++++++++++++++-------
 net/vmw_vsock/hyperv_transport.c        |  5 ++--
 net/vmw_vsock/virtio_transport.c        |  2 ++
 net/vmw_vsock/virtio_transport_common.c | 12 ++++++++--
 net/vmw_vsock/vmci_transport.c          |  5 ++--
 8 files changed, 67 insertions(+), 25 deletions(-)

-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
