Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 85278D40F2
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 15:19:37 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 64241174E;
	Fri, 11 Oct 2019 13:19:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1F7C915D6
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:08:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A9D4B735
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 13:08:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B6553082128;
	Fri, 11 Oct 2019 13:08:07 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-54.ams2.redhat.com
	[10.36.117.54])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD59C60600;
	Fri, 11 Oct 2019 13:07:59 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net 0/2] vsock: don't allow half-closed socket in the host
	transports
Date: Fri, 11 Oct 2019 15:07:56 +0200
Message-Id: <20191011130758.22134-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 11 Oct 2019 13:08:07 +0000 (UTC)
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

We are implementing a test suite for the VSOCK sockets and we discovered
that vmci_transport never allowed half-closed socket on the host side.

As Jorgen explained [1] this is due to the implementation of VMCI.

Since we want to have the same behaviour across all transports, this
series adds a section in the "Implementation notes" to exaplain this
behaviour, and changes the vhost_transport to behave the same way.

[1] https://patchwork.ozlabs.org/cover/847998/#1831400

Stefano Garzarella (2):
  vsock: add half-closed socket details in the implementation notes
  vhost/vsock: don't allow half-closed socket in the host

 drivers/vhost/vsock.c    | 17 ++++++++++++++++-
 net/vmw_vsock/af_vsock.c |  4 ++++
 2 files changed, 20 insertions(+), 1 deletion(-)

-- 
2.21.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
