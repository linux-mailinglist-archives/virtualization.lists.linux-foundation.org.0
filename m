Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F713BB547
	for <lists.virtualization@lfdr.de>; Mon,  5 Jul 2021 04:49:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81F3B402AE;
	Mon,  5 Jul 2021 02:49:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id be4M_Wnk-N7J; Mon,  5 Jul 2021 02:49:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 503D840425;
	Mon,  5 Jul 2021 02:49:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21CEFC000E;
	Mon,  5 Jul 2021 02:49:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59DAEC0010
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 02:49:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44DE24044E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 02:49:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bkxj_NWHbrvV
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 02:49:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 312AF403C0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  5 Jul 2021 02:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625453356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BLeXj+8XKMxLFChu+De6U7Z5h/Ve0EnpqGdSTfh+Oog=;
 b=NHJZgpONmyuxBVJzep3ZjC0iordRam/hK+we7ygjzSmoPLKDWlIogOjILg3OX4gkbdUo6D
 Pyhxg2/44gTwtRCHjEMHFxqCiKwEb8lC1ASrVhYbjUyIwWReyjtXbymjPtbxfdE39wwh9R
 dGN83Q6j+CwTZ5RdVCm0/sJPYAQEFmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-xXC6zSW9MTmViJGyU_E-qA-1; Sun, 04 Jul 2021 22:49:15 -0400
X-MC-Unique: xXC6zSW9MTmViJGyU_E-qA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD287100B3AC;
 Mon,  5 Jul 2021 02:49:12 +0000 (UTC)
Received: from T590 (ovpn-13-193.pek2.redhat.com [10.72.13.193])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 759025C1A1;
 Mon,  5 Jul 2021 02:48:57 +0000 (UTC)
Date: Mon, 5 Jul 2021 10:48:53 +0800
From: Ming Lei <ming.lei@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 5/6] virtio: add one field into virtio_device for
 recording if device uses managed irq
Message-ID: <YOJzFe3xcLK279Wv@T590>
References: <20210702150555.2401722-1-ming.lei@redhat.com>
 <20210702150555.2401722-6-ming.lei@redhat.com>
 <20210702115430-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702115430-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 John Garry <john.garry@huawei.com>, linux-scsi@vger.kernel.org,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Daniel Wagner <dwagner@suse.de>, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, Wen Xiong <wenxiong@us.ibm.com>,
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>
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

On Fri, Jul 02, 2021 at 11:55:40AM -0400, Michael S. Tsirkin wrote:
> On Fri, Jul 02, 2021 at 11:05:54PM +0800, Ming Lei wrote:
> > blk-mq needs to know if the device uses managed irq, so add one field
> > to virtio_device for recording if device uses managed irq.
> > 
> > If the driver use managed irq, this flag has to be set so it can be
> > passed to blk-mq.
> > 
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Jason Wang <jasowang@redhat.com>
> > Cc: virtualization@lists.linux-foundation.org
> > Signed-off-by: Ming Lei <ming.lei@redhat.com>
> 
> 
> The API seems somewhat confusing. virtio does not request
> a managed irq as such, does it? I think it's a decision taken
> by the irq core.

vp_request_msix_vectors():

        if (desc) {
                flags |= PCI_IRQ_AFFINITY;
                desc->pre_vectors++; /* virtio config vector */
                vdev->use_managed_irq = true;
        }

        err = pci_alloc_irq_vectors_affinity(vp_dev->pci_dev, nvectors,
                                             nvectors, flags, desc);

Managed irq is used once PCI_IRQ_AFFINITY is passed to
pci_alloc_irq_vectors_affinity().

> 
> Any way to query the irq to find out if it's managed?

So far the managed info isn't exported via /proc/irq, but if one irq is
managed, its smp_affinity & smp_affinity_list attributes can't be
changed successfully.

If irq's debugfs is enabled, this info can be retrieved.


Thanks,
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
