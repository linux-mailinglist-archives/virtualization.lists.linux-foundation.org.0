Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF247C242
	for <lists.virtualization@lfdr.de>; Wed, 31 Jul 2019 14:53:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ADC083C22;
	Wed, 31 Jul 2019 12:52:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7E5463C22
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 12:41:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CE3396CE
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 12:41:25 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id h18so66362169qtm.9
	for <virtualization@lists.linux-foundation.org>;
	Wed, 31 Jul 2019 05:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ssT+JujOxDwS6NEpfq2Ge7MRteKET9yZx/jW5aTaxrI=;
	b=CV7jH3veMykUxgu+H5gGaJEiM7dHfRA3AWXtjSYfzu48EjQ0oDP+S8cs1UxQbidp/W
	MqKLYekmIDfV2RBQHTtrwRlnUCc5krtCPt3AASFeznsZkr+ipQT/XuC+Xn6vABBkKIFP
	enujxa2gQmDcqqBPQMXqNzw5a+lpfG5eB2A37iznAHNxxA9jQHhaTnP+cwJR1UO9lidY
	SP65bUUa5WqhqoZCyAGPCKh7SUkgLjT8qHxGXbgc7GA59ln/8F06imsHF08LgdqgZvE2
	/+AQjQMxZnEgE6iMjDFEfdphXGCtwyg1L1ebJpvApgpgereLtbGxAEtwqnD5666T6XAv
	R7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ssT+JujOxDwS6NEpfq2Ge7MRteKET9yZx/jW5aTaxrI=;
	b=oYZhpQQtKKdGTk0AhUf1PySXHHRN/YZ1DLHDxmhPS7e4AT+GBW2r5M2zy0oNjfYAJW
	dX96p/eju6R3J9M19XakXIQZeTvSDOiY3r+X6bedVoYD3/jHU1AHJLaYl+nvOwacrEOF
	GzoIohfCW6UK6goe9NEwFDmdNaQ4jFNUHs0XysZDLp37RupMUyKeGiB7ulSpZ3Pm4gcD
	7t6hxk6KGrfW4Cl0MnuszKBW3EBB46y9CLXQiXZODt9j9f/qn+FpP7om4uAf0ckoZAZy
	/SoItG4G37MpP+1Rm4XX3OmsdRbEgTXT58rMj7DmyiA0lq4Ood/kRWEIM7+FDWnm0bVz
	aABw==
X-Gm-Message-State: APjAAAU5iACCug80shgbCYF+09urWZOALqYhTpNN3ObxteBM/2jw6AK4
	WQi7gewcfqA7YXwJ+oULhBbNJCPvErA=
X-Google-Smtp-Source: APXvYqwbN0Zcgw/rqJW/uUJyj5pJV/gEvjkDyEf6dYni+Q8BnL4R5HKzXod/DVe6ENOwDm8+CZT9Rw==
X-Received: by 2002:a0c:acab:: with SMTP id m40mr88924921qvc.52.1564576884920; 
	Wed, 31 Jul 2019 05:41:24 -0700 (PDT)
Received: from ziepe.ca
	(hlfxns017vw-156-34-55-100.dhcp-dynamic.fibreop.ns.bellaliant.net.
	[156.34.55.100]) by smtp.gmail.com with ESMTPSA id
	u4sm29623865qkb.16.2019.07.31.05.41.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 Jul 2019 05:41:24 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
	(envelope-from <jgg@ziepe.ca>)
	id 1hsnv2-0006PN-6Q; Wed, 31 Jul 2019 09:41:24 -0300
Date: Wed, 31 Jul 2019 09:41:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2 4/9] vhost: reset invalidate_count in
	vhost_set_vring_num_addr()
Message-ID: <20190731124124.GD3946@ziepe.ca>
References: <20190731084655.7024-1-jasowang@redhat.com>
	<20190731084655.7024-5-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731084655.7024-5-jasowang@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
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

On Wed, Jul 31, 2019 at 04:46:50AM -0400, Jason Wang wrote:
> The vhost_set_vring_num_addr() could be called in the middle of
> invalidate_range_start() and invalidate_range_end(). If we don't reset
> invalidate_count after the un-registering of MMU notifier, the
> invalidate_cont will run out of sync (e.g never reach zero). This will
> in fact disable the fast accessor path. Fixing by reset the count to
> zero.
> 
> Reported-by: Michael S. Tsirkin <mst@redhat.com>

Did Michael report this as well?

> Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual address")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
>  drivers/vhost/vhost.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 2a3154976277..2a7217c33668 100644
> +++ b/drivers/vhost/vhost.c
> @@ -2073,6 +2073,10 @@ static long vhost_vring_set_num_addr(struct vhost_dev *d,
>  		d->has_notifier = false;
>  	}
>  
> +	/* reset invalidate_count in case we are in the middle of
> +	 * invalidate_start() and invalidate_end().
> +	 */
> +	vq->invalidate_count = 0;
>  	vhost_uninit_vq_maps(vq);
>  #endif
>  
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
