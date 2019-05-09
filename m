Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F37189EC
	for <lists.virtualization@lfdr.de>; Thu,  9 May 2019 14:40:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 228B4DA5;
	Thu,  9 May 2019 12:39:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 35A3FDA6
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 12:39:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BEB1A8AA
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 12:24:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D91C307D98F;
	Thu,  9 May 2019 12:24:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA6435C226;
	Thu,  9 May 2019 12:24:25 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 257BD41F58;
	Thu,  9 May 2019 12:24:25 +0000 (UTC)
Date: Thu, 9 May 2019 08:24:24 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <511098535.27565704.1557404664499.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAPcyv4hRdvypEj4LBTMfUFm80BdpRYbOugrkkj-3Kk_LErXPqQ@mail.gmail.com>
References: <20190426050039.17460-1-pagupta@redhat.com>
	<20190426050039.17460-4-pagupta@redhat.com>
	<CAPcyv4hRdvypEj4LBTMfUFm80BdpRYbOugrkkj-3Kk_LErXPqQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] libnvdimm: add dax_dev sync flag
MIME-Version: 1.0
X-Originating-IP: [10.67.116.88, 10.4.195.16]
Thread-Topic: libnvdimm: add dax_dev sync flag
Thread-Index: ojaRi4mgEPnvOvl3Gx+91mTiXiceZg==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 09 May 2019 12:24:26 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: cohuck@redhat.com, Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
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
	Paolo Bonzini <pbonzini@redhat.com>, lcapitulino@redhat.com,
	Nitesh Narayan Lal <nilal@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Igor Mammedov <imammedo@redhat.com>
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


> >
> > This patch adds 'DAXDEV_SYNC' flag which is set
> > for nd_region doing synchronous flush. This later
> > is used to disable MAP_SYNC functionality for
> > ext4 & xfs filesystem for devices don't support
> > synchronous flush.
> >
> > Signed-off-by: Pankaj Gupta <pagupta@redhat.com>
> [..]
> > diff --git a/include/linux/dax.h b/include/linux/dax.h
> > index 0dd316a74a29..c97fc0cc7167 100644
> > --- a/include/linux/dax.h
> > +++ b/include/linux/dax.h
> > @@ -7,6 +7,9 @@
> >  #include <linux/radix-tree.h>
> >  #include <asm/pgtable.h>
> >
> > +/* Flag for synchronous flush */
> > +#define DAXDEV_F_SYNC true
> 
> I'd feel better, i.e. it reads more canonically, if this was defined
> as (1UL << 0) and the argument to alloc_dax() was changed to 'unsigned
> long flags' rather than a bool.

Sure, Will send a v8 with suggested changes.

Thank You,
Pankaj

> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
