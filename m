Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7525F1C1D7
	for <lists.virtualization@lfdr.de>; Tue, 14 May 2019 07:27:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 382C9B7D;
	Tue, 14 May 2019 05:27:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 85488ACC
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 05:27:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0F95427B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 14 May 2019 05:27:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09F663092670;
	Tue, 14 May 2019 05:27:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F3478600C6;
	Tue, 14 May 2019 05:27:19 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9997218089C8;
	Tue, 14 May 2019 05:27:18 +0000 (UTC)
Date: Tue, 14 May 2019 01:27:17 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <676644679.28490825.1557811637861.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAPcyv4genJtCt6dp6N07_6RfPTwC6xXMhLp-dr0GWQy5q52YoA@mail.gmail.com>
References: <20190510155202.14737-1-pagupta@redhat.com>
	<20190510155202.14737-4-pagupta@redhat.com>
	<CAPcyv4hbVNRFSyS2CTbmO88uhnbeH4eiukAng2cxgbDzLfizwg@mail.gmail.com>
	<864186878.28040999.1557535549792.JavaMail.zimbra@redhat.com>
	<CAPcyv4gL3ODfOr52Ztgq7BM4gVf1cih6cj0271gcpVvpi9aFSA@mail.gmail.com>
	<2003480558.28042237.1557537797923.JavaMail.zimbra@redhat.com>
	<116369545.28425569.1557768748009.JavaMail.zimbra@redhat.com>
	<CAPcyv4genJtCt6dp6N07_6RfPTwC6xXMhLp-dr0GWQy5q52YoA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v8 3/6] libnvdimm: add dax_dev sync flag
MIME-Version: 1.0
X-Originating-IP: [10.65.16.148, 10.4.195.17]
Thread-Topic: libnvdimm: add dax_dev sync flag
Thread-Index: wQqDJDTh4d6BDzUQZjrFKazK6E2QhQ==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Tue, 14 May 2019 05:27:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jan Kara <jack@suse.cz>, KVM list <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, david <david@fromorbit.com>,
	Qemu Developers <qemu-devel@nongnu.org>,
	virtualization@lists.linux-foundation.org,
	Andreas Dilger <adilger.kernel@dilger.ca>,
	Ross Zwisler <zwisler@kernel.org>, Andrea Arcangeli <aarcange@redhat.com>,
	Dave Jiang <dave.jiang@intel.com>, jstaron@google.com,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	Vishal L Verma <vishal.l.verma@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Christoph Hellwig <hch@infradead.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>, jmoyer <jmoyer@redhat.com>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Len Brown <lenb@kernel.org>, Adam Borowski <kilobyte@angband.pl>,
	Rik van Riel <riel@surriel.com>, yuval shaia <yuval.shaia@oracle.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, lcapitulino@redhat.com,
	Nitesh Narayan Lal <nilal@redhat.com>, Theodore Ts'o <tytso@mit.edu>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>, cohuck@redhat.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-xfs <linux-xfs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
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


> >
> >
> > Hi Dan,
> >
> > While testing device mapper with DAX, I faced a bug with the commit:
> >
> > commit ad428cdb525a97d15c0349fdc80f3d58befb50df
> > Author: Dan Williams <dan.j.williams@intel.com>
> > Date:   Wed Feb 20 21:12:50 2019 -0800
> >
> > When I reverted the condition to old code[1] it worked for me. I
> > am thinking when we map two different devices (e.g with device mapper),
> > will
> > start & end pfn still point to same pgmap? Or there is something else which
> > I am missing here.
> >
> > Note: I tested only EXT4.
> >
> > [1]
> >
> > -               if (pgmap && pgmap->type == MEMORY_DEVICE_FS_DAX)
> > +               end_pgmap = get_dev_pagemap(pfn_t_to_pfn(end_pfn), NULL);
> > +               if (pgmap && pgmap == end_pgmap && pgmap->type ==
> > MEMORY_DEVICE_FS_DAX
> > +                               && pfn_t_to_page(pfn)->pgmap == pgmap
> > +                               && pfn_t_to_page(end_pfn)->pgmap == pgmap
> > +                               && pfn_t_to_pfn(pfn) ==
> > PHYS_PFN(__pa(kaddr))
> > +                               && pfn_t_to_pfn(end_pfn) ==
> > PHYS_PFN(__pa(end_kaddr)))
> 
> Ugh, yes, device-mapper continues to be an awkward fit for dax (or
> vice versa). We would either need a way to have a multi-level pfn to
> pagemap lookup for composite devices, or a way to discern that even
> though the pagemap is different that the result is still valid / not
> an indication that we have leaked into an unassociated address range.
> Perhaps a per-daxdev callback for ->dax_supported() so that
> device-mapper internals can be used for this validation.

Yes, Will look at it.

> 
> We need to get that fixed up, but I don't see it as a blocker /
> pre-requisite for virtio-pmem.

Agree. Will send virtio-pmem patch series.

Thank you,
Pankaj
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
