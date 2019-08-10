Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7213888CB8
	for <lists.virtualization@lfdr.de>; Sat, 10 Aug 2019 20:14:42 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 59C79B8F;
	Sat, 10 Aug 2019 18:13:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 58FBCB59
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 18:12:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E4A897D2
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 18:12:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id s14so3761067qkm.4
	for <virtualization@lists.linux-foundation.org>;
	Sat, 10 Aug 2019 11:12:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=Rl3GYKdvkUhjJZod4R7cIwaGENcluFkd1m8GRMDLYjA=;
	b=YX8xfXmaNZwnyVXkRDdL0syq2s+n2xyUrhTXtyvsN6pYJNqDNOrmVjstkmr/ie/wM8
	Uj24S8qE0goKLUQiHPVuOqLWFN/y+U9yYPgRWih/XVlomvmX9RsUC5D+/sAuLqtV/Vqy
	02AeLN2LRHHdRlibiXaeMx5/tX5yq8Q62G9okOjfS2fz1bC1nCG9wsTgm70LiQAUtEaZ
	Ac5kI1QqxZi+Syoa6+dBPmDXUchVeqphsbxq2BEz6CKLVFQzxJfRrXee1wqSoI0m1pZI
	8LFCkAzRVcQiv8Oe1voPCMMfyrcXHZlB96o7bFrony3Na+ShV3E2ViaLyN/mPxC5dn2C
	MJ6A==
X-Gm-Message-State: APjAAAXwDhpizCeCdkbedoc3AokWsfZgy4/qgNYW5wezvhxyM+2fjCJv
	TKbp8p8/0OB0gKz6lkrzOLfG6w==
X-Google-Smtp-Source: APXvYqwi1TjEBF8tYTsvAGgXLmd4P+ip28ybiTZaq2rLk2el4TcxbT3QBB9TmfjhklDWaGag+v2B+A==
X-Received: by 2002:a37:a7d6:: with SMTP id q205mr24016018qke.44.1565460778101;
	Sat, 10 Aug 2019 11:12:58 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	h4sm43862894qkk.39.2019.08.10.11.12.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 10 Aug 2019 11:12:57 -0700 (PDT)
Date: Sat, 10 Aug 2019 14:12:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Pankaj Gupta <pagupta@redhat.com>
Subject: Re: [PATCH v3 2/2] virtio: decrement avail idx with buffer detach
	for packed ring
Message-ID: <20190810141213-mutt-send-email-mst@kernel.org>
References: <20190809064847.28918-1-pagupta@redhat.com>
	<20190809064847.28918-3-pagupta@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809064847.28918-3-pagupta@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: arnd@arndb.de, amit@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, xiaohli@redhat.com
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

On Fri, Aug 09, 2019 at 12:18:47PM +0530, Pankaj Gupta wrote:
> This patch decrements 'next_avail_idx' count when detaching a buffer
> from vq for packed ring code. Split ring code already does this in
> virtqueue_detach_unused_buf_split function. This updates the
> 'next_avail_idx' to the previous correct index after an unused buffer
> is detatched from the vq.
> 
> Signed-off-by: Pankaj Gupta <pagupta@redhat.com>

I would make this patch 1, not patch 2, otherwise
patch 1 corrupts the ring.


> ---
>  drivers/virtio/virtio_ring.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index c8be1c4f5b55..7c69181113e2 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1537,6 +1537,12 @@ static void *virtqueue_detach_unused_buf_packed(struct virtqueue *_vq)
>  		/* detach_buf clears data, so grab it now. */
>  		buf = vq->packed.desc_state[i].data;
>  		detach_buf_packed(vq, i, NULL);
> +		vq->packed.next_avail_idx--;
> +		if (vq->packed.next_avail_idx < 0) {
> +			vq->packed.next_avail_idx = vq->packed.vring.num - 1;
> +			vq->packed.avail_wrap_counter ^= 1;
> +		}
> +
>  		END_USE(vq);
>  		return buf;
>  	}
> -- 
> 2.20.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
