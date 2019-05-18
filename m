Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 425E622469
	for <lists.virtualization@lfdr.de>; Sat, 18 May 2019 20:11:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 95212AAE;
	Sat, 18 May 2019 18:11:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 269C2A59
	for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 18:11:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7B563837
	for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 18:11:10 +0000 (UTC)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4II8VhS093630 for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 14:11:09 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sjccc054j-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Sat, 18 May 2019 14:11:09 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Sat, 18 May 2019 19:11:07 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Sat, 18 May 2019 19:11:04 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4IIB2L146989462
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Sat, 18 May 2019 18:11:02 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A30A14C04E;
	Sat, 18 May 2019 18:11:02 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D55364C046;
	Sat, 18 May 2019 18:11:01 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.62.129])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sat, 18 May 2019 18:11:01 +0000 (GMT)
Date: Sat, 18 May 2019 20:11:00 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
In-Reply-To: <20190516082928.1371696b.cohuck@redhat.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
	<20190513114136.783c851c.cohuck@redhat.com>
	<20190515225158.301af387.pasic@linux.ibm.com>
	<20190516082928.1371696b.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051818-0028-0000-0000-0000036F18EB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051818-0029-0000-0000-0000242EBA85
Message-Id: <20190518201100.0fd07d7f.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-18_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905180131
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
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

On Thu, 16 May 2019 08:29:28 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 15 May 2019 22:51:58 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 
> > On Mon, 13 May 2019 11:41:36 +0200
> > Cornelia Huck <cohuck@redhat.com> wrote:
> > 
> > > On Fri, 26 Apr 2019 20:32:41 +0200
> > > Halil Pasic <pasic@linux.ibm.com> wrote:
> > >   
> > > > As virtio-ccw devices are channel devices, we need to use the dma area
> > > > for any communication with the hypervisor.
> > > > 
> > > > This patch addresses the most basic stuff (mostly what is required for
> > > > virtio-ccw), and does take care of QDIO or any devices.  
> > > 
> > > "does not take care of QDIO", surely?   
> > 
> > I did not bother making the QDIO library code use dma memory for
> > anything that is conceptually dma memory. AFAIK QDIO is out of scope for
> > prot virt for now. If one were to do some emulated qdio with prot virt
> > guests, one wound need to make a bunch of things shared.
> 
> And unless you wanted to support protected virt under z/VM as well, it
> would be wasted effort :)
> 

:)

> > 
> > > (Also, what does "any devices"
> > > mean? Do you mean "every arbitrary device", perhaps?)  
> > 
> > What I mean is: this patch takes care of the core stuff, but any
> > particular device is likely to have to do more -- that is it ain't all
> > the cio devices support prot virt with this patch. For example
> > virtio-ccw needs to make sure that the ccws constituting the channel
> > programs, as well as the data pointed by the ccws is shared. If one
> > would want to make vfio-ccw DASD pass-through work under prot virt, one
> > would need to make sure, that everything that needs to be shared is
> > shared (data buffers, channel programs).
> > 
> > Does is clarify things?
> 
> That's what I thought, but the sentence was confusing :) What about
> 
> "This patch addresses the most basic stuff (mostly what is required to
> support virtio-ccw devices). It handles neither QDIO devices, nor
> arbitrary non-virtio-ccw devices." ?
>

Don't like the second sentence. How about "It handles neither QDIO
in the common code, nor any device type specific stuff (like channel
programs constructed by the DADS driver)."

My problem is that this patch is about the common infrastructure code,
and virtio-ccw specific stuff is handled by subsequent patches of this
series.

[..]

> > > Is there any way to reserve the 31 bit restriction for channel
> > > subsystem structures and keep vring in the full 64 bit range? (Or
> > > am I fundamentally misunderstanding something?)
> > >   
> > 
> > At the root of this problem is that the DMA API basically says
> > devices may have addressing limitations expressed by the dma_mask,
> > while our addressing limitations are not coming from the device but
> > from the IO arch: e.g. orb.cpa and ccw.cda are 31 bit addresses. In
> > our case it depends on how and for what is the device going to use
> > the memory (e.g. buffers addressed by MIDA vs IDA vs direct).
> > 
> > Virtio uses the DMA properties of the parent, that is in our case the
> > struct device embedded in struct ccw_device.
> > 
> > The previous version (RFC) used to allocate all the cio DMA stuff
> > from this global cio_dma_pool using the css0.dev for the DMA API
> > interactions. And we set *css0.dev.dma_mask == DMA_BIT_MASK(31) so
> > e.g. the allocated ccws are 31 bit addressable.
> > 
> > But I was asked to change this so that when I allocate DMA memory
> > for a channel program of particular ccw device, a struct device of
> > that ccw device is used as the first argument of
> > dma_alloc_coherent().
> > 
> > Considering
> > 
> > void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t
> > *dma_handle, gfp_t flag, unsigned long attrs)
> > {
> >         const struct dma_map_ops *ops = get_dma_ops(dev);
> >         void *cpu_addr;
> > 
> >         WARN_ON_ONCE(dev && !dev->coherent_dma_mask);
> > 
> >         if (dma_alloc_from_dev_coherent(dev, size, dma_handle,
> > &cpu_addr)) return cpu_addr;
> > 
> >         /* let the implementation decide on the zone to allocate
> > from: */ flag &= ~(__GFP_DMA | __GFP_DMA32 | __GFP_HIGHMEM);
> > 
> > that is the GFP flags dropped that implies that we really want
> > cdev->dev restricted to 31 bit addressable memory because we can't
> > tell (with the current common DMA code) hey but this piece of DMA
> > mem you are abot to allocate for me must be 31 bit addressable
> > (using GFP_DMA as we usually do).
> > 
> > So, as described in the commit message, the vring stuff being forced
> > into ZONE_DMA is an unfortunate consequence of this all.
> 
> Yeah. I hope 31 bits are enough for that as well.
> 
> > 
> > A side note: making the subchannel device 'own' the DMA stuff of a
> > ccw device (something that was discussed in the RFC thread) is tricky
> > because the ccw device may outlive the subchannel (all that orphan
> > stuff).
> 
> Yes, that's... eww. Not really a problem for virtio-ccw devices (which
> do not support the disconnected state), but can we make DMA and the
> subchannel moving play nice with each other at all?
> 

I don't quite understand the question. This series does not have any
problems with that AFAIU. Can you please clarify?

Regards,
Halil

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
