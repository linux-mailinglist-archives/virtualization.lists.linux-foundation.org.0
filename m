Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1376111EAA0
	for <lists.virtualization@lfdr.de>; Fri, 13 Dec 2019 19:48:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BB05E85572;
	Fri, 13 Dec 2019 18:48:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1HY2f796Ar6t; Fri, 13 Dec 2019 18:48:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 293E6855CE;
	Fri, 13 Dec 2019 18:48:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E9B1C0881;
	Fri, 13 Dec 2019 18:48:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 06E8AC0881
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 035B387589
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xiz6DQLy-wxi
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7D87087626
 for <virtualization@lists.linux-foundation.org>;
 Fri, 13 Dec 2019 18:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576262889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=deTmsk0BQdQEPhCCzmHgYqMaF0cfRBrvO3lqwb43CWA=;
 b=ibaVLrghPB2eFq31ccfq0+S4rrTYuYsgvzdrl1waoUZfg5yquePzktywl4d7j1mQU/0utV
 ZUVF6QJXBWcqzaIsz6zTZ5kbD5EjaA0WGT/WrHAkpXcPL0OqqIztEEID+14mmBQQhX7JHV
 Tps23HvBwJOrP6JvOcgrExhEgBKUfhs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-HA1EV8o7OLOXy-TFUmvD3g-1; Fri, 13 Dec 2019 13:48:08 -0500
X-MC-Unique: HA1EV8o7OLOXy-TFUmvD3g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36A0D911EA;
 Fri, 13 Dec 2019 18:48:07 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-123.ams2.redhat.com
 [10.36.117.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F183B60BB3;
 Fri, 13 Dec 2019 18:48:02 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: davem@davemloft.net
Subject: [PATCH net 0/2] vsock/virtio: fix null-pointer dereference and
 related precautions
Date: Fri, 13 Dec 2019 19:47:59 +0100
Message-Id: <20191213184801.486675-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>
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

This series mainly solves a possible null-pointer dereference in
virtio_transport_recv_listen() introduced with the multi-transport
support [PATCH 1].

PATCH 2 adds a WARN_ON check for the same potential issue
and a returned error in the virtio_transport_send_pkt_info() function
to avoid crashing the kernel.

Stefano Garzarella (2):
  vsock/virtio: fix null-pointer dereference in
    virtio_transport_recv_listen()
  vsock/virtio: add WARN_ON check on virtio_transport_get_ops()

 net/vmw_vsock/virtio_transport_common.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
