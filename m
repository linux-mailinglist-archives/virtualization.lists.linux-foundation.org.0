Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7540B143898
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 09:44:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1F62487A2E;
	Tue, 21 Jan 2020 08:44:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S9a+3T1Sl4nk; Tue, 21 Jan 2020 08:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 27CE987A3A;
	Tue, 21 Jan 2020 08:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ECB75C0174;
	Tue, 21 Jan 2020 08:44:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20686C0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0CFDC832C6
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:44:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVLvPcyysJ2E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:44:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6C4D4823FA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 08:44:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 00:44:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; d="scan'208";a="425414145"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2020 00:44:41 -0800
Received: from shsmsx107.ccr.corp.intel.com (10.239.4.96) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 21 Jan 2020 00:44:41 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX107.ccr.corp.intel.com ([169.254.9.210]) with mapi id 14.03.0439.000;
 Tue, 21 Jan 2020 16:44:39 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Wang <jasowang@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>
Subject: RE: [PATCH 0/5] vDPA support
Thread-Topic: [PATCH 0/5] vDPA support
Thread-Index: AQHVzGp/SBLGDhHHOEaUVdPH9dzUvaf01Ivg
Date: Tue, 21 Jan 2020 08:44:39 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D73EC6B@SHSMSX104.ccr.corp.intel.com>
References: <20200116124231.20253-1-jasowang@redhat.com>
In-Reply-To: <20200116124231.20253-1-jasowang@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZjlmMDRhMzQtNDBlNy00YzU3LWI5NGYtNGU3M2IwM2FjYjMyIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidnNEbEpQRG92ODhoYlZNbFRzOVpCd3BUbVlCQ2hhem92R1RZOXJ4cEo0NDQ1dzluRUNwWlRXOGdjdjc1SkhjTCJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "shahafs@mellanox.com" <shahafs@mellanox.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "jgg@mellanox.com" <jgg@mellanox.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>, "Zhu, Lingshan" <lingshan.zhu@intel.com>,
 "jiri@mellanox.com" <jiri@mellanox.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>
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

> From: Jason Wang
> Sent: Thursday, January 16, 2020 8:42 PM
> 
> Hi all:
> 
> Based on the comments and discussion for mdev based hardware virtio
> offloading support[1]. A different approach to support vDPA device is
> proposed in this series.

Can you point to the actual link which triggered the direction change?
A quick glimpse in that thread doesn't reveal such information...

> 
> Instead of leveraging VFIO/mdev which may not work for some
> vendors. This series tries to introduce a dedicated vDPA bus and
> leverage vhost for userspace drivers. This help for the devices that
> are not fit for VFIO and may reduce the conflict when try to propose a
> bus template for virtual devices in [1].
> 
> The vDPA support is split into following parts:
> 
> 1) vDPA core (bus, device and driver abstraction)
> 2) virtio vDPA transport for kernel virtio driver to control vDPA
>    device
> 3) vhost vDPA bus driver for userspace vhost driver to control vDPA
>    device
> 4) vendor vDPA drivers
> 5) management API
> 
> Both 1) and 2) are included in this series. Tiwei will work on part
> 3). For 4), Ling Shan will work and post IFCVF driver. For 5) we leave
> it to vendor to implement, but it's better to come into an agreement
> for management to create/configure/destroy vDPA device.
> 
> The sample driver is kept but renamed to vdap_sim. An on-chip IOMMU
> implementation is added to sample device to make it work for both
> kernel virtio driver and userspace vhost driver. It implements a sysfs
> based management API, but it can switch to any other (e.g devlink) if
> necessary.
> 
> Please refer each patch for more information.
> 
> Comments are welcomed.
> 
> [1] https://lkml.org/lkml/2019/11/18/261
> 
> Jason Wang (5):
>   vhost: factor out IOTLB
>   vringh: IOTLB support
>   vDPA: introduce vDPA bus
>   virtio: introduce a vDPA based transport
>   vdpasim: vDPA device simulator
> 
>  MAINTAINERS                    |   2 +
>  drivers/vhost/Kconfig          |   7 +
>  drivers/vhost/Kconfig.vringh   |   1 +
>  drivers/vhost/Makefile         |   2 +
>  drivers/vhost/net.c            |   2 +-
>  drivers/vhost/vhost.c          | 221 +++------
>  drivers/vhost/vhost.h          |  36 +-
>  drivers/vhost/vhost_iotlb.c    | 171 +++++++
>  drivers/vhost/vringh.c         | 434 +++++++++++++++++-
>  drivers/virtio/Kconfig         |  15 +
>  drivers/virtio/Makefile        |   2 +
>  drivers/virtio/vdpa/Kconfig    |  26 ++
>  drivers/virtio/vdpa/Makefile   |   3 +
>  drivers/virtio/vdpa/vdpa.c     | 141 ++++++
>  drivers/virtio/vdpa/vdpa_sim.c | 796
> +++++++++++++++++++++++++++++++++
>  drivers/virtio/virtio_vdpa.c   | 400 +++++++++++++++++
>  include/linux/vdpa.h           | 191 ++++++++
>  include/linux/vhost_iotlb.h    |  45 ++
>  include/linux/vringh.h         |  36 ++
>  19 files changed, 2327 insertions(+), 204 deletions(-)
>  create mode 100644 drivers/vhost/vhost_iotlb.c
>  create mode 100644 drivers/virtio/vdpa/Kconfig
>  create mode 100644 drivers/virtio/vdpa/Makefile
>  create mode 100644 drivers/virtio/vdpa/vdpa.c
>  create mode 100644 drivers/virtio/vdpa/vdpa_sim.c
>  create mode 100644 drivers/virtio/virtio_vdpa.c
>  create mode 100644 include/linux/vdpa.h
>  create mode 100644 include/linux/vhost_iotlb.h
> 
> --
> 2.19.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
