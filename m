Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE425585
	for <lists.virtualization@lfdr.de>; Tue, 21 May 2019 18:24:53 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DB800BE4;
	Tue, 21 May 2019 16:24:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 95856AE0
	for <virtualization@lists.linux-foundation.org>;
	Tue, 21 May 2019 16:24:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4435E27B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 21 May 2019 16:24:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4368830833AF;
	Tue, 21 May 2019 16:24:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1465F4387;
	Tue, 21 May 2019 16:24:24 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3F6A5B423;
	Tue, 21 May 2019 16:24:14 +0000 (UTC)
Date: Tue, 21 May 2019 12:24:14 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <176786650.30122184.1558455854322.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190521094543-mutt-send-email-mst@kernel.org>
References: <20190521133713.31653-1-pagupta@redhat.com>
	<20190521133713.31653-3-pagupta@redhat.com>
	<20190521094543-mutt-send-email-mst@kernel.org>
Subject: Re: [Qemu-devel] [PATCH v10 2/7] virtio-pmem: Add virtio pmem driver
MIME-Version: 1.0
X-Originating-IP: [10.67.116.105, 10.4.195.14]
Thread-Topic: virtio-pmem: Add virtio pmem driver
Thread-Index: 3AiQ7PJb9jLe5p+DRlEZBNdQ18HFYA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 21 May 2019 16:24:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: rdunlap@infradead.org, jack@suse.cz, kvm@vger.kernel.org,
	david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org, dm-devel@redhat.com,
	adilger kernel <adilger.kernel@dilger.ca>, zwisler@kernel.org,
	aarcange@redhat.com, dave jiang <dave.jiang@intel.com>,
	jstaron@google.com, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, willy@infradead.org,
	hch@infradead.org, linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, imammedo@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, nilal@redhat.com, tytso@mit.edu,
	xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	snitzer@redhat.com, cohuck@redhat.com, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
	darrick wong <darrick.wong@oracle.com>
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


> > diff --git a/include/uapi/linux/virtio_pmem.h
> > b/include/uapi/linux/virtio_pmem.h
> > new file mode 100644
> > index 000000000000..7a3e2fe52415
> > --- /dev/null
> > +++ b/include/uapi/linux/virtio_pmem.h
> > @@ -0,0 +1,35 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
> > +/*
> > + * Definitions for virtio-pmem devices.
> > + *
> > + * Copyright (C) 2019 Red Hat, Inc.
> > + *
> > + * Author(s): Pankaj Gupta <pagupta@redhat.com>
> > + */
> > +
> > +#ifndef _UAPI_LINUX_VIRTIO_PMEM_H
> > +#define _UAPI_LINUX_VIRTIO_PMEM_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/virtio_types.h>
> > +#include <linux/virtio_ids.h>
> > +#include <linux/virtio_config.h>
> > +
> > +struct virtio_pmem_config {
> > +	__le64 start;
> > +	__le64 size;
> > +};
> > +
> 
> config generally should be __u64.
> Are you sure sparse does not complain?

I used this because VIRTIO 1.1 spec says: 
"The device configuration space uses the little-endian format for multi-byte fields. "

and __le64 looks ok to me. Also, its used in other driver config as welle.g virtio-vsock

> 
> 
> > +#define VIRTIO_PMEM_REQ_TYPE_FLUSH      0
> > +
> > +struct virtio_pmem_resp {
> > +	/* Host return status corresponding to flush request */
> > +	__virtio32 ret;
> > +};
> > +
> > +struct virtio_pmem_req {
> > +	/* command type */
> > +	__virtio32 type;
> > +};
> > +
> > +#endif
> > --
> > 2.20.1
> 
> Sorry why are these __virtio32 not __le32?

I used __virtio32 for data fields for guest and host supporting different endianess.
 
Thanks,
Pankaj
> 
> --
> MST
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
