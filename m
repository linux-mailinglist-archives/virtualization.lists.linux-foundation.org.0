Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D220BAEE4
	for <lists.virtualization@lfdr.de>; Mon, 23 Sep 2019 10:07:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 8596EC6E;
	Mon, 23 Sep 2019 08:07:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 73D45C37
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 08:07:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B45C489E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 08:07:22 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24C6A61D25
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 08:07:22 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id b67so16803239qkc.1
	for <virtualization@lists.linux-foundation.org>;
	Mon, 23 Sep 2019 01:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=GtkVLxajS9qecd1iiLjWKYP8KasxkZAd70jCNiNzvoI=;
	b=EwBMd4YZ5C1IffK5IELJJHadQz7nCAgiwScYKpq1iSvdUq0fk1TJpWKC+/XlrxS1Qa
	AA7cokFl0sqz2cMzqnsC6EYP0rkd8ZX/E9V43xQSPLdltekeemad/hZ0WJFfA+x31hTP
	Dyz3U2Ho4XtKc/gi+teBNC0N0TEz+eNJYeQrf2g39VghElbtyrfgPoKyAXxMUirIwfcE
	k4GruH/RUzhz1kIJjyMxB6M3mxJ0EBJdd+XatU/JTuTPu+w/0xUMp3mVS3IaZ0kYPGG/
	NbvJTDvQTxSEK6RbMJYuoxf+cp7VZQruJQBPWziJMDM0CDwUJeNQnvNkyaQYuxIoNPPZ
	8CBw==
X-Gm-Message-State: APjAAAWlFMuvNepBcPWIrRluzB5pObA/wzlXFJYF3sgNcc0PHa68zH/b
	H6yIk891/4L11ZPvSp8ebM4RjtLrb/NoiwPa35oBkk3MtHAmQFK9ialJ+fhRiXXvNz+4DJYMR93
	FRVshDx6pocT0EY0c86YWgngAqeFIqW68XANluSSE1Q==
X-Received: by 2002:ac8:1767:: with SMTP id u36mr15795733qtk.152.1569226041435;
	Mon, 23 Sep 2019 01:07:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxTFCDVmbYMZjvOnYtH+mE9geB7di4826uJa+jSeyr2GrwRD/VkW9bYWy7gYlmWOdfHPTBHMg==
X-Received: by 2002:ac8:1767:: with SMTP id u36mr15795722qtk.152.1569226041292;
	Mon, 23 Sep 2019 01:07:21 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id 60sm5445508qta.77.2019.09.23.01.07.18
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 23 Sep 2019 01:07:20 -0700 (PDT)
Date: Mon, 23 Sep 2019 04:07:15 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: wangxu <wangxu72@huawei.com>
Subject: Re: [PATCH] vhost: It's better to use size_t for the 3rd parameter
	of vhost_exceeds_weight()
Message-ID: <20190923040518-mutt-send-email-mst@kernel.org>
References: <1569224801-101248-1-git-send-email-wangxu72@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1569224801-101248-1-git-send-email-wangxu72@huawei.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
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

On Mon, Sep 23, 2019 at 03:46:41PM +0800, wangxu wrote:
> From: Wang Xu <wangxu72@huawei.com>
> 
> Caller of vhost_exceeds_weight(..., total_len) in drivers/vhost/net.c
> usually pass size_t total_len, which may be affected by rx/tx package.
> 
> Signed-off-by: Wang Xu <wangxu72@huawei.com>


Puts a bit more pressure on the register file ...
why do we care? Is there some way that it can
exceed INT_MAX?

> ---
>  drivers/vhost/vhost.c | 4 ++--
>  drivers/vhost/vhost.h | 7 ++++---
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 36ca2cf..159223a 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -412,7 +412,7 @@ static void vhost_dev_free_iovecs(struct vhost_dev *dev)
>  }
>  
>  bool vhost_exceeds_weight(struct vhost_virtqueue *vq,
> -			  int pkts, int total_len)
> +			  int pkts, size_t total_len)
>  {
>  	struct vhost_dev *dev = vq->dev;
>  
> @@ -454,7 +454,7 @@ static size_t vhost_get_desc_size(struct vhost_virtqueue *vq,
>  
>  void vhost_dev_init(struct vhost_dev *dev,
>  		    struct vhost_virtqueue **vqs, int nvqs,
> -		    int iov_limit, int weight, int byte_weight)
> +		    int iov_limit, int weight, size_t byte_weight)
>  {
>  	struct vhost_virtqueue *vq;
>  	int i;
> diff --git a/drivers/vhost/vhost.h b/drivers/vhost/vhost.h
> index e9ed272..8d80389d 100644
> --- a/drivers/vhost/vhost.h
> +++ b/drivers/vhost/vhost.h
> @@ -172,12 +172,13 @@ struct vhost_dev {
>  	wait_queue_head_t wait;
>  	int iov_limit;
>  	int weight;
> -	int byte_weight;
> +	size_t byte_weight;
>  };
>  


This just costs extra memory, and value is never large,
so I don't think this matters.

> -bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts, int total_len);
> +bool vhost_exceeds_weight(struct vhost_virtqueue *vq, int pkts,
> +			  size_t total_len);
>  void vhost_dev_init(struct vhost_dev *, struct vhost_virtqueue **vqs,
> -		    int nvqs, int iov_limit, int weight, int byte_weight);
> +		    int nvqs, int iov_limit, int weight, size_t byte_weight);
>  long vhost_dev_set_owner(struct vhost_dev *dev);
>  bool vhost_dev_has_owner(struct vhost_dev *dev);
>  long vhost_dev_check_owner(struct vhost_dev *);
> -- 
> 1.8.5.6
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
