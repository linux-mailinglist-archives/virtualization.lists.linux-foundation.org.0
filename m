Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC73ACC57
	for <lists.virtualization@lfdr.de>; Fri, 18 Jun 2021 15:35:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEEC24014A;
	Fri, 18 Jun 2021 13:35:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yyiW1CwdIOMh; Fri, 18 Jun 2021 13:35:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id A88DB4020E;
	Fri, 18 Jun 2021 13:35:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 346A5C0022;
	Fri, 18 Jun 2021 13:35:41 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B70F0C000B
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B79F405B6
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_JU-PL9m4LS
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5450841577
 for <virtualization@lists.linux-foundation.org>;
 Fri, 18 Jun 2021 13:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624023337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7mCct73RnwgXH1BQ0EFrvsasGFgPM8gKKeeGJpCib/k=;
 b=iRQNTu3CxpS6Y7epRY2/yekAsTpaBrlXax2qY63ldpETfAxlfncxq2tFjj9ywsKdGnSHt6
 /ws5uRY1gH7/1/Dy6oGPperRPMEfsgYhUVUMOVyaO3DLwjvdXjlgbb0SDYs2DW23kdBf5a
 19jdNSQ+Sga005WlFvu7o/Ivx3nYADg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-BPaOIvFPP9q6xV0MS2lJkQ-1; Fri, 18 Jun 2021 09:35:35 -0400
X-MC-Unique: BPaOIvFPP9q6xV0MS2lJkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3949D802C8A;
 Fri, 18 Jun 2021 13:35:34 +0000 (UTC)
Received: from steredhat.lan (ovpn-115-127.ams2.redhat.com [10.36.115.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D8D561000324;
 Fri, 18 Jun 2021 13:35:27 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org
Subject: [PATCH net-next 0/3] vsock: small fixes for seqpacket support
Date: Fri, 18 Jun 2021 15:35:23 +0200
Message-Id: <20210618133526.300347-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Arseny Krasnov <arseny.krasnov@kaspersky.com>,
 "David S. Miller" <davem@davemloft.net>
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

This series contains few patches to clean up a bit the code
of seqpacket recently merged in the net-next tree.

No functionality changes.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Stefano Garzarella (3):
  vsock: rename vsock_has_data()
  vsock: rename vsock_wait_data()
  vsock/virtio: remove redundant `copy_failed` variable

 net/vmw_vsock/af_vsock.c                | 18 ++++++++++--------
 net/vmw_vsock/virtio_transport_common.c |  7 ++-----
 2 files changed, 12 insertions(+), 13 deletions(-)

-- 
2.31.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
