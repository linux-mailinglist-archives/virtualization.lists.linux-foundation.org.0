Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A6418615
	for <lists.virtualization@lfdr.de>; Sun, 26 Sep 2021 06:18:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9073540125;
	Sun, 26 Sep 2021 04:18:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7H1MwrZ5VI42; Sun, 26 Sep 2021 04:18:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 3B38540243;
	Sun, 26 Sep 2021 04:18:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD37FC001E;
	Sun, 26 Sep 2021 04:18:48 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2C8FC000D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Sep 2021 04:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AB8E40218
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Sep 2021 04:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSpmNlTMzcGE
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Sep 2021 04:18:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 34BEC40125
 for <virtualization@lists.linux-foundation.org>;
 Sun, 26 Sep 2021 04:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632629923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZVfqG5ktaedjHM4YPTY+LSy+ZXEciFFCc/QZiCi+cE=;
 b=F9vXSoRSLYrXmCtZ91TXmte6gk86WBrHk1UpctzdLd4Rnee/X6Pid/YIZh5vFcMAmU9jz/
 6XspPUZVEiaOAXORPHPZhAQnAPt9dfWDhyELEPxyFSsppSiqJBOd+pKQQDWa4mLWGTupno
 MTB/0VIUZ/xQO10UzzR8iOHSYlZfFgY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-boUq3HQUPoCx3mTF_x1uew-1; Sun, 26 Sep 2021 00:18:39 -0400
X-MC-Unique: boUq3HQUPoCx3mTF_x1uew-1
Received: by mail-lf1-f72.google.com with SMTP id
 t187-20020a19c3c4000000b003fc1361fb20so13028477lff.0
 for <virtualization@lists.linux-foundation.org>;
 Sat, 25 Sep 2021 21:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZVfqG5ktaedjHM4YPTY+LSy+ZXEciFFCc/QZiCi+cE=;
 b=YYNv/aidTB+bq+8vuPcA0KV11+EdDooX8U0Uu+heX0Ivn8ixWjTihUN1jeKdv9NmIO
 SoArLvYP4XAJY+Rh+LyHCeEpgrR7VERZpHb4uVsoEMW5Zfkb2+XRKmWRUaBEIhPVMWx3
 OO3OdoOPiwP/hULrb8G6vFBKUWVnZ+lybiBxRyl0DI4nuiDougo3pDGb73B+7XAwu7dl
 fxtOrpVKboMv86PWtA+ycHFA/mvx80+xysvpFJoEqMOSzlikmPGmVFDYOPRKFFLWkvMU
 DmNfvG34WAk6Xf93SBY7hEwERwD1joHmJDjbyNJma+mYyEKayxoRmnadR/5XtGiVR9Uy
 4eyw==
X-Gm-Message-State: AOAM5330kX7jSYuRpgp13HGMhI+q89dbqWK3sS0CM+FXyLWYqixIvrqg
 rOgJjDO/EulH8nEZ3ophIJhK+PrGeUmMnaSrHFzPxspEG2PhdIYY+E76EDoCu4agQvDp30sq2GD
 30BCPfCX8PB3zLGfc/140v4dM7nJKyd85jS3QhPuxw5RNP2+xaIzTnUlfPg==
X-Received: by 2002:a2e:b88a:: with SMTP id r10mr20499831ljp.362.1632629918000; 
 Sat, 25 Sep 2021 21:18:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznr7ktV0dqN6uLd3BmLMRzHzxE3PZ+ZfMyoa4l0gPp7uzdL7qAx169XrxW0sYmUMZNxYL9sSxl/TnyeqAJyao=
X-Received: by 2002:a2e:b88a:: with SMTP id r10mr20499810ljp.362.1632629917680; 
 Sat, 25 Sep 2021 21:18:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631621507.git.wuzongyong@linux.alibaba.com>
 <cover.1632313398.git.wuzongyong@linux.alibaba.com>
 <296014fa3b765f2088a3183bf04e09863651a584.1632313398.git.wuzongyong@linux.alibaba.com>
 <CACGkMEt5rQv8DFdsYuJ6SF2YOsh_3YP_yzSsdL3X_n3Mfz3Gag@mail.gmail.com>
 <20210926032434.GA32570@L-PF27918B-1352.localdomain>
