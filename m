Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A216359BA2
	for <lists.virtualization@lfdr.de>; Fri, 28 Jun 2019 14:37:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C6E19CC0;
	Fri, 28 Jun 2019 12:37:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B9429CC1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 12:37:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 03E0282F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 28 Jun 2019 12:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8D9CE87633;
	Fri, 28 Jun 2019 12:37:10 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-102.ams2.redhat.com
	[10.36.117.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 950825DA96;
	Fri, 28 Jun 2019 12:37:00 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH v2 0/3] vsock/virtio: several fixes in the .probe() and
	.remove()
Date: Fri, 28 Jun 2019 14:36:56 +0200
Message-Id: <20190628123659.139576-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 28 Jun 2019 12:37:15 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
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

During the review of "[PATCH] vsock/virtio: Initialize core virtio vsock
before registering the driver", Stefan pointed out some possible issues
in the .probe() and .remove() callbacks of the virtio-vsock driver.

This series tries to solve these issues:
- Patch 1 adds RCU critical sections to avoid use-after-free of
  'the_virtio_vsock' pointer.
- Patch 2 stops workers before to call vdev->config->reset(vdev) to
  be sure that no one is accessing the device.
- Patch 3 moves the works flush at the end of the .remove() to avoid
  use-after-free of 'vsock' object.

v2:
- Patch 1: use RCU to protect 'the_virtio_vsock' pointer
- Patch 2: no changes
- Patch 3: flush works only at the end of .remove()
- Removed patch 4 because virtqueue_detach_unused_buf() returns all the buffers
  allocated.

v1: https://patchwork.kernel.org/cover/10964733/

Stefano Garzarella (3):
  vsock/virtio: use RCU to avoid use-after-free on the_virtio_vsock
  vsock/virtio: stop workers during the .remove()
  vsock/virtio: fix flush of works during the .remove()

 net/vmw_vsock/virtio_transport.c | 131 ++++++++++++++++++++++++-------
 1 file changed, 102 insertions(+), 29 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
