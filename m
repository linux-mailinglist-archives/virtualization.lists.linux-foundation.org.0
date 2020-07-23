Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6443E22ACBD
	for <lists.virtualization@lfdr.de>; Thu, 23 Jul 2020 12:41:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0712A88B41;
	Thu, 23 Jul 2020 10:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FPGolR9OgOFV; Thu, 23 Jul 2020 10:41:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C8C6889B2;
	Thu, 23 Jul 2020 10:41:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 34D70C004C;
	Thu, 23 Jul 2020 10:41:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AC54C004C
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E1AD2294A5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xMY6E0Y37Rea
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:41:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id A444424BF8
 for <virtualization@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 10:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595500872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pccu1WPz1xvuQB5MohXtpAdjUF46pMcZQ6izcbE7gFQ=;
 b=cf9AV3TDyqmb6mV+5onKC7unz7K+r8tDDm4uKbWqy7q6kF8qOMYC8qSLwrNXIqg8CcgE72
 DbAhTYXkqmS9MHgIVAcx7O6m+GJXHx+PR5pNnaVawviAE5Q5xxVJhPURNfYCoeVT+X/ax6
 5ljrCOJRQTtAbsS2a8MUR+t5udo+Fpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-dTHvbkiFOnW67wx0dFP4ew-1; Thu, 23 Jul 2020 06:41:08 -0400
X-MC-Unique: dTHvbkiFOnW67wx0dFP4ew-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8613F800460;
 Thu, 23 Jul 2020 10:41:07 +0000 (UTC)
Received: from localhost (ovpn-114-99.ams2.redhat.com [10.36.114.99])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 724D72E021;
 Thu, 23 Jul 2020 10:40:56 +0000 (UTC)
Date: Thu, 23 Jul 2020 11:40:56 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Interesting qemu/virt-manager bug about the "rotational"
 attribute on virtio-blk disks
Message-ID: <20200723104056.GN3888@redhat.com>
References: <20200716080614.GA18456@redhat.com>
 <20200716093344.7molwklwco4sdtvs@steredhat>
 <20200723103239.GD186372@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20200723103239.GD186372@stefanha-x1.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: qemu-discuss@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 virtualization@lists.linux-foundation.org
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

On Thu, Jul 23, 2020 at 11:32:39AM +0100, Stefan Hajnoczi wrote:
> On Thu, Jul 16, 2020 at 11:33:44AM +0200, Stefano Garzarella wrote:
> > +Cc Michael, Stefan, virtualization@lists.linux-foundation.org
> > 
> > On Thu, Jul 16, 2020 at 09:06:14AM +0100, Richard W.M. Jones wrote:
> > > 
> > > https://bugzilla.redhat.com/show_bug.cgi?id=1857515
> > > 
> > > A virtio-blk disk which is backed by a raw file on an SSD,
> > > inside the guest shows rotational = 1.
> > > 
> > > I assumed that qemu must have a "rotational" property for disks and
> > > this would be communicated by virtio to the guest, but qemu and virtio
> > > don't seem to have this.  Pretty surprising!  Is it called something
> > > other than "rotational"?
> > > 
> > 
> > I'm not sure if we need to add this property in QEMU, but in Linux
> > I found these flags (include/linux/blkdev.h) for the block queues:
> > 
> >     #define QUEUE_FLAG_NONROT	6	/* non-rotational device (SSD) */
> >     #define QUEUE_FLAG_VIRT		QUEUE_FLAG_NONROT /* paravirt device */
> > 
> > xen-blkfront driver is the only one that sets the QUEUE_FLAG_VIRT,
> > should we do the same in the virtio-blk driver regardless of the backend?
> 
> The ability to control this flag would be interesting for performance
> experiments.

I expect there's a pretty strong interaction between this feature and
the shared guest io_uring stuff isn't there?  I'm not sure if it'll be
a positive or negative effect though.

Rich.

> The problem with changing the default is that regressions can be
> expected. Certain workloads benefit while others regress.
> 
> I suggest:
> 1. Make it controllable so that QUEUE_FLAG_NONROT can be set or clear
>    (not hardcoded to a single value).
> 2. The device can communicate the optimal setting from the host. The
>    SCSI protocol already conveys this information. Virtio-blk needs a
>    feature bit and possibly config space field.
> 3. Make it migration-safe. It needs to be configured explicitly so the
>    value doesn't change suddenly across migration.
> 
> Stefan



-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
Fedora Windows cross-compiler. Compile Windows programs, test, and
build Windows installers. Over 100 libraries supported.
http://fedoraproject.org/wiki/MinGW

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
