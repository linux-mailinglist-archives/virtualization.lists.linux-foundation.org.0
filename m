Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1D1F5148
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 11:39:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5C01C888E2;
	Wed, 10 Jun 2020 09:39:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z-HnLqwSKiSg; Wed, 10 Jun 2020 09:39:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id D8488885CD;
	Wed, 10 Jun 2020 09:39:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD364C016F;
	Wed, 10 Jun 2020 09:39:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0B2F8C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EE687885CD
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g+zpwegBXisA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6015488355
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591781981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0H9JvbVSTDy5EkcBxAYDLVdpZdU6drMIY4wiOG5g/Cg=;
 b=LgiZoQ7hpFwiFWah2o9PgSn0JevR3usDy5lrzkxVlB19C6JdmrOlkwVSfNasly0s21KdXN
 amguAYByArB1UQZPDUG+iOSvVsT3eJwVPpiB9YhsJFvM59zm9QlR1RKq6D+76veH9Z2+YM
 co9vAqol/9yoSdQ00zVju5giMu5E/O0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-AWrGIztkPIem_xUdUnLK7A-1; Wed, 10 Jun 2020 05:39:39 -0400
X-MC-Unique: AWrGIztkPIem_xUdUnLK7A-1
Received: by mail-wr1-f72.google.com with SMTP id p9so840442wrx.10
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 02:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0H9JvbVSTDy5EkcBxAYDLVdpZdU6drMIY4wiOG5g/Cg=;
 b=nCHMNL1ldZ2o50syICpKOXdLZOGoU9/Zfk/Qbmk7VSrlKsvAZpivU1e8TfPa3rh3NO
 D6peYv8rasOEwF2MiB+Q5lJ+0867FAcuXQKQGWYrBLTJGFC703HTskjNEKOVdY1EOVUw
 DYQ4m9WALYjjow+4eocInwnwnr4Ax8g7IfRAPhclpUBpGEJKy8/Kf0v038ojLp6BgBy1
 Qjsf5ckE6XlRmoDmrmWyn5sPi2LBiG0BvNZEaQTZq9kkJqou98azQSXUsISLk7SiK64A
 2iai8lfp59BWNVbYfjG07VZyvLIYpIB1tFx9E5kOMt07T2fwJOx/h9B5Wk4NWhT3XX4A
 zuwg==
X-Gm-Message-State: AOAM531s0dS2Znr+nkWdUYG+FmkjU7Zm60rBb5Y4DDnQOYcuSR5lnEo5
 JH7Wy8eN+m7ZRpga7NneJ1HpQRkbaJvS8VszCA/eegcsO7kaDMz1tCt5wIrTY+f3o5dSJD59Ph3
 rOh0raYumujChWHH4LTbI6krm0ZLAgguX9LlT/lzmsA==
X-Received: by 2002:adf:f2c2:: with SMTP id d2mr2548442wrp.424.1591781978384; 
 Wed, 10 Jun 2020 02:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxymu+fkfSsDo8znawTJ6c4VcvlNi7tdHuvNBBytAhcUZ0W/2OrQ3nbVPMH2Y9nzbPs1nQa3w==
X-Received: by 2002:adf:f2c2:: with SMTP id d2mr2548422wrp.424.1591781978220; 
 Wed, 10 Jun 2020 02:39:38 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id c70sm5964690wme.32.2020.06.10.02.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 02:39:37 -0700 (PDT)
Date: Wed, 10 Jun 2020 05:39:35 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] vhost_vdpa: Fix potential underflow in vhost_vdpa_mmap()
Message-ID: <20200610053926-mutt-send-email-mst@kernel.org>
References: <20200610085852.GB5439@mwanda>
MIME-Version: 1.0
In-Reply-To: <20200610085852.GB5439@mwanda>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Wed, Jun 10, 2020 at 11:58:52AM +0300, Dan Carpenter wrote:
> The "vma->vm_pgoff" variable is an unsigned long so if it's larger than
> INT_MAX then "index" can be negative leading to an underflow.  Fix this
> by changing the type of "index" to "unsigned long".
> 
> Fixes: ddd89d0a059d ("vhost_vdpa: support doorbell mapping via mmap")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks!

> ---
>  drivers/vhost/vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
> index 7580e34f76c10..a54b60d6623f0 100644
> --- a/drivers/vhost/vdpa.c
> +++ b/drivers/vhost/vdpa.c
> @@ -818,7 +818,7 @@ static int vhost_vdpa_mmap(struct file *file, struct vm_area_struct *vma)
>  	struct vdpa_device *vdpa = v->vdpa;
>  	const struct vdpa_config_ops *ops = vdpa->config;
>  	struct vdpa_notification_area notify;
> -	int index = vma->vm_pgoff;
> +	unsigned long index = vma->vm_pgoff;
>  
>  	if (vma->vm_end - vma->vm_start != PAGE_SIZE)
>  		return -EINVAL;
> -- 
> 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
