Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 339C1208A7
	for <lists.virtualization@lfdr.de>; Thu, 16 May 2019 15:55:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 83777E2F;
	Thu, 16 May 2019 13:54:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id ECF949E7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:54:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 907CF878
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 13:54:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E8F4C882FB;
	Thu, 16 May 2019 13:54:53 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6CADA60BE5;
	Thu, 16 May 2019 13:54:46 +0000 (UTC)
Date: Thu, 16 May 2019 15:54:44 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 06/10] s390/cio: add basic protected virtualization support
Message-ID: <20190516155444.158867ac.cohuck@redhat.com>
In-Reply-To: <20190516154245.4a0a84f7.pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-7-pasic@linux.ibm.com>
	<20190513114136.783c851c.cohuck@redhat.com>
	<d0ffefec-a14e-ee83-0aae-df288c3ffda4@linux.ibm.com>
	<20190515230817.2f8a8a5d.pasic@linux.ibm.com>
	<20190516083228.0cc5b489.cohuck@redhat.com>
	<20190516154245.4a0a84f7.pasic@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 16 May 2019 13:54:54 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Jason J. Herne" <jjherne@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Michael Mueller <mimu@linux.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>
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

On Thu, 16 May 2019 15:42:45 +0200
Halil Pasic <pasic@linux.ibm.com> wrote:

> On Thu, 16 May 2019 08:32:28 +0200
> Cornelia Huck <cohuck@redhat.com> wrote:
> 
> > On Wed, 15 May 2019 23:08:17 +0200
> > Halil Pasic <pasic@linux.ibm.com> wrote:
> >   
> > > On Tue, 14 May 2019 10:47:34 -0400
> > > "Jason J. Herne" <jjherne@linux.ibm.com> wrote:  
> >   
> > > > Are we 
> > > > worried that virtio data structures are going to be a burden on the 31-bit address space?
> > > > 
> > > >     
> > > 
> > > That is a good question I can not answer. Since it is currently at least
> > > a page per queue (because we use dma direct, right Mimu?), I am concerned
> > > about this.
> > > 
> > > Connie, what is your opinion?  
> > 
> > Yes, running into problems there was one of my motivations for my
> > question. I guess it depends on the number of devices and how many
> > queues they use. The problem is that it affects not only protected virt
> > guests, but all guests.
> >   
> 
> Unless things are about to change only devices that have
> VIRTIO_F_IOMMU_PLATFORM are affected. So it does not necessarily affect
> not protected virt guests. (With prot virt we have to use
> VIRTIO_F_IOMMU_PLATFORM.)
> 
> If it were not like this, I would be much more worried.

If we go forward with this approach, documenting this side effect of
VIRTIO_F_IOMMU_PLATFORM is something that needs to happen.

> 
> @Mimu: Could you please discuss this problem with the team? It might be
> worth considering to go back to the design of the RFC (i.e. cio/ccw stuff
> allocated from a common cio dma pool which gives you 31 bit addressable
> memory, and 64 bit dma mask for a ccw device of a virtio device).
> 
> Regards,
> Halil
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
