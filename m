Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 004067189FF
	for <lists.virtualization@lfdr.de>; Wed, 31 May 2023 21:18:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBED141CD9;
	Wed, 31 May 2023 19:18:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBED141CD9
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RyBUlnA+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KtOQ1R6KohNe; Wed, 31 May 2023 19:18:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 7B74841C5D;
	Wed, 31 May 2023 19:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B74841C5D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 93EBFC008C;
	Wed, 31 May 2023 19:18:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 53E4BC0037
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 19:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2799241CCF
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 19:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2799241CCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8r8UOcSPIYLo
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 19:18:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22E7040514
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22E7040514
 for <virtualization@lists.linux-foundation.org>;
 Wed, 31 May 2023 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685560714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZUPKVyQl2euMVF9dLwzB6fd+hMnPcnIGYhgmpA343oM=;
 b=RyBUlnA+MLCAPh0OSNdECCnP6LdYt9A3ko5cVWbmGFaowN0vpzTfIAzUGn6lIeqhqntbLP
 KVKxXizWiElkrUxELuxIkicgXCVi5yhwp54L6YS/u3bHCZGRIJLOVtnNU+i9zdh4WOcR0S
 A3wIbOHrL/VttW/n60MxETG/DhO9BmU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-364-s0ml9qk3MgynAJj9CoX9Vw-1; Wed, 31 May 2023 15:18:25 -0400
X-MC-Unique: s0ml9qk3MgynAJj9CoX9Vw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12F143802140;
 Wed, 31 May 2023 19:18:25 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.8.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E331D40CFD46;
 Wed, 31 May 2023 19:18:24 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
 id 630A116EF8B; Wed, 31 May 2023 15:18:24 -0400 (EDT)
Date: Wed, 31 May 2023 15:18:24 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Peter-Jan Gootzen <peter-jan@gootzen.net>
Subject: Re: [PATCH V2] virtio-fs: Improved request latencies when Virtio
 queue is full
Message-ID: <ZHedgNu89LoiW4sZ@redhat.com>
References: <20230531171031.1424338-1-peter-jan@gootzen.net>
MIME-Version: 1.0
In-Reply-To: <20230531171031.1424338-1-peter-jan@gootzen.net>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
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

