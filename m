Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7941F79CA
	for <lists.virtualization@lfdr.de>; Fri, 12 Jun 2020 16:27:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 40F4D897A3;
	Fri, 12 Jun 2020 14:27:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIyNIigYBLIb; Fri, 12 Jun 2020 14:27:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id BF9E5897A7;
	Fri, 12 Jun 2020 14:27:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98955C016F;
	Fri, 12 Jun 2020 14:27:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7B7FC016F
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 14:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A720C87E05
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 14:27:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ewjrselk22Jn
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 14:27:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 44CE587E04
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591972042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+olewpNOq4Mhtigyte1j6a5drL4wqqmBJ3lT4ECK4c=;
 b=Ofrd+4sK8KO+yMEZPMgQlyt0ayuXAXHWHYwooj9hiNoHXbI0QQkniSLkoaax0RGPtszzvZ
 wPpNPVUZN9KSW6+hMsEUSFkC1HvBYsd7yo252dAfikhfgzf/nxkPoppNPf+vhry27iwzvV
 gmOsqe8CmhuDWOaMGxNEKCjPQUcTGag=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-SECunhGFOaaXWABSkb5BzQ-1; Fri, 12 Jun 2020 10:27:18 -0400
X-MC-Unique: SECunhGFOaaXWABSkb5BzQ-1
Received: by mail-wm1-f72.google.com with SMTP id y15so2010924wmi.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Jun 2020 07:27:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6+olewpNOq4Mhtigyte1j6a5drL4wqqmBJ3lT4ECK4c=;
 b=TIZa3a2m5hipIqK+a1lNB7eZMzSmjuxIMQenDgZQYixSIlVCwCICpvfSIB/prm9dR3
 7KxKx/B3uc7D/EC0bRPwkq8eC4TKeIDdl1UysLsS21lsHXnq21yCSXgqkDL/JDFrY8ti
 YdK6MRHBcYh9ir/T3jkTn5JHKoEFwD1LUZGA6qlkJP2sJRK6BMRsGqbAe1w5ltHYjUpJ
 jlPT1OmuJ/XGZLtwuYEiQYUGJ0cg4UJHtJLhlgfz0pAe3AfyFPGLzJjSIwT97FouAamq
 6/gg6PzJgB3W9SaJkyw73Sc3coUSauYRpyD8tNAGXbRiDHEORdsvgwJimqB8b1sUaTsk
 uCdg==
X-Gm-Message-State: AOAM532uPfWfehBT6OZ3nmHUQE5iWJnmW0AQjvF5VNgNuNqbXNHy+yzj
 5UrFs0hkaVc9afVpHx4KIe0G6sEuPmPBWDE/kxSJ0yJgH8UvESgoN9CDBwfUJoKGqwUOjm829nh
 2wZhvvnBvv9PT8uv/aST4wah+fWe8UpBbIDTAw1JiMw==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr15422407wrt.341.1591972037874; 
 Fri, 12 Jun 2020 07:27:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0rXM6T8tsdAIVG7Puy2koE7wNaJ6yQ2Cnd9iEfviiNtynmFOaRLpvuGD2gfkKEGv2EVuLpQ==
X-Received: by 2002:a5d:4c45:: with SMTP id n5mr15422380wrt.341.1591972037717; 
 Fri, 12 Jun 2020 07:27:17 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id t189sm9043363wma.4.2020.06.12.07.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 07:27:17 -0700 (PDT)
Date: Fri, 12 Jun 2020 10:27:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] drivers\block: Use kobj_to_dev() API
Message-ID: <20200612102651-mutt-send-email-mst@kernel.org>
References: <1591945856-14749-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
In-Reply-To: <1591945856-14749-1-git-send-email-wangqing@vivo.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-block@vger.kernel.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Fri, Jun 12, 2020 at 03:10:56PM +0800, Wang Qing wrote:
> Use kobj_to_dev() API instead of container_of().
> 
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  drivers/block/virtio_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  mode change 100644 => 100755 drivers/block/virtio_blk.c


Subject should probably use "/". Besides that - trivial tree?

> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 9d21bf0..c808405
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -630,7 +630,7 @@ static struct attribute *virtblk_attrs[] = {
>  static umode_t virtblk_attrs_are_visible(struct kobject *kobj,
>  		struct attribute *a, int n)
>  {
> -	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct device *dev = kobj_to_dev(kobj);
>  	struct gendisk *disk = dev_to_disk(dev);
>  	struct virtio_blk *vblk = disk->private_data;
>  	struct virtio_device *vdev = vblk->vdev;
> -- 
> 2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
