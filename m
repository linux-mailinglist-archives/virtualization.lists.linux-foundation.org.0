Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 58078714D3
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 11:17:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 853BBC6D;
	Tue, 23 Jul 2019 09:17:13 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 242EA2C
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:17:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A8386FE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:17:11 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h21so41140916qtn.13
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 02:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=rE+i8EqXzyB8DBEUYxSjl+5SA8mCW5PhVrX+Xp6Yjvw=;
	b=MGi6F4AOhfp7sBpTgqg0ukeZ9Of1075uujLw3lDkyflHWMpxCcYUnBjjm/iWQZtSdn
	dOzir+EM+fiSMssn6/o1xNAstNqfFy8mpZSFqC+GYV3ghCuUp9mma8bvepuCfKqJ6C2e
	GE08qEEa9238M/9ZriQ6WJpgBD8hBDeY3O1en7CSnfQ8yzJtczOPUWJJUwYMOZVkAgs4
	/HQi9saqYQzp80zu6rTQlVmJ57lG3TyG+KnJicSkDJGYyBZCQG2Ba2he/X2Fxj8jxysP
	e991zqJg33vBP3hcKb9DDEvdeUVPuMLuajVv+VLFbyBzKqiOJkh7w9xF3ks+XcyZ14Vy
	3vrg==
X-Gm-Message-State: APjAAAVPkzK0KyQ7oVBjmEGAkvqci/i2lsZrx7vkY/PiAZdjjwoMoFzC
	Ul7r7CJIXO5JX8mBUL6JvLGPPg==
X-Google-Smtp-Source: APXvYqyAykM6yZ3eL7Nuv5ZAEtiWnBxoluP42MON3e5EZBOP/lJkeMVDrPe0RbgXHwPtl0InvF1Ang==
X-Received: by 2002:ac8:39a3:: with SMTP id v32mr53485150qte.262.1563873430754;
	Tue, 23 Jul 2019 02:17:10 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	42sm22937793qtm.27.2019.07.23.02.17.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 02:17:10 -0700 (PDT)
Date: Tue, 23 Jul 2019 05:17:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vhost: mark dirty pages during map uninit
Message-ID: <20190723041702-mutt-send-email-mst@kernel.org>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-6-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723075718.6275-6-jasowang@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

On Tue, Jul 23, 2019 at 03:57:17AM -0400, Jason Wang wrote:
> We don't mark dirty pages if the map was teared down outside MMU
> notifier. This will lead untracked dirty pages. Fixing by marking
> dirty pages during map uninit.
> 
> Reported-by: Michael S. Tsirkin <mst@redhat.com>
> Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual address")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  drivers/vhost/vhost.c | 22 ++++++++++++++++------
>  1 file changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 89c9f08b5146..5b8821d00fe4 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -306,6 +306,18 @@ static void vhost_map_unprefetch(struct vhost_map *map)
>  	kfree(map);
>  }
>  
> +static void vhost_set_map_dirty(struct vhost_virtqueue *vq,
> +				struct vhost_map *map, int index)
> +{
> +	struct vhost_uaddr *uaddr = &vq->uaddrs[index];
> +	int i;
> +
> +	if (uaddr->write) {
> +		for (i = 0; i < map->npages; i++)
> +			set_page_dirty(map->pages[i]);
> +	}
> +}
> +
>  static void vhost_uninit_vq_maps(struct vhost_virtqueue *vq)
>  {
>  	struct vhost_map *map[VHOST_NUM_ADDRS];
> @@ -315,8 +327,10 @@ static void vhost_uninit_vq_maps(struct vhost_virtqueue *vq)
>  	for (i = 0; i < VHOST_NUM_ADDRS; i++) {
>  		map[i] = rcu_dereference_protected(vq->maps[i],
>  				  lockdep_is_held(&vq->mmu_lock));
> -		if (map[i])
> +		if (map[i]) {
> +			vhost_set_map_dirty(vq, map[i], i);
>  			rcu_assign_pointer(vq->maps[i], NULL);
> +		}
>  	}
>  	spin_unlock(&vq->mmu_lock);
>  
> @@ -354,7 +368,6 @@ static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
>  {
>  	struct vhost_uaddr *uaddr = &vq->uaddrs[index];
>  	struct vhost_map *map;
> -	int i;
>  
>  	if (!vhost_map_range_overlap(uaddr, start, end))
>  		return;
> @@ -365,10 +378,7 @@ static void vhost_invalidate_vq_start(struct vhost_virtqueue *vq,
>  	map = rcu_dereference_protected(vq->maps[index],
>  					lockdep_is_held(&vq->mmu_lock));
>  	if (map) {
> -		if (uaddr->write) {
> -			for (i = 0; i < map->npages; i++)
> -				set_page_dirty(map->pages[i]);
> -		}
> +		vhost_set_map_dirty(vq, map, index);
>  		rcu_assign_pointer(vq->maps[index], NULL);
>  	}
>  	spin_unlock(&vq->mmu_lock);

OK and the reason it's safe is because the invalidate counter
got incremented so we know page will not get mapped again.

But we *do* need to wait for page not to be mapped.
And if that means waiting for VQ processing to finish,
then I worry that is a very log time.


> -- 
> 2.18.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
