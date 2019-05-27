Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 401DE2B47C
	for <lists.virtualization@lfdr.de>; Mon, 27 May 2019 14:11:08 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CE96C1849;
	Mon, 27 May 2019 12:11:03 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 50E2B1517
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:10:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3FB92821
	for <virtualization@lists.linux-foundation.org>;
	Mon, 27 May 2019 12:10:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC65881DF6;
	Mon, 27 May 2019 12:10:39 +0000 (UTC)
Received: from gondolin (ovpn-204-109.brq.redhat.com [10.40.204.109])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3815A19C58;
	Mon, 27 May 2019 12:10:32 +0000 (UTC)
Date: Mon, 27 May 2019 14:10:29 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 6/8] virtio/s390: add indirection to indicators access
Message-ID: <20190527141029.102f838a.cohuck@redhat.com>
In-Reply-To: <20190527135706.34837062.pasic@linux.ibm.com>
References: <20190523162209.9543-1-mimu@linux.ibm.com>
	<20190523162209.9543-7-mimu@linux.ibm.com>
	<20190527130028.62e1f7d7.cohuck@redhat.com>
	<20190527135706.34837062.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 27 May 2019 12:10:39 +0000 (UTC)
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

On Mon, 27 May 2019 13:57:06 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 27 May 2019 13:00:28 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Thu, 23 May 2019 18:22:07 +0200
> > Michael Mueller <mimu@linux.ibm.com> wrote:
> >   
> > > From: Halil Pasic <pasic@linux.ibm.com>
> > > 
> > > This will come in handy soon when we pull out the indicators from
> > > virtio_ccw_device to a memory area that is shared with the hypervisor
> > > (in particular for protected virtualization guests).
> > > 
> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
> > > ---
> > >  drivers/s390/virtio/virtio_ccw.c | 40 +++++++++++++++++++++++++---------------
> > >  1 file changed, 25 insertions(+), 15 deletions(-)
> > >   
> >   
> > > @@ -338,17 +348,17 @@ static void virtio_ccw_drop_indicator(struct virtio_ccw_device *vcdev,
> > >  		ccw->cda = (__u32)(unsigned long) thinint_area;
> > >  	} else {
> > >  		/* payload is the address of the indicators */
> > > -		indicatorp = kmalloc(sizeof(&vcdev->indicators),
> > > +		indicatorp = kmalloc(sizeof(indicators(vcdev)),
> > >  				     GFP_DMA | GFP_KERNEL);
> > >  		if (!indicatorp)
> > >  			return;
> > >  		*indicatorp = 0;
> > >  		ccw->cmd_code = CCW_CMD_SET_IND;
> > > -		ccw->count = sizeof(&vcdev->indicators);
> > > +		ccw->count = sizeof(indicators(vcdev));
> > >  		ccw->cda = (__u32)(unsigned long) indicatorp;
> > >  	}
> > >  	/* Deregister indicators from host. */
> > > -	vcdev->indicators = 0;
> > > +	*indicators(vcdev) = 0;  
> > 
> > I'm not too hot about this notation, but it's not wrong and a minor
> > thing :)  
> 
> I don't have any better ideas :/
> 
> >   
> > >  	ccw->flags = 0;
> > >  	ret = ccw_io_helper(vcdev, ccw,
> > >  			    vcdev->is_thinint ?  
> > 
> > Patch looks reasonable and not dependent on the other patches here.
> >   
> 
> looks reasonable == r-b?
> 
> Not dependent in a sense that this patch could be made a first patch in
> the series. A subsequent patch depends on it.

What is the plan with these patches? I can either pick patch 5+6 and
let them go through the virtio tree, or give my r-b and let them go
through the s390 tree. The former is probably the quicker route, but
the latter has less potential for dependency issues.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
