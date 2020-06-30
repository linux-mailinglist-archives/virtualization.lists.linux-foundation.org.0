Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D649020EF01
	for <lists.virtualization@lfdr.de>; Tue, 30 Jun 2020 09:08:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 90F4486AFB;
	Tue, 30 Jun 2020 07:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LIYjzkeX24Jb; Tue, 30 Jun 2020 07:08:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 75D7586444;
	Tue, 30 Jun 2020 07:08:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 49DE4C016E;
	Tue, 30 Jun 2020 07:08:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B30FC016E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 07:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1A0F786CBB
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 07:08:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KkI6UL7pExJf
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 07:08:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id BCC3086444
 for <virtualization@lists.linux-foundation.org>;
 Tue, 30 Jun 2020 07:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593500921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KQPYTZde0jKWzHqMrO+wD3ssUprq0n+GimCxSyznUEE=;
 b=Q9fRQyGNH1czZF7o/sn9WSg7KTbe5vDryjmOGQzrM6iMGBnFJnsL/3dlFjHkeH4yaUSPs1
 kse+NxeAvZxEOtbb8trNWzdBqOuz/0f672BBi2GNyt4ntHT6AQLSiqs4SnXfR/sqrUg7rC
 /J0lj8hH5rEsE5Ff78eQ6P6wo62iW6c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-2au5i8WnMFGbxQvN6NnLjQ-1; Tue, 30 Jun 2020 03:08:37 -0400
X-MC-Unique: 2au5i8WnMFGbxQvN6NnLjQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5852F18A0724;
 Tue, 30 Jun 2020 07:08:35 +0000 (UTC)
Received: from gondolin (ovpn-113-12.ams2.redhat.com [10.36.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F4000289B5;
 Tue, 30 Jun 2020 07:08:28 +0000 (UTC)
Date: Tue, 30 Jun 2020 09:08:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3 1/1] s390: virtio: let arch accept devices without
 IOMMU feature
Message-ID: <20200630090825.18a439f5.cohuck@redhat.com>
In-Reply-To: <20200629171241-mutt-send-email-mst@kernel.org>
References: <1592390637-17441-1-git-send-email-pmorel@linux.ibm.com>
 <1592390637-17441-2-git-send-email-pmorel@linux.ibm.com>
 <20200629115952-mutt-send-email-mst@kernel.org>
 <66f808f2-5dd9-9127-d0e8-6bafbf13fc62@linux.ibm.com>
 <20200629171241-mutt-send-email-mst@kernel.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: gor@linux.ibm.com, linux-s390@vger.kernel.org, frankja@linux.ibm.com,
 Pierre Morel <pmorel@linux.ibm.com>, thomas.lendacky@amd.com,
 heiko.carstens@de.ibm.com, linuxram@us.ibm.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, kvm@vger.kernel.org, david@gibson.dropbear.id.au
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

On Mon, 29 Jun 2020 17:18:09 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Mon, Jun 29, 2020 at 06:48:28PM +0200, Pierre Morel wrote:
> > 
> > 
> > On 2020-06-29 18:09, Michael S. Tsirkin wrote:  
> > > On Wed, Jun 17, 2020 at 12:43:57PM +0200, Pierre Morel wrote:  
> > > > An architecture protecting the guest memory against unauthorized host
> > > > access may want to enforce VIRTIO I/O device protection through the
> > > > use of VIRTIO_F_IOMMU_PLATFORM.
> > > > Let's give a chance to the architecture to accept or not devices
> > > > without VIRTIO_F_IOMMU_PLATFORM.  
> > > 
> > > I agree it's a bit misleading. Protection is enforced by memory
> > > encryption, you can't trust the hypervisor to report the bit correctly
> > > so using that as a securoty measure would be pointless.
> > > The real gain here is that broken configs are easier to
> > > debug.
> > > 
> > > Here's an attempt at a better description:
> > > 
> > > 	On some architectures, guest knows that VIRTIO_F_IOMMU_PLATFORM is
> > > 	required for virtio to function: e.g. this is the case on s390 protected
> > > 	virt guests, since otherwise guest passes encrypted guest memory to devices,
> > > 	which the device can't read. Without VIRTIO_F_IOMMU_PLATFORM the
> > > 	result is that affected memory (or even a whole page containing
> > > 	it is corrupted). Detect and fail probe instead - that is easier
> > > 	to debug.  

s/guest/the guest/ (x2)

> > 
> > Thanks indeed better aside from the "encrypted guest memory": the mechanism
> > used to avoid the access to the guest memory from the host by s390 is not
> > encryption but a hardware feature denying the general host access and
> > allowing pieces of memory to be shared between guest and host.  
> 
> s/encrypted/protected/
> 
> > As a consequence the data read from memory is not corrupted but not read at
> > all and the read error kills the hypervizor with a SIGSEGV.  
> 
> s/(or even a whole page containing it is corrupted)/can not be
> 	read and the read error kills the hypervizor with a SIGSEGV/

s/hypervizor/hypervisor/

> 
> 
> As an aside, we could maybe handle that more gracefully
> on the hypervisor side.
> 
> >   
> > > 
> > > however, now that we have described what it is (hypervisor
> > > misconfiguration) I ask a question: can we be sure this will never
> > > ever work? E.g. what if some future hypervisor gains ability to
> > > access the protected guest memory in some abstractly secure manner?  
> > 
> > The goal of the s390 PV feature is to avoid this possibility so I don't
> > think so; however, there is a possibility that some hardware VIRTIO device
> > gain access to the guest's protected memory, even such device does not exist
> > yet.
> > 
> > At the moment such device exists we will need a driver for it, at least to
> > enable the feature and apply policies, it is also one of the reasons why a
> > hook to the architecture is interesting.  
> 
> 
> Not neessarily, it could also be fully transparent. See e.g.
> recent AMD andvances allowing unmodified guests with SEV.

I guess it depends on the architecture's protection mechanism and
threat model whether this makes sense.

> 
> 
> > > We are blocking this here, and it's hard to predict the future,
> > > and a broken hypervisor can always find ways to crash the guest ...  
> > 
> > yes, this is also something to fix on the hypervizor side, Halil is working
> > on it.
> >   
> > > 
> > > IMHO it would be safer to just print a warning.
> > > What do you think?  
> > 
> > Sadly, putting a warning may not help as qemu is killed if it accesses the
> > protected memory.
> > Also note that the crash occurs not only on start but also on hotplug.

Failing to start a guest is not that bad IMHO, but crashing a guest
that is running perfectly fine is. I vote for just failing the probe if
preconditions are not met.

> > 
> > Thanks,
> > Pierre  
> 
> Well that depends on where does the warning go. If it's on a serial port
> it might be reported host side before the crash triggers.  But
> interesting point generally. How about a feature to send a warning code
> or string to host then?

I would generally expect a guest warning to stay on the guest side --
especially as the host admin and the guest admin may be different
persons. So having a general way to send an alert to from a guest to
the host is not uninteresting, although we need to be careful to avoid
the guest being able to DOS the host.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
