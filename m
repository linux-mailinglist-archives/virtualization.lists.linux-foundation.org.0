Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id E8190410DA2
	for <lists.virtualization@lfdr.de>; Mon, 20 Sep 2021 00:39:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7758960710;
	Sun, 19 Sep 2021 22:39:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YsDe9UUcSpCj; Sun, 19 Sep 2021 22:39:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 1DB70606CF;
	Sun, 19 Sep 2021 22:39:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8A01BC000D;
	Sun, 19 Sep 2021 22:39:50 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90F66C000D
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Sep 2021 22:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CF0440350
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Sep 2021 22:39:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id esdTwXc-9WZH
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Sep 2021 22:39:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7843440347
 for <virtualization@lists.linux-foundation.org>;
 Sun, 19 Sep 2021 22:39:47 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18JM0eNS026178; 
 Sun, 19 Sep 2021 18:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=NOo7aphByIffGzCjytW4K5tlJde9y3XX6jvfzqwO2p4=;
 b=hmEz349sAfzVGCvorQoNl2rv+BgIzoGCxxoGi9gFH0JQZLebUN4z3y6GmF5MCVi/tcNK
 zVj1EpjD6Cfi8LLFt4jGsGkevWTAKJGBOZdNPFpaLePyBx5iPxl2ru7mc2O9xwwVAaTf
 FHWuk1klfbLORdws+Dl4xb72rpYLXk+oVWej8gbW1Dlg7593x/q2OTNA/87YfMFWKwFZ
 L9ONi+jE0LR3d0xGA2Sc2iVhwOaGzSuVI6HVcJBQMopl82VJdjrnQImLFfXQN8RSFEMx
 gRsRWV6fl0uzrFQ6bPOrr88vF02LhmAwZSwXO9SvNE4opEYOG2B+EtuL5GhAPjDJzUaq Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w4d49b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Sep 2021 18:39:46 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18JMaGNb021508;
 Sun, 19 Sep 2021 18:39:46 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b5w4d49ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Sep 2021 18:39:45 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18JMWoJM004446;
 Sun, 19 Sep 2021 22:39:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3b57r8h2nx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 19 Sep 2021 22:39:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18JMdd3864028960
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 19 Sep 2021 22:39:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 93A5D5208E;
 Sun, 19 Sep 2021 22:39:39 +0000 (GMT)
Received: from li-e979b1cc-23ba-11b2-a85c-dfd230f6cf82 (unknown [9.171.4.199])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id A8DB952089; 
 Sun, 19 Sep 2021 22:39:38 +0000 (GMT)
Date: Mon, 20 Sep 2021 00:39:35 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 1/1] virtio/s390: fix vritio-ccw device teardown
Message-ID: <20210920003935.1369f9fe.pasic@linux.ibm.com>
In-Reply-To: <87mtobh9xn.fsf@redhat.com>
References: <20210915215742.1793314-1-pasic@linux.ibm.com>
 <87pmt8hp5o.fsf@redhat.com>
 <20210916151835.4ab512b2.pasic@linux.ibm.com>
 <87mtobh9xn.fsf@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vo_b5A4_7bFStOBJqnClaqJfUDOVFbDR
X-Proofpoint-ORIG-GUID: DI9__-iXJR6ZE_G5dJfTm66tONOyFUfq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-19_07,2021-09-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109190167
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 bfu@redhat.com, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, kvm@vger.kernel.org,
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

