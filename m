Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181D71F240
	for <lists.virtualization@lfdr.de>; Thu,  1 Jun 2023 20:45:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A67014266F;
	Thu,  1 Jun 2023 18:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A67014266F
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aKQq8GJi
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8sOUvaLrcQe; Thu,  1 Jun 2023 18:45:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F354E4266B;
	Thu,  1 Jun 2023 18:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F354E4266B
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E397C0088;
	Thu,  1 Jun 2023 18:45:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B3122C0029
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 18:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D85D4266B
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 18:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D85D4266B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BXArNkAR4tIX
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 18:45:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 368104266A
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 368104266A
 for <virtualization@lists.linux-foundation.org>;
 Thu,  1 Jun 2023 18:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685645130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IkpfQLYlhRw+ZUrPJG4eaDVzJYrcU1Z4HMrlO4XLNRc=;
 b=aKQq8GJi0xuB/BiA4jSWKf7D5IFtprhwpr9n65S+d4+GwfpJPcUed1ZFvc68PnE1zY2Qe6
 TTGePxptLqpOYJotRAlhIpb+BsV/8+JHbI+v43gjgrXzPkXWsAbFIoaveAvhpVxaGybsie
 Vt4oOPAQB7YueSoHRlHp8HtqSCcd7L0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-gaeNi5skOnSXSvg2N3SfWg-1; Thu, 01 Jun 2023 14:45:26 -0400
X-MC-Unique: gaeNi5skOnSXSvg2N3SfWg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B055801224;
 Thu,  1 Jun 2023 18:45:26 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.8.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55D8720296C6;
 Thu,  1 Jun 2023 18:45:25 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id C803916F298; Thu,  1 Jun 2023 14:45:24 -0400 (EDT)
Date: Thu, 1 Jun 2023 14:45:24 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH V2] virtio-fs: Improved request latencies when Virtio
 queue is full
Message-ID: <ZHjnRJXeJnZ9THnO@redhat.com>
References: <20230531171031.1424338-1-peter-jan@gootzen.net>
 <ZHedgNu89LoiW4sZ@redhat.com>
 <02ad6a48-6db7-fab5-721e-2d940d4a664a@gootzen.net>
 <ZHey45k+V8sP2F6l@redhat.com> <20230601140850.GF1538357@fedora>
