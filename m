Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E5F1B78DE
	for <lists.virtualization@lfdr.de>; Fri, 24 Apr 2020 17:09:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3154286370;
	Fri, 24 Apr 2020 15:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8-uMS+A5MZY; Fri, 24 Apr 2020 15:09:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id E22F2885DC;
	Fri, 24 Apr 2020 15:09:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0583C0175;
	Fri, 24 Apr 2020 15:09:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1BD4C0175
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D05FB87E6E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LEl5ajV4kmHg
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id C83F587E0B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 24 Apr 2020 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587740942;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mGgOnRVzcCEgMJaj5VrAhSpVCj/tilxi8AFKq06F19o=;
 b=Q14AIl6WtJtlGIUsZjBh+iZmPErUsxJHQFGdyizuB6sUAAZ/xdjHhEgJmB02lGOfprZchn
 uCHJsXmXuDMzXwn8WArA1e6yUpDPLB5KX1lV0HwFjZyr2CXwUqHImTYsuPXjpiKN/0OCy9
 piyQijWgOyj36IOMy5AAzJu+ot/w/t8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-MjVSv9QHNR6m_5AgATCLsw-1; Fri, 24 Apr 2020 11:08:54 -0400
X-MC-Unique: MjVSv9QHNR6m_5AgATCLsw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16056846348;
 Fri, 24 Apr 2020 15:08:34 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-114-43.ams2.redhat.com
 [10.36.114.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9E8EC5D76A;
 Fri, 24 Apr 2020 15:08:31 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net v2 0/2] vsock/virtio: fixes about packet delivery to
 monitoring devices
Date: Fri, 24 Apr 2020 17:08:28 +0200
Message-Id: <20200424150830.183113-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>
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

During the review of v1, Stefan pointed out an issue introduced by
that patch, where replies can appear in the packet capture before
the transmitted packet.

While fixing my patch, reverting it and adding a new flag in
'struct virtio_vsock_pkt' (patch 2/2), I found that we already had
that issue in vhost-vsock, so I fixed it (patch 1/2).

v1 -> v2:
- reverted the v1 patch, to avoid that replies can appear in the
  packet capture before the transmitted packet [Stefan]
- added patch to fix packet delivering to monitoring devices in
  vhost-vsock
- added patch to check if the packet is already delivered to
  monitoring devices

v1: https://patchwork.ozlabs.org/project/netdev/patch/20200421092527.41651-1-sgarzare@redhat.com/

Stefano Garzarella (2):
  vhost/vsock: fix packet delivery order to monitoring devices
  vsock/virtio: fix multiple packet delivery to monitoring devices

 drivers/vhost/vsock.c                   | 16 +++++++++++-----
 include/linux/virtio_vsock.h            |  1 +
 net/vmw_vsock/virtio_transport_common.c |  4 ++++
 3 files changed, 16 insertions(+), 5 deletions(-)

-- 
2.25.3


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
