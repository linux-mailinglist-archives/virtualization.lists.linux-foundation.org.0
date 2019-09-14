Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1837BB2CB9
	for <lists.virtualization@lfdr.de>; Sat, 14 Sep 2019 21:38:57 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DD4D5AE7;
	Sat, 14 Sep 2019 19:38:49 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7DD91907
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 19:38:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 08EE1619
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 19:38:47 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
	[209.85.222.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31E2181F10
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 19:38:47 +0000 (UTC)
Received: by mail-qk1-f198.google.com with SMTP id n125so37146145qkc.16
	for <virtualization@lists.linux-foundation.org>;
	Sat, 14 Sep 2019 12:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=KIGHcmUUN4jMJWs2R7tAQdbVbc2v6AIe7xkdq87Pa2A=;
	b=nFAUt2OzAbL+kp9Md4Z5BZHdnQGCptJGAtSX0Zp05hir87jJyawVh2/Qjq1BMLD13t
	G03ElhLSYQaC+ayH3/APgI+ZnJlyCyCqen2Yib9Hvzmdhy06Zy7DXGnzCiONMyGsN0N2
	5T0oHSLZ43DJ7MC26aEOK6Ai1h9e/6w/z27Uyvk72PjfXJLUI6ke9RTqvCvSt1qLBirS
	HDfNKcSbGxluI5FiA8M2a5hPJknalHCqeoawnBAnYMzKWYmFBQPwUKERL8xbIgZ3IXMz
	re42I3/RRJ4YxDSt3V+MJ2hghNM7q94j5j/NwkNCUFNgCAxD0dUi5zOUkftkwnhkBVjY
	xnxA==
X-Gm-Message-State: APjAAAU1OByKYQxrmsF2t7/7iJcHB2BjUy6GgaVUOnYgRvk8VEIW4MYO
	g6Zc4zxV6YVHEgi42URdv4B42l3Oqbll5r87VXdUR1VdJBywXGXOGIfV7BxVqlUwoufry9PIlIK
	zN8WHnix5l4GUYnuKc3I4ftx+45MhS4vxD/ko33BqQw==
X-Received: by 2002:a05:620a:c:: with SMTP id
	j12mr49368895qki.127.1568489926544; 
	Sat, 14 Sep 2019 12:38:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw7wOJHQxLUm66la0qX4SPSRkPiO4NywNevPf0TnyLpnxGz/aWmk5UQ6mtqxs1zvRBm/WQW7Q==
X-Received: by 2002:a05:620a:c:: with SMTP id
	j12mr49368877qki.127.1568489926312; 
	Sat, 14 Sep 2019 12:38:46 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
	by smtp.gmail.com with ESMTPSA id
	60sm15837153qta.77.2019.09.14.12.38.41
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 12:38:45 -0700 (PDT)
Date: Sat, 14 Sep 2019 15:38:39 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] vhost: Fix compile time error
Message-ID: <20190914153325-mutt-send-email-mst@kernel.org>
References: <1568450697-16775-1-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1568450697-16775-1-git-send-email-linux@roeck-us.net>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>
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

On Sat, Sep 14, 2019 at 01:44:57AM -0700, Guenter Roeck wrote:
> Building vhost on 32-bit targets results in the following error.
> 
> drivers/vhost/vhost.c: In function 'translate_desc':
> include/linux/compiler.h:549:38: error:
> 	call to '__compiletime_assert_1879' declared with attribute error:
> 	BUILD_BUG_ON failed: sizeof(_s) > sizeof(long)
> 
> Fixes: a89db445fbd7 ("vhost: block speculation of translated descriptors")
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>



> ---
>  drivers/vhost/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index acabf20b069e..102a0c877007 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2074,7 +2074,7 @@ static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
>  		_iov->iov_base = (void __user *)
>  			((unsigned long)node->userspace_addr +
>  			 array_index_nospec((unsigned long)(addr - node->start),
> -					    node->size));
> +					    (unsigned long)node->size));

Unfortunately this does not fix the case where size is actually 64 bit,
e.g. a single node with VA 0, size 2^32 is how
you cover the whole virtual address space.

this is not how qemu uses it, but it's valid.

I think it's best to just revert the patch for now.

>  		s += size;
>  		addr += size;
>  		++ret;
> -- 
> 2.7.4
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
