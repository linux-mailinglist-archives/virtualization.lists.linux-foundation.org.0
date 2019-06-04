Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABAC348F6
	for <lists.virtualization@lfdr.de>; Tue,  4 Jun 2019 15:36:45 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E7F0AC2C;
	Tue,  4 Jun 2019 13:36:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0DC58C03
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 13:36:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8F9FA84C
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 13:36:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C43FFA3B60;
	Tue,  4 Jun 2019 13:36:33 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB1EA60C91;
	Tue,  4 Jun 2019 13:36:27 +0000 (UTC)
Date: Tue, 4 Jun 2019 15:36:25 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 7/8] virtio/s390: use DMA memory for ccw I/O and
	classic notifiers
Message-ID: <20190604153625.6c03c232.cohuck@redhat.com>
In-Reply-To: <20190604150819.1f8707b5.pasic@linux.ibm.com>
References: <20190529122657.166148-1-mimu@linux.ibm.com>
	<20190529122657.166148-8-mimu@linux.ibm.com>
	<20190603181716.325101d9.cohuck@redhat.com>
	<20190604150819.1f8707b5.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 04 Jun 2019 13:36:34 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Tue, 4 Jun 2019 15:08:19 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 3 Jun 2019 18:17:16 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Wed, 29 May 2019 14:26:56 +0200
> > Michael Mueller <mimu@linux.ibm.com> wrote:

> > (...)
> >   
> > > @@ -176,6 +180,22 @@ static struct virtio_ccw_device *to_vc_device(struct virtio_device *vdev)
> > >  	return container_of(vdev, struct virtio_ccw_device, vdev);
> > >  }
> > >  
> > > +static inline void *__vc_dma_alloc(struct virtio_device *vdev, size_t size)
> > > +{
> > > +	return ccw_device_dma_zalloc(to_vc_device(vdev)->cdev, size);
> > > +}
> > > +
> > > +static inline void __vc_dma_free(struct virtio_device *vdev, size_t size,
> > > +				 void *cpu_addr)
> > > +{
> > > +	return ccw_device_dma_free(to_vc_device(vdev)->cdev, cpu_addr, size);
> > > +}
> > > +
> > > +#define vc_dma_alloc_struct(vdev, ptr) \
> > > +	({ptr = __vc_dma_alloc(vdev, sizeof(*(ptr))); })
> > > +#define vc_dma_free_struct(vdev, ptr) \
> > > +	__vc_dma_free(vdev, sizeof(*(ptr)), (ptr))
> > > +  
> > 
> > I *still* don't like these #defines (and the __vc_dma_* functions), as I
> > already commented last time. I think they make it harder to follow the
> > code.
> >   
> 
> Sorry! I think we simply forgot to address this comment of yours. 
> 
> > >  static void drop_airq_indicator(struct virtqueue *vq, struct airq_info *info)
> > >  {
> > >  	unsigned long i, flags;
> > > @@ -336,8 +356,7 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
> > >  	struct airq_info *airq_info = vcdev->airq_info;
> > >  
> > >  	if (vcdev->is_thinint) {
> > > -		thinint_area = kzalloc(sizeof(*thinint_area),
> > > -				       GFP_DMA | GFP_KERNEL);
> > > +		vc_dma_alloc_struct(&vcdev->vdev, thinint_area);  
> > 
> > Last time I wrote:
> > 
> > "Any reason why this takes a detour via the virtio device? The ccw
> >  device is already referenced in vcdev, isn't it?
> >
> > thinint_area = ccw_device_dma_zalloc(vcdev->cdev, sizeof(*thinint_area));
> > 
> >  looks much more obvious to me."
> > 
> > It still seems more obvious to me.
> >  
> 
> 
> The reason why I decided to introduce __vc_dma_alloc() back then is
> because I had no clarity what do we want to do there. If you take a look
> the body of __vc_dma_alloc() changed quite a lot, while I the usage not
> so much. 
> 
> Regarding why is the first argument a pointer struct virtio_device, the
> idea was probably to keep the needs to be ZONE_DMA and can use the full
> 64 bit address space separate. But I abandoned the ideal.
> 
> Also vc_dma_alloc_struct() started out more elaborate (I used to manage
> a dma_addr_t as well -- see RFC).

Understood, history is often important :)

> 
> I'm not quite sure what is your problem with the these. As far as I
> understand, this is another of those matter of taste things. But it ain't
> a big deal. 

Two things:
- The call path goes from the vcdev to the vdev, then back to the vcdev
  and then to the cdev. Going from the vcdev to the cdev  directly
  eliminates the roundtrip via the vdev, which I think does not add
  anything.
- I prefer
	variable = function_returning_a_pointer(...);
  over
	function_setting_a_variable(..., variable);
  The latter obscures the fact that we change the value of the
  variable, unless named very obviously.

> 
> I will change this for v4 as you requested. Again sorry for missing it!

np, can happen.

> 
> Regards,
> Halil
> 
>  
> > >  		if (!thinint_area)
> > >  			return;
> > >  		thinint_area->summary_indicator =  
> >   
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
