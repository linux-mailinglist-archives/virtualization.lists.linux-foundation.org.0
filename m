Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1C12F4A
	for <lists.virtualization@lfdr.de>; Fri,  3 May 2019 15:34:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BD70838E2;
	Fri,  3 May 2019 13:34:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46EEC38C3
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 13:33:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EF6D979
	for <virtualization@lists.linux-foundation.org>;
	Fri,  3 May 2019 13:33:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 488633086222;
	Fri,  3 May 2019 13:33:18 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42DD6600C7;
	Fri,  3 May 2019 13:33:13 +0000 (UTC)
Date: Fri, 3 May 2019 15:33:10 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>
Subject: Re: [PATCH 00/10] s390: virtio: support protected virtualization
Message-ID: <20190503153310.04d4b85c.cohuck@redhat.com>
In-Reply-To: <20190503115511.17a1f6d1.cohuck@redhat.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190503115511.17a1f6d1.cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 03 May 2019 13:33:18 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Fri, 3 May 2019 11:55:11 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> On Fri, 26 Apr 2019 20:32:35 +0200
> Halil Pasic <pasic@linux.ibm.com> wrote:
> 

> > What needs to be done
> > =====================
> > 
> > Thus what needs to be done to bring virtio-ccw up to speed with respect
> > to protected virtualization is:
> > * use some 'new' common virtio stuff
> 
> Doing this makes sense regardless of the protected virtualization use
> case, and I think we should go ahead and merge those patches for 5.2.
> 
> > * make sure that virtio-ccw specific stuff uses shared memory when
> >   talking to the hypervisor (except control/communication blocks like ORB,
> >   these are handled by the ultravisor)
> 
> TBH, I'm still a bit hazy on what needs to use shared memory and what
> doesn't.
> 
> > * make sure the DMA API does what is necessary to talk through shared
> >   memory if we are a protected virtualization guest.
> > * make sure the common IO layer plays along as well (airqs, sense).

I've skimmed some more over the rest of the patches; but I think this
needs review by someone else.

For example, I'm not sure what the semantics of using the main css
device as the dma device are, as I'm not sufficiently familiar with the
intricacies of the dma infrastructure. Combine this with a lack of
documentation of the hardware architecture, and I think that others can
provide much better feedback on this than I am able to.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
