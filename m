Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E9622A82
	for <lists.virtualization@lfdr.de>; Mon, 20 May 2019 05:47:49 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2DB22A64;
	Mon, 20 May 2019 03:47:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D03947A9
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 03:47:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7FB6A7ED
	for <virtualization@lists.linux-foundation.org>;
	Mon, 20 May 2019 03:47:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CC0F9308A963;
	Mon, 20 May 2019 03:47:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0F8E611A1;
	Mon, 20 May 2019 03:47:42 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 786E518089C8;
	Mon, 20 May 2019 03:47:42 +0000 (UTC)
Date: Sun, 19 May 2019 23:47:42 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Jakub =?utf-8?Q?Staro=C5=84?= <jstaron@google.com>
Message-ID: <68418388.29774907.1558324062441.JavaMail.zimbra@redhat.com>
In-Reply-To: <1902045958.29774859.1558323977950.JavaMail.zimbra@redhat.com>
References: <20190514145422.16923-1-pagupta@redhat.com>
	<20190514145422.16923-3-pagupta@redhat.com>
	<c06514fd-8675-ba74-4b7b-ff0eb4a91605@google.com>
	<1954162775.29408078.1558071358974.JavaMail.zimbra@redhat.com>
	<5e27fa73-53f5-007a-e0c1-f32f83e5764f@google.com>
	<1902045958.29774859.1558323977950.JavaMail.zimbra@redhat.com>
Subject: Re: [Qemu-devel] [PATCH v9 2/7] virtio-pmem: Add virtio pmem driver
MIME-Version: 1.0
X-Originating-IP: [10.67.116.42, 10.4.195.12]
Thread-Topic: virtio-pmem: Add virtio pmem driver
Thread-Index: 4LLaKD2mAqtUZ1AopBm+Wwx4LVVjgdYM8BfX
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Mon, 20 May 2019 03:47:43 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com, david@fromorbit.com,
	qemu-devel@nongnu.org, virtualization@lists.linux-foundation.org,
	adilger kernel <adilger.kernel@dilger.ca>, smbarber@google.com,
	zwisler@kernel.org, aarcange@redhat.com,
	dave jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, willy@infradead.org,
	hch@infradead.org, linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, pbonzini@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, nilal@redhat.com, tytso@mit.edu,
	xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	cohuck@redhat.com, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, imammedo@redhat.com,
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


> 
> 
> > On 5/16/19 10:35 PM, Pankaj Gupta wrote:
> > > Can I take it your reviewed/acked-by? or tested-by tag? for the virtio
> > > patch :)I don't feel that I have enough expertise to give the reviewed-by
> > > tag, but you can
> > take my acked-by + tested-by.
> > 
> > Acked-by: Jakub Staron <jstaron@google.com>
> > Tested-by: Jakub Staron <jstaron@google.com>
> > 
> > No kernel panics/stalls encountered during testing this patches (v9) with
> > QEMU + xfstests.
> 
> Thank you for testing and confirming the results. I will add your tested &
> acked-by in v10.
> 
> > Some CPU stalls encountered while testing with crosvm instead of QEMU with
> > xfstests
> > (test generic/464) but no repro for QEMU, so the fault may be on the side
> > of
> > crosvm.
> 
> yes, looks like crosvm related as we did not see any of this in my and your
> testing with Qemu.

Also, they don't seem to be related with virtio-pmem.

Thanks,
Pankaj
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
