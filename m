Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A849386185
	for <lists.virtualization@lfdr.de>; Thu,  8 Aug 2019 14:19:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 56C15103B;
	Thu,  8 Aug 2019 12:19:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D8E32F3C
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:19:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C81F714D
	for <virtualization@lists.linux-foundation.org>;
	Thu,  8 Aug 2019 12:19:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C4F27E426;
	Thu,  8 Aug 2019 12:19:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B9321001284;
	Thu,  8 Aug 2019 12:19:25 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 08FA618089C8;
	Thu,  8 Aug 2019 12:19:25 +0000 (UTC)
Date: Thu, 8 Aug 2019 08:19:24 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <1593246032.7424344.1565266764494.JavaMail.zimbra@redhat.com>
In-Reply-To: <20190808115555.GA2015@kroah.com>
References: <20190808113606.19504-1-pagupta@redhat.com>
	<20190808113606.19504-2-pagupta@redhat.com>
	<20190808115555.GA2015@kroah.com>
Subject: Re: [PATCH v2 1/2] virtio_console: free unused buffers with port
	delete
MIME-Version: 1.0
X-Originating-IP: [10.67.116.132, 10.4.195.30]
Thread-Topic: virtio_console: free unused buffers with port delete
Thread-Index: 3j1KCI3vfTqn3wC0i4fDgfcUSG+LwQ==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 08 Aug 2019 12:19:25 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: arnd@arndb.de, mst@redhat.com, amit@kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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


> 
> On Thu, Aug 08, 2019 at 05:06:05PM +0530, Pankaj Gupta wrote:
> >   The commit a7a69ec0d8e4 ("virtio_console: free buffers after reset")
> >   deferred detaching of unused buffer to virtio device unplug time.
> > 
> >   This causes unplug/replug of single port in virtio device with an
> >   error "Error allocating inbufs\n". As we don't free the unused buffers
> >   attached with the port. Re-plug the same port tries to allocate new
> >   buffers in virtqueue and results in this error if queue is full.
> > 
> >   This patch removes the unused buffers in vq's when we unplug the port.
> >   This is the best we can do as we cannot call device_reset because virtio
> >   device is still active.
> 
> Why is this indented?

o.k. will remove the empty lines.

> 
> > 
> > Reported-by: Xiaohui Li <xiaohli@redhat.com>
> > Fixes: b3258ff1d6 ("virtio_console: free buffers after reset")
> 
> Fixes: b3258ff1d608 ("virtio: Decrement avail idx on buffer detach")
> 
> is the correct format to use.

Sorry! for this. Commit it fixes is:
a7a69ec0d8e4 ("virtio_console: free buffers after reset")

> 
> And given that this is from 2.6.39 (and 2.6.38.5), shouldn't it also be
> backported for the stable kernels?

Yes.

Thanks,
Pankaj

> 
> thanks,
> 
> greg k-h
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
