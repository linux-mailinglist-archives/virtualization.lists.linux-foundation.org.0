Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1142632374E
	for <lists.virtualization@lfdr.de>; Wed, 24 Feb 2021 07:19:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632BE60673;
	Wed, 24 Feb 2021 06:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57C2C7FOQZdz; Wed, 24 Feb 2021 06:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D6DB6F5BD;
	Wed, 24 Feb 2021 06:19:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9672BC000A;
	Wed, 24 Feb 2021 06:19:04 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63C65C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 384FE83C36
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=nvidia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ww8Ka4T7HiBF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4807083BF7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 24 Feb 2021 06:19:01 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6035efd40000>; Tue, 23 Feb 2021 22:19:00 -0800
Received: from sw-mtx-036.mtx.labs.mlnx (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Feb 2021 06:18:59 +0000
From: Parav Pandit <parav@nvidia.com>
To: <virtualization@lists.linux-foundation.org>
Subject: [PATCH linux-next 0/9] vdpa: Enable user to set mac address,
Date: Wed, 24 Feb 2021 08:18:35 +0200
Message-ID: <20210224061844.137776-1-parav@nvidia.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614147540; bh=WMAPIMcjPzu2+ZBtWb9wRcT+5Rm9vaI9zaKQCf9hsjs=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
 X-ClientProxiedBy;
 b=ef9CPTmBChJfbIi/uTAm6TatXEtsrrg9th86pFwYS70oSz9Qo3c+HHLuITEBIE1BX
 PRGc6jZUi+NCDZgcEtcEStOzSd7DWtLRs0R+vFQT3nKSnDkyXmIIYX/G4n2Z3c0abI
 Anwbzz0980gaAfNfF6InpE+MKDBUiTq15INmOtLi0JjOPQeY0mbpLs0K1FpdItxE73
 j0cOMUQsalxrfn08FLIE4Qeqxssrr8rs4PhcLVuNPoOvcWyfeqvEFhL0Q/AGxw6vjz
 mUykWkHPtx3OtyeiAWfQup32tgetn8LWsyCKrvqZiDSN9SuVjJw2pA0lDnpBPkkzCZ
 w8t3IDYQ3v0Pw==
Cc: mst@redhat.com
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

Currently user cannot set the mac address and mtu of the vdpa device.
This patchset enables users to set the mac address and mtu of the vdpa
device once the device is created.
If a vendor driver supports such configuration user can set it otherwise
user gets unsupported error.

vdpa mac address and mtu are device configuration layout fields.
To keep interface generic enough for multiple types of vdpa devices, mac
address and mtu setting is implemented as configuration layout config
knobs.
This enables to use similar config layout for other virtio devices.

An example of query & set of config layout fields for vdpa_sim_net
driver:

Configuration layout fields are set after device is created.
This enables user to change such fields at later point without destroying and
recreating the device for new config.

$ vdpa mgmtdev show
vdpasim_net:
  supported_classes net

Add the device:
$ vdpa dev add name bar mgmtdev vdpasim_net

Configure mac address and mtu:
$ vdpa dev config set bar mac 00:11:22:33:44:55 mtu 9000

In above command only mac address or only mtu can also be set.

View the config after setting:
$ vdpa dev config show
bar: mac 00:11:22:33:44:55 link up link_announce false mtu 9000 speed 0 duplex 0

Patch summary:
Patch-1 uses read only features bit to detect endianness
Patch-2 implements new config layout query command
Patch-3 implements callback for setting vdpa net config fields
Patch-4 extends vdpa_sim_net driver to implement mac, mtu setting
Patch-5 removed redundant get_config callback
Patch-6 mlx5 vdpa driver migrates to user created vdpa device
Patch-7 mlx5 vdpa driver uses random mac address when not configured
Patch-8 mlx5 vdpa driver supports user provided mac config
Patch-9 mlx5 vdpa driver uses user provided mac during rx flow steering

Eli Cohen (4):
  vdpa/mlx5: Enable user to add/delete vdpa device
  vdpa/mlx5: Provide device generated random MAC address
  vdpa/mlx5: Support configuration of MAC
  vdpa/mlx5: Forward only packets with allowed MAC address

Parav Pandit (5):
  vdpa_sim: Consider read only supported features instead of current
  vdpa: Introduce query of device config layout
  vdpa: Enable user to set mac and mtu of vdpa device
  vdpa_sim_net: Enable user to set mac address and mtu
  vdpa_sim_net: Remove redundant get_config callback

 drivers/vdpa/mlx5/net/mlx5_vnet.c    | 185 ++++++++++++++----
 drivers/vdpa/vdpa.c                  | 270 +++++++++++++++++++++++++++
 drivers/vdpa/vdpa_sim/vdpa_sim.h     |   4 +-
 drivers/vdpa/vdpa_sim/vdpa_sim_net.c |  49 +++--
 include/linux/vdpa.h                 |  16 ++
 include/uapi/linux/vdpa.h            |  12 ++
 6 files changed, 476 insertions(+), 60 deletions(-)

-- 
2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
