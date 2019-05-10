Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F12A1A597
	for <lists.virtualization@lfdr.de>; Sat, 11 May 2019 01:33:55 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 16294FC2;
	Fri, 10 May 2019 23:33:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id EAC11FC2
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 23:33:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B26D61FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 23:33:43 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 143so5725676oii.4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 16:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WC/y1DmHB2Y90knG08MAWJGLd/iKaXtu4mQo0QQg32o=;
	b=prtx5XbQoKn8R8zrPANnGGghcOCZK+wRPFO9hQpMhQaWx9/y/5msAKm524s/8jfR4q
	Hy/plrFCxwPLklnjRg1ytI1vkn65dKxxuODtQeQONgGnDyY1Qeyz0ulF0k6we7eJvilt
	tmVlP80ebYIRcJwK89TR50H36szz+HZnzK7WWoKiff6yLgse0PR4bCCx+krMuh/OcsHY
	rTLVV48h5/TQ1ELvZZDMwiGcklzyIYGSPlmmucHXjV/zIDskI4WdEUyDfHwtO5v/HA5K
	wzM6gR/i/MF76pXW0PLzzNQE/aQ80Tklyd5SMmPr2Rqn7ds79bCo7+Dp3zNj56KtP/n1
	rr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WC/y1DmHB2Y90knG08MAWJGLd/iKaXtu4mQo0QQg32o=;
	b=picPQIb1hiBmtty5leuKIjzMluSR4rre3WHx+paZ1rKmwi03Jb63kVYLa2UOjQAbim
	D+B5NPj4hof90vRQKE5FJmkWikSUMRJQU9Pa+DyULUxUpgunJdCtzv0fisIipbKiYi+U
	EKbUmCdShi10+lhq9sk20/k1Xp6KCA+sd29pXKG25xLeTY6fw/RKHnZY9UxnNmMyLZ6z
	sIegg7syW2FPZ0hhPSGXXDNixTudrpv/QHLFzI0UkNqlvDup+3ENGhfOiE27qq8CmuIn
	Q2cqYC7yw/AVcFVrtwJFxlPzp7wy+Pd4+KKAbBr/WUvSp64UWeRs7S1igAWPPS4Q/L1s
	O3tA==
X-Gm-Message-State: APjAAAWEOT3OKQjxOLhj79d4yoNqQMHsiGpK0Pa5Desci+92oVUNGuRs
	8BrOezTquMnO+Z+Pq92XKeArg25co2e+Fcos9JUODw==
X-Google-Smtp-Source: APXvYqy3hU8IrTm8PSkpuEnPK36JXZdIT/LmyaieX/IDEIUp9CvxH/SS4vBmVUBtvUxwooicCRs3MOkHKX/DpSGnAGY=
X-Received: by 2002:aca:de57:: with SMTP id v84mr7193950oig.149.1557531222870; 
	Fri, 10 May 2019 16:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190426050039.17460-1-pagupta@redhat.com>
	<20190426050039.17460-3-pagupta@redhat.com>
	<CAPcyv4hdT5bbgv0Gy1r0Xb3RMfE_Zpe7DV10a=F1PFeTeEt+Fw@mail.gmail.com>
	<2066697253.27249896.1557314351749.JavaMail.zimbra@redhat.com>
In-Reply-To: <2066697253.27249896.1557314351749.JavaMail.zimbra@redhat.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 10 May 2019 16:33:31 -0700
Message-ID: <CAPcyv4ifTg=_UzA_P1J6Lo_+djisrHxy+QEa_frbeq50UXHKsg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v7 2/6] virtio-pmem: Add virtio pmem driver
To: Pankaj Gupta <pagupta@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, david <david@fromorbit.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	virtualization@lists.linux-foundation.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Ross Zwisler <zwisler@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, kilobyte@angband.pl,
	Rik van Riel <riel@surriel.com>, yuval shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, lcapitulino@redhat.com,
	Nitesh Narayan Lal <nilal@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>, cohuck@redhat.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Wed, May 8, 2019 at 4:19 AM Pankaj Gupta <pagupta@redhat.com> wrote:
