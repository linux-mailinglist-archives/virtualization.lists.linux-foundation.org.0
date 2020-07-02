Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DF42C21205B
	for <lists.virtualization@lfdr.de>; Thu,  2 Jul 2020 11:51:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8265B24F51;
	Thu,  2 Jul 2020 09:51:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id roYVPTTWwmsW; Thu,  2 Jul 2020 09:51:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 07A9824F3A;
	Thu,  2 Jul 2020 09:51:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1E8EC0733;
	Thu,  2 Jul 2020 09:51:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A8F32C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8FD318AA21
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:51:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2+Eyc4FzQSNd
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:51:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 989058AA1D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Jul 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593683500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bHogEYB9LdYLmlRRtpVvkwg/X8GA9U3ZCoLaT+Iq1ZM=;
 b=GG0gC5tPwNQ1GQzo70ll5O2gYXTfldguHt2MsrnmI21GCNHdb1rLWkxz5UsWtWLXxMOiQk
 rOdpVe0VQImR3NlQZQ5VCb8D4yTd1Bgk1mMSvf8KmaIqYTH5sMGqvBublwgqxXx1bjLT2Y
 2KuJ2TyGO/8cAL7lrYAJvUg1tT7YHO4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-CqncoWVMPlqtrDwWv2iFQg-1; Thu, 02 Jul 2020 05:51:36 -0400
X-MC-Unique: CqncoWVMPlqtrDwWv2iFQg-1
Received: by mail-wr1-f70.google.com with SMTP id o12so24484733wrj.23
 for <virtualization@lists.linux-foundation.org>;
 Thu, 02 Jul 2020 02:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bHogEYB9LdYLmlRRtpVvkwg/X8GA9U3ZCoLaT+Iq1ZM=;
 b=PVR8fFYfYYd074glARkDY+cajS6oYo0CHew9DUHfjtB7ivGkCb63wm0uMsaTplbrid
 EDYJfQGWf+KSGDffC3Qp3N4EtaxkSUSa4ceOkGMqw0X36brqEdL912O0vtVb/JkK3YES
 u2IbOO8bEBhzt+y4UbeR9u8bv5n/jef+pUu4xMTSCL1HEkNB+onkYGiYBOd4G1XGNbmg
 gj/SjlDS6mANFOHW08+3GB2z2/07wDP70eKig+f/yLTNQn0T4+YioguNySo81MiPTs+T
 Ei7RjXClmotNKmuYTEXn9M+VyPNXLQGW8QNxgZmvqRmKXvQ5D9uJvVHseptk0/ZHPXbW
 rjfA==
X-Gm-Message-State: AOAM533Wuo/NNyOZKI+/8t9Y41HnrHupbYnHCat4Sf0YTkUr5F/kh+BP
 uxTF1QWd3l2fYYkuaxUewmbC+90xL0Xo6D/zIBwyCDn6KBatp8Imve9X8DqW6u8VO13ypfEKRgL
 +b6LYhAqx/I7bnWYDD1HKQaEKPn5cvws1z+0KQ1ZiYA==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr32647458wru.115.1593683494975; 
 Thu, 02 Jul 2020 02:51:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXVWeInx8Is6mzpEdmO8KzqqisDChfcd/0ZxL7aKAX8BZJxTsoFC5nkJpDq8uHhK7haSamAg==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr32647426wru.115.1593683494694; 
 Thu, 02 Jul 2020 02:51:34 -0700 (PDT)
Received: from redhat.com ([93.157.82.4])
 by smtp.gmail.com with ESMTPSA id 138sm4695866wmb.1.2020.07.02.02.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 02:51:33 -0700 (PDT)
Date: Thu, 2 Jul 2020 05:51:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
Subject: Re: [RFC PATCH 00/22] Enhance VHOST to enable SoC-to-SoC communication
Message-ID: <20200702055026-mutt-send-email-mst@kernel.org>
References: <20200702082143.25259-1-kishon@ti.com>
MIME-Version: 1.0
In-Reply-To: <20200702082143.25259-1-kishon@ti.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Allen Hubbe <allenbh@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Dave Jiang <dave.jiang@intel.com>, kvm@vger.kernel.org,
 linux-ntb@googlegroups.com, linux-doc@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 netdev@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Jon Mason <jdmason@kudzu.us>, Bjorn Helgaas <bhelgaas@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, virtualization@lists.linux-foundation.org
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