On Fri, 17 Sep 2021 10:40:20 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Thu, Sep 16 2021, Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Thu, 16 Sep 2021 10:59:15 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> >  
> >> > Since commit 48720ba56891 ("virtio/s390: use DMA memory for ccw I/O and
> >> > classic notifiers") we were supposed to make sure that
> >> > virtio_ccw_release_dev() completes before the ccw device, and the
> >> > attached dma pool are torn down, but unfortunately we did not.
> >> > Before that commit it used to be OK to delay cleaning up the memory
> >> > allocated by virtio-ccw indefinitely (which isn't really intuitive for
> >> > guys used to destruction happens in reverse construction order).
> >> >
> >> > To accomplish this let us take a reference on the ccw device before we
> >> > allocate the dma_area and give it up after dma_area was freed.
> >> >
> >> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> >> > Fixes: 48720ba56891 ("virtio/s390: use DMA memory for ccw I/O and
> >> > classic notifiers")
> >> > Reported-by: bfu@redhat.com
> >> > ---
> >> >
> >> > I'm not certain this is the only hot-unplug and teardonw related problem
> >> > with virtio-ccw.
> >> >
> >> > Some things that are not perfectly clear to me:
> >> > * What would happen if we observed an hot-unplug while we are doing
> >> >   wait_event() in ccw_io_helper()? Do we get stuck? I don't thin we
> >> >   are guaranteed to receive an irq for a subchannel that is gone.    
> >> 
> >> Hm. I think we may need to do a wake_up during remove handling.  
> >
> > My guess is that the BQL is saving us from ever seeing this with QEMU
> > as the hypervisor-userspace. Nevertheless I don't think we should rely
> > on that.  
> 
> I agree. Let's do that via a separate patch.
> 

I understand you would like us to finish the discussion on the alternate
approach before giving an r-b for this patch, right?

> >  
> >>   
> >> > * cdev->online seems to be manipulated under cdev->ccwlock, but
> >> >   in virtio_ccw_remove() we look at it to decide should we clean up
> >> >   or not. What is the idea there? I guess we want to avoid doing
> >> >   if nothing is there or twice. But I don't understand how stuff
> >> >   interlocks.    
> >> 
> >> We only created the virtio device when we onlined the ccw device. Do you
> >> have a better idea how to check for that? (And yes, I'm not sure the
> >> locking is correct.)
> >>   
> >
> > Thanks, if I find time for it, I will try to understand this better and
> > come back with my findings.
> >  
> >> > * Can virtio_ccw_remove() get called while !cdev->online and 
> >> >   virtio_ccw_online() is running on a different cpu? If yes, what would
> >> >   happen then?    
> >> 
> >> All of the remove/online/... etc. callbacks are invoked via the ccw bus
> >> code. We have to trust that it gets it correct :) (Or have the common
> >> I/O layer maintainers double-check it.)
> >>   
> >
> > Vineeth, what is your take on this? Are the struct ccw_driver
> > virtio_ccw_remove and the virtio_ccw_online callbacks mutually
> > exclusive. Please notice that we may initiate the onlining by
> > calling ccw_device_set_online() from a workqueue.
> >
> > @Conny: I'm not sure what is your definition of 'it gets it correct'...
> > I doubt CIO can make things 100% foolproof in this area.  
> 
> Not 100% foolproof, but "don't online a device that is in the progress
> of going away" seems pretty basic to me.
> 

I hope Vineeth will chime in on this.

> >  
> >> >  
> >> > The main addresse of these questions is Conny ;).  
> >
> > In any case, I think we can go step by step. I would like the issue
> > this patch intends to address, addressed first. Then we can think
> > about the rest.
> >  
> >> >
> >> > An alternative to this approach would be to inc and dec the refcount
> >> > in ccw_device_dma_zalloc() and ccw_device_dma_free() respectively.    
> >> 
> >> Yeah, I also thought about that. This would give us more get/put
> >> operations, but might be the safer option.  
> >
> > My understanding is, that having the ccw device go away while in a
> > middle of doing ccw stuff (about to submit, or waiting for a channel
> > program, or whatever) was bad before.  
> 
> What do you mean with "was bad before"?

Using an already invalid pointer to the ccw device is always bad. I'm
not sure what prevented this from happening before commit 48720ba56891.
I'm aware of the fact that virtio_ccw_release_dev() didn't use to
deference the vcdev->cdev before that commit, so we didn't have this
exact problem. Can you tell me, how did we use to ensure that all
dereferences of vcdev->cdev are legit, i.e. happened while the
ccw device is still fully alive before commit 48720ba56891?

> 
> > So my intuition tells me that
> > drivers should manage explicitly. Yes virtio_ccw happens to have dma
> > memory whose lifetime is more or less the lifetime of struct virtio_ccw,
> > but that may not be always the case.  
> 
> I'm not sure what you're getting at here. Regardless of the lifetime of
> the dma memory, it depends on the presence of the ccw device to which it
> is tied. This means that the ccw device must not be released while the
> dma memory is alive. We can use the approach in your patch here due to
> the lifetime of the dma memory that virtio-ccw allocates when we start
> using the device and frees when we stop using the device, or we can use
> get/put with every allocate/release dma memory pair, which should be
> safe for everyone?
> 

What I mean is that ccw_device_dma_[zalloc,free]() take a pointer to the
ccw_device. If we get/put in those we can ensure that, provided the
alloc and the free calls are properly paired, the device will be still
alive (and the pointer valid) for the free, if it was valid for the
alloc. But it does not ensure that each and every call to alloc is with
a valid pointer, or that other uses of the pointer are OK. So I don't
think it is completely safe for everyone, because we could try to use
a pointer to a ccw device when not having any dma memory allocated from
its pool.

This patch takes reference to cdev before the pointer is published via
vcdev->cdev and drops the reference after *vcdev is freed. The idea is
that the pointee basically outlives the pointer. (Without having a full
understanding of how things are synchronized).

Regards,
Halil
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
