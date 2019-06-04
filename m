Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 337E8347A6
	for <lists.virtualization@lfdr.de>; Tue,  4 Jun 2019 15:08:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 321BEDDF;
	Tue,  4 Jun 2019 13:08:31 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B10C3DA4
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 13:08:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3239583A
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 13:08:29 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x54D4FrC026665 for <virtualization@lists.linux-foundation.org>;
	Tue, 4 Jun 2019 09:08:28 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2swqwbm2xf-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Tue, 04 Jun 2019 09:08:28 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Tue, 4 Jun 2019 14:08:25 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 4 Jun 2019 14:08:23 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x54D8LL661276310
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 4 Jun 2019 13:08:21 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFF9A42041;
	Tue,  4 Jun 2019 13:08:20 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4274642054;
	Tue,  4 Jun 2019 13:08:20 +0000 (GMT)
Received: from oc2783563651 (unknown [9.152.224.145])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  4 Jun 2019 13:08:20 +0000 (GMT)
Date: Tue, 4 Jun 2019 15:08:19 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH v3 7/8] virtio/s390: use DMA memory for ccw I/O and
	classic notifiers
In-Reply-To: <20190603181716.325101d9.cohuck@redhat.com>
References: <20190529122657.166148-1-mimu@linux.ibm.com>
	<20190529122657.166148-8-mimu@linux.ibm.com>
	<20190603181716.325101d9.cohuck@redhat.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19060413-4275-0000-0000-0000033C8A73
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060413-4276-0000-0000-0000384C995A
Message-Id: <20190604150819.1f8707b5.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-06-04_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1906040089
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>,
	Linux-S390 Mailing List <linux-s390@vger.kernel.org>,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	KVM Mailing List <kvm@vger.kernel.org>,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
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

On Mon, 3 Jun 2019 18:17:16 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Wed, 29 May 2019 14:26:56 +0200
> Michael Mueller <mimu@linux.ibm.com> wrote:
> 
> > From: Halil Pasic <pasic@linux.ibm.com>
> > 
> > Before virtio-ccw could get away with not using DMA API for the pieces of
> > memory it does ccw I/O with. With protected virtualization this has to
> > change, since the hypervisor needs to read and sometimes also write these
> > pieces of memory.
> > 
> > The hypervisor is supposed to poke the classic notifiers, if these are
> > used, out of band with regards to ccw I/O. So these need to be allocated
> > as DMA memory (which is shared memory for protected virtualization
> > guests).
> > 
> > Let us factor out everything from struct virtio_ccw_device that needs to
> > be DMA memory in a satellite that is allocated as such.
> > 
> > Note: The control blocks of I/O instructions do not need to be shared.
> > These are marshalled by the ultravisor.
> > 
> > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> > Signed-off-by: Michael Mueller <mimu@linux.ibm.com>
> > ---
> >  drivers/s390/virtio/virtio_ccw.c | 177 +++++++++++++++++++++------------------
> >  1 file changed, 96 insertions(+), 81 deletions(-)
> > 
> 
> (...)
> 
> > @@ -176,6 +180,22 @@ static struct virtio_ccw_device *to_vc_device(struct virtio_device *vdev)
> >  	return container_of(vdev, struct virtio_ccw_device, vdev);
> >  }
> >  
> > +static inline void *__vc_dma_alloc(struct virtio_device *vdev, size_t size)
> > +{
> > +	return ccw_device_dma_zalloc(to_vc_device(vdev)->cdev, size);
> > +}
> > +
> > +static inline void __vc_dma_free(struct virtio_device *vdev, size_t size,
> > +				 void *cpu_addr)
> > +{
> > +	return ccw_device_dma_free(to_vc_device(vdev)->cdev, cpu_addr, size);
> > +}
> > +
> > +#define vc_dma_alloc_struct(vdev, ptr) \
> > +	({ptr = __vc_dma_alloc(vdev, sizeof(*(ptr))); })
> > +#define vc_dma_free_struct(vdev, ptr) \
> > +	__vc_dma_free(vdev, sizeof(*(ptr)), (ptr))
> > +
> 
> I *still* don't like these #defines (and the __vc_dma_* functions), as I
> already commented last time. I think they make it harder to follow the
> code.
> 

Sorry! I think we simply forgot to address this comment of yours. 

> >  static void drop_airq_indicator(struct virtqueue *vq, struct airq_info *info)
> >  {
> >  	unsigned long i, flags;
> > @@ -336,8 +356,7 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
> >  	struct airq_info *airq_info = vcdev->airq_info;
> >  
> >  	if (vcdev->is_thinint) {
> > -		thinint_area = kzalloc(sizeof(*thinint_area),
> > -				       GFP_DMA | GFP_KERNEL);
> > +		vc_dma_alloc_struct(&vcdev->vdev, thinint_area);
> 
> Last time I wrote:
> 
> "Any reason why this takes a detour via the virtio device? The ccw
>  device is already referenced in vcdev, isn't it?
>
> thinint_area = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*thinint_area));
> 
>  looks much more obvious to me."
> 
> It still seems more obvious to me.
>


The reason why I decided to introduce __vc_dma_alloc() back then is
because I had no clarity what do we want to do there. If you take a look
the body of __vc_dma_alloc() changed quite a lot, while I the usage not
so much. 

Regarding why is the first argument a pointer struct virtio_device, the
idea was probably to keep the needs to be ZONE_DMA and can use the full
64 bit address space separate. But I abandoned the ideal.

Also vc_dma_alloc_struct() started out more elaborate (I used to manage
a dma_addr_t as well -- see RFC).

I'm not quite sure what is your problem with the these. As far as I
understand, this is another of those matter of taste things. But it ain't
a big deal. 

I will change this for v4 as you requested. Again sorry for missing it!

Regards,
Halil

 
> >  		if (!thinint_area)
> >  			return;
> >  		thinint_area->summary_indicator =
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
