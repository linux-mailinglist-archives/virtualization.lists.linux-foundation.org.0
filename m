Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D94C714CE
	for <lists.virtualization@lfdr.de>; Tue, 23 Jul 2019 11:17:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 16B9FBE7;
	Tue, 23 Jul 2019 09:16:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 97168B43
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:16:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30C40FE
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 09:16:52 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id g18so30562456qkl.3
	for <virtualization@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 02:16:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=p1+gYIBWMowLYRybQ6oWxpq5UdgeV2arIpG6bdXu/8w=;
	b=ANmsFZuICL82tKL1e3K9GlTysAuXWsZk0gWvtRw8THXwS3ECkzefyL0yxT3TKMzo4a
	gu844N3zfnpvdd/bLp44fG5//GaAsUl1TKZ/qDeraezi6y9Iw/x9paw3/fzUzUuyipun
	ZM2KGAnB/Y5KQ1QeLjWVa7rXtUF5lqAirsgypIkI4EQNL56jmeWCfNye4VHCJQ1qsiYL
	yKUQhmChYmDrW48E9ad9ZMhrRUdSmwbwJvhcRwbCL7bNwemlvKSVfPR14dnpqPBVQ53+
	E+TYuoJFqRcIc9HMMfDjNIYvVkXtw885PhPzn1jEWDHxP1OSCC44Hhdttv+oxH2ImhnJ
	4E6Q==
X-Gm-Message-State: APjAAAX420TjMbT/kSWPQv9nWLIa7vOvfCEiSAnz0oBXepC2XZuZTITW
	E7o+rlF4MA7RvGwnKVL5BwLIkA==
X-Google-Smtp-Source: APXvYqyu6jNlikk+iK+Qd5rby5/UX6t/lEzykZfn5ns4rVGJkT29eU29dnU+XKBwjNMXoWgetKh15w==
X-Received: by 2002:a37:6508:: with SMTP id z8mr48471820qkb.492.1563873411371; 
	Tue, 23 Jul 2019 02:16:51 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
	by smtp.gmail.com with ESMTPSA id
	t12sm18734095qtr.49.2019.07.23.02.16.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Jul 2019 02:16:50 -0700 (PDT)
Date: Tue, 23 Jul 2019 05:16:45 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 6/6] vhost: don't do synchronize_rcu() in
	vhost_uninit_vq_maps()
Message-ID: <20190723041144-mutt-send-email-mst@kernel.org>
References: <20190723075718.6275-1-jasowang@redhat.com>
	<20190723075718.6275-7-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723075718.6275-7-jasowang@redhat.com>
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

On Tue, Jul 23, 2019 at 03:57:18AM -0400, Jason Wang wrote:
> There's no need for RCU synchronization in vhost_uninit_vq_maps()
> since we've already serialized with readers (memory accessors). This
> also avoid the possible userspace DOS through ioctl() because of the
> possible high latency caused by synchronize_rcu().
> 
> Reported-by: Michael S. Tsirkin <mst@redhat.com>
> Fixes: 7f466032dc9e ("vhost: access vq metadata through kernel virtual address")
> Signed-off-by: Jason Wang <jasowang@redhat.com>

I agree synchronize_rcu in both mmu notifiers and ioctl
is a problem we must fix.

> ---
>  drivers/vhost/vhost.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 5b8821d00fe4..a17df1f4069a 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -334,7 +334,9 @@ static void vhost_uninit_vq_maps(struct vhost_virtqueue *vq)
>  	}
>  	spin_unlock(&vq->mmu_lock);
>  
> -	synchronize_rcu();
> +	/* No need for synchronize_rcu() or kfree_rcu() since we are
> +	 * serialized with memory accessors (e.g vq mutex held).
> +	 */
>  
>  	for (i = 0; i < VHOST_NUM_ADDRS; i++)
>  		if (map[i])
> -- 
> 2.18.1

.. however we can not RCU with no synchronization in sight.
Sometimes there are hacks like using a lock/unlock
pair instead of sync, but here no one bothers.

specifically notifiers call reset vq maps which calls
uninit vq maps which is not under any lock.

You will get use after free when map is then accessed.

If you always have a lock then just take that lock
and no need for RCU.

-- 
MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
