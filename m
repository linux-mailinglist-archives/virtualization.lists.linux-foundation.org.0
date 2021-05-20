Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 262CF389EE8
	for <lists.virtualization@lfdr.de>; Thu, 20 May 2021 09:29:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B497A834D5;
	Thu, 20 May 2021 07:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f0FJfPXzQH7k; Thu, 20 May 2021 07:29:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB9081D2D;
	Thu, 20 May 2021 07:29:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 435B4C0001;
	Thu, 20 May 2021 07:29:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AE02C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 07:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF5C1834D5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 07:29:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uVB0IDfOMUsC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 07:29:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1BD2881D2D
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 07:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621495780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iJI5xVvNxINRYWmcOTjljaXIWh1BlzRm8Wtm6C6Fnm0=;
 b=EqGltirlFHJxOAh7fVNZ1JUrMnrNNoYpHgVRIicfPpU/cJ7CZpS1+CjgOgfTQDVKt725mU
 ZzZ4Iwn0hh8ney1LmwD2srjelx2gE4Pq6FwCPGF85GvvKrysT9tzs5fUbXzSLoO9pQEU05
 klyU4ey3NYkRL01CZYrtHSb5+39FOU8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-XoDbVERzNn-xO9kktrINUg-1; Thu, 20 May 2021 03:29:38 -0400
X-MC-Unique: XoDbVERzNn-xO9kktrINUg-1
Received: by mail-ed1-f72.google.com with SMTP id
 m6-20020aa7c4860000b029038d4e973878so4892606edq.10
 for <virtualization@lists.linux-foundation.org>;
 Thu, 20 May 2021 00:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iJI5xVvNxINRYWmcOTjljaXIWh1BlzRm8Wtm6C6Fnm0=;
 b=atag0hwXKsGk5BeQ3oExFhTrywmJCgOH/LcgIBctJdyMss2Fo61BTm7LKsOGcbpamu
 Gu815LBMLiXsCdLaaXmgzfzGWLlilhIx0rWBQJ/dkVToXgZkFB7q4yXq8THhG4c4awfK
 1Cu+LBHfb/G/pIAIr0uEnD8nl0gydBoM9H7FG9lUKoQlGxJNqfebFcLtiekGWCGp/zV6
 JegzRJ0EFZMH0yG8C14HApCsMNNHTaEKfdmFJQ8bngJEFmJaPnZ1PLzb/hTl9bdcAoE7
 ojkjU4sBEkwILEok2SbuCBsRCnYqigRI530KSj+UlIDDvMANd8YbhhvgLrrms8QLki7Z
 BVqw==
X-Gm-Message-State: AOAM531jcFUGVreAr0AMgxWDGN+A3iLu9xRlkIdEKJ/piYAu25XkZ1t+
 6G2Lpf8+51jI9Fhd3HeX/pWObe4KIZYIUj3g0WW759dG8+Bux/Kn0O97d60v8Q4U3XGmAhF7ZLk
 gUNWBF+gJQpSImOejDY4hnjiAsfUG3G++g75CKjN4HQ==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr3520805edt.246.1621495777566; 
 Thu, 20 May 2021 00:29:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8+dyhQJCj4ceZNKLk7+x81350KC9GtSx2oTbohE3ItwuPVfBsGaPBRhHO/WvAEjvYZV1bYw==
X-Received: by 2002:aa7:cb92:: with SMTP id r18mr3520763edt.246.1621495776983; 
 Thu, 20 May 2021 00:29:36 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id h9sm978823ede.93.2021.05.20.00.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 00:29:36 -0700 (PDT)
Date: Thu, 20 May 2021 09:29:34 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Yang Yingliang <yangyingliang@huawei.com>
Subject: Re: [PATCH -next] virtio_ring: Correct function name
 virtqueue_get_buf_ctx()
Message-ID: <20210520072934.ubkprak3li6nyrjf@steredhat>
References: <20210518050057.614081-1-yangyingliang@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210518050057.614081-1-yangyingliang@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: mst@redhat.com, linux-kernel@vger.kernel.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Tue, May 18, 2021 at 01:00:57PM +0800, Yang Yingliang wrote:
>Fix the following make W=1 kernel build warning:
>
>  drivers/virtio/virtio_ring.c:1903: warning: expecting prototype for virtqueue_get_buf(). Prototype was for virtqueue_get_buf_ctx() instead
>
>Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>---
> drivers/virtio/virtio_ring.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
>index 88f0b16b11b8..992cb1cbec93 100644
>--- a/drivers/virtio/virtio_ring.c
>+++ b/drivers/virtio/virtio_ring.c
>@@ -1882,7 +1882,7 @@ bool virtqueue_kick(struct virtqueue *vq)
> EXPORT_SYMBOL_GPL(virtqueue_kick);
>
> /**
>- * virtqueue_get_buf - get the next used buffer
>+ * virtqueue_get_buf_ctx - get the next used buffer
>  * @_vq: the struct virtqueue we're talking about.
>  * @len: the length written into the buffer
>  * @ctx: extra context for the token
>-- 
>2.25.1
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