On Wed, May 31, 2023 at 07:10:32PM +0200, Peter-Jan Gootzen wrote:
> When the Virtio queue is full, a work item is scheduled
> to execute in 1ms that retries adding the request to the queue.
> This is a large amount of time on the scale on which a
> virtio-fs device can operate. When using a DPU this is around
> 40us baseline without going to a remote server (4k, QD=1).
> This patch queues requests when the Virtio queue is full,
> and when a completed request is taken off, immediately fills
> it back up with queued requests.
> 
> This reduces the 99.9th percentile latencies in our tests by
> 60x and slightly increases the overall throughput, when using a
> queue depth 2x the size of the Virtio queue size, with a
> DPU-powered virtio-fs device.
> 
> Signed-off-by: Peter-Jan Gootzen <peter-jan@gootzen.net>
> ---
> V1 -> V2: Not scheduling dispatch work anymore when not needed
> and changed delayed_work structs to work_struct structs
> 
>  fs/fuse/virtio_fs.c | 32 +++++++++++++++++---------------
>  1 file changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/fs/fuse/virtio_fs.c b/fs/fuse/virtio_fs.c
> index 4d8d4f16c727..a676297db09b 100644
> --- a/fs/fuse/virtio_fs.c
> +++ b/fs/fuse/virtio_fs.c
> @@ -45,7 +45,7 @@ struct virtio_fs_vq {
>  	struct work_struct done_work;
>  	struct list_head queued_reqs;
>  	struct list_head end_reqs;	/* End these requests */
> -	struct delayed_work dispatch_work;
> +	struct work_struct dispatch_work;
>  	struct fuse_dev *fud;
>  	bool connected;
>  	long in_flight;
> @@ -202,7 +202,7 @@ static void virtio_fs_drain_queue(struct virtio_fs_vq *fsvq)
>  	}
>  
>  	flush_work(&fsvq->done_work);
> -	flush_delayed_work(&fsvq->dispatch_work);
> +	flush_work(&fsvq->dispatch_work);
>  }
>  
>  static void virtio_fs_drain_all_queues_locked(struct virtio_fs *fs)
> @@ -346,6 +346,9 @@ static void virtio_fs_hiprio_done_work(struct work_struct *work)
>  			dec_in_flight_req(fsvq);
>  		}
>  	} while (!virtqueue_enable_cb(vq) && likely(!virtqueue_is_broken(vq)));
> +
> +	if (!list_empty(&fsvq->queued_reqs))
> +		schedule_work(&fsvq->dispatch_work);
>  	spin_unlock(&fsvq->lock);
>  }
>  
> @@ -353,7 +356,7 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
>  {
>  	struct fuse_req *req;
>  	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
> -						 dispatch_work.work);
> +						 dispatch_work);
>  	int ret;
>  
>  	pr_debug("virtio-fs: worker %s called.\n", __func__);
> @@ -388,8 +391,6 @@ static void virtio_fs_request_dispatch_work(struct work_struct *work)
>  			if (ret == -ENOMEM || ret == -ENOSPC) {
>  				spin_lock(&fsvq->lock);
>  				list_add_tail(&req->list, &fsvq->queued_reqs);
> -				schedule_delayed_work(&fsvq->dispatch_work,
> -						      msecs_to_jiffies(1));

Virtqueue being full is only one of the reasons for failure to queue
the request. What if virtqueue is empty but we could not queue the
request because lack of memory (-ENOMEM). In that case we will queue
the request and it might not be dispatched because there is no completion.
(Assume there is no further new request coming). That means deadlock?

Thanks
Vivek

>  				spin_unlock(&fsvq->lock);
>  				return;
>  			}
> @@ -436,8 +437,6 @@ static int send_forget_request(struct virtio_fs_vq *fsvq,
>  			pr_debug("virtio-fs: Could not queue FORGET: err=%d. Will try later\n",
>  				 ret);
>  			list_add_tail(&forget->list, &fsvq->queued_reqs);
> -			schedule_delayed_work(&fsvq->dispatch_work,
> -					      msecs_to_jiffies(1));
>  			if (!in_flight)
>  				inc_in_flight_req(fsvq);
>  			/* Queue is full */
> @@ -469,7 +468,7 @@ static void virtio_fs_hiprio_dispatch_work(struct work_struct *work)
>  {
>  	struct virtio_fs_forget *forget;
>  	struct virtio_fs_vq *fsvq = container_of(work, struct virtio_fs_vq,
> -						 dispatch_work.work);
> +						 dispatch_work);
>  	pr_debug("virtio-fs: worker %s called.\n", __func__);
>  	while (1) {
>  		spin_lock(&fsvq->lock);
> @@ -647,6 +646,11 @@ static void virtio_fs_requests_done_work(struct work_struct *work)
>  			virtio_fs_request_complete(req, fsvq);
>  		}
>  	}
> +
> +	spin_lock(&fsvq->lock);
> +	if (!list_empty(&fsvq->queued_reqs))
> +		schedule_work(&fsvq->dispatch_work);
> +	spin_unlock(&fsvq->lock);
>  }
>  
>  /* Virtqueue interrupt handler */
> @@ -670,12 +674,12 @@ static void virtio_fs_init_vq(struct virtio_fs_vq *fsvq, char *name,
>  
>  	if (vq_type == VQ_REQUEST) {
>  		INIT_WORK(&fsvq->done_work, virtio_fs_requests_done_work);
> -		INIT_DELAYED_WORK(&fsvq->dispatch_work,
> -				  virtio_fs_request_dispatch_work);
> +		INIT_WORK(&fsvq->dispatch_work,
> +			  virtio_fs_request_dispatch_work);
>  	} else {
>  		INIT_WORK(&fsvq->done_work, virtio_fs_hiprio_done_work);
> -		INIT_DELAYED_WORK(&fsvq->dispatch_work,
> -				  virtio_fs_hiprio_dispatch_work);
> +		INIT_WORK(&fsvq->dispatch_work,
> +			  virtio_fs_hiprio_dispatch_work);
>  	}
>  }
>  
> @@ -1254,8 +1258,6 @@ __releases(fiq->lock)
>  			spin_lock(&fsvq->lock);
>  			list_add_tail(&req->list, &fsvq->queued_reqs);
>  			inc_in_flight_req(fsvq);
> -			schedule_delayed_work(&fsvq->dispatch_work,
> -						msecs_to_jiffies(1));
>  			spin_unlock(&fsvq->lock);
>  			return;
>  		}
> @@ -1265,7 +1267,7 @@ __releases(fiq->lock)
>  		/* Can't end request in submission context. Use a worker */
>  		spin_lock(&fsvq->lock);
>  		list_add_tail(&req->list, &fsvq->end_reqs);
> -		schedule_delayed_work(&fsvq->dispatch_work, 0);
> +		schedule_work(&fsvq->dispatch_work);
>  		spin_unlock(&fsvq->lock);
>  		return;
>  	}
> -- 
> 2.34.1
> 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
