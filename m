Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D97D32047C
	for <lists.virtualization@lfdr.de>; Sat, 20 Feb 2021 09:46:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3224086AB3;
	Sat, 20 Feb 2021 08:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ByYZJa7b76ln; Sat, 20 Feb 2021 08:46:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A357A86A92;
	Sat, 20 Feb 2021 08:46:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 74F06C0001;
	Sat, 20 Feb 2021 08:46:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F877C0001
 for <virtualization@lists.linux-foundation.org>;
 Sat, 20 Feb 2021 08:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1D78839E7
 for <virtualization@lists.linux-foundation.org>;
 Sat, 20 Feb 2021 08:46:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plT6H4topMWV
 for <virtualization@lists.linux-foundation.org>;
 Sat, 20 Feb 2021 08:46:45 +0000 (UTC)
Received: by smtp1.osuosl.org (Postfix, from userid 1001)
 id 5D4C4839F9; Sat, 20 Feb 2021 08:46:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29536839E7
 for <virtualization@lists.linux-foundation.org>;
 Sat, 20 Feb 2021 08:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613810802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=zORzgLNQwO5lxbztLsKp7s13i+nOx6UmKJ+iNn0Boxc=;
 b=LuSWZXw5VVMPeKRWRU5unQVWQnF7bKYOsVxrTrHIS62h85BhD6VLpRh82gZwjQW6RFsAac
 /+ZsquC3tEoU7F6MTCQ1y6ys9gpT4t655yCz1Kh572isTJvAo9xnZb/vUnpfSmmtq9zsq9
 IbSghLqqMHsZqjdnv99XjCOaEgbYDsU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-kqJb9T8HOgCKf66ficOnWw-1; Sat, 20 Feb 2021 03:46:38 -0500
X-MC-Unique: kqJb9T8HOgCKf66ficOnWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 893AB803F4B;
 Sat, 20 Feb 2021 08:46:37 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-12-128.pek2.redhat.com [10.72.12.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B8F4E60C04;
 Sat, 20 Feb 2021 08:46:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com
Subject: [PATCH V4 0/2] virtio-pci: introduce modern device module
Date: Sat, 20 Feb 2021 16:46:27 +0800
Message-Id: <20210220084629.282432-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Cc: shahafs@mellanox.com, lulu@redhat.com, rdunlap@infradead.org,
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

Hi all:

This series tries to implement a vDPA driver for virtio-pci device
which will bridge between vDPA bus and virtio-pci device.

This could be used for future feature prototyping and testing.

Please review

Changes since V3:
- rebase to vhost.git

Changes since V2:

- tweak config prompt
- switch from 'cb' to 'config_cb' for vp_vdpa config interrupt
- use a macro for vp_vdpa msix name length

Changes since V1:

- don't try to use devres for virtio-pci core
- tweak the commit log
- split the patches furtherly to ease the reviewing

Changes since RFC:

- Split common codes from virito-pci and share it with vDPA driver
- Use dynamic id in order to be less confusing with virtio-pci driver
- No feature whitelist, supporting any features (mq, config etc)

Jason Wang (2):
  vdpa: set the virtqueue num during register
  vdpa: introduce virtio pci driver

 drivers/vdpa/Kconfig                 |   7 +
 drivers/vdpa/Makefile                |   1 +
 drivers/vdpa/ifcvf/ifcvf_main.c      |   5 +-
 drivers/vdpa/mlx5/net/mlx5_vnet.c    |   4 +-
 drivers/vdpa/vdpa.c                  |  18 +-
 drivers/vdpa/vdpa_sim/vdpa_sim.c     |   2 +-
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c |   2 +-
 drivers/vdpa/virtio_pci/Makefile     |   2 +
 drivers/vdpa/virtio_pci/vp_vdpa.c    | 456 +++++++++++++++++++++++++++
 include/linux/vdpa.h                 |  10 +-
 10 files changed, 487 insertions(+), 20 deletions(-)
 create mode 100644 drivers/vdpa/virtio_pci/Makefile
 create mode 100644 drivers/vdpa/virtio_pci/vp_vdpa.c

-- 
2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
