Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB0734A631
	for <lists.virtualization@lfdr.de>; Fri, 26 Mar 2021 12:13:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C91D4000E;
	Fri, 26 Mar 2021 11:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sXdAN5ApHh7E; Fri, 26 Mar 2021 11:13:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7FD8414D6;
	Fri, 26 Mar 2021 11:13:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 543EFC000A;
	Fri, 26 Mar 2021 11:13:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 511C1C000A
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 11:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F477404CC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 11:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Xs17bCLNd0Q
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 11:13:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46B95404A2
 for <virtualization@lists.linux-foundation.org>;
 Fri, 26 Mar 2021 11:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616757223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPhua1UQWWj1RTWclW1uEi358mEATuQDZb3+gEe5PtY=;
 b=bGaP9zXFAiDap28TOQhqqMynpj0TMIka36KWZh2zt8R40A9E6W7c9+obi+YCz9JMkj78RG
 QsLGpRGvZu5z0Q/DDhz2h786mXwrMCeW2pcw9Uw0pocH/OegUNvBcoe5oms0nscooACY64
 5Y/uQznrmjp4U1XTBGghGCoir+V0QeE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-G8cIrN-fM7yD9_bNw9qghQ-1; Fri, 26 Mar 2021 07:13:38 -0400
X-MC-Unique: G8cIrN-fM7yD9_bNw9qghQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7546783DD20;
 Fri, 26 Mar 2021 11:13:37 +0000 (UTC)
Received: from [10.36.112.81] (ovpn-112-81.ams2.redhat.com [10.36.112.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8264E5C8AB;
 Fri, 26 Mar 2021 11:13:32 +0000 (UTC)
Subject: Re: [PATCH] virtio-balloon: move release_pages_balloon() outside of
 mutex_unlock(&vb->balloon_lock)
To: Liu Xiang <liu.xiang@zlingsmart.com>, mst@redhat.com
References: <20210326095326.13221-1-liu.xiang@zlingsmart.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <d8fef7b4-d01c-98ad-c3b1-4c48f482ce76@redhat.com>
Date: Fri, 26 Mar 2021 12:13:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210326095326.13221-1-liu.xiang@zlingsmart.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Cc: liuxiang_1999@126.com, liuxiang1999@gmail.com, linux-kernel@vger.kernel.org,
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

On 26.03.21 10:53, Liu Xiang wrote:
> Since pages have been deflated to a local list,
> there is no race between fill and leak.
> 
> Signed-off-by: Liu Xiang <liu.xiang@zlingsmart.com>
> ---
>   drivers/virtio/virtio_balloon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index 8985fc2ce..7da25b87f 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -303,8 +303,8 @@ static unsigned leak_balloon(struct virtio_balloon *vb, size_t num)
>   	 */
>   	if (vb->num_pfns != 0)
>   		tell_host(vb, vb->deflate_vq);
> -	release_pages_balloon(vb, &pages);
>   	mutex_unlock(&vb->balloon_lock);
> +	release_pages_balloon(vb, &pages);
>   	return num_freed_pages;
>   }
>   
> 

I think this should be fine

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
