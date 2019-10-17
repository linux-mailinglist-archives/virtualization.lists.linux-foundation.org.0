Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C969DAC8D
	for <lists.virtualization@lfdr.de>; Thu, 17 Oct 2019 14:44:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 257E6152E;
	Thu, 17 Oct 2019 12:44:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 66E8F1508
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 12:44:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2D5B16C5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 17 Oct 2019 12:44:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5127B30650DA;
	Thu, 17 Oct 2019 12:44:09 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-195.ams2.redhat.com
	[10.36.117.195])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E17AC5D9CA;
	Thu, 17 Oct 2019 12:44:03 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 0/2] vsock/virtio: make the credit mechanism more robust
Date: Thu, 17 Oct 2019 14:44:01 +0200
Message-Id: <20191017124403.266242-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 17 Oct 2019 12:44:09 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

This series makes the credit mechanism implemented in the
virtio-vsock devices more robust.
Patch 1 sends an update to the remote peer when the buf_alloc
change.
Patch 2 prevents a malicious peer (especially the guest) can
consume all the memory of the other peer, discarding packets
when the credit available is not respected.

Stefano Garzarella (2):
  vsock/virtio: send a credit update when buffer size is changed
  vsock/virtio: discard packets if credit is not respected

 net/vmw_vsock/virtio_transport_common.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
