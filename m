Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EE5258D45
	for <lists.virtualization@lfdr.de>; Tue,  1 Sep 2020 13:14:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 389B28707A;
	Tue,  1 Sep 2020 11:14:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZoQ6wgBWxEg; Tue,  1 Sep 2020 11:14:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B7A2287077;
	Tue,  1 Sep 2020 11:14:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9674FC0051;
	Tue,  1 Sep 2020 11:14:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79BDBC0051
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 11:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 680AB86148
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 11:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPomd7vcAm50
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 11:14:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8057286119
 for <virtualization@lists.linux-foundation.org>;
 Tue,  1 Sep 2020 11:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598958882;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=STUtmyXZIT8KzVqJU5XU2kgQYureljA3Ku1GnLyYimw=;
 b=eflOJVhF4wU+cFqUufWQbmr0ly5UkDL027i6zHChfvAQluBtOVBB4t57Etw0iwiwLuknIz
 C6FLshb30wE32PSSs983xOx0tIM6rykIBvq30gSH9SFKbVc3QUbXjr9TdjJVwszXqM9Emt
 w5CIgpqc5ub7CF0uOXucpuBdge+yn2I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-zaz7e_rwMfiUPBFTgDmOgQ-1; Tue, 01 Sep 2020 07:14:40 -0400
X-MC-Unique: zaz7e_rwMfiUPBFTgDmOgQ-1
Received: by mail-wm1-f69.google.com with SMTP id b73so280479wmb.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 01 Sep 2020 04:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=STUtmyXZIT8KzVqJU5XU2kgQYureljA3Ku1GnLyYimw=;
 b=lXmp4O7K07eU5qN0n03xQo/QBq4ggpsIXwiItS8qDXTNAG3/Mtqbw9x1sS9oWP+N+v
 704b7T+H5TGCrZkB10UHvTHfpVj9Kca9HztLsahKnUnbNZr2elyKFuO/CYlFBtmsHEPc
 14uCGwyl2CVn06qPk3S8D7AKzaFp06MeVY+HGjYOj/VOgT1RGN01zJ8MPW8e6zPbQJyt
 If1SXzPNsOAJ4TvpGmInHfE7klO3upynEdJf8oZ0bs+4YGiFXXmJvc59GtHxBUiuHyjC
 pNvbE4VKmD+FJ1qZ6KBjDXSaFNsPbdWc3rMvmXgJM+reae89lTVo6eR9Yjg9DDKF8DAy
 7jug==
X-Gm-Message-State: AOAM532BXGVcn3VOb0P9uIb42erpGE+1eAZGeMsis3Z3uMH6PE6QfRXy
 itwAboHxuS6HSWZ2euEugeBEY/hbNUhUmDfT4n8YYrZDIn1BB1bKHc64iOZBwbbNsembSG4kZUR
 EzUY1MQfyXBd0sw4LAsjucwvY+HoATHBuq2VsVEc1DA==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr1261019wml.28.1598958879546;
 Tue, 01 Sep 2020 04:14:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhiep0HYoVEPjzoTxNmrDMLvfem8Qoq1Zugr1LpbcVQJKpBDMnkFnDG0mj5yp0i4zCh7HKeg==
X-Received: by 2002:a7b:c925:: with SMTP id h5mr1261007wml.28.1598958879391;
 Tue, 01 Sep 2020 04:14:39 -0700 (PDT)
Received: from redhat.com (bzq-79-181-14-13.red.bezeqint.net. [79.181.14.13])
 by smtp.gmail.com with ESMTPSA id
 d18sm1614949wrm.10.2020.09.01.04.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 04:14:38 -0700 (PDT)
Date: Tue, 1 Sep 2020 07:14:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Subject: Re: [PATCH net-next] vhost: fix typo in error message
Message-ID: <20200901071400-mutt-send-email-mst@kernel.org>
References: <1598927949-201997-1-git-send-email-linyunsheng@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1598927949-201997-1-git-send-email-linyunsheng@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, Sep 01, 2020 at 10:39:09AM +0800, Yunsheng Lin wrote:
> "enable" should be "disable" when the function name is
> vhost_disable_notify(), which does the disabling work.
> 
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Why net-next though? It's a bugfix, can go into net.


> ---
>  drivers/vhost/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 5857d4e..b45519c 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2537,7 +2537,7 @@ void vhost_disable_notify(struct vhost_dev *dev, struct vhost_virtqueue *vq)
>  	if (!vhost_has_feature(vq, VIRTIO_RING_F_EVENT_IDX)) {
>  		r = vhost_update_used_flags(vq);
>  		if (r)
> -			vq_err(vq, "Failed to enable notification at %p: %d\n",
> +			vq_err(vq, "Failed to disable notification at %p: %d\n",
>  			       &vq->used->flags, r);
>  	}
>  }
> -- 
> 2.8.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
