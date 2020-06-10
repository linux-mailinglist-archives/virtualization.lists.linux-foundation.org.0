Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6F91F5144
	for <lists.virtualization@lfdr.de>; Wed, 10 Jun 2020 11:39:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 43DC786E4E;
	Wed, 10 Jun 2020 09:39:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GGCLIS5pXRch; Wed, 10 Jun 2020 09:39:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AB3A486D82;
	Wed, 10 Jun 2020 09:39:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 850CFC016F;
	Wed, 10 Jun 2020 09:39:30 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56474C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 3E9FF86E4E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3XR67paMunTE
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 41C9286D82
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591781966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZHhN+DXAIMHw8hGd/EZXD/3ZlKq/Nb955xAU2QRluu4=;
 b=Hqo34pcexwZZW+IzxLwM3bVrn7wpLjoydXBCWT9tN0OQP/IQOo/nmDvR0oJez2eVXnQr+o
 in+ibCPG+P+cfjZeyjvC2v3TuxLhcW0+62QAchrzjO8oT16bEm4BAktMF1Z5WZK3Ftj23r
 UYNlbS8ETWJNWhY6E4cg57mZMSwUQB8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-hgk5tDygPM6a3dP-jAxdcg-1; Wed, 10 Jun 2020 05:39:24 -0400
X-MC-Unique: hgk5tDygPM6a3dP-jAxdcg-1
Received: by mail-wm1-f72.google.com with SMTP id k185so256741wme.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 02:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZHhN+DXAIMHw8hGd/EZXD/3ZlKq/Nb955xAU2QRluu4=;
 b=ZV+h6rTyafDtG4PRoli2qpyyNt+WTOzdqBSPJC27zi27Xc2GOZpoX2yiIrzh16TztR
 N3koM49aa+PJI7UPqCGpCxU9yDLqgkses/QAys5vdtTZy/oT6yYtZ+wp1KN9TqUx/iuK
 1CMuG6/tYVW2BMw/+FdU2Cr9zUgjoW4KgHu5whq1FZNXO7208Rttf2pB8dvJTGfeyUIs
 xzghgsJavVIjugL8XsARztmrV2eBkF0dgsjcUqnrmid+KTeKZB0DzQa/zzh3w58bawq9
 +ZZ7ylKqh6GVEttGPJelvZOZHvxNnB2LkMnGkT8u9SJmudyICOBpyd3MXSD2cxUKIaPq
 6thQ==
X-Gm-Message-State: AOAM531DJsl34PoqBcNGuP+0WQLdm9otNMOPZNkzcJWIDQQpk4TODhos
 FULVMy68JFEczI0c6cWYgK7Lp/fFVW9wyHiwtYWF/n5FAsB4P7cg6Iz/koDYzqcBmSnuWO+gQUN
 VTWwTvOd95PPdXR3jN0gUY7gqv8y3yzpXA54PCivXAQ==
X-Received: by 2002:a1c:154:: with SMTP id 81mr2260878wmb.23.1591781963790;
 Wed, 10 Jun 2020 02:39:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQX9a47BGmJoqN+JImhK5ZUe/6waoIaFpAVaxQJvVOjhT3XwxiiPuNU8njX16wSPNDegWrSA==
X-Received: by 2002:a1c:154:: with SMTP id 81mr2260855wmb.23.1591781963549;
 Wed, 10 Jun 2020 02:39:23 -0700 (PDT)
Received: from redhat.com ([212.92.121.57])
 by smtp.gmail.com with ESMTPSA id n19sm6011219wmi.33.2020.06.10.02.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 02:39:22 -0700 (PDT)
Date: Wed, 10 Jun 2020 05:39:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] virtio-mem: silence a static checker warning
Message-ID: <20200610053912-mutt-send-email-mst@kernel.org>
References: <20200610085911.GC5439@mwanda>
MIME-Version: 1.0
In-Reply-To: <20200610085911.GC5439@mwanda>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
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

On Wed, Jun 10, 2020 at 11:59:11AM +0300, Dan Carpenter wrote:
> Smatch complains that "rc" can be uninitialized if we hit the "break;"
> statement on the first iteration through the loop.  I suspect that this
> can't happen in real life, but returning a zero literal is cleaner and
> silence the static checker warning.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/virtio/virtio_mem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

> diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
> index f658fe9149beb..893ef18060a02 100644
> --- a/drivers/virtio/virtio_mem.c
> +++ b/drivers/virtio/virtio_mem.c
> @@ -1192,7 +1192,7 @@ static int virtio_mem_mb_plug_any_sb(struct virtio_mem *vm, unsigned long mb_id,
>  						VIRTIO_MEM_MB_STATE_OFFLINE);
>  	}
>  
> -	return rc;
> +	return 0;
>  }
>  
>  /*
> -- 
> 2.26.2

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
