Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id B57BC3BF5AF
	for <lists.virtualization@lfdr.de>; Thu,  8 Jul 2021 08:35:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D812606DC;
	Thu,  8 Jul 2021 06:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2zGdX9g9g4ux; Thu,  8 Jul 2021 06:35:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E3E61606D6;
	Thu,  8 Jul 2021 06:35:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63D3BC001F;
	Thu,  8 Jul 2021 06:35:32 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62BA5C000E
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 06:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AEDA402C8
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 06:35:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bsCCVs5rDFy4
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 06:35:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 176214026C
 for <virtualization@lists.linux-foundation.org>;
 Thu,  8 Jul 2021 06:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625726127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zPy2uiaqDpvQKzXrMQTnHDaQviTPg5vo1248ee1WfqU=;
 b=EH78LwrgYqt867ZLr4ComKf2XSvcfXEBlLhfo+ZonYYZBJ5MTMVCX9ElieT3v6v2qZ6SM0
 7u6Pd9bNHT1//6I070ZSCie5DXgbMTkHKybrVpKM/CWzqMugY5drMYp78aO2e8HgBj9MSi
 f3SgTbI6accg+YBKQFP/jlBdnJu7uuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-eKj7iy7QOOuaFRG8CwjXVQ-1; Thu, 08 Jul 2021 02:35:25 -0400
X-MC-Unique: eKj7iy7QOOuaFRG8CwjXVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39804100C660;
 Thu,  8 Jul 2021 06:35:23 +0000 (UTC)
Received: from T590 (ovpn-12-112.pek2.redhat.com [10.72.12.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A42B5D6A8;
 Thu,  8 Jul 2021 06:35:04 +0000 (UTC)
Date: Thu, 8 Jul 2021 14:34:59 +0800
From: Ming Lei <ming.lei@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH V2 5/6] virtio: add one field into virtio_device for
 recording if device uses managed irq
Message-ID: <YOack2zlRnGmjWWz@T590>
References: <20210702150555.2401722-1-ming.lei@redhat.com>
 <20210702150555.2401722-6-ming.lei@redhat.com>
 <20210706054203.GC17027@lst.de>
 <87bl7eqyr2.ffs@nanos.tec.linutronix.de> <YOV3HgWG6F3geECm@T590>
 <20210707140529.GA24637@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707140529.GA24637@lst.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Jens Axboe <axboe@kernel.dk>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-scsi@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, John Garry <john.garry@huawei.com>,
 linux-nvme@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-block@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wen Xiong <wenxiong@us.ibm.com>,
 Daniel Wagner <dwagner@suse.de>, Sagi Grimberg <sagi@grimberg.me>
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

On Wed, Jul 07, 2021 at 04:05:29PM +0200, Christoph Hellwig wrote:
> On Wed, Jul 07, 2021 at 05:42:54PM +0800, Ming Lei wrote:
> > The problem is that how blk-mq looks at that flag, since the device
> > representing the controller which allocates irq vectors isn't visible
> > to blk-mq.
> 
> In blk_mq_pci_map_queues and similar helpers.

Firstly it depends if drivers call into these helpers, so this way
is fragile.

Secondly, I think it isn't good to expose specific physical devices
into blk-mq which shouldn't deal with physical device directly, also
all the three helpers just duplicates same logic except for retrieving
each vector's affinity from specific physical device.

I will think about how to cleanup them.


Thanks,
Ming

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