MIME-Version: 1.0
In-Reply-To: <20230601140850.GF1538357@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: miklos@szeredi.hu, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Thu, Jun 01, 2023 at 10:08:50AM -0400, Stefan Hajnoczi wrote:
> On Wed, May 31, 2023 at 04:49:39PM -0400, Vivek Goyal wrote:
> > On Wed, May 31, 2023 at 10:34:15PM +0200, Peter-Jan Gootzen wrote:
> > > On 31/05/2023 21:18, Vivek Goyal wrote:
> > > > On Wed, May 31, 2023 at 07:10:32PM +0200, Peter-Jan Gootzen wrote:
> > > >> When the Virtio queue is full, a work item is scheduled
> > > >> to execute in 1ms that retries adding the request to the queue.
> > > >> This is a large amount of time on the scale on which a
> > > >> virtio-fs device can operate. When using a DPU this is around
> > > >> 40us baseline without going to a remote server (4k, QD=1).
> > > >> This patch queues requests when the Virtio queue is full,
> > > >> and when a completed request is taken off, immediately fills
> > > >> it back up with queued requests.
> > > >>
> > > >> This reduces the 99.9th percentile latencies in our tests by
> > > >> 60x and slightly increases the overall throughput, when using a
> > > >> queue depth 2x the size of the Virtio queue size, with a
> > > >> DPU-powered virtio-fs device.
> > > >>
> > > >> Signed-off-by: Peter-Jan Gootzen <peter-jan@gootzen.net>
> > > >> ---
> > > >> V1 -> V2: Not scheduling dispatch work anymore when not needed
> > > >> and changed delayed_work structs to work_struct structs
> > > >>
> > > >>  fs/fuse/virtio_fs.c | 32 +++++++++++++++++---------------
> > > >>  1 file changed, 17 insertions(+), 15 deletions(-)
> > > >>
> > > >> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> > > >> index 4d8d4f16c727..a676297db09b 100644
> > > >> --- a/fs/fuse/virtio_fs.c
> > > >> +++ b/fs/fuse/virtio_fs.c
> > > >> @@ -45,7 +45,7 @@ struct virtio_fs_vq {
> > > >>  	struct work_struct done_work;
> > > >>  	struct list_head queued_reqs;
> > > >>  	struct list_head end_reqs;	/* End these requests */
> > > >> -	struct delayed_work dispatch_work;
> > > >> +	struct work_struct dispatch_work;
> > > >>  	struct fuse_dev *fud;
> > > >>  	bool connected;
> > > >>  	long in_flight;
> > > >> @@ -202,7 +202,7 @@ static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
> > > >>  	}
> > > >>  
> > > >>  	flush_work(&fsvq->done_work);
> > > >> -	flush_delayed_work(&fsvq->dispatch_work);
> > > >> +	flush_work(&fsvq->dispatch_work);
> > > >>  }
> > > >>  
> > > >>  static void virtio_fs_drain_all_queues_locked(struct virtio_fs *fs)
> > > >> @@ -346,6 +346,9 @@ static void virtio_fs_hiprio_done_work(struct work_struct *work)
> > > >>  			dec_in_flight_req(fsvq);
> > > >>  		}
> > > >>  	} while (!virtqueue_enable_cb(vq) && likely(!virtqueue_is_broken(vq)));
> > > >> +
> > > >> +	if (!list_empty(&fsvq->queued_reqs))
> > > >> +		schedule_work(&fsvq->dispatch_work);
> > > >>  	spin_unlock(&fsvq->lock);
> > > >>  }
> > > >>  
> > > >> @@ -353,7 +356,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
> > > >>  {
> > > >>  	struct fuse_req *req;
> > > >>  	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
> > > >> -						 dispatch_work.work);
> > > >> +						 dispatch_work);
> > > >>  	int ret;
> > > >>  
> > > >>  	pr_debug("virtio-fs: worker %s called.\n", __func__);
> > > >> @@ -388,8 +391,6 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
> > > >>  			if (ret == -ENOMEM || ret == -ENOSPC) {
> > > >>  				spin_lock(&fsvq->lock);
> > > >>  				list_add_tail(&req->list, &fsvq->queued_reqs);
> > > >> -				schedule_delayed_work(&fsvq->dispatch_work,
> > > >> -						      msecs_to_jiffies(1));
> > > > 
> > > > Virtqueue being full is only one of the reasons for failure to queue
> > > > the request. What if virtqueue is empty but we could not queue the
> > > > request because lack of memory (-ENOMEM). In that case we will queue
> > > > the request and it might not be dispatched because there is no completion.
> > > > (Assume there is no further new request coming). That means deadlock?
> > > > 
> > > > Thanks
> > > > Vivek
> > > > 
> > > 
> > > Good catch that will deadlock.
> > > 
> > > Is default kernel behavior to indefinitely retry a file system
> > > request until memory is available?
> > 
> > As of now that seems to be the behavior. I think I had copied this
> > code from another driver. 
> > 
> > But I guess one can argue that if memory is not available, then
> > return -ENOMEM to user space instead of retrying in kernel.
> > 
> > Stefan, Miklos, WDYT?
> 
> My understanding is that file system syscalls may return ENOMEM, so this
> is okay.

Ok. Fair enough. Thanks.

One more question. How do we know virtqueue is full. Is -ENOSPC is the
correct error code to check and retry indefinitely. Are there other
situations where -ENOSPC can be returned. Peter's current patch rely
on the fact that there is atleast one completion happening after
queuing of request which will kick the worker thread and submit the
request later.

We need to watch out for race conditions very closely. If that assumption
is not valid in some cases or there are races between getting -ENOSPC
and request completions, we will have a deadlock scenario.

Thanks
Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