In-Reply-To: <20210926032434.GA32570@L-PF27918B-1352.localdomain>
From: Jason Wang <jasowang@redhat.com>
Date: Sun, 26 Sep 2021 12:18:26 +0800
Message-ID: <CACGkMEtrGtbzNrf96uz9zwZ7ohNg1-dUoMLfL4HWoZwv8Zejdw@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] eni_vdpa: add vDPA driver for Alibaba ENI
To: Wu Zongyong <wuzongyong@linux.alibaba.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: wei.yang1@linux.alibaba.com, mst <mst@redhat.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 virtualization <virtualization@lists.linux-foundation.org>
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

On Sun, Sep 26, 2021 at 11:24 AM Wu Zongyong
<wuzongyong@linux.alibaba.com> wrote:
>
> On Sun, Sep 26, 2021 at 10:24:21AM +0800, Jason Wang wrote:
> > On Wed, Sep 22, 2021 at 8:47 PM Wu Zongyong
> > <wuzongyong@linux.alibaba.com> wrote:
> > >
> > > This patch adds a new vDPA driver for Alibaba ENI(Elastic Network
> > > Interface) which is build upon virtio 0.9.5 specification.
> > > And this driver doesn't support to run on BE host.
> > >
> > > Signed-off-by: Wu Zongyong <wuzongyong@linux.alibaba.com>
> > > ---
> > >  drivers/vdpa/Kconfig            |   8 +
> > >  drivers/vdpa/Makefile           |   1 +
> > >  drivers/vdpa/alibaba/Makefile   |   3 +
> > >  drivers/vdpa/alibaba/eni_vdpa.c | 554 ++++++++++++++++++++++++++++++++
> > >  4 files changed, 566 insertions(+)
> > >  create mode 100644 drivers/vdpa/alibaba/Makefile
> > >  create mode 100644 drivers/vdpa/alibaba/eni_vdpa.c
> > >
> > > diff --git a/drivers/vdpa/Kconfig b/drivers/vdpa/Kconfig
> > > index 3d91982d8371..9587b9177b05 100644
> > > --- a/drivers/vdpa/Kconfig
> > > +++ b/drivers/vdpa/Kconfig
> > > @@ -78,4 +78,12 @@ config VP_VDPA
> > >         help
> > >           This kernel module bridges virtio PCI device to vDPA bus.
> > >
> > > +config ALIBABA_ENI_VDPA
> > > +       tristate "vDPA driver for Alibaba ENI"
> > > +       select VIRTIO_PCI_LEGACY_LIB
> > > +       depends on PCI_MSI
> > > +       help
> > > +         VDPA driver for Alibaba ENI(Elastic Network Interface) which is build upon
> > > +         virtio 0.9.5 specification.
> > > +
> > >  endif # VDPA
> > > diff --git a/drivers/vdpa/Makefile b/drivers/vdpa/Makefile
> > > index f02ebed33f19..15665563a7f4 100644
> > > --- a/drivers/vdpa/Makefile
> > > +++ b/drivers/vdpa/Makefile
> > > @@ -5,3 +5,4 @@ obj-$(CONFIG_VDPA_USER) += vdpa_user/
> > >  obj-$(CONFIG_IFCVF)    += ifcvf/
> > >  obj-$(CONFIG_MLX5_VDPA) += mlx5/
> > >  obj-$(CONFIG_VP_VDPA)    += virtio_pci/
> > > +obj-$(CONFIG_ALIBABA_ENI_VDPA) += alibaba/
> > > diff --git a/drivers/vdpa/alibaba/Makefile b/drivers/vdpa/alibaba/Makefile
> > > new file mode 100644
> > > index 000000000000..ef4aae69f87a
> > > --- /dev/null
> > > +++ b/drivers/vdpa/alibaba/Makefile
> > > @@ -0,0 +1,3 @@
> > > +# SPDX-License-Identifier: GPL-2.0
> > > +obj-$(CONFIG_ALIBABA_ENI_VDPA) += eni_vdpa.o
> > > +
> > > diff --git a/drivers/vdpa/alibaba/eni_vdpa.c b/drivers/vdpa/alibaba/eni_vdpa.c
> > > new file mode 100644
> > > index 000000000000..b6eef696cec5
> > > --- /dev/null
> > > +++ b/drivers/vdpa/alibaba/eni_vdpa.c
> > > @@ -0,0 +1,554 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * vDPA bridge driver for Alibaba ENI(Elastic Network Interface)
> > > + *
> > > + * Copyright (c) 2021, Alibaba Inc. All rights reserved.
> > > + * Author: Wu Zongyong <wuzongyong@linux.alibaba.com>
> > > + *
> > > + */
> > > +
> > > +#include "linux/bits.h"
> > > +#include <linux/interrupt.h>
> > > +#include <linux/module.h>
> > > +#include <linux/pci.h>
> > > +#include <linux/vdpa.h>
> > > +#include <linux/virtio.h>
> > > +#include <linux/virtio_config.h>
> > > +#include <linux/virtio_ring.h>
> > > +#include <linux/virtio_pci.h>
> > > +#include <linux/virtio_pci_legacy.h>
> > > +#include <uapi/linux/virtio_net.h>
> > > +
> > > +#define ENI_MSIX_NAME_SIZE 256
> > > +
> > > +#define ENI_ERR(pdev, fmt, ...)        \
> > > +       dev_err(&pdev->dev, "%s"fmt, "eni_vdpa: ", ##__VA_ARGS__)
> > > +#define ENI_DBG(pdev, fmt, ...)        \
> > > +       dev_dbg(&pdev->dev, "%s"fmt, "eni_vdpa: ", ##__VA_ARGS__)
> > > +#define ENI_INFO(pdev, fmt, ...) \
> > > +       dev_info(&pdev->dev, "%s"fmt, "eni_vdpa: ", ##__VA_ARGS__)
> > > +
> > > +struct eni_vring {
> > > +       void __iomem *notify;
> > > +       char msix_name[ENI_MSIX_NAME_SIZE];
> > > +       struct vdpa_callback cb;
> > > +       int irq;
> > > +};
> > > +
> > > +struct eni_vdpa {
> > > +       struct vdpa_device vdpa;
> > > +       struct virtio_pci_legacy_device ldev;
> > > +       struct eni_vring *vring;
> > > +       struct vdpa_callback config_cb;
> > > +       char msix_name[ENI_MSIX_NAME_SIZE];
> > > +       int config_irq;
> > > +       int queues;
> > > +       int vectors;
> > > +};
> > > +
> > > +static struct eni_vdpa *vdpa_to_eni(struct vdpa_device *vdpa)
> > > +{
> > > +       return container_of(vdpa, struct eni_vdpa, vdpa);
> > > +}
> > > +
> > > +static struct virtio_pci_legacy_device *vdpa_to_ldev(struct vdpa_device *vdpa)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +
> > > +       return &eni_vdpa->ldev;
> > > +}
> > > +
> > > +static u64 eni_vdpa_get_features(struct vdpa_device *vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +       u64 features = vp_legacy_get_features(ldev);
> > > +
> > > +       features |= BIT_ULL(VIRTIO_F_ACCESS_PLATFORM);
> > > +
> > > +       return features;
> >
> > I wonder if the following can work with ENI:
> >
> > -device virtio-net-pci,mrg_rxbuf=off
> >
> > ?
>
> ENI didn't work.
> I will remove F_MRG_RXBUF when get_features.

I think we need to fail FEATURE_OK if F_MRG_RXBUF is not negotiated.
Since VERSION_1 requires a fixed header length even if F_MRG_RXBUF is
not negotiated.

But this trick doesn't come for free. If some driver doesn't support
mrg_rxbuf, it won't work.

Thanks


> >
> > Thanks
> >
> > > +}
> > > +
> > > +static int eni_vdpa_set_features(struct vdpa_device *vdpa, u64 features)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       vp_legacy_set_features(ldev, (u32)features);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static u8 eni_vdpa_get_status(struct vdpa_device *vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       return vp_legacy_get_status(ldev);
> > > +}
> > > +
> > > +static int eni_vdpa_get_vq_irq(struct vdpa_device *vdpa, u16 idx)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +       int irq = eni_vdpa->vring[idx].irq;
> > > +
> > > +       if (irq == VIRTIO_MSI_NO_VECTOR)
> > > +               return -EINVAL;
> > > +
> > > +       return irq;
> > > +}
> > > +
> > > +static void eni_vdpa_free_irq(struct eni_vdpa *eni_vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = &eni_vdpa->ldev;
> > > +       struct pci_dev *pdev = ldev->pci_dev;
> > > +       int i;
> > > +
> > > +       for (i = 0; i < eni_vdpa->queues; i++) {
> > > +               if (eni_vdpa->vring[i].irq != VIRTIO_MSI_NO_VECTOR) {
> > > +                       vp_legacy_queue_vector(ldev, i, VIRTIO_MSI_NO_VECTOR);
> > > +                       devm_free_irq(&pdev->dev, eni_vdpa->vring[i].irq,
> > > +                                     &eni_vdpa->vring[i]);
> > > +                       eni_vdpa->vring[i].irq = VIRTIO_MSI_NO_VECTOR;
> > > +               }
> > > +       }
> > > +
> > > +       if (eni_vdpa->config_irq != VIRTIO_MSI_NO_VECTOR) {
> > > +               vp_legacy_config_vector(ldev, VIRTIO_MSI_NO_VECTOR);
> > > +               devm_free_irq(&pdev->dev, eni_vdpa->config_irq, eni_vdpa);
> > > +               eni_vdpa->config_irq = VIRTIO_MSI_NO_VECTOR;
> > > +       }
> > > +
> > > +       if (eni_vdpa->vectors) {
> > > +               pci_free_irq_vectors(pdev);
> > > +               eni_vdpa->vectors = 0;
> > > +       }
> > > +}
> > > +
> > > +static irqreturn_t eni_vdpa_vq_handler(int irq, void *arg)
> > > +{
> > > +       struct eni_vring *vring = arg;
> > > +
> > > +       if (vring->cb.callback)
> > > +               return vring->cb.callback(vring->cb.private);
> > > +
> > > +       return IRQ_HANDLED;
> > > +}
> > > +
> > > +static irqreturn_t eni_vdpa_config_handler(int irq, void *arg)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = arg;
> > > +
> > > +       if (eni_vdpa->config_cb.callback)
> > > +               return eni_vdpa->config_cb.callback(eni_vdpa->config_cb.private);
> > > +
> > > +       return IRQ_HANDLED;
> > > +}
> > > +
> > > +static int eni_vdpa_request_irq(struct eni_vdpa *eni_vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = &eni_vdpa->ldev;
> > > +       struct pci_dev *pdev = ldev->pci_dev;
> > > +       int i, ret, irq;
> > > +       int queues = eni_vdpa->queues;
> > > +       int vectors = queues + 1;
> > > +
> > > +       ret = pci_alloc_irq_vectors(pdev, vectors, vectors, PCI_IRQ_MSIX);
> > > +       if (ret != vectors) {
> > > +               ENI_ERR(pdev,
> > > +                       "failed to allocate irq vectors want %d but %d\n",
> > > +                       vectors, ret);
> > > +               return ret;
> > > +       }
> > > +
> > > +       eni_vdpa->vectors = vectors;
> > > +
> > > +       for (i = 0; i < queues; i++) {
> > > +               snprintf(eni_vdpa->vring[i].msix_name, ENI_MSIX_NAME_SIZE,
> > > +                        "eni-vdpa[%s]-%d\n", pci_name(pdev), i);
> > > +               irq = pci_irq_vector(pdev, i);
> > > +               ret = devm_request_irq(&pdev->dev, irq,
> > > +                                      eni_vdpa_vq_handler,
> > > +                                      0, eni_vdpa->vring[i].msix_name,
> > > +                                      &eni_vdpa->vring[i]);
> > > +               if (ret) {
> > > +                       ENI_ERR(pdev, "failed to request irq for vq %d\n", i);
> > > +                       goto err;
> > > +               }
> > > +               vp_legacy_queue_vector(ldev, i, i);
> > > +               eni_vdpa->vring[i].irq = irq;
> > > +       }
> > > +
> > > +       snprintf(eni_vdpa->msix_name, ENI_MSIX_NAME_SIZE, "eni-vdpa[%s]-config\n",
> > > +                pci_name(pdev));
> > > +       irq = pci_irq_vector(pdev, queues);
> > > +       ret = devm_request_irq(&pdev->dev, irq, eni_vdpa_config_handler, 0,
> > > +                              eni_vdpa->msix_name, eni_vdpa);
> > > +       if (ret) {
> > > +               ENI_ERR(pdev, "failed to request irq for config vq %d\n", i);
> > > +               goto err;
> > > +       }
> > > +       vp_legacy_config_vector(ldev, queues);
> > > +       eni_vdpa->config_irq = irq;
> > > +
> > > +       return 0;
> > > +err:
> > > +       eni_vdpa_free_irq(eni_vdpa);
> > > +       return ret;
> > > +}
> > > +
> > > +static void eni_vdpa_set_status(struct vdpa_device *vdpa, u8 status)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +       struct virtio_pci_legacy_device *ldev = &eni_vdpa->ldev;
> > > +       u8 s = eni_vdpa_get_status(vdpa);
> > > +
> > > +       if (status & VIRTIO_CONFIG_S_DRIVER_OK &&
> > > +           !(s & VIRTIO_CONFIG_S_DRIVER_OK)) {
> > > +               eni_vdpa_request_irq(eni_vdpa);
> > > +       }
> > > +
> > > +       vp_legacy_set_status(ldev, status);
> > > +
> > > +       if (!(status & VIRTIO_CONFIG_S_DRIVER_OK) &&
> > > +           (s & VIRTIO_CONFIG_S_DRIVER_OK))
> > > +               eni_vdpa_free_irq(eni_vdpa);
> > > +}
> > > +
> > > +static int eni_vdpa_reset(struct vdpa_device *vdpa)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +       struct virtio_pci_legacy_device *ldev = &eni_vdpa->ldev;
> > > +       u8 s = eni_vdpa_get_status(vdpa);
> > > +
> > > +       vp_legacy_set_status(ldev, 0);
> > > +
> > > +       if (s & VIRTIO_CONFIG_S_DRIVER_OK)
> > > +               eni_vdpa_free_irq(eni_vdpa);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static u16 eni_vdpa_get_vq_num_max(struct vdpa_device *vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       return vp_legacy_get_queue_size(ldev, 0);
> > > +}
> > > +
> > > +static u16 eni_vdpa_get_vq_num_min(struct vdpa_device *vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       return vp_legacy_get_queue_size(ldev, 0);
> > > +}
> > > +
> > > +static int eni_vdpa_get_vq_state(struct vdpa_device *vdpa, u16 qid,
> > > +                               struct vdpa_vq_state *state)
> > > +{
> > > +       return -EOPNOTSUPP;
> > > +}
> > > +
> > > +static int eni_vdpa_set_vq_state(struct vdpa_device *vdpa, u16 qid,
> > > +                                const struct vdpa_vq_state *state)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +       const struct vdpa_vq_state_split *split = &state->split;
> > > +
> > > +       /* ENI is build upon virtio-pci specfication which not support
> > > +        * to set state of virtqueue. But if the state is equal to the
> > > +        * device initial state by chance, we can let it go.
> > > +        */
> > > +       if (!vp_legacy_get_queue_enable(ldev, qid)
> > > +           && split->avail_index == 0)
> > > +               return 0;
> > > +
> > > +       return -EOPNOTSUPP;
> > > +}
> > > +
> > > +
> > > +static void eni_vdpa_set_vq_cb(struct vdpa_device *vdpa, u16 qid,
> > > +                              struct vdpa_callback *cb)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +
> > > +       eni_vdpa->vring[qid].cb = *cb;
> > > +}
> > > +
> > > +static void eni_vdpa_set_vq_ready(struct vdpa_device *vdpa, u16 qid,
> > > +                                 bool ready)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       /* ENI is a legacy virtio-pci device. This is not supported
> > > +        * by specification. But we can disable virtqueue by setting
> > > +        * address to 0.
> > > +        */
> > > +       if (!ready)
> > > +               vp_legacy_set_queue_address(ldev, qid, 0);
> > > +}
> > > +
> > > +static bool eni_vdpa_get_vq_ready(struct vdpa_device *vdpa, u16 qid)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       return vp_legacy_get_queue_enable(ldev, qid);
> > > +}
> > > +
> > > +static void eni_vdpa_set_vq_num(struct vdpa_device *vdpa, u16 qid,
> > > +                              u32 num)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +       struct pci_dev *pdev = ldev->pci_dev;
> > > +       u16 n = vp_legacy_get_queue_size(ldev, qid);
> > > +
> > > +       /* ENI is a legacy virtio-pci device which not allow to change
> > > +        * virtqueue size. Just report a error if someone tries to
> > > +        * change it.
> > > +        */
> > > +       if (num != n)
> > > +               ENI_ERR(pdev,
> > > +                       "not support to set vq %u fixed num %u to %u\n",
> > > +                       qid, n, num);
> > > +}
> > > +
> > > +static int eni_vdpa_set_vq_address(struct vdpa_device *vdpa, u16 qid,
> > > +                                  u64 desc_area, u64 driver_area,
> > > +                                  u64 device_area)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +       u32 pfn = desc_area >> VIRTIO_PCI_QUEUE_ADDR_SHIFT;
> > > +
> > > +       vp_legacy_set_queue_address(ldev, qid, pfn);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void eni_vdpa_kick_vq(struct vdpa_device *vdpa, u16 qid)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +
> > > +       iowrite16(qid, eni_vdpa->vring[qid].notify);
> > > +}
> > > +
> > > +static u32 eni_vdpa_get_device_id(struct vdpa_device *vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       return ldev->id.device;
> > > +}
> > > +
> > > +static u32 eni_vdpa_get_vendor_id(struct vdpa_device *vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = vdpa_to_ldev(vdpa);
> > > +
> > > +       return ldev->id.vendor;
> > > +}
> > > +
> > > +static u32 eni_vdpa_get_vq_align(struct vdpa_device *vdpa)
> > > +{
> > > +       return PAGE_SIZE;
> > > +}
> > > +
> > > +static size_t eni_vdpa_get_config_size(struct vdpa_device *vdpa)
> > > +{
> > > +       return sizeof(struct virtio_net_config);
> > > +}
> > > +
> > > +
> > > +static void eni_vdpa_get_config(struct vdpa_device *vdpa,
> > > +                               unsigned int offset,
> > > +                               void *buf, unsigned int len)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +       struct virtio_pci_legacy_device *ldev = &eni_vdpa->ldev;
> > > +       void __iomem *ioaddr = ldev->ioaddr +
> > > +               VIRTIO_PCI_CONFIG_OFF(eni_vdpa->vectors) +
> > > +               offset;
> > > +       u8 *p = buf;
> > > +       int i;
> > > +
> > > +       for (i = 0; i < len; i++)
> > > +               *p++ = ioread8(ioaddr + i);
> > > +}
> > > +
> > > +static void eni_vdpa_set_config(struct vdpa_device *vdpa,
> > > +                               unsigned int offset, const void *buf,
> > > +                               unsigned int len)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +       struct virtio_pci_legacy_device *ldev = &eni_vdpa->ldev;
> > > +       void __iomem *ioaddr = ldev->ioaddr +
> > > +               VIRTIO_PCI_CONFIG_OFF(eni_vdpa->vectors) +
> > > +               offset;
> > > +       const u8 *p = buf;
> > > +       int i;
> > > +
> > > +       for (i = 0; i < len; i++)
> > > +               iowrite8(*p++, ioaddr + i);
> > > +}
> > > +
> > > +static void eni_vdpa_set_config_cb(struct vdpa_device *vdpa,
> > > +                                  struct vdpa_callback *cb)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = vdpa_to_eni(vdpa);
> > > +
> > > +       eni_vdpa->config_cb = *cb;
> > > +}
> > > +
> > > +static const struct vdpa_config_ops eni_vdpa_ops = {
> > > +       .get_features   = eni_vdpa_get_features,
> > > +       .set_features   = eni_vdpa_set_features,
> > > +       .get_status     = eni_vdpa_get_status,
> > > +       .set_status     = eni_vdpa_set_status,
> > > +       .reset          = eni_vdpa_reset,
> > > +       .get_vq_num_max = eni_vdpa_get_vq_num_max,
> > > +       .get_vq_num_min = eni_vdpa_get_vq_num_min,
> > > +       .get_vq_state   = eni_vdpa_get_vq_state,
> > > +       .set_vq_state   = eni_vdpa_set_vq_state,
> > > +       .set_vq_cb      = eni_vdpa_set_vq_cb,
> > > +       .set_vq_ready   = eni_vdpa_set_vq_ready,
> > > +       .get_vq_ready   = eni_vdpa_get_vq_ready,
> > > +       .set_vq_num     = eni_vdpa_set_vq_num,
> > > +       .set_vq_address = eni_vdpa_set_vq_address,
> > > +       .kick_vq        = eni_vdpa_kick_vq,
> > > +       .get_device_id  = eni_vdpa_get_device_id,
> > > +       .get_vendor_id  = eni_vdpa_get_vendor_id,
> > > +       .get_vq_align   = eni_vdpa_get_vq_align,
> > > +       .get_config_size = eni_vdpa_get_config_size,
> > > +       .get_config     = eni_vdpa_get_config,
> > > +       .set_config     = eni_vdpa_set_config,
> > > +       .set_config_cb  = eni_vdpa_set_config_cb,
> > > +       .get_vq_irq     = eni_vdpa_get_vq_irq,
> > > +};
> > > +
> > > +
> > > +static u16 eni_vdpa_get_num_queues(struct eni_vdpa *eni_vdpa)
> > > +{
> > > +       struct virtio_pci_legacy_device *ldev = &eni_vdpa->ldev;
> > > +       u32 features = vp_legacy_get_features(ldev);
> > > +       u16 num = 2;
> > > +
> > > +       if (features & BIT_ULL(VIRTIO_NET_F_MQ)) {
> > > +               __virtio16 max_virtqueue_pairs;
> > > +
> > > +               eni_vdpa_get_config(&eni_vdpa->vdpa,
> > > +                       offsetof(struct virtio_net_config, max_virtqueue_pairs),
> > > +                       &max_virtqueue_pairs,
> > > +                       sizeof(max_virtqueue_pairs));
> > > +               num = 2 * __virtio16_to_cpu(virtio_legacy_is_little_endian(),
> > > +                               max_virtqueue_pairs);
> > > +       }
> > > +
> > > +       if (features & BIT_ULL(VIRTIO_NET_F_CTRL_VQ))
> > > +               num += 1;
> > > +
> > > +       return num;
> > > +}
> > > +
> > > +static void eni_vdpa_free_irq_vectors(void *data)
> > > +{
> > > +       pci_free_irq_vectors(data);
> > > +}
> > > +
> > > +#ifdef __LITTLE_ENDIAN
> > > +static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > +{
> > > +       struct device *dev = &pdev->dev;
> > > +       struct eni_vdpa *eni_vdpa;
> > > +       struct virtio_pci_legacy_device *ldev;
> > > +       int ret, i;
> > > +
> > > +       ret = pcim_enable_device(pdev);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       eni_vdpa = vdpa_alloc_device(struct eni_vdpa, vdpa,
> > > +                                    dev, &eni_vdpa_ops, NULL, false);
> > > +       if (IS_ERR(eni_vdpa)) {
> > > +               ENI_ERR(pdev, "failed to allocate vDPA structure\n");
> > > +               return PTR_ERR(eni_vdpa);
> > > +       }
> > > +
> > > +       ldev = &eni_vdpa->ldev;
> > > +       ldev->pci_dev = pdev;
> > > +
> > > +       ret = vp_legacy_probe(ldev);
> > > +       if (ret) {
> > > +               ENI_ERR(pdev, "failed to probe legacy PCI device\n");
> > > +               goto err;
> > > +       }
> > > +
> > > +       pci_set_master(pdev);
> > > +       pci_set_drvdata(pdev, eni_vdpa);
> > > +
> > > +       eni_vdpa->vdpa.dma_dev = &pdev->dev;
> > > +       eni_vdpa->queues = eni_vdpa_get_num_queues(eni_vdpa);
> > > +
> > > +       ret = devm_add_action_or_reset(dev, eni_vdpa_free_irq_vectors, pdev);
> > > +       if (ret) {
> > > +               ENI_ERR(pdev,
> > > +                       "failed for adding devres for freeing irq vectors\n");
> > > +               goto err;
> > > +       }
> > > +
> > > +       eni_vdpa->vring = devm_kcalloc(&pdev->dev, eni_vdpa->queues,
> > > +                                     sizeof(*eni_vdpa->vring),
> > > +                                     GFP_KERNEL);
> > > +       if (!eni_vdpa->vring) {
> > > +               ret = -ENOMEM;
> > > +               ENI_ERR(pdev, "failed to allocate virtqueues\n");
> > > +               goto err;
> > > +       }
> > > +
> > > +       for (i = 0; i < eni_vdpa->queues; i++) {
> > > +               eni_vdpa->vring[i].irq = VIRTIO_MSI_NO_VECTOR;
> > > +               eni_vdpa->vring[i].notify = ldev->ioaddr + VIRTIO_PCI_QUEUE_NOTIFY;
> > > +       }
> > > +       eni_vdpa->config_irq = VIRTIO_MSI_NO_VECTOR;
> > > +
> > > +       ret = vdpa_register_device(&eni_vdpa->vdpa, eni_vdpa->queues);
> > > +       if (ret) {
> > > +               ENI_ERR(pdev, "failed to register to vdpa bus\n");
> > > +               goto err;
> > > +       }
> > > +
> > > +       return 0;
> > > +
> > > +err:
> > > +       put_device(&eni_vdpa->vdpa.dev);
> > > +       return ret;
> > > +}
> > > +#else
> > > +static int eni_vdpa_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > > +{
> > > +       ENI_ERR(pdev, "this driver not supported on BE host\n");
> > > +       return -ENODEV;
> > > +}
> > > +#endif
> > > +
> > > +static void eni_vdpa_remove(struct pci_dev *pdev)
> > > +{
> > > +       struct eni_vdpa *eni_vdpa = pci_get_drvdata(pdev);
> > > +
> > > +       vdpa_unregister_device(&eni_vdpa->vdpa);
> > > +       vp_legacy_remove(&eni_vdpa->ldev);
> > > +}
> > > +
> > > +static struct pci_device_id eni_pci_ids[] = {
> > > +       { PCI_DEVICE_SUB(PCI_VENDOR_ID_REDHAT_QUMRANET,
> > > +                        VIRTIO_TRANS_ID_NET,
> > > +                        PCI_SUBVENDOR_ID_REDHAT_QUMRANET,
> > > +                        VIRTIO_ID_NET) },
> > > +       { 0 },
> > > +};
> > > +
> > > +static struct pci_driver eni_vdpa_driver = {
> > > +       .name           = "alibaba-eni-vdpa",
> > > +       .id_table       = eni_pci_ids,
> > > +       .probe          = eni_vdpa_probe,
> > > +       .remove         = eni_vdpa_remove,
> > > +};
> > > +
> > > +module_pci_driver(eni_vdpa_driver);
> > > +
> > > +MODULE_AUTHOR("Wu Zongyong <wuzongyong@linux.alibaba.com>");
> > > +MODULE_DESCRIPTION("Alibaba ENI vDPA driver");
> > > +MODULE_LICENSE("GPL v2");
> > > --
> > > 2.31.1
> > >
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
