Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38A17688
	for <lists.virtualization@lfdr.de>; Wed,  8 May 2019 13:13:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 593512864;
	Wed,  8 May 2019 11:12:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7A8671CE9
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 11:12:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AF7A9884
	for <virtualization@lists.linux-foundation.org>;
	Wed,  8 May 2019 11:12:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD27530842B2;
	Wed,  8 May 2019 11:12:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80D2960C67;
	Wed,  8 May 2019 11:12:48 +0000 (UTC)
Received: from zmail21.collab.prod.int.phx2.redhat.com
	(zmail21.collab.prod.int.phx2.redhat.com [10.5.83.24])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F3F3D41F3C;
	Wed,  8 May 2019 11:12:47 +0000 (UTC)
Date: Wed, 8 May 2019 07:12:47 -0400 (EDT)
From: Pankaj Gupta <pagupta@redhat.com>
To: Jakub =?utf-8?Q?Staro=C5=84?= <jstaron@google.com>
Message-ID: <1555943483.27247564.1557313967518.JavaMail.zimbra@redhat.com>
In-Reply-To: <3d6479ae-6c39-d614-f1d9-aa1978e2e438@google.com>
References: <20190426050039.17460-1-pagupta@redhat.com>
	<20190426050039.17460-3-pagupta@redhat.com>
	<3d6479ae-6c39-d614-f1d9-aa1978e2e438@google.com>
