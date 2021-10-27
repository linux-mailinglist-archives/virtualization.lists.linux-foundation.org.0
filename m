Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F1643BF91
	for <lists.virtualization@lfdr.de>; Wed, 27 Oct 2021 04:21:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6EA240111;
	Wed, 27 Oct 2021 02:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Bm7ZOpy---X; Wed, 27 Oct 2021 02:21:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 763D3401A0;
	Wed, 27 Oct 2021 02:21:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB102C0021;
	Wed, 27 Oct 2021 02:21:34 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C889C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 129886075B
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdZDremem1o8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24FE4606E0
 for <virtualization@lists.linux-foundation.org>;
 Wed, 27 Oct 2021 02:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635301290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=XpwYAisWYsf21qlcW1bsvTshKwDSaTc83jJhCK0mOdE=;
 b=SFskRLsaOZTWKnO7TlxDrZIxV1Jrip6/bg1B9CK8wdnOWcM42iOZrfEv/t4hqbhurHd+cZ
 2uLkkk2JQuEgCa2E3PI+137wsfHze/pZz+E/x8IeRY8MebaWFQi7C4L7OImx+NkiJWaU6Y
 POS7BnLlFd+EIbf/DWS+GGLJBLK+aZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-fEDNFWLENaOqSG6HSfv9fw-1; Tue, 26 Oct 2021 22:21:25 -0400
X-MC-Unique: fEDNFWLENaOqSG6HSfv9fw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10FB68026AD;
 Wed, 27 Oct 2021 02:21:24 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-228.pek2.redhat.com
 [10.72.13.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 044CC19729;
 Wed, 27 Oct 2021 02:21:14 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	virtualization@lists.linux-foundation.org
Subject: [PATCH V5 0/4] Validate used buffer length
Date: Wed, 27 Oct 2021 10:21:03 +0800
Message-Id: <20211027022107.14357-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: f.hetzelt@tu-berlin.de, linux-kernel@vger.kernel.org, david.kaplan@amd.com,
 konrad.wilk@oracle.com
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

Hi All:

This patch tries to validate the used buffer length in the virtio
core. This help to eliminate the unexpected result caused by buggy or
mailicous devices. For the drivers that can do the validation itself,
they can ask the virtio core to suppress the check.

Changes since V4:

- Fix the out of date description in the commit log

Changes since V3:

- Initialize the buflen to zero when the validation is done by the
  driver.

Jason Wang (4):
  virtio_ring: validate used buffer length
  virtio-net: don't let virtio core to validate used length
  virtio-blk: don't let virtio core to validate used length
  virtio-scsi: don't let virtio core to validate used buffer length

 drivers/block/virtio_blk.c   |  1 +
 drivers/net/virtio_net.c     |  1 +
 drivers/scsi/virtio_scsi.c   |  1 +
 drivers/virtio/virtio_ring.c | 60 ++++++++++++++++++++++++++++++++++++
 include/linux/virtio.h       |  2 ++
 5 files changed, 65 insertions(+)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
