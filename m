Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A8A5699A1
	for <lists.virtualization@lfdr.de>; Thu,  7 Jul 2022 07:00:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C2F660D6F;
	Thu,  7 Jul 2022 05:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C2F660D6F
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GHZOvwnr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8ay_xRzsQQtj; Thu,  7 Jul 2022 05:00:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 57C2960DFD;
	Thu,  7 Jul 2022 05:00:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C2960DFD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 76A47C0077;
	Thu,  7 Jul 2022 05:00:02 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7661C002D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 05:00:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9397A40543
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 05:00:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9397A40543
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=GHZOvwnr
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpDIxkGjaY9D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 04:59:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 875B640151
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 875B640151
 for <virtualization@lists.linux-foundation.org>;
 Thu,  7 Jul 2022 04:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657169998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=87kGiNSJscDrhkcqf9onMm+btgIEmECZQ3ujjWWzTDc=;
 b=GHZOvwnr0kTPGRC29QJKFGIzPO/KWdw3Xh1Z3UpOcahukRq+8QjfXtneY3kJ7HxkQxbPwU
 5zUvrzRLrahDO3/Dy6cG6up+5hhTm83SE27wSMXPmVmegnH3aiffGe4CwULyQ00T0JyYMY
 fmDECMrMuNEu7qO/gj+E6h/vF7nSPC0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-kv3Uojn9PEiV_qV_v0OfMQ-1; Thu, 07 Jul 2022 00:59:56 -0400
X-MC-Unique: kv3Uojn9PEiV_qV_v0OfMQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 i184-20020a1c3bc1000000b003a026f48333so7600342wma.4
 for <virtualization@lists.linux-foundation.org>;
 Wed, 06 Jul 2022 21:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=87kGiNSJscDrhkcqf9onMm+btgIEmECZQ3ujjWWzTDc=;
 b=gOKA/Lh56YW4K07IRqPvlZ7SoLAk8RybrRBk5OJs5dmjuzCue4lU9vzrOF2nR4Z1Nl
 m5i7Sp7toxVVN9phLUNkThbgATwRMiZ1ujUTsUxzlFZ+KRSmC6FwmCO/ZAaOBJFOlnZI
 suiIdmLm2gFfyUt+tK8xDRGMYpjzOkmMKFjtmZ7zv+Uc6bYKbuwvVi+VyPQNXKBfXiJZ
 uVyRM9eVLh4oghgNHvB06pf35Sq3oiMfTaywwo//FIuzG5w8c4qiEUcNC6C3aYhm2X+R
 I7wQ9fUaFwNDeaOgBOfjasSEhGZiNIWh/QbhTnfzFVml9XD7//xBzyuizSpVWTj94cK/
 oFpA==
X-Gm-Message-State: AJIora+AFifm2Rh93Ew0sf4FwUqv95t/9JzK9fpZrEAX611V4ySLp6Ax
 wf5m0FkcSj8/nx2sesGtg6Z6i5nFf3aUyI+cybr/pAIeWzMmHYRu9eEMYf5hdIKh/IcBo4CXBwQ
 uY6Bv2+ruVRVD5H/YytCgR0q/5PJFhbRZWNkfKHNV4Q==
X-Received: by 2002:a05:600c:154c:b0:3a1:884e:72ac with SMTP id
 f12-20020a05600c154c00b003a1884e72acmr2306292wmg.23.1657169995386; 
 Wed, 06 Jul 2022 21:59:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1upX1q823M5idzqfyXLIdglC8V3bd4vHkK4OrK+AmRKZd7yXW3c6aZu7VmA8Y4bGp5ywmiDYQ==
X-Received: by 2002:a05:600c:154c:b0:3a1:884e:72ac with SMTP id
 f12-20020a05600c154c00b003a1884e72acmr2306277wmg.23.1657169995141; 
 Wed, 06 Jul 2022 21:59:55 -0700 (PDT)
