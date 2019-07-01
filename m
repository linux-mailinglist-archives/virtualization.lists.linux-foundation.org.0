Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id D413A34AFB
	for <lists.virtualization@lfdr.de>; Tue,  4 Jun 2019 16:52:14 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0C62E949;
	Tue,  4 Jun 2019 14:52:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CEF0C5AA
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 14:52:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 78D1784C
	for <virtualization@lists.linux-foundation.org>;
	Tue,  4 Jun 2019 14:52:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8CA5A30BB367;
	Tue,  4 Jun 2019 14:51:29 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5D8F410013D9;
	Tue,  4 Jun 2019 14:51:22 +0000 (UTC)
Date: Tue, 4 Jun 2019 16:51:20 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH v3 4/8] s390/airq: use DMA memory for adapter interrupts
Message-ID: <20190604165120.5afdce78.cohuck@redhat.com>
In-Reply-To: <20190604152256.158d688c.pasic@linux.ibm.com>
References: <20190529122657.166148-1-mimu@linux.ibm.com>
	<20190529122657.166148-5-mimu@linux.ibm.com>
	<20190603172740.1023e078.cohuck@redhat.com>
	<20190604152256.158d688c.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 04 Jun 2019 14:52:00 +0000 (UTC)
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

On Tue, 4 Jun 2019 15:22:56 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Mon, 3 Jun 2019 17:27:40 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:

> > Apologies if that already has been answered (and I missed it in my mail
> > pile...), but two things had come to my mind previously:
> > 
> > - CHSC... does anything need to be done there? Last time I asked:
> >   "Anyway, css_bus_init() uses some chscs
> >    early (before cio_dma_pool_init), so we could not use the pools
> >    there, even if we wanted to. Do chsc commands either work, or else
> >    fail benignly on a protected virt guest?"  
> 
> Protected virt won't support all CHSC. The supported ones won't requre
> use of shared memory. So we are fine.

I suppose the supported ones are the sync chscs that use the chsc area
as a direct parameter (and therefore are handled similarly to the other
I/O instructions that supply a direct parameter)? I don't think we care
about async chscs in KVM/QEMU anyway, as we don't even emulate chsc
subchannels :) (And IIRC, you don't get chsc subchannels in z/VM
guests, either.)

> 
> > - PCI indicators... does this interact with any dma configuration on
> >   the pci device? (I know pci is not supported yet, and I don't really
> >   expect any problems.)
> >   
> 
> It does but, I'm pretty confident we don't have a problem with PCI. IMHO
> Sebastian is the guy who needs to be paranoid about this, and he r-b-ed
> the respective patches.

Just wanted to make sure that this was on the radar. You guys are
obviously in a better position than me to judge this :)

Anyway, I do not intend to annoy with those questions, it's just hard
to get a feel if there are areas that still need care if you don't have
access to the documentation for this... if you tell me that you are
aware of it and it should work, that's fine for me.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
