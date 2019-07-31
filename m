Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4D7BE19
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 12:13:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A03973B5A;
	Wed, 31 Jul 2019 10:12:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E25703B48
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 09:59:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 46D8CA8
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 09:59:55 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s3so60093467wms.2
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 02:59:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KfQ1GOxa2gwawYjZESEw8m6ZN1EOeLyab9IzRAQRkB8=;
	b=PhjtrTkw82EEwuOBtrBeT+qmgH6+Ybo4m0fkkxN+6FCdGkswGjzwxXhmU3L+GC2pef
	oQOFICU58xsNCzCemoru662jv6bg+HSFvSMXRZNz3myLcTyVCK/wkohrDU+dWP+vl1Pn
	1QuXOWa6qKMc+sJx3mfPc7bV7HmAmX4IMRE+asfeLfgOf5cfXF/hVzD575mo5YZkFCzE
	9lvBeRFaeqBejUCJ/NAd2IXY/4vs6Nt1rL9ejFwCdtm1nYYgviSuFvt4dM7KyY/dj/sD
	Y+bGSwRnZWXxkcrrdmsDyM9zSKZS/JY5tKaoxRMvzokEGcrOFmv04NWabLonNWoja5Xm
	KwUQ==
X-Gm-Message-State: APjAAAXs3/tho57mSoC8TGfGs6CVgDNXkR308LGD5Jlp6v6loqonBMrU
	jOh7GiOnkCXejijIy6G1Gl3RZA==
X-Google-Smtp-Source: APXvYqy7/iEU1UrL2it0Ep7+ooQdkQ6xuUDFbcpqjrWR2xbr/ulDYf5qm8/eQpzBooD00tKHJ19RcQ==
X-Received: by 2002:a05:600c:230c:: with SMTP id
	12mr12821673wmo.151.1564567193839; 
	Wed, 31 Jul 2019 02:59:53 -0700 (PDT)
Received: from steredhat (host122-201-dynamic.13-79-r.retail.telecomitalia.it.
	[79.13.201.122]) by smtp.gmail.com with ESMTPSA id
	d10sm79226236wro.18.2019.07.31.02.59.52
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 31 Jul 2019 02:59:53 -0700 (PDT)
Date: Wed, 31 Jul 2019 11:59:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 9/9] vhost: do not return -EAGIAN for non blocking
	invalidation too early
Message-ID: <20190731095950.d6zr472megt7rgkt@steredhat>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-10-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731084655.7024-10-jasowang@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: jgg@ziepe.ca, kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org
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

A little typo in the title: s/EAGIAN/EAGAIN

Thanks,
Stefano

On Wed, Jul 31, 2019 at 04:46:55AM -0400, Jason Wang wrote:
> Instead of returning -EAGAIN unconditionally, we'd better do that only
> we're sure the range is overlapped with the metadata area.
> 
> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual address")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vhost/vhost.c | 32 +++++++++++++++++++-------------
>  1 file changed, 19 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index fc2da8a0c671..96c6aeb1871f 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -399,16 +399,19 @@ static void inline vhost_vq_sync_access(struct vhost_virtqueue *vq)
>  	smp_mb();
>  }
>  
> -static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
> -				      int index,
> -				      unsigned long start,
> -				      unsigned long end)
> +static int vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
> +				     int index,
> +				     unsigned long start,
> +				     unsigned long end,
> +				     bool blockable)
>  {
>  	struct vhost_uaddr *uaddr = &vq->uaddrs[index];
>  	struct vhost_map *map;
>  
>  	if (!vhost_map_range_overlap(uaddr, start, end))
> -		return;
> +		return 0;
> +	else if (!blockable)
> +		return -EAGAIN;
>  
>  	spin_lock(&vq->mmu_lock);
>  	++vq->invalidate_count;
> @@ -423,6 +426,8 @@ static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
>  		vhost_set_map_dirty(vq, map, index);
>  		vhost_map_unprefetch(map);
>  	}
> +
> +	return 0;
>  }
>  
>  static void vhost_invalidate_vq_end(struct vhost_virtqueue *vq,
> @@ -443,18 +448,19 @@ static int vhost_invalidate_range_start(struct mmu_notifier *mn,
>  {
>  	struct vhost_dev *dev = container_of(mn, struct vhost_dev,
>  					     mmu_notifier);
> -	int i, j;
> -
> -	if (!mmu_notifier_range_blockable(range))
> -		return -EAGAIN;
> +	bool blockable = mmu_notifier_range_blockable(range);
> +	int i, j, ret;
>  
>  	for (i = 0; i < dev->nvqs; i++) {
>  		struct vhost_virtqueue *vq = dev->vqs[i];
>  
> -		for (j = 0; j < VHOST_NUM_ADDRS; j++)
> -			vhost_invalidate_vq_start(vq, j,
> -						  range->start,
> -						  range->end);
> +		for (j = 0; j < VHOST_NUM_ADDRS; j++) {
> +			ret = vhost_invalidate_vq_start(vq, j,
> +							range->start,
> +							range->end, blockable);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	return 0;
> -- 
> 2.18.1
> 

-- 
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
