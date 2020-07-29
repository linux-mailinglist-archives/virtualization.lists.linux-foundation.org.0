Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7C232598
	for <lists.virtualization@lfdr.de>; Wed, 29 Jul 2020 21:48:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3963C2352E;
	Wed, 29 Jul 2020 19:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CaMR+8eW-MK5; Wed, 29 Jul 2020 19:48:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 246CC20022;
	Wed, 29 Jul 2020 19:48:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01DE3C004D;
	Wed, 29 Jul 2020 19:48:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94B14C004D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 87F9A87E45
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPIeKwDSMZ5J
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EBD1B87E41
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Jul 2020 19:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596052099;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=g6E6oxh17gWdFsve5u7k1i5BDdfNHe2sq9hYCnsEY64=;
 b=RB1P3hODBMxArlrk2KVA9jDpHyvB4/9P75FqWU/Y86a/yvlZ2oylbOhfq9JM+8+WxHHAWi
 iVhmTmpDu9fDS/k/N5pKuJPpSU8Z2IVzTGa7XmpdwwiezQSRfId3/yitCY3WsYYkma62SV
 lgzgwP4vZjFZYiXteW6Olvu6IUw2s8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-72-DnRjCcLqMwCpki9ZXGyb-g-1; Wed, 29 Jul 2020 15:48:17 -0400
X-MC-Unique: DnRjCcLqMwCpki9ZXGyb-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14FC58015F4;
 Wed, 29 Jul 2020 19:48:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8858A5C5B7;
 Wed, 29 Jul 2020 19:48:07 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/1] virtio-scsi: fix missing unplug events when all LUNs are
 unplugged at the same time
Date: Wed, 29 Jul 2020 22:48:05 +0300
Message-Id: <20200729194806.4933-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "open list:VIRTIO BLOCK AND SCSI DRIVERS"
 <virtualization@lists.linux-foundation.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
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

virtio-scsi currently has limit of 8 outstanding notifications so when more that
8 LUNs are unplugged, some are missed.

Commit 5ff843721467 ("scsi: virtio_scsi: unplug LUNs when events missed")
Fixed this by checking the 'event overflow' bit and manually scanned the bus
to see which LUNs are still there.

However there is a corner case when all LUNs are unplugged.
In this case (which is not fully scsi confirmant IMHO), all scsi
commands to such device respond with INVALID TARGET.

This patch proposes to detect this and remove the LUN in this case
as well.

Maxim Levitsky (1):
  scsi: virtio-scsi: handle correctly case when all LUNs were unplugged

 drivers/scsi/virtio_scsi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
2.26.2


_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
