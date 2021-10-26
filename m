Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id DA43143AD11
	for <lists.virtualization@lfdr.de>; Tue, 26 Oct 2021 09:20:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75BCB401BF;
	Tue, 26 Oct 2021 07:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ge4tLbKx8t6; Tue, 26 Oct 2021 07:20:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 196BD40170;
	Tue, 26 Oct 2021 07:20:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7630CC0021;
	Tue, 26 Oct 2021 07:20:16 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22575C000E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B5A980DD3
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRkKzV0R4xSn
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C376C80C2E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 26 Oct 2021 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635232812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3b0+Kh5GhdCTKf3DqTlQfiS/ku1LnxpLvlQPIU6Uwf8=;
 b=a3Z7I6dBimK0VpN6WXJTYCfdOCBcGbPk27jEVPZC0xJ2nxtPDX5IPKUm+A5uXF3exQSW9m
 TFl8eW0lST25GtQpLF7tAt6LbrT6r/8jg1Z/zQyX4T7pWDKU6m2IvFg/W4LbIdzpUl6H/J
 EmwHQYotdJ2Og8kV9vdTKy0asv+Cdso=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-M5wM4iRfOneqbJxZiDHdLw-1; Tue, 26 Oct 2021 03:20:09 -0400
X-MC-Unique: M5wM4iRfOneqbJxZiDHdLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D34645074B;
 Tue, 26 Oct 2021 07:20:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-80.pek2.redhat.com [10.72.12.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F70519C79;
 Tue, 26 Oct 2021 07:20:04 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	virtualization@lists.linux-foundation.org
Subject: [PATCH V4 0/4] Validate used buffer length
Date: Tue, 26 Oct 2021 15:19:56 +0800
Message-Id: <20211026072000.8699-1-jasowang@redhat.com>
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

Changes since V3:

- Initialize the buflen to zero when the validation is done by the driver.

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
