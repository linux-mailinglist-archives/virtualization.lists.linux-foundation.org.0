Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA4EAB203
	for <lists.virtualization@lfdr.de>; Fri,  6 Sep 2019 07:18:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 240F21B46;
	Fri,  6 Sep 2019 05:18:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 2FF701B26
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 05:18:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C41B2756
	for <virtualization@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 05:18:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F100F18C891C;
	Fri,  6 Sep 2019 05:18:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
	[10.36.117.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14E1D60872;
	Fri,  6 Sep 2019 05:18:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 42172753F; Fri,  6 Sep 2019 07:18:47 +0200 (CEST)
Date: Fri, 6 Sep 2019 07:18:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: David Riley <davidriley@chromium.org>
Subject: Re: [PATCH v2] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190906051847.75mj4772nqwdper6@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190905220008.75488-1-davidriley@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190905220008.75488-1-davidriley@chromium.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.70]);
	Fri, 06 Sep 2019 05:18:50 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>,
	=?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
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

> +/* How many bytes left in this page. */
> +static unsigned int rest_of_page(void *data)
> +{
> +	return PAGE_SIZE - offset_in_page(data);
> +}

Not needed.

> +/* Create sg_table from a vmalloc'd buffer. */
> +static struct sg_table *vmalloc_to_sgt(char *data, uint32_t size, int *sg_ents)
> +{
> +	int nents, ret, s, i;
> +	struct sg_table *sgt;
> +	struct scatterlist *sg;
> +	struct page *pg;
> +
> +	*sg_ents = 0;
> +
> +	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
> +	if (!sgt)
> +		return NULL;
> +
> +	nents = DIV_ROUND_UP(size, PAGE_SIZE) + 1;

Why +1?

> +	ret = sg_alloc_table(sgt, nents, GFP_KERNEL);
> +	if (ret) {
> +		kfree(sgt);
> +		return NULL;
> +	}
> +
> +	for_each_sg(sgt->sgl, sg, nents, i) {
> +		pg = vmalloc_to_page(data);
> +		if (!pg) {
> +			sg_free_table(sgt);
> +			kfree(sgt);
> +			return NULL;
> +		}
> +
> +		s = rest_of_page(data);
> +		if (s > size)
> +			s = size;

vmalloc memory is page aligned, so:

		s = min(PAGE_SIZE, size);

> +		sg_set_page(sg, pg, s, offset_in_page(data));

Offset is always zero.

> +
> +		size -= s;
> +		data += s;
> +		*sg_ents += 1;

sg_ents isn't used anywhere.

> +
> +		if (size) {
> +			sg_unmark_end(sg);
> +		} else {
> +			sg_mark_end(sg);
> +			break;
> +		}

That looks a bit strange.  I guess you need only one of the two because
the other is the default?

>  static int virtio_gpu_queue_fenced_ctrl_buffer(struct virtio_gpu_device *vgdev,
>  					       struct virtio_gpu_vbuffer *vbuf,
>  					       struct virtio_gpu_ctrl_hdr *hdr,
>  					       struct virtio_gpu_fence *fence)
>  {
>  	struct virtqueue *vq = vgdev->ctrlq.vq;
> +	struct scatterlist *vout = NULL, sg;
> +	struct sg_table *sgt = NULL;
>  	int rc;
> +	int outcnt = 0;
> +
> +	if (vbuf->data_size) {
> +		if (is_vmalloc_addr(vbuf->data_buf)) {
> +			sgt = vmalloc_to_sgt(vbuf->data_buf, vbuf->data_size,
> +					     &outcnt);
> +			if (!sgt)
> +				return -ENOMEM;
> +			vout = sgt->sgl;
> +		} else {
> +			sg_init_one(&sg, vbuf->data_buf, vbuf->data_size);
> +			vout = &sg;
> +			outcnt = 1;

outcnt must be set in both cases.

> +static int virtio_gpu_queue_ctrl_buffer(struct virtio_gpu_device *vgdev,
> +					struct virtio_gpu_vbuffer *vbuf)
> +{
> +	return virtio_gpu_queue_fenced_ctrl_buffer(vgdev, vbuf, NULL, NULL);
> +}

Changing virtio_gpu_queue_ctrl_buffer to call
virtio_gpu_queue_fenced_ctrl_buffer should be done in a separate patch.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
