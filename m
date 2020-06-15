Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD9E1F8FEF
	for <lists.virtualization@lfdr.de>; Mon, 15 Jun 2020 09:32:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4B001204A3;
	Mon, 15 Jun 2020 07:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIgWgSxQ26zz; Mon, 15 Jun 2020 07:32:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0D1A520485;
	Mon, 15 Jun 2020 07:32:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5349C016E;
	Mon, 15 Jun 2020 07:32:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BD9D3C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id AA7D687005
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aFkc_TdW1eov
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:32:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E5FDE86FF6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 07:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592206345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MVmSa8Yxs683+Ekeg5nVJQwj3FLB/0nHqVNedIYMZKA=;
 b=crOBL503O3AGgsu9FGpdn2F5jAbpZ6d2DBxpo9y6QLU5OAWDpcy9Yx0pov1pYQyaANaAwB
 v3bp/pOyjA72iUQ3bz6MRaQH1G/U0oU/vkDNJE3UHaH7MM5RK7PogGGKzM+cW+z1V6kWYE
 GuKXmkbrHzZjYnsSQvzpNNkDQuaXSKw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-0O8kO9NxN7CpikI2SsmM1Q-1; Mon, 15 Jun 2020 03:32:23 -0400
X-MC-Unique: 0O8kO9NxN7CpikI2SsmM1Q-1
Received: by mail-wr1-f72.google.com with SMTP id s17so6646874wrt.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Jun 2020 00:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MVmSa8Yxs683+Ekeg5nVJQwj3FLB/0nHqVNedIYMZKA=;
 b=qYYfigvMe7gTkq2R7sH3k//nSYn0RMjW9Wr0MmRp/Hz1ZhyclquXvnkstIKLwl+73K
 qik85BSNxZNQ5kgo3JhCarbuCjTjdYtRlQtCftHIt9oKcFqwp/lk5KBozF0czxyc2jEN
 BQM9QYWCixX5woXu9ywvqDuhf1UMFyr5rlHdz3BNTsxjaJjZ/vX5OiHOSzZ6sMaIAc3G
 hS51o4gZCEKv5v1oYhW5acfrdkzhr+K4kmk8H6zUK0UiNk9r8Ye31O5SBhdMCIU2Acma
 R82dn8KjXovVfa2+Z2TGlh+RKWjKmTPTU0RLGa0m3hLhkLYLPyfPc59kHx6bEnJEhjIn
 kBrQ==
X-Gm-Message-State: AOAM531CSVQzQpCiCKi94UwhpD6gUILzsZ7C01JHvrJhlEpmnMyLhPD5
 Dyi48PgEUrexSbWGOid+YvsJSEVkMr6rEU1c47kVuW8Wqn77fnYBZ2M/sUXcddQt/8R3pyfl6Yz
 s0d8gnhRg9U6WNOSV+l21lYA7QReH8NA5EpYzR8Htbw==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr28119143wrr.96.1592206342593; 
 Mon, 15 Jun 2020 00:32:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9sW2KxmB2iYo5NWUyXKW9j1fjFzmv455gF6I9xB5C663EM4s8qGhGf3DzxGkOXJyGtHB+ew==
X-Received: by 2002:adf:fd81:: with SMTP id d1mr28119120wrr.96.1592206342383; 
 Mon, 15 Jun 2020 00:32:22 -0700 (PDT)
Received: from steredhat ([5.180.207.22])
 by smtp.gmail.com with ESMTPSA id v19sm21164940wml.26.2020.06.15.00.32.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 00:32:21 -0700 (PDT)
Date: Mon, 15 Jun 2020 09:32:19 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Hou Tao <houtao1@huawei.com>
Subject: Re: [PATCH] virtio-blk: free vblk-vqs in error path of virtblk_probe()
Message-ID: <20200615073219.eeydysnn3d3xkwzg@steredhat>
References: <20200615041459.22477-1-houtao1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200615041459.22477-1-houtao1@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@canonical.com>,
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

On Mon, Jun 15, 2020 at 12:14:59PM +0800, Hou Tao wrote:
> Else there will be memory leak if alloc_disk() fails.
> 
> Fixes: 6a27b656fc02 ("block: virtio-blk: support multi virt queues per virtio-blk device")
> Signed-off-by: Hou Tao <houtao1@huawei.com>
> ---
>  drivers/block/virtio_blk.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> index 9d21bf0f155e..980df853ee49 100644
> --- a/drivers/block/virtio_blk.c
> +++ b/drivers/block/virtio_blk.c
> @@ -878,6 +878,7 @@ static int virtblk_probe(struct virtio_device *vdev)
>  	put_disk(vblk->disk);
>  out_free_vq:
>  	vdev->config->del_vqs(vdev);
> +	kfree(vblk->vqs);
>  out_free_vblk:
>  	kfree(vblk);
>  out_free_index:
> -- 
> 2.25.0.4.g0ad7144999
> 

The patch LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
