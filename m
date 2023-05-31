Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF0E718B6E
	for <lists.virtualization@lfdr.de>; Wed, 31 May 2023 22:49:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C2B441EF0;
	Wed, 31 May 2023 20:49:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C2B441EF0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F90Es4Tk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aqN5gNvVcnaa; Wed, 31 May 2023 20:49:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 530F4429BF;
	Wed, 31 May 2023 20:49:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 530F4429BF
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 99067C0089;
	Wed, 31 May 2023 20:49:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4E2BC0037
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B25C283EFE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B25C283EFE
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=F90Es4Tk
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3mx6LUw2C_1C
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:49:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF4B283EC9
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF4B283EC9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 20:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685566183;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z+sl7QKdfvJR+8prMRKrq6yBg6su9u8l9/1eF6lx1JQ=;
 b=F90Es4Tk9kyeV7pLa5yzDCUlX2CccZnIXzX3GgazyYdGqR9aOlvLfTeyQbVOo/y/dSy556
 MGlX97VIsl7jI/mQfLwwfbjiM3jqGHkIhG9G+XpL/Tyr3JHG41V8T6C5Ff8l/ZM+HvpyHv
 YdQrZWH4FzCZdh6s36H039DAzYcHOfM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-gHhOLF_kNWyX0duvJ2d1Iw-1; Wed, 31 May 2023 16:49:40 -0400
X-MC-Unique: gHhOLF_kNWyX0duvJ2d1Iw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D343428078CC;
 Wed, 31 May 2023 20:49:39 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.8.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8524F421C3;
 Wed, 31 May 2023 20:49:39 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id 1250516EF97; Wed, 31 May 2023 16:49:39 -0400 (EDT)
Date: Wed, 31 May 2023 16:49:39 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Peter-Jan Gootzen <peter-jan@gootzen.net>
Subject: Re: [PATCH V2] virtio-fs: Improved request latencies when Virtio
 queue is full
Message-ID: <ZHey45k+V8sP2F6l@redhat.com>
References: <20230531171031.1424338-1-peter-jan@gootzen.net>
 <ZHedgNu89LoiW4sZ@redhat.com>
 <02ad6a48-6db7-fab5-721e-2d940d4a664a@gootzen.net>
MIME-Version: 1.0
In-Reply-To: <02ad6a48-6db7-fab5-721e-2d940d4a664a@gootzen.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: miklos@szeredi.hu, stefanha@redhat.com,
 virtualization@lists.linux-foundation.org
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

On Wed, May 31, 2023 at 10:34:15PM +0200, Peter-Jan Gootzen wrote:
> On 31/05/2023 21:18, Vivek Goyal wrote:
> > On Wed, May 31, 2023 at 07:10:32PM +0200, Peter-Jan Gootzen wrote:
> >> When the Virtio queue is full, a work item is scheduled
> >> to execute in 1ms that retries adding the request to the queue.
> >> This is a large amount of time on the scale on which a
> >> virtio-fs device can operate. When using a DPU this is around
> >> 40us baseline without going to a remote server (4k, QD=1).
> >> This patch queues requests when the Virtio queue is full,
> >> and when a completed request is taken off, immediately fills
> >> it back up with queued requests.
> >>
> >> This reduces the 99.9th percentile latencies in our tests by
> >> 60x and slightly increases the overall throughput, when using a
> >> queue depth 2x the size of the Virtio queue size, with a
> >> DPU-powered virtio-fs device.
> >>
> >> Signed-off-by: Peter-Jan Gootzen <peter-jan@gootzen.net>
> >> ---
> >> V1 -> V2: Not scheduling dispatch work anymore when not needed
> >> and changed delayed_work structs to work_struct structs
> >>
> >>  fs/fuse/virtio_fs.c | 32 +++++++++++++++++---------------
> >>  1 file changed, 17 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> >> index 4d8d4f16c727..a676297db09b 100644
> >> --- a/fs/fuse/virtio_fs.c
> >> +++ b/fs/fuse/virtio_fs.c
> >> @@ -45,7 +45,7 @@ struct virtio_fs_vq {
> >>  	struct work_struct done_work;
> >>  	struct list_head queued_reqs;
> >>  	struct list_head end_reqs;	/* End these requests */
> >> -	struct delayed_work dispatch_work;
> >> +	struct work_struct dispatch_work;
> >>  	struct fuse_dev *fud;
> >>  	bool connected;
> >>  	long in_flight;
> >> @@ -202,7 +202,7 @@ static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
> >>  	}
> >>  
> >>  	flush_work(&fsvq->done_work);
> >> -	flush_delayed_work(&fsvq->dispatch_work);
> >> +	flush_work(&fsvq->dispatch_work);
> >>  }
> >>  
> >>  static void virtio_fs_drain_all_queues_locked(struct virtio_fs *fs)
> >> @@ -346,6 +346,9 @@ static void virtio_fs_hiprio_done_work(struct work_struct *work)
> >>  			dec_in_flight_req(fsvq);
> >>  		}
> >>  	} while (!virtqueue_enable_cb(vq) && likely(!virtqueue_is_broken(vq)));
> >> +
> >> +	if (!list_empty(&fsvq->queued_reqs))
> >> +		schedule_work(&fsvq->dispatch_work);
> >>  	spin_unlock(&fsvq->lock);
> >>  }
> >>  
> >> @@ -353,7 +356,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
> >>  {
> >>  	struct fuse_req *req;
> >>  	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
> >> -						 dispatch_work.work);
> >> +						 dispatch_work);
> >>  	int ret;
> >>  
> >>  	pr_debug("virtio-fs: worker %s called.\n", __func__);
> >> @@ -388,8 +391,6 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
> >>  			if (ret == -ENOMEM || ret == -ENOSPC) {
> >>  				spin_lock(&fsvq->lock);
> >>  				list_add_tail(&req->list, &fsvq->queued_reqs);
> >> -				schedule_delayed_work(&fsvq->dispatch_work,
> >> -						      msecs_to_jiffies(1));
> > 
> > Virtqueue being full is only one of the reasons for failure to queue
> > the request. What if virtqueue is empty but we could not queue the
> > request because lack of memory (-ENOMEM). In that case we will queue
> > the request and it might not be dispatched because there is no completion.
> > (Assume there is no further new request coming). That means deadlock?
> > 
> > Thanks
> > Vivek
> > 
> 
> Good catch that will deadlock.
> 
> Is default kernel behavior to indefinitely retry a file system
> request until memory is available?

As of now that seems to be the behavior. I think I had copied this
code from another driver. 

But I guess one can argue that if memory is not available, then
return -ENOMEM to user space instead of retrying in kernel.

Stefan, Miklos, WDYT?

Thanks
Vivek

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