>
>
> Hi Dan,
>
> Thank you for the review. Please see my reply inline.
>
> >
> > Hi Pankaj,
> >
> > Some minor file placement comments below.
>
> Sure.
>
> >
> > On Thu, Apr 25, 2019 at 10:02 PM Pankaj Gupta <pagupta@redhat.com> wrote:
> > >
> > > This patch adds virtio-pmem driver for KVM guest.
> > >
> > > Guest reads the persistent memory range information from
> > > Qemu over VIRTIO and registers it on nvdimm_bus. It also
> > > creates a nd_region object with the persistent memory
> > > range information so that existing 'nvdimm/pmem' driver
> > > can reserve this into system memory map. This way
> > > 'virtio-pmem' driver uses existing functionality of pmem
> > > driver to register persistent memory compatible for DAX
> > > capable filesystems.
> > >
> > > This also provides function to perform guest flush over
> > > VIRTIO from 'pmem' driver when userspace performs flush
> > > on DAX memory range.
> > >
> > > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > > ---
> > >  drivers/nvdimm/virtio_pmem.c     | 114 +++++++++++++++++++++++++++++
> > >  drivers/virtio/Kconfig           |  10 +++
> > >  drivers/virtio/Makefile          |   1 +
> > >  drivers/virtio/pmem.c            | 118 +++++++++++++++++++++++++++++++
> > >  include/linux/virtio_pmem.h      |  60 ++++++++++++++++
> > >  include/uapi/linux/virtio_ids.h  |   1 +
> > >  include/uapi/linux/virtio_pmem.h |  10 +++
> > >  7 files changed, 314 insertions(+)
> > >  create mode 100644 drivers/nvdimm/virtio_pmem.c
> > >  create mode 100644 drivers/virtio/pmem.c
> > >  create mode 100644 include/linux/virtio_pmem.h
> > >  create mode 100644 include/uapi/linux/virtio_pmem.h
> > >
> > > diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
> > > new file mode 100644
> > > index 000000000000..66b582f751a3
> > > --- /dev/null
> > > +++ b/drivers/nvdimm/virtio_pmem.c
> > > @@ -0,0 +1,114 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * virtio_pmem.c: Virtio pmem Driver
> > > + *
> > > + * Discovers persistent memory range information
> > > + * from host and provides a virtio based flushing
> > > + * interface.
> > > + */
> > > +#include <linux/virtio_pmem.h>
> > > +#include "nd.h"
> > > +
> > > + /* The interrupt handler */
> > > +void host_ack(struct virtqueue *vq)
> > > +{
> > > +       unsigned int len;
> > > +       unsigned long flags;
> > > +       struct virtio_pmem_request *req, *req_buf;
> > > +       struct virtio_pmem *vpmem = vq->vdev->priv;
> > > +
> > > +       spin_lock_irqsave(&vpmem->pmem_lock, flags);
> > > +       while ((req = virtqueue_get_buf(vq, &len)) != NULL) {
> > > +               req->done = true;
> > > +               wake_up(&req->host_acked);
> > > +
> > > +               if (!list_empty(&vpmem->req_list)) {
> > > +                       req_buf = list_first_entry(&vpmem->req_list,
> > > +                                       struct virtio_pmem_request, list);
> > > +                       list_del(&vpmem->req_list);
> > > +                       req_buf->wq_buf_avail = true;
> > > +                       wake_up(&req_buf->wq_buf);
> > > +               }
> > > +       }
> > > +       spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> > > +}
> > > +EXPORT_SYMBOL_GPL(host_ack);
> > > +
> > > + /* The request submission function */
> > > +int virtio_pmem_flush(struct nd_region *nd_region)
> > > +{
> > > +       int err;
> > > +       unsigned long flags;
> > > +       struct scatterlist *sgs[2], sg, ret;
> > > +       struct virtio_device *vdev = nd_region->provider_data;
> > > +       struct virtio_pmem *vpmem = vdev->priv;
> > > +       struct virtio_pmem_request *req;
> > > +
> > > +       might_sleep();
> > > +       req = kmalloc(sizeof(*req), GFP_KERNEL);
> > > +       if (!req)
> > > +               return -ENOMEM;
> > > +
> > > +       req->done = req->wq_buf_avail = false;
> > > +       strcpy(req->name, "FLUSH");
> > > +       init_waitqueue_head(&req->host_acked);
> > > +       init_waitqueue_head(&req->wq_buf);
> > > +       sg_init_one(&sg, req->name, strlen(req->name));
> > > +       sgs[0] = &sg;
> > > +       sg_init_one(&ret, &req->ret, sizeof(req->ret));
> > > +       sgs[1] = &ret;
> > > +
> > > +       spin_lock_irqsave(&vpmem->pmem_lock, flags);
> > > +       err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req, GFP_ATOMIC);
> > > +       if (err) {
> > > +               dev_err(&vdev->dev, "failed to send command to virtio pmem
> > > device\n");
> > > +
> > > +               list_add_tail(&vpmem->req_list, &req->list);
> > > +               spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> > > +
> > > +               /* When host has read buffer, this completes via host_ack
> > > */
> > > +               wait_event(req->wq_buf, req->wq_buf_avail);
> > > +               spin_lock_irqsave(&vpmem->pmem_lock, flags);
> > > +       }
> > > +       err = virtqueue_kick(vpmem->req_vq);
> > > +       spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> > > +
> > > +       if (!err) {
> > > +               err = -EIO;
> > > +               goto ret;
> > > +       }
> > > +       /* When host has read buffer, this completes via host_ack */
> > > +       wait_event(req->host_acked, req->done);
> > > +       err = req->ret;
> > > +ret:
> > > +       kfree(req);
> > > +       return err;
> > > +};
> > > +
> > > + /* The asynchronous flush callback function */
> > > +int async_pmem_flush(struct nd_region *nd_region, struct bio *bio)
> > > +{
> > > +       int rc = 0;
> > > +
> > > +       /* Create child bio for asynchronous flush and chain with
> > > +        * parent bio. Otherwise directly call nd_region flush.
> > > +        */
> > > +       if (bio && bio->bi_iter.bi_sector != -1) {
> > > +               struct bio *child = bio_alloc(GFP_ATOMIC, 0);
> > > +
> > > +               if (!child)
> > > +                       return -ENOMEM;
> > > +               bio_copy_dev(child, bio);
> > > +               child->bi_opf = REQ_PREFLUSH;
> > > +               child->bi_iter.bi_sector = -1;
> > > +               bio_chain(child, bio);
> > > +               submit_bio(child);
> > > +       } else {
> > > +               if (virtio_pmem_flush(nd_region))
> > > +                       rc = -EIO;
> > > +       }
> > > +
> > > +       return rc;
> > > +};
> > > +EXPORT_SYMBOL_GPL(async_pmem_flush);
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> > > index 35897649c24f..9f634a2ed638 100644
> > > --- a/drivers/virtio/Kconfig
> > > +++ b/drivers/virtio/Kconfig
> > > @@ -42,6 +42,16 @@ config VIRTIO_PCI_LEGACY
> > >
> > >           If unsure, say Y.
> > >
> > > +config VIRTIO_PMEM
> > > +       tristate "Support for virtio pmem driver"
> > > +       depends on VIRTIO
> > > +       depends on LIBNVDIMM
> > > +       help
> > > +       This driver provides support for virtio based flushing interface
> > > +       for persistent memory range.
> > > +
> > > +       If unsure, say M.
> > > +
> > >  config VIRTIO_BALLOON
> > >         tristate "Virtio balloon driver"
> > >         depends on VIRTIO
> > > diff --git a/drivers/virtio/Makefile b/drivers/virtio/Makefile
> > > index 3a2b5c5dcf46..143ce91eabe9 100644
> > > --- a/drivers/virtio/Makefile
> > > +++ b/drivers/virtio/Makefile
> > > @@ -6,3 +6,4 @@ virtio_pci-y := virtio_pci_modern.o virtio_pci_common.o
> > >  virtio_pci-$(CONFIG_VIRTIO_PCI_LEGACY) += virtio_pci_legacy.o
> > >  obj-$(CONFIG_VIRTIO_BALLOON) += virtio_balloon.o
> > >  obj-$(CONFIG_VIRTIO_INPUT) += virtio_input.o
> > > +obj-$(CONFIG_VIRTIO_PMEM) += pmem.o ../nvdimm/virtio_pmem.o
> > > diff --git a/drivers/virtio/pmem.c b/drivers/virtio/pmem.c
> > > new file mode 100644
> > > index 000000000000..309788628e41
> > > --- /dev/null
> > > +++ b/drivers/virtio/pmem.c
> >
> > It's not clear to me why this driver is located in drivers/virtio/
>
> Like other VIRTIO drivers, I placed it initially in drivers/virtio directory.
>
> >
> > > @@ -0,0 +1,118 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * virtio_pmem.c: Virtio pmem Driver
> > > + *
> > > + * Discovers persistent memory range information
> > > + * from host and registers the virtual pmem device
> > > + * with libnvdimm core.
> > > + */
> > > +#include <linux/virtio_pmem.h>
> > > +#include <../../drivers/nvdimm/nd.h>
> >
> > ...especially because it seems to require nvdimm internals.
> >
> > However I don't see why that header is included.
>
> Removed.
>
> >
> > In any event lets move this to drivers/nvdimm/virtio.c to live
> > alongside the other generic bus provider drivers/nvdimm/e820.c.
>
> o.k. Makes sense.
>
> >
> > > +
> > > +static struct virtio_device_id id_table[] = {
> > > +       { VIRTIO_ID_PMEM, VIRTIO_DEV_ANY_ID },
> > > +       { 0 },
> > > +};
> > > +
> > > + /* Initialize virt queue */
> > > +static int init_vq(struct virtio_pmem *vpmem)
> > > +{
> > > +       /* single vq */
> > > +       vpmem->req_vq = virtio_find_single_vq(vpmem->vdev,
> > > +                               host_ack, "flush_queue");
> > > +       if (IS_ERR(vpmem->req_vq))
> > > +               return PTR_ERR(vpmem->req_vq);
> > > +
> > > +       spin_lock_init(&vpmem->pmem_lock);
> > > +       INIT_LIST_HEAD(&vpmem->req_list);
> > > +
> > > +       return 0;
> > > +};
> > > +
> > > +static int virtio_pmem_probe(struct virtio_device *vdev)
> > > +{
> > > +       int err = 0;
> > > +       struct resource res;
> > > +       struct virtio_pmem *vpmem;
> > > +       struct nd_region_desc ndr_desc = {};
> > > +       int nid = dev_to_node(&vdev->dev);
> > > +       struct nd_region *nd_region;
> > > +
> > > +       if (!vdev->config->get) {
> > > +               dev_err(&vdev->dev, "%s failure: config access disabled\n",
> > > +                       __func__);
> > > +               return -EINVAL;
> > > +       }
> > > +
> > > +       vpmem = devm_kzalloc(&vdev->dev, sizeof(*vpmem), GFP_KERNEL);
> > > +       if (!vpmem) {
> > > +               err = -ENOMEM;
> > > +               goto out_err;
> > > +       }
> > > +
> > > +       vpmem->vdev = vdev;
> > > +       vdev->priv = vpmem;
> > > +       err = init_vq(vpmem);
> > > +       if (err)
> > > +               goto out_err;
> > > +
> > > +       virtio_cread(vpmem->vdev, struct virtio_pmem_config,
> > > +                       start, &vpmem->start);
> > > +       virtio_cread(vpmem->vdev, struct virtio_pmem_config,
> > > +                       size, &vpmem->size);
> > > +
> > > +       res.start = vpmem->start;
> > > +       res.end   = vpmem->start + vpmem->size-1;
> > > +       vpmem->nd_desc.provider_name = "virtio-pmem";
> > > +       vpmem->nd_desc.module = THIS_MODULE;
> > > +
> > > +       vpmem->nvdimm_bus = nvdimm_bus_register(&vdev->dev,
> > > +                                               &vpmem->nd_desc);
> > > +       if (!vpmem->nvdimm_bus)
> > > +               goto out_vq;
> > > +
> > > +       dev_set_drvdata(&vdev->dev, vpmem->nvdimm_bus);
> > > +
> > > +       ndr_desc.res = &res;
> > > +       ndr_desc.numa_node = nid;
> > > +       ndr_desc.flush = async_pmem_flush;
> > > +       set_bit(ND_REGION_PAGEMAP, &ndr_desc.flags);
> > > +       set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
> > > +       nd_region = nvdimm_pmem_region_create(vpmem->nvdimm_bus,
> > > &ndr_desc);
> > > +
> > > +       if (!nd_region)
> > > +               goto out_nd;
> > > +       nd_region->provider_data =  dev_to_virtio
> > > +                                       (nd_region->dev.parent->parent);
> > > +       return 0;
> > > +out_nd:
> > > +       err = -ENXIO;
> > > +       nvdimm_bus_unregister(vpmem->nvdimm_bus);
> > > +out_vq:
> > > +       vdev->config->del_vqs(vdev);
> > > +out_err:
> > > +       dev_err(&vdev->dev, "failed to register virtio pmem memory\n");
> > > +       return err;
> > > +}
> > > +
> > > +static void virtio_pmem_remove(struct virtio_device *vdev)
> > > +{
> > > +       struct nvdimm_bus *nvdimm_bus = dev_get_drvdata(&vdev->dev);
> > > +
> > > +       nvdimm_bus_unregister(nvdimm_bus);
> > > +       vdev->config->del_vqs(vdev);
> > > +       vdev->config->reset(vdev);
> > > +}
> > > +
> > > +static struct virtio_driver virtio_pmem_driver = {
> > > +       .driver.name            = KBUILD_MODNAME,
> > > +       .driver.owner           = THIS_MODULE,
> > > +       .id_table               = id_table,
> > > +       .probe                  = virtio_pmem_probe,
> > > +       .remove                 = virtio_pmem_remove,
> > > +};
> > > +
> > > +module_virtio_driver(virtio_pmem_driver);
> > > +MODULE_DEVICE_TABLE(virtio, id_table);
> > > +MODULE_DESCRIPTION("Virtio pmem driver");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/include/linux/virtio_pmem.h b/include/linux/virtio_pmem.h
> > > new file mode 100644
> > > index 000000000000..ab1da877575d
> > > --- /dev/null
> > > +++ b/include/linux/virtio_pmem.h
> >
> > Why is this a global header?
>
> This is where other virtio driver headers are also placed.
> I think this is to access uapi config file in :
>
> ./include/uapi/linux/virtio_pmem.h
>
> Is it okay if we keep 'virtio_pmem.h' in global header?

No, I don't think so. While virtio_console.h and virtio_net.h make
sense as global headers because they are consumed from multiple
drivers, there is no need for virtio_caif.h, for example, to be a
global header. I see no practical reason that the private details of
virtio_pmem.h need to be made available outside of the virtio_pmem.c
consumer.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