On Thu, Jul 02, 2020 at 01:51:21PM +0530, Kishon Vijay Abraham I wrote:
> This series enhances Linux Vhost support to enable SoC-to-SoC
> communication over MMIO. This series enables rpmsg communication between
> two SoCs using both PCIe RC<->EP and HOST1-NTB-HOST2
> 
> 1) Modify vhost to use standard Linux driver model
> 2) Add support in vring to access virtqueue over MMIO
> 3) Add vhost client driver for rpmsg
> 4) Add PCIe RC driver (uses virtio) and PCIe EP driver (uses vhost) for
>    rpmsg communication between two SoCs connected to each other
> 5) Add NTB Virtio driver and NTB Vhost driver for rpmsg communication
>    between two SoCs connected via NTB
> 6) Add configfs to configure the components
> 
> UseCase1 :
> 
>  VHOST RPMSG                     VIRTIO RPMSG
>       +                               +
>       |                               |
>       |                               |
>       |                               |
>       |                               |
> +-----v------+                 +------v-------+
> |   Linux    |                 |     Linux    |
> |  Endpoint  |                 | Root Complex |
> |            <----------------->              |
> |            |                 |              |
> |    SOC1    |                 |     SOC2     |
> +------------+                 +--------------+
> 
> UseCase 2:
> 
>      VHOST RPMSG                                      VIRTIO RPMSG
>           +                                                 +
>           |                                                 |
>           |                                                 |
>           |                                                 |
>           |                                                 |
>    +------v------+                                   +------v------+
>    |             |                                   |             |
>    |    HOST1    |                                   |    HOST2    |
>    |             |                                   |             |
>    +------^------+                                   +------^------+
>           |                                                 |
>           |                                                 |
> +---------------------------------------------------------------------+
> |  +------v------+                                   +------v------+  |
> |  |             |                                   |             |  |
> |  |     EP      |                                   |     EP      |  |
> |  | CONTROLLER1 |                                   | CONTROLLER2 |  |
> |  |             <----------------------------------->             |  |
> |  |             |                                   |             |  |
> |  |             |                                   |             |  |
> |  |             |  SoC With Multiple EP Instances   |             |  |
> |  |             |  (Configured using NTB Function)  |             |  |
> |  +-------------+                                   +-------------+  |
> +---------------------------------------------------------------------+
> 
> Software Layering:
> 
> The high-level SW layering should look something like below. This series
> adds support only for RPMSG VHOST, however something similar should be
> done for net and scsi. With that any vhost device (PCI, NTB, Platform
> device, user) can use any of the vhost client driver.
> 
> 
>     +----------------+  +-----------+  +------------+  +----------+
>     |  RPMSG VHOST   |  | NET VHOST |  | SCSI VHOST |  |    X     |
>     +-------^--------+  +-----^-----+  +-----^------+  +----^-----+
>             |                 |              |              |
>             |                 |              |              |
>             |                 |              |              |
> +-----------v-----------------v--------------v--------------v----------+
> |                            VHOST CORE                                |
> +--------^---------------^--------------------^------------------^-----+
>          |               |                    |                  |
>          |               |                    |                  |
>          |               |                    |                  |
> +--------v-------+  +----v------+  +----------v----------+  +----v-----+
> |  PCI EPF VHOST |  | NTB VHOST |  |PLATFORM DEVICE VHOST|  |    X     |
> +----------------+  +-----------+  +---------------------+  +----------+
> 
> This was initially proposed here [1]
> 
> [1] -> https://lore.kernel.org/r/2cf00ec4-1ed6-f66e-6897-006d1a5b6390@ti.com


I find this very interesting. A huge patchset so will take a bit
to review, but I certainly plan to do that. Thanks!

