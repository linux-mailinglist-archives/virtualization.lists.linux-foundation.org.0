Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB742C95E
	for <lists.virtualization@lfdr.de>; Tue, 28 May 2019 16:58:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2B8B61DA1;
	Tue, 28 May 2019 14:58:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9E3E71D81
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 14:56:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5332A891
	for <virtualization@lists.linux-foundation.org>;
	Tue, 28 May 2019 14:56:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B540A19CBA4;
	Tue, 28 May 2019 14:56:35 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EF7C87C564;
	Tue, 28 May 2019 14:56:29 +0000 (UTC)
Date: Tue, 28 May 2019 16:56:27 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v2 8/8] virtio/s390: make airq summary indicators DMA
Message-ID: <20190528165627.76da557a.cohuck@redhat.com>
In-Reply-To: <20190528163342.335eea0b.pasic@linux.ibm.com>
References: <20190523162209.9543-1-mimu@linux.ibm.com>
	<20190523162209.9543-9-mimu@linux.ibm.com>
	<20190527140018.7c2d34ff.cohuck@redhat.com>
	<20190528163342.335eea0b.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 28 May 2019 14:56:35 +0000 (UTC)
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

On Tue, 28 May 2019 16:33:42 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 27 May 2019 14:00:18 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Thu, 23 May 2019 18:22:09 +0200
> > Michael Mueller <mimu@linux.ibm.com> wrote:
> >   
> > > From: Halil Pasic <pasic@linux.ibm.com>
> > > 
> > > Hypervisor needs to interact with the summary indicators, so these
> > > need to be DMA memory as well (at least for protected virtualization
> > > guests).
> > > 
> > > Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> > > ---
> > >  drivers/s390/virtio/virtio_ccw.c | 22 +++++++++++++++-------
> > >  1 file changed, 15 insertions(+), 7 deletions(-)  
> > 
> > (...)
> >   
> > > @@ -1501,6 +1508,7 @@ static int __init virtio_ccw_init(void)
> > >  {
> > >  	/* parse no_auto string before we do anything further */
> > >  	no_auto_parse();
> > > +	summary_indicators = cio_dma_zalloc(MAX_AIRQ_AREAS);  
> > 
> > What happens if this fails?  
> 
> Bad things could happen!
> 
> How about adding
> 
> if (!summary_indicators)
> 	virtio_ccw_use_airq = 0; /* fall back to classic */
> 
> ?
> 
> Since it ain't very likely to happen, we could also just fail
> virtio_ccw_init() with -ENOMEM.

How high are the chances of things working if we fail to allocate here?
Returning with -ENOMEM is probably the more reasonable approach here.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
