Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BC382553134
	for <lists.virtualization@lfdr.de>; Tue, 21 Jun 2022 13:42:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E052640BAB;
	Tue, 21 Jun 2022 11:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E052640BAB
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernkonzept.com header.i=@kernkonzept.com header.a=rsa-sha256 header.s=mx1 header.b=gZPlPh4b
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KbeAha7gzj1Y; Tue, 21 Jun 2022 11:42:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B3CB840BB3;
	Tue, 21 Jun 2022 11:42:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3CB840BB3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DAE2EC0081;
	Tue, 21 Jun 2022 11:42:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2694C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 11:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC6A440BB4
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 11:42:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC6A440BB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-dKhcZgHv8V
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 11:42:37 +0000 (UTC)
X-Greylist: delayed 00:32:24 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B37D740BAB
Received: from mx.kernkonzept.com (serv1.kernkonzept.com
 [IPv6:2a01:4f8:1c1c:b490::2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B37D740BAB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jun 2022 11:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D6GD7v0OxoQRiN+PLWPk/I3LPeDqLQnzXNY1W/TtwTQ=; b=gZPlPh4bRTWAWM9vsyz7KyFwPl
 ZU9yrDlz4CFhbD36JLeX5/a659POUAmFVCZe+piXKe6F6j0nsYxdX1Mc2UEUX7XNq6YmTBdaVGRua
 /HgJPpEdArS0HD92yeO0ZYehtWRJxTuZuvqn+YlMQMT133b6PMIat7tVzdXw7ifof9YyxyKPp12K8
 9F7ZAaX/t2aU7m7rTDPXHS7iCPaNODfQlsj8RYYuhSKFH/P0IfNPSbf1Ch4t7/5WCq2IapIZs38zL
 yeozHzaIZIpqEJ3tbIK0uR+AAXn2DUpEEAdGVPtrv1568qARjisNNEPtbfT7KbzHRLOImRXJmjOuL
 6ea98NTA==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
 by mx.kernkonzept.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
 id 1o3blo-005hKr-Fd; Tue, 21 Jun 2022 13:10:08 +0200
From: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>
Subject: [PATCH 0/2] virtio_mmio: Fix suspend to disk (hibernation)
Date: Tue, 21 Jun 2022 13:06:19 +0200
Message-Id: <20220621110621.3638025-1-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Cc: Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

At the moment suspend to disk (hibernation) works correctly when using
virtio_pci, but not when using virtio_mmio. This is because virtio_mmio
does not call the freeze/restore callbacks provided by most virtio
drivers.

Fix this by adding the missing PM calls to virtio_mmio and restore
the guest page size for the legacy version of virtio_mmio.

Stephan Gerhold (2):
  virtio_mmio: Add missing PM calls to freeze/restore
  virtio_mmio: Restore guest page size on resume

 drivers/virtio/virtio_mmio.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

-- 
2.30.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