> 
> Kishon Vijay Abraham I (22):
>   vhost: Make _feature_ bits a property of vhost device
>   vhost: Introduce standard Linux driver model in VHOST
>   vhost: Add ops for the VHOST driver to configure VHOST device
>   vringh: Add helpers to access vring in MMIO
>   vhost: Add MMIO helpers for operations on vhost virtqueue
>   vhost: Introduce configfs entry for configuring VHOST
>   virtio_pci: Use request_threaded_irq() instead of request_irq()
>   rpmsg: virtio_rpmsg_bus: Disable receive virtqueue callback when
>     reading messages
>   rpmsg: Introduce configfs entry for configuring rpmsg
>   rpmsg: virtio_rpmsg_bus: Add Address Service Notification support
>   rpmsg: virtio_rpmsg_bus: Move generic rpmsg structure to
>     rpmsg_internal.h
>   virtio: Add ops to allocate and free buffer
>   rpmsg: virtio_rpmsg_bus: Use virtio_alloc_buffer() and
>     virtio_free_buffer()
>   rpmsg: Add VHOST based remote processor messaging bus
>   samples/rpmsg: Setup delayed work to send message
>   samples/rpmsg: Wait for address to be bound to rpdev for sending
>     message
>   rpmsg.txt: Add Documentation to configure rpmsg using configfs
>   virtio_pci: Add VIRTIO driver for VHOST on Configurable PCIe Endpoint
>     device
>   PCI: endpoint: Add EP function driver to provide VHOST interface
>   NTB: Add a new NTB client driver to implement VIRTIO functionality
>   NTB: Add a new NTB client driver to implement VHOST functionality
>   NTB: Describe the ntb_virtio and ntb_vhost client in the documentation
> 
>  Documentation/driver-api/ntb.rst              |   11 +
>  Documentation/rpmsg.txt                       |   56 +
>  drivers/ntb/Kconfig                           |   18 +
>  drivers/ntb/Makefile                          |    2 +
>  drivers/ntb/ntb_vhost.c                       |  776 +++++++++++
>  drivers/ntb/ntb_virtio.c                      |  853 ++++++++++++
>  drivers/ntb/ntb_virtio.h                      |   56 +
>  drivers/pci/endpoint/functions/Kconfig        |   11 +
>  drivers/pci/endpoint/functions/Makefile       |    1 +
>  .../pci/endpoint/functions/pci-epf-vhost.c    | 1144 ++++++++++++++++
>  drivers/rpmsg/Kconfig                         |   10 +
>  drivers/rpmsg/Makefile                        |    3 +-
>  drivers/rpmsg/rpmsg_cfs.c                     |  394 ++++++
>  drivers/rpmsg/rpmsg_core.c                    |    7 +
>  drivers/rpmsg/rpmsg_internal.h                |  136 ++
>  drivers/rpmsg/vhost_rpmsg_bus.c               | 1151 +++++++++++++++++
>  drivers/rpmsg/virtio_rpmsg_bus.c              |  184 ++-
>  drivers/vhost/Kconfig                         |    1 +
>  drivers/vhost/Makefile                        |    2 +-
>  drivers/vhost/net.c                           |   10 +-
>  drivers/vhost/scsi.c                          |   24 +-
>  drivers/vhost/test.c                          |   17 +-
>  drivers/vhost/vdpa.c                          |    2 +-
>  drivers/vhost/vhost.c                         |  730 ++++++++++-
>  drivers/vhost/vhost_cfs.c                     |  341 +++++
>  drivers/vhost/vringh.c                        |  332 +++++
>  drivers/vhost/vsock.c                         |   20 +-
>  drivers/virtio/Kconfig                        |    9 +
>  drivers/virtio/Makefile                       |    1 +
>  drivers/virtio/virtio_pci_common.c            |   25 +-
>  drivers/virtio/virtio_pci_epf.c               |  670 ++++++++++
>  include/linux/mod_devicetable.h               |    6 +
>  include/linux/rpmsg.h                         |    6 +
>  {drivers/vhost => include/linux}/vhost.h      |  132 +-
>  include/linux/virtio.h                        |    3 +
>  include/linux/virtio_config.h                 |   42 +
>  include/linux/vringh.h                        |   46 +
>  samples/rpmsg/rpmsg_client_sample.c           |   32 +-
>  tools/virtio/virtio_test.c                    |    2 +-
>  39 files changed, 7083 insertions(+), 183 deletions(-)
>  create mode 100644 drivers/ntb/ntb_vhost.c
>  create mode 100644 drivers/ntb/ntb_virtio.c
>  create mode 100644 drivers/ntb/ntb_virtio.h
>  create mode 100644 drivers/pci/endpoint/functions/pci-epf-vhost.c
>  create mode 100644 drivers/rpmsg/rpmsg_cfs.c
>  create mode 100644 drivers/rpmsg/vhost_rpmsg_bus.c
>  create mode 100644 drivers/vhost/vhost_cfs.c
>  create mode 100644 drivers/virtio/virtio_pci_epf.c
>  rename {drivers/vhost => include/linux}/vhost.h (66%)
> 
> -- 
> 2.17.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
