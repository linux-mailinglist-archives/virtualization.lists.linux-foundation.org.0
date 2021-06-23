Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE03B1E6D
	for <lists.virtualization@lfdr.de>; Wed, 23 Jun 2021 18:14:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9579683B37;
	Wed, 23 Jun 2021 16:14:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0JtKfTmHaIno; Wed, 23 Jun 2021 16:14:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 94FE583B3B;
	Wed, 23 Jun 2021 16:14:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 118C6C0022;
	Wed, 23 Jun 2021 16:14:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89987C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 692DB40635
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:14:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-XLKc-M5T42
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:14:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8402940640
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624464855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nj23NkvOz6EzLV20ZpL38A+OlYN1UWETlVYZQZsTA/A=;
 b=H6siRlcnJZlQexwP3hrMUKTZgcLogHHnE/udCEtW4wfw+ptwjZYreWQEsMv69mzEaWGckL
 AyS18Tjm1iGikBbZ8J7M8tjnTjUaKiq0uYyh3KwBYZlI1rxiz3/s/pKmw3wo9aGPEiwKjc
 /eRkam11oZ1okIhQENq7CKDe8y07QuE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-oNT4WtQJPZu3vNfR8-nReg-1; Wed, 23 Jun 2021 12:14:13 -0400
X-MC-Unique: oNT4WtQJPZu3vNfR8-nReg-1
Received: by mail-ej1-f71.google.com with SMTP id
 l6-20020a1709062a86b029046ec0ceaf5cso1183879eje.8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 09:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nj23NkvOz6EzLV20ZpL38A+OlYN1UWETlVYZQZsTA/A=;
 b=TJQyeeoMXq0OOt7Vbc1liTzRFGQbXAsw0W4FervhhH3lgu+v15Sgso2TTpcuRds5K6
 N4ud+ca9bdtGWJfyQjpvkF6+X/O5Gwh30ur7Bdiv+ldFTmTbb/ZMLy0PmsLiA0PyaYtu
 omBchsABwCTAFsfaJAVusVA45b5bjyuFSc3mpeMx6kBHS0FJsl9eoLryCdNmYBTulnLT
 QmdOKhxGzIUr+0XKrjzTncXvDS/7R8A0ctYY8pL/ObmH9yqZc0lzUUIdxXMthkqNsEHH
 aq2Zr6PyYQeqrUVfoHeI3leQbk4JuNFuWpTs59TghNsfN98xoUB1TZXaFG2v4Iom+N1g
 Vt/g==
X-Gm-Message-State: AOAM533EBbBlc7Mu2MBag81Q5lsKNtp2FgcsL8Wt6sQ15s8mNyhHRP96
 UHh12n/TWPFsN4xpXIqhtTA9qvGXV8chZv7LoKPl2Aw4IlUjOzLI/CUpVW9L5pqfTxD92Q+ojpJ
 j4nSP+fCrk58J8k0z2mC8x+C6Kl2grEoCAZ7FZPbxEg==
X-Received: by 2002:a05:6402:358:: with SMTP id
 r24mr694005edw.69.1624464851997; 
 Wed, 23 Jun 2021 09:14:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYtrsEjivOh9pUUY54YkoZINzNJahBEuMWFaogEOzw9HISbTNQJpM83z5DvSQQAP7UL/KVEw==
X-Received: by 2002:a05:6402:358:: with SMTP id
 r24mr693976edw.69.1624464851854; 
 Wed, 23 Jun 2021 09:14:11 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id em20sm101445ejc.70.2021.06.23.09.14.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 09:14:11 -0700 (PDT)
Date: Wed, 23 Jun 2021 18:14:08 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Xianting Tian <xianting_tian@126.com>
Subject: Re: [PATCH] virtio_net: Use virtio_find_vqs_ctx() helper
Message-ID: <20210623161408.vzq3fizljtkyig76@steredhat>
References: <1624461382-8302-1-git-send-email-xianting_tian@126.com>
MIME-Version: 1.0
In-Reply-To: <1624461382-8302-1-git-send-email-xianting_tian@126.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mst@redhat.com, Xianting Tian <xianting.tian@linux.alibaba.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kuba@kernel.org,
 davem@davemloft.net
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

On Wed, Jun 23, 2021 at 11:16:22AM -0400, Xianting Tian wrote:
>virtio_find_vqs_ctx() is defined but never be called currently,
>it is the right place to use it.
>
>Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
>---
> drivers/net/virtio_net.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
>index 78a01c7..9061c55 100644
>--- a/drivers/net/virtio_net.c
>+++ b/drivers/net/virtio_net.c
>@@ -2830,8 +2830,8 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> 			ctx[rxq2vq(i)] = true;
> 	}
>
>-	ret = vi->vdev->config->find_vqs(vi->vdev, total_vqs, vqs, callbacks,
>-					 names, ctx, NULL);
>+	ret = virtio_find_vqs_ctx(vi->vdev, total_vqs, vqs, callbacks,
>+				  names, ctx, NULL);
> 	if (ret)
> 		goto err_find;
>
>-- 
>1.8.3.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