Subject: Re: [Qemu-devel] [PATCH v7 2/6] virtio-pmem: Add virtio pmem driver
MIME-Version: 1.0
X-Originating-IP: [10.67.116.97, 10.4.195.7]
Thread-Topic: virtio-pmem: Add virtio pmem driver
Thread-Index: PGqRBxt7ac04jwyhY+CEFoY6aRdKvA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Wed, 08 May 2019 11:12:49 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: cohuck@redhat.com, jack@suse.cz, kvm@vger.kernel.org, mst@redhat.com,
	david@fromorbit.com, qemu-devel@nongnu.org,
	virtualization@lists.linux-foundation.org,
	adilger kernel <adilger.kernel@dilger.ca>, smbarber@google.com,
	zwisler@kernel.org, aarcange@redhat.com,
	dave jiang <dave.jiang@intel.com>, linux-nvdimm@lists.01.org,
	vishal l verma <vishal.l.verma@intel.com>, willy@infradead.org,
	hch@infradead.org, linux-acpi@vger.kernel.org, jmoyer@redhat.com,
	linux-ext4@vger.kernel.org, lenb@kernel.org, kilobyte@angband.pl,
	riel@surriel.com, yuval shaia <yuval.shaia@oracle.com>,
	stefanha@redhat.com, imammedo@redhat.com,
	dan j williams <dan.j.williams@intel.com>,
	lcapitulino@redhat.com, nilal@redhat.com, tytso@mit.edu,
	xiaoguangrong eric <xiaoguangrong.eric@gmail.com>,
	darrick wong <darrick.wong@oracle.com>, rjw@rjwysocki.net,
	linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, pbonzini@redhat.com
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
> On 4/25/19 10:00 PM, Pankaj Gupta wrote:
> 
> > +void host_ack(struct virtqueue *vq)
> > +{
> > +	unsigned int len;
> > +	unsigned long flags;
> > +	struct virtio_pmem_request *req, *req_buf;
> > +	struct virtio_pmem *vpmem = vq->vdev->priv;
> > +
> > +	spin_lock_irqsave(&vpmem->pmem_lock, flags);
> > +	while ((req = virtqueue_get_buf(vq, &len)) != NULL) {
> > +		req->done = true;
> > +		wake_up(&req->host_acked);
> > +
> > +		if (!list_empty(&vpmem->req_list)) {
> > +			req_buf = list_first_entry(&vpmem->req_list,
> > +					struct virtio_pmem_request, list);
> > +			list_del(&vpmem->req_list);
> 
> Shouldn't it be rather `list_del(vpmem->req_list.next)`? We are trying to
> unlink
> first element of the list and `vpmem->req_list` is just the list head.

This looks correct. We are not deleting head but first entry in 'req_list'
which is device corresponding list of pending requests.

Please see below:

/**
 * Retrieve the first list entry for the given list pointer.
 *
 * Example:
 * struct foo *first;
 * first = list_first_entry(&bar->list_of_foos, struct foo, list_of_foos);
 *
 * @param ptr The list head
 * @param type Data type of the list element to retrieve
 * @param member Member name of the struct list_head field in the list element.
 * @return A pointer to the first list element.
 */
#define list_first_entry(ptr, type, member) \
    list_entry((ptr)->next, type, member)

> 
> > +int virtio_pmem_flush(struct nd_region *nd_region)
> > +{
> > +	int err;
> > +	unsigned long flags;
> > +	struct scatterlist *sgs[2], sg, ret;
> > +	struct virtio_device *vdev = nd_region->provider_data;
> > +	struct virtio_pmem *vpmem = vdev->priv;
> > +	struct virtio_pmem_request *req;
> > +
> > +	might_sleep();
> > +	req = kmalloc(sizeof(*req), GFP_KERNEL);
> > +	if (!req)
> > +		return -ENOMEM;
> > +
> > +	req->done = req->wq_buf_avail = false;
> > +	strcpy(req->name, "FLUSH");
> > +	init_waitqueue_head(&req->host_acked);
> > +	init_waitqueue_head(&req->wq_buf);
> > +	sg_init_one(&sg, req->name, strlen(req->name));
> > +	sgs[0] = &sg;
> > +	sg_init_one(&ret, &req->ret, sizeof(req->ret));
> > +	sgs[1] = &ret;
> > +
> > +	spin_lock_irqsave(&vpmem->pmem_lock, flags);
> > +	err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req, GFP_ATOMIC);
> > +	if (err) {
> > +		dev_err(&vdev->dev, "failed to send command to virtio pmem device\n");
> > +
> > +		list_add_tail(&vpmem->req_list, &req->list);
> > +		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> > +
> > +		/* When host has read buffer, this completes via host_ack */
> > +		wait_event(req->wq_buf, req->wq_buf_avail);
> > +		spin_lock_irqsave(&vpmem->pmem_lock, flags);
> > +	}
> 
> Aren't the arguments in `list_add_tail` swapped? The element we are adding

No, this is intentional. 'vpmem->req_list' maintains a list of pending requests
for entire pmem device.  'req->list'is per request list and maintains pending
request on virtio queue add failure. I think we don't need this list.

> should
> be first, the list should be second. Also, shouldn't we resubmit the request
> after
> waking up from `wait_event(req->wq_buf, req->wq_buf_avail)`?

Yes. we should. Good point.

> 
> I propose rewriting it like that:
> 
> diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
> index 66b582f751a3..ff0556b04e86 100644
> --- a/drivers/nvdimm/virtio_pmem.c
> +++ b/drivers/nvdimm/virtio_pmem.c
> @@ -25,7 +25,7 @@ void host_ack(struct virtqueue *vq)
>  		if (!list_empty(&vpmem->req_list)) {
>  			req_buf = list_first_entry(&vpmem->req_list,
>  					struct virtio_pmem_request, list);
> -			list_del(&vpmem->req_list);
> +			list_del(vpmem->req_list.next);

Don't think its correct.

>  			req_buf->wq_buf_avail = true;
>  			wake_up(&req_buf->wq_buf);
>  		}
> @@ -59,17 +59,33 @@ int virtio_pmem_flush(struct nd_region *nd_region)
>  	sgs[1] = &ret;
>  
>  	spin_lock_irqsave(&vpmem->pmem_lock, flags);
> -	err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req, GFP_ATOMIC);
> -	if (err) {
> -		dev_err(&vdev->dev, "failed to send command to virtio pmem device\n");
> +	/*
> +	 * If virtqueue_add_sgs returns -ENOSPC then req_vq virtual queue does not
> +	 * have free descriptor slots. We add the request to req_list and wait
> +	 * for host_ack to wake us up when free slots are available.
> +	 */
> +	while ((err = virtqueue_add_sgs(vpmem->req_vq, sgs, 1, 1, req, GFP_ATOMIC))
> == -ENOSPC) {
> +		dev_err(&vdev->dev, "failed to send command to virtio pmem device, no free
> slots in the virtqueue, postponing request\n");
> +		req->wq_buf_avail = false;
>  
> -		list_add_tail(&vpmem->req_list, &req->list);
> +		list_add_tail(&req->list, &vpmem->req_list);
>  		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
>  
>  		/* When host has read buffer, this completes via host_ack */
>  		wait_event(req->wq_buf, req->wq_buf_avail);
>  		spin_lock_irqsave(&vpmem->pmem_lock, flags);
>  	}
> +
> +	/*
> +	 * virtqueue_add_sgs failed with error different than -ENOSPC, we can't
> +	 * do anything about that.
> +	 */
> +	if (err) {
> +		dev_info(&vdev->dev, "failed to send command to virtio pmem device, error
> code %d\n", err);
> +		spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> +		err = -EIO;
> +		goto ret;
> +	}
>  	err = virtqueue_kick(vpmem->req_vq);
>  	spin_unlock_irqrestore(&vpmem->pmem_lock, flags);
> 
> 
> Let me know if it looks reasonable to you.

Don't think this is fulfilling entire logic correctly. But thanks, I spotted a bug in my code :)
Will fix it. 

> 
> Thank you,
> Jakub Staron
> 
> 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
