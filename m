Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A5411298
	for <lists.virtualization@lfdr.de>; Mon, 20 Sep 2021 12:07:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2997F826EA;
	Mon, 20 Sep 2021 10:07:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NB6liZZh0To; Mon, 20 Sep 2021 10:07:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ED8D6826FB;
	Mon, 20 Sep 2021 10:07:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 77B69C001E;
	Mon, 20 Sep 2021 10:07:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF568C000F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 10:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CB7B8826EF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 10:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CKUTG3DucCLF
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 10:07:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE897826EA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Sep 2021 10:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632132456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=odkZV5dq7VYtsOMJXDg+2n8h1mYSCLrv0qFp+DsAT2Y=;
 b=HK3D2b9LXKD32sW0h+v+vHqO0DkCa/Nu+V4PQBQHOD7C9vBDGW6V7lpwlc3pTF5jJZpfDq
 HG/KXIqL/Z4gfXre2/SfnY7JArdKRJ1e8zVan5JmjoycBD8KL9Er4v3q9mw6RQaLvswuV0
 1da4lwXwNTpadTQmQYtXnspwsJ0RsdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-OvxKwz2wN0ygX4b2jsTIuQ-1; Mon, 20 Sep 2021 06:07:33 -0400
X-MC-Unique: OvxKwz2wN0ygX4b2jsTIuQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16C8B835DE4;
 Mon, 20 Sep 2021 10:07:31 +0000 (UTC)
Received: from localhost (unknown [10.39.193.92])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C6CFE101E24F;
 Mon, 20 Sep 2021 10:07:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Vineeth Vijayan <vneethv@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 1/1] virtio/s390: fix vritio-ccw device teardown
In-Reply-To: <88b514a4416cf72cda53a31ad2e15c13586350e4.camel@linux.ibm.com>
Organization: Red Hat GmbH
References: <20210915215742.1793314-1-pasic@linux.ibm.com>
 <87pmt8hp5o.fsf@redhat.com> <20210916151835.4ab512b2.pasic@linux.ibm.com>
 <87mtobh9xn.fsf@redhat.com> <20210920003935.1369f9fe.pasic@linux.ibm.com>
 <88b514a4416cf72cda53a31ad2e15c13586350e4.camel@linux.ibm.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Mon, 20 Sep 2021 12:07:23 +0200
Message-ID: <878rzrh86c.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 bfu@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, kvm@vger.kernel.org,
 Michael Mueller <mimu@linux.ibm.com>
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

On Mon, Sep 20 2021, Vineeth Vijayan <vneethv@linux.ibm.com> wrote:

> On Mon, 2021-09-20 at 00:39 +0200, Halil Pasic wrote:
>> On Fri, 17 Sep 2021 10:40:20 +0200
>> Cornelia Huck <cohuck@redhat.com> wrote:
>> 
> ...snip...
>> > > 
>> > > Thanks, if I find time for it, I will try to understand this
>> > > better and
>> > > come back with my findings.
>> > >  
>> > > > > * Can virtio_ccw_remove() get called while !cdev->online and 
>> > > > >   virtio_ccw_online() is running on a different cpu? If yes,
>> > > > > what would
>> > > > >   happen then?    
>> > > > 
>> > > > All of the remove/online/... etc. callbacks are invoked via the
>> > > > ccw bus
>> > > > code. We have to trust that it gets it correct :) (Or have the
>> > > > common
>> > > > I/O layer maintainers double-check it.)
>> > > >   
>> > > 
>> > > Vineeth, what is your take on this? Are the struct ccw_driver
>> > > virtio_ccw_remove and the virtio_ccw_online callbacks mutually
>> > > exclusive. Please notice that we may initiate the onlining by
>> > > calling ccw_device_set_online() from a workqueue.
>> > > 
>> > > @Conny: I'm not sure what is your definition of 'it gets it
>> > > correct'...
>> > > I doubt CIO can make things 100% foolproof in this area.  
>> > 
>> > Not 100% foolproof, but "don't online a device that is in the
>> > progress
>> > of going away" seems pretty basic to me.
>> > 
>> 
>> I hope Vineeth will chime in on this.
> Considering the online/offline processing, 
> The ccw_device_set_offline function or the online/offline is handled
> inside device_lock. Also, the online_store function takes care of
> avoiding multiple online/offline processing. 
>
> Now, when we consider the unconditional remove of the device,
> I am not familiar with the virtio_ccw driver. My assumptions are based
> on how CIO/dasd drivers works. If i understand correctly, the dasd
> driver sets different flags to make sure that a device_open is getting
> prevented while the the device is in progress of offline-ing. 

Hm, if we are invoking the online/offline callbacks under the device
lock already, how would that affect the remove callback? Shouldn't they
be serialized under the device lock already? I think we are fine.

For dasd, I think they also need to deal with the block device
lifetimes. For virtio-ccw, we are basically a transport that does not
know about devices further down the chain (that are associated with the
virtio device, whose lifetime is tied to online/offline processing.) I'd
presume that the serialization above would be enough.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
