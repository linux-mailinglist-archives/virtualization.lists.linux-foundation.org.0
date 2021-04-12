Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A7D35C6B8
	for <lists.virtualization@lfdr.de>; Mon, 12 Apr 2021 14:49:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE06C403E3;
	Mon, 12 Apr 2021 12:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RZwXgZHMDp8A; Mon, 12 Apr 2021 12:49:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8898403DD;
	Mon, 12 Apr 2021 12:49:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3CB1DC0011;
	Mon, 12 Apr 2021 12:49:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1223DC000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 12:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6AD1834F7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 12:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtOhpqk_Rz57
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 12:49:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B5CE82923
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618231782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9C/cD8P3IrDuK2NZ6oucMLdIewXV7K4I9kOUr8VG5sI=;
 b=QgDnDdwu07pfrag5MdZYi8ccTL9R85aQmJEFbGvhAY2nIQvZN1c+wmDPMHm6gnq54ins/Z
 QR0oXLPqDAmFf53b1EikBqpjiYjxXXF8zaFGFiJGDJ2WmlHsC+iWDy8p3wuHtVrVfudU1B
 9mF8LkmJsRdJdBaAfeUTQouRfuaWPqs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-IVuy4UIKOa-KkmzdwLBuLA-1; Mon, 12 Apr 2021 08:49:39 -0400
X-MC-Unique: IVuy4UIKOa-KkmzdwLBuLA-1
Received: by mail-ej1-f70.google.com with SMTP id bg7so3868831ejb.12
 for <virtualization@lists.linux-foundation.org>;
 Mon, 12 Apr 2021 05:49:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9C/cD8P3IrDuK2NZ6oucMLdIewXV7K4I9kOUr8VG5sI=;
 b=NLSXI8+L4+eVgdOYFRfsTLi4u8ZWtOmBgbYyoj9qNC4trDY0iYnNG9cHTausjDSOKC
 xcdx2VjgeEbJF4tEyP1E7cNUEcitmscI4Ixf/URmu08fVmLDRaCUA1/+ja+63r6tlU/5
 w37pxAIbyCwXGn4bupFrm8Wz2VbYtjoQNHmZYogDFRoBiBdbLnYqo0M7OtUR6rEm8rjp
 b68PlNbF86FhIhJ5270BoJTpe8u3XNnxyvVn9A/hJ+sYP38Bt8YhygXttliycvikza8z
 ER3QQmLlpNKbLDBDbJSG9nr4ZulTEeK6TKO71ktXs4Ms//l56sh+lZ/OCI1Vty4u4jn3
 QJtQ==
X-Gm-Message-State: AOAM530pPAh8fYgkGZDt/CnqVZ/pIGknKlsSAiUwgICSIeRLdhzER8wT
 BPqJlVYwJjk8yIaJXBm0gtiIOJFwqzzIQNq1Iy9U00dSciT5cUeeZaJAKHpBq8t1JT7LB/77+W5
 ApLSgx1dR8AeIvPXrzxqjD4yZRdoY0nSOmyWyPPC7Og==
X-Received: by 2002:a17:907:2da7:: with SMTP id
 gt39mr26876317ejc.193.1618231778003; 
 Mon, 12 Apr 2021 05:49:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9TAigsm6UebpwTlyCIPnqI/8fvxuiuivYYglIeM/jT9AIMxLlEwKdWU424VxLaXfSrQdHKQ==
X-Received: by 2002:a17:907:2da7:: with SMTP id
 gt39mr26876310ejc.193.1618231777810; 
 Mon, 12 Apr 2021 05:49:37 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id u19sm6688595edy.23.2021.04.12.05.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 05:49:37 -0700 (PDT)
Date: Mon, 12 Apr 2021 14:49:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Eli Cohen <elic@nvidia.com>
Subject: Re: [PATCH] vdpa/mlx5: Set err = -ENOMEM in case dma_map_sg_attrs
 fails
Message-ID: <20210412124935.jtguuf7dj74eezcw@steredhat>
References: <20210411083646.910546-1-elic@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20210411083646.910546-1-elic@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kernel test robot <lkp@intel.com>, mst@redhat.com, netdev@vger.kernel.org,
 virtualization@lists.linux-foundation.org, si-wei.liu@oracle.com,
 Dan Carpenter <dan.carpenter@oracle.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Sun, Apr 11, 2021 at 11:36:46AM +0300, Eli Cohen wrote:
>Set err = -ENOMEM if dma_map_sg_attrs() fails so the function reutrns
>error.
>
>Fixes: 94abbccdf291 ("vdpa/mlx5: Add shared memory registration code")
>Signed-off-by: Eli Cohen <elic@nvidia.com>
>Reported-by: kernel test robot <lkp@intel.com>
>Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>---
> drivers/vdpa/mlx5/core/mr.c | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/vdpa/mlx5/core/mr.c b/drivers/vdpa/mlx5/core/mr.c
>index 3908ff28eec0..800cfd1967ad 100644
>--- a/drivers/vdpa/mlx5/core/mr.c
>+++ b/drivers/vdpa/mlx5/core/mr.c
>@@ -278,8 +278,10 @@ static int map_direct_mr(struct mlx5_vdpa_dev *mvdev, struct mlx5_vdpa_direct_mr
> 	mr->log_size = log_entity_size;
> 	mr->nsg = nsg;
> 	mr->nent = dma_map_sg_attrs(dma, mr->sg_head.sgl, mr->nsg, DMA_BIDIRECTIONAL, 0);
>-	if (!mr->nent)
>+	if (!mr->nent) {
>+		err = -ENOMEM;
> 		goto err_map;
>+	}
>
> 	err = create_direct_mr(mvdev, mr);
> 	if (err)
>-- 
>2.30.1
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