Received: from redhat.com ([2.52.154.68]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05600c1c8b00b003a2cf5eb900sm449581wms.40.2022.07.06.21.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 21:59:54 -0700 (PDT)
Date: Thu, 7 Jul 2022 00:59:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guo Zhi <qtxuning1999@sjtu.edu.cn>
Subject: Re: [PATCH v2 4/4] virtio_test: enable indirection feature
Message-ID: <20220707005311-mutt-send-email-mst@kernel.org>
References: <20220707024409.1869-1-qtxuning1999@sjtu.edu.cn>
 <20220707024409.1869-5-qtxuning1999@sjtu.edu.cn>
MIME-Version: 1.0
In-Reply-To: <20220707024409.1869-5-qtxuning1999@sjtu.edu.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: eperezma@redhat.com, linux-kernel@vger.kernel.org,
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

On Thu, Jul 07, 2022 at 10:44:09AM +0800, Guo Zhi wrote:
> Prior implementation don't use indirection feature because there is only
> one descriptor for every io event, actually prior implementation don't
> support indirection because vhost can't translate and find the indirect
> descriptors. This commit enable virtio_test malloc indirect descriptors
> in a indirect buffer and map this buffer to vhost, thus resolve this
> problem.
> 
> Signed-off-by: Guo Zhi <qtxuning1999@sjtu.edu.cn>
> ---
>  tools/virtio/virtio_test.c | 50 ++++++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 8 deletions(-)
> 
> diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
> index 363695b33..dca408a5c 100644
> --- a/tools/virtio/virtio_test.c
> +++ b/tools/virtio/virtio_test.c
> @@ -25,7 +25,7 @@
>  #define RINGSIZE   256
>  #define TEST_BUF_NUM 0x100000
>  #define BUF_SIZE   1024
> -/* Unused */
> +#define INDIRECTS_SIZE   (RINGSIZE * sizeof(struct vring_desc) * 8)
>  void *__kmalloc_fake, *__kfree_ignore_start, *__kfree_ignore_end;
>  
>  struct vq_info {
> @@ -47,6 +47,8 @@ struct vdev_info {
>  	int nvqs;
>  	void *buf;
>  	size_t buf_size;
> +	void *indirects;
> +	size_t indirects_size;

What are these exactly?

>  	struct vhost_memory *mem;
>  };
>  
> @@ -131,6 +133,8 @@ static void vq_info_add(struct vdev_info *dev, int num)
>  static void vdev_info_init(struct vdev_info* dev, unsigned long long features)
>  {
>  	int r;
> +	int nregions = 2;
> +
>  	memset(dev, 0, sizeof *dev);
>  	dev->vdev.features = features;
>  	INIT_LIST_HEAD(&dev->vdev.vqs);
> @@ -138,19 +142,25 @@ static void vdev_info_init(struct vdev_info* dev, unsigned long long features)
>  	dev->buf_size = BUF_SIZE;
>  	dev->buf = malloc(dev->buf_size);
>  	assert(dev->buf);
> -        dev->control = open("/dev/vhost-test", O_RDWR);
> +	dev->indirects_size = INDIRECTS_SIZE;
> +	dev->indirects = malloc(dev->indirects_size);
> +	assert(dev->indirects);
> +	dev->control = open("/dev/vhost-test", O_RDWR);
>  	assert(dev->control >= 0);
>  	r = ioctl(dev->control, VHOST_SET_OWNER, NULL);
>  	assert(r >= 0);
>  	dev->mem = malloc(offsetof(struct vhost_memory, regions) +
> -			  sizeof dev->mem->regions[0]);
> +			(sizeof(dev->mem->regions[0])) * nregions);
>  	assert(dev->mem);
>  	memset(dev->mem, 0, offsetof(struct vhost_memory, regions) +
> -                          sizeof dev->mem->regions[0]);
> -	dev->mem->nregions = 1;
> +			(sizeof(dev->mem->regions[0])) * nregions);
> +	dev->mem->nregions = nregions;
>  	dev->mem->regions[0].guest_phys_addr = (long)dev->buf;
>  	dev->mem->regions[0].userspace_addr = (long)dev->buf;
>  	dev->mem->regions[0].memory_size = dev->buf_size;
> +	dev->mem->regions[1].guest_phys_addr = (long)dev->indirects;
> +	dev->mem->regions[1].userspace_addr = (long)dev->indirects;
> +	dev->mem->regions[1].memory_size = dev->indirects_size;
>  	r = ioctl(dev->control, VHOST_SET_MEM_TABLE, dev->mem);
>  	assert(r >= 0);
>  }
> @@ -170,6 +180,19 @@ static void wait_for_interrupt(struct vdev_info *dev)
>  		}
>  }
>  
> +static int test_virtqueue_add_outbuf(struct virtqueue *vq,
> +				     struct scatterlist *sg, unsigned int num,
> +				     void *data, void *indirects)
> +{
> +	int r;
> +
> +	__kmalloc_fake = indirects;
> +	r = virtqueue_add_outbuf(vq, sg, num, data,
> +				 GFP_ATOMIC);
> +	__kmalloc_fake = NULL;
> +	return r;
> +}
> +

Quite a hack. Please add comments with documentation. Also - no way to
avoid hacks?

>  static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  		     bool delayed, int batch, int reset_n, int bufs)
>  {
> @@ -181,6 +204,7 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  	unsigned len;
>  	long long spurious = 0;
>  	const bool random_batch = batch == RANDOM_BATCH;
> +	void *indirects;
>  
>  	r = ioctl(dev->control, VHOST_TEST_RUN, &test);
>  	assert(r >= 0);
> @@ -188,10 +212,15 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  		next_reset = INT_MAX;
>  	}
>  
> +	/* Don't kfree indirects. */
> +	__kfree_ignore_start = dev->indirects;
> +	__kfree_ignore_end = dev->indirects + dev->indirects_size;
> +
>  	for (;;) {
>  		virtqueue_disable_cb(vq->vq);
>  		completed_before = completed;
>  		started_before = started;
> +		indirects = dev->indirects;
>  		do {
>  			const bool reset = completed > next_reset;
>  			if (random_batch)
> @@ -203,9 +232,13 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  				sg_init_table(sg, sg_size);
>  				for (int i = 0; i < sg_size; ++i)
>  					sg_set_buf(&sg[i], dev->buf + i, 0x1);
> -				r = virtqueue_add_outbuf(vq->vq, sg, sg_size,
> -							 dev->buf + started,
> -							 GFP_ATOMIC);
> +
> +				// use indirects buffer repeatedly


C style comments please.

> +				if (indirects + sg_size * sizeof(struct vring_desc) >
> +						dev->indirects + dev->indirects_size)
> +					indirects = dev->indirects;
> +				r = test_virtqueue_add_outbuf(vq->vq, sg, sg_size,
> +							      dev->buf + started, indirects);
>  				if (unlikely(r != 0)) {
>  					if (r == -ENOSPC &&
>  					    started > started_before)
> @@ -216,6 +249,7 @@ static void run_test(struct vdev_info *dev, struct vq_info *vq,
>  				}
>  
>  				++started;
> +				indirects += sg_size * sizeof(struct vring_desc);
>  			}
>  			if (unlikely(!virtqueue_kick(vq->vq))) {
>  				r = -1;
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
