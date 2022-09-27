Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F295EBBE2
	for <lists.virtualization@lfdr.de>; Tue, 27 Sep 2022 09:48:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4129281308;
	Tue, 27 Sep 2022 07:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4129281308
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iGE9yWnQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l1RLppv51gdh; Tue, 27 Sep 2022 07:48:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 1C9348130C;
	Tue, 27 Sep 2022 07:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9348130C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B162C0078;
	Tue, 27 Sep 2022 07:48:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 95F50C002D
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 07:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 646106101F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 07:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 646106101F
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=iGE9yWnQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nO8HXeGDKwMr
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 07:48:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A226260F54
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A226260F54
 for <virtualization@lists.linux-foundation.org>;
 Tue, 27 Sep 2022 07:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664264905;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Epw8BTEITTG51o1ixLVEgGzqrZgiUy5p9Cv+5Yl00kA=;
 b=iGE9yWnQ+2aiCTzXQDP4DqL+fjsvT25Mci1TGq09tq9PpTaknSdz7zZdiGHN9UltyYl18F
 0M7kEqM2c3/LwZlcP4NdDUgm8AWYl/BhkanUk2i6X2tp0cDNbeU5qrKmCQEwjxerHifd3p
 n0p14pxAdqlt0TZIJBUfMg71NDR1QTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-g2io9IK_MOaSBbTLx4aq0w-1; Tue, 27 Sep 2022 03:48:19 -0400
X-MC-Unique: g2io9IK_MOaSBbTLx4aq0w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C6B1101A528;
 Tue, 27 Sep 2022 07:48:18 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-192.pek2.redhat.com
 [10.72.13.192])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFC4E140EBF3;
 Tue, 27 Sep 2022 07:48:12 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V3 0/3] vdpa: device feature provisioning
Date: Tue, 27 Sep 2022 15:48:07 +0800
Message-Id: <20220927074810.28627-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Cc: lulu@redhat.com, xieyongji@bytedance.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, wuzongyong@linux.alibaba.com, elic@nvidia.com,
 lingshan.zhu@intel.com
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

Virtio features are neogiated between the device and the drivers. This
allows the mediation layer like vDPA to hide some features from the
driver to faciliate the cross vendor live migration:

vDPA on the source supports feature set X
vDPA on the destination supports feature set Y

Management can simply provision the vDPA instance with features X&Y on
both source and destination to let the vDPA can be migrate-able
between the two vDPA devies with different features support.

This series tries to allow the device features to be provisioned via
netlink to achieve this.

Changes since V2:

- remove the unnecessary and operation for the devie_features after
  validating it is a subset of what device supports
- provison the features via vdpasim_create() to benefit all type of
  simulators
- fix the reference leak when fail to provision feature for vp_vdpa
- add a warn when failing to provision vp_vdpa device features

Changes since V1:

- Add vdpa tool command output

Please review.

Jason Wang (3):
  vdpa: device feature provisioning
  vdpa_sim_net: support feature provisioning
  vp_vdpa: support feature provisioning

 drivers/vdpa/vdpa.c                  |  5 +++++
 drivers/vdpa/vdpa_sim/vdpa_sim.c     | 12 +++++++++++-
 drivers/vdpa/vdpa_sim/vdpa_sim.h     |  3 ++-
 drivers/vdpa/vdpa_sim/vdpa_sim_blk.c |  2 +-
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c |  5 +++--
 drivers/vdpa/virtio_pci/vp_vdpa.c    | 22 ++++++++++++++++++++--
 include/linux/vdpa.h                 |  1 +
 include/uapi/linux/vdpa.h            |  2 ++
 8 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
