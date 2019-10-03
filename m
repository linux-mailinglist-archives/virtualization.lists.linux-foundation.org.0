Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 126EBCAF7F
	for <lists.virtualization@lfdr.de>; Thu,  3 Oct 2019 21:45:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0718C14BF;
	Thu,  3 Oct 2019 19:45:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1C4EA1474
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 19:45:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 94948D3
	for <virtualization@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 19:45:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0DE919D335;
	Thu,  3 Oct 2019 19:45:18 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 450901001B01;
	Thu,  3 Oct 2019 19:45:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id C6D04220308; Thu,  3 Oct 2019 15:45:15 -0400 (EDT)
Date: Thu, 3 Oct 2019 15:45:15 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: virtq questions
Message-ID: <20191003194515.GA13783@redhat.com>
References: <CAJfpegsGNoT4NUai-=HHkqOrmjgMb=4TDk79EgxDBCd8fxCGZA@mail.gmail.com>
	<20191002132734.GA6972@redhat.com>
	<CAJfpegvJGTFiJh5MFRNQF8dQQo7KS5f0Ei7vEYOBTw4RzVtA2w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJfpegvJGTFiJh5MFRNQF8dQQo7KS5f0Ei7vEYOBTw4RzVtA2w@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 03 Oct 2019 19:45:19 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org
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

On Thu, Oct 03, 2019 at 10:42:44AM +0200, Miklos Szeredi wrote:
> On Wed, Oct 2, 2019 at 3:27 PM Vivek Goyal <vgoyal@redhat.com> wrote:
> >
> > On Wed, Oct 02, 2019 at 09:40:11AM +0200, Miklos Szeredi wrote:
> > > Looking at the ugly retry logic in virtiofs and have some questions.
> >
> > Hi Miklos,
> >
> > What are you thinking w.r.t cleanup of retry logic. As of now we put
> > requests in a list and retry later with the help of a worker.
> 
> Two things:
> 
>  - don't use a timeout for retrying
>  - try to preserve order of requests submitted vs. order of requests queued

Hi Miklos,

I understand first point but no the second one. Can you elaborate a bit
more that why it is important. Device does not provide any guarantees
that requests will be completed in order of submission. If that's the
case, then submitter can't assume any order in request completion anyway.

> 
> This is complicated by the fact that we call virtqueue_add_sgs() under
> spinlock, which is the reason GFP_ATOMIC is used.  However GFP_ATOMIC
> can easily fail and that means even if the "indirect_desc" feature is
> turned on a request may use several slots of the ring buffer for a
> single request.

Aha, you are referring to the case where indirect_desc feature is enabled
but memory allocation fails, so it falls back to using regular
descriptors.

> Worst case is that a request has lots of pages,
> resulting in total_sgs > vring.num, which is bad, because we'll get
> ENOSPC thinking that the operation needs to be retried once some
> pending requests are done, but that's not actually the case...

Got it. So if we always allocate memory for total_sgs (which could
be more than vring.num) and are in a position to wait for memory
allocation, then this problem will not be there.

Alternate solution probably is to query queue size in the beginning
and make sure number of pages attached to a request are less then 
that.

> 
> So my proposed solution is to turn fsvq->lock into a mutex; call
> virtqueue_add_sgs() with whatever gfp flags are used to allocate the
> request and add __GFP_NOFAIL for good measure.  This means that the
> request is guaranteed to use a single slot IF "indirect_desc" is on.
> And there should be some way to verify from the virtiofs code that
> this feature is indeed on, otherwise things can get messy (as noted
> above).

Sounds reasonable.

So if system is under memory pressure, currently we will fall back to
using pre-allocated descriptors instead of waiting for memory to become
free. IOW, virtio-fs can continue to make progress. But with GFP_NOFAIL
we will wait for memory to be allocated for indirect descriptor and
then make progress. It probably is fine, I am just thinking loud.

I noticed that all the virtio drivers currently seem to be using
GFP_ATOMIC. Interesting...

Anyway, it probably is worth trying it. It also solves the problem of
retrying as we will block for resources to be allocated and should
not get -ENOSPC or -ENOMEM.

BTW, I have few cleanup/improvement patches lined up internally to
use better method to wait for draining of request. Will post these
separately. They probably can go in next merge window.

Thanks
Vivek
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
