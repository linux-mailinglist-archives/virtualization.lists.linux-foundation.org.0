Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8631A19EBE
	for <lists.virtualization@lfdr.de>; Fri, 10 May 2019 16:10:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08059EA7;
	Fri, 10 May 2019 14:10:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 212F4EA1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 14:10:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CE1A7831
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 14:10:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34152307D849;
	Fri, 10 May 2019 14:10:21 +0000 (UTC)
Received: from gondolin (dhcp-192-213.str.redhat.com [10.33.192.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 307E85E7B5;
	Fri, 10 May 2019 14:10:16 +0000 (UTC)
Date: Fri, 10 May 2019 16:10:13 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 05/10] s390/cio: introduce DMA pools to cio
Message-ID: <20190510161013.7e697337.cohuck@redhat.com>
In-Reply-To: <20190510001112.479b2fd7.pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-6-pasic@linux.ibm.com>
	<alpine.LFD.2.21.1905081447280.1773@schleppi>
	<20190508232210.5a555caa.pasic@linux.ibm.com>
	<20190509121106.48aa04db.cohuck@redhat.com>
	<20190510001112.479b2fd7.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Fri, 10 May 2019 14:10:21 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Sebastian Ott <sebott@linux.ibm.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
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

On Fri, 10 May 2019 00:11:12 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 9 May 2019 12:11:06 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Wed, 8 May 2019 23:22:10 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> > > On Wed, 8 May 2019 15:18:10 +0200 (CEST)
> > > Sebastian Ott <sebott@linux.ibm.com> wrote:  
> >   
> > > > > @@ -1063,6 +1163,7 @@ static int __init css_bus_init(void)
> > > > >  		unregister_reboot_notifier(&css_reboot_notifier);
> > > > >  		goto out_unregister;
> > > > >  	}
> > > > > +	cio_dma_pool_init();      
> > > > 
> > > > This is too late for early devices (ccw console!).    
> > > 
> > > You have already raised concern about this last time (thanks). I think,
> > > I've addressed this issue: tje cio_dma_pool is only used by the airq
> > > stuff. I don't think the ccw console needs it. Please have an other look
> > > at patch #6, and explain your concern in more detail if it persists.  
> > 
> > What about changing the naming/adding comments here, so that (1) folks
> > aren't confused by the same thing in the future and (2) folks don't try
> > to use that pool for something needed for the early ccw consoles?
> >   
> 
> I'm all for clarity! Suggestions for better names?

css_aiv_dma_pool, maybe? Or is there other cross-device stuff that may
need it?
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
