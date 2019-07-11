Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB6A65FC8
	for <lists.virtualization@lfdr.de>; Thu, 11 Jul 2019 20:54:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4BA8F54AD;
	Thu, 11 Jul 2019 18:54:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A6C954AA
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 18:46:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D5C5E895
	for <virtualization@lists.linux-foundation.org>;
	Thu, 11 Jul 2019 18:46:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 63C2130832E9;
	Thu, 11 Jul 2019 18:46:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E05A5D720;
	Thu, 11 Jul 2019 18:46:12 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C4B51818485;
	Thu, 11 Jul 2019 18:46:12 +0000 (UTC)
Date: Thu, 11 Jul 2019 14:46:11 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <1464566100.41069898.1562870771867.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190711134648-mutt-send-email-mst@kernel.org>
References: <20190710175832.17252-1-pagupta@redhat.com>
	<20190711134648-mutt-send-email-mst@kernel.org>
Subject: Re: [PATCH v2] virtio_pmem: fix sparse warning
MIME-Version: 1.0
X-Originating-IP: [10.67.116.73, 10.4.195.27]
Thread-Topic: virtio_pmem: fix sparse warning
Thread-Index: VglBfntAUfpmr8NxVnObWKSCyUc5eA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 11 Jul 2019 18:46:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-nvdimm@lists.01.org, cohuck@redhat.com, linux-kernel@vger.kernel.org,
	yuval shaia <yuval.shaia@oracle.com>,
	virtualization@lists.linux-foundation.org,
	dan j williams <dan.j.williams@intel.com>, lcapitulino@redhat.com
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


> 
> On Wed, Jul 10, 2019 at 11:28:32PM +0530, Pankaj Gupta wrote:
> > This patch fixes below sparse warning related to __virtio
> > type in virtio pmem driver. This is reported by Intel test
> > bot on linux-next tree.
> > 
> > nd_virtio.c:56:28: warning: incorrect type in assignment
> > 				(different base types)
> > nd_virtio.c:56:28:    expected unsigned int [unsigned] [usertype] type
> > nd_virtio.c:56:28:    got restricted __virtio32
> > nd_virtio.c:93:59: warning: incorrect type in argument 2
> > 				(different base types)
> > nd_virtio.c:93:59:    expected restricted __virtio32 [usertype] val
> > nd_virtio.c:93:59:    got unsigned int [unsigned] [usertype] ret
> > 
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> > ---
> > 
> > This fixes a warning, so submitting it as a separate
> > patch on top of virtio pmem series.
> > 
> >  include/uapi/linux/virtio_pmem.h | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/include/uapi/linux/virtio_pmem.h
> > b/include/uapi/linux/virtio_pmem.h
> > index efcd72f2d20d..7a7435281362 100644
> > --- a/include/uapi/linux/virtio_pmem.h
> > +++ b/include/uapi/linux/virtio_pmem.h
> > @@ -10,7 +10,7 @@
> >  #ifndef _UAPI_LINUX_VIRTIO_PMEM_H
> >  #define _UAPI_LINUX_VIRTIO_PMEM_H
> >  
> > -#include <linux/types.h>
> > +#include <linux/virtio_types.h>
> >  #include <linux/virtio_ids.h>
> >  #include <linux/virtio_config.h>
> >  
> > @@ -23,12 +23,12 @@ struct virtio_pmem_config {
> >  
> >  struct virtio_pmem_resp {
> >  	/* Host return status corresponding to flush request */
> > -	__u32 ret;
> > +	__virtio32 ret;
> >  };
> >  
> >  struct virtio_pmem_req {
> >  	/* command type */
> > -	__u32 type;
> > +	__virtio32 type;
> >  };
> >  
> >  #endif
> 
> Same comment as previously: pls use __le and fix accessors.

Now, I think I got it. 

__virtio is for legacy devices to solve the endianess. 
By default virtio 1.0 and later are little endian.
Will send updated patch soon.

Thank you,
Pankaj

> 
> > --
> > 2.20.1
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
