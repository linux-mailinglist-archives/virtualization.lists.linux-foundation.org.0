Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 864792C4F1
	for <lists.virtualization@lfdr.de>; Tue, 28 May 2019 12:57:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6C4721C0C;
	Tue, 28 May 2019 10:57:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A35951C02
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 65E8ED0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 10:56:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD432C05D3F4;
	Tue, 28 May 2019 10:56:36 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-13.ams2.redhat.com
	[10.36.117.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 391E97D59A;
	Tue, 28 May 2019 10:56:25 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH 0/4] vsock/virtio: several fixes in the .probe() and .remove()
Date: Tue, 28 May 2019 12:56:19 +0200
Message-Id: <20190528105623.27983-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 28 May 2019 10:56:36 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, "Michael S . Tsirkin" <mst@redhat.com>,
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
- Patch 1 postpones the 'the_virtio_vsock' assignment at the end of the
  .probe() to avoid that some sockets queue works when the initialization
  is not finished.
- Patches 2 and 3 stop workers before to call vdev->config->reset(vdev) to
  be sure that no one is accessing the device, and adds another flush at the
  end of the .remove() to avoid use after free.
- Patch 4 free also used buffers in the virtqueues during the .remove().

Stefano Garzarella (4):
  vsock/virtio: fix locking around 'the_virtio_vsock'
  vsock/virtio: stop workers during the .remove()
  vsock/virtio: fix flush of works during the .remove()
  vsock/virtio: free used buffers during the .remove()

 net/vmw_vsock/virtio_transport.c | 105 ++++++++++++++++++++++++++-----
 1 file changed, 90 insertions(+), 15 deletions(-)

-- 
2.20.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
