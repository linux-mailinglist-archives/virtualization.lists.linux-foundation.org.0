Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E1133C27B
	for <lists.virtualization@lfdr.de>; Mon, 15 Mar 2021 17:51:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A58747A73;
	Mon, 15 Mar 2021 16:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sufQQwrompDK; Mon, 15 Mar 2021 16:51:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1C7D4AD66;
	Mon, 15 Mar 2021 16:51:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4FCFAC0012;
	Mon, 15 Mar 2021 16:51:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 138FCC0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E02F247A73
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:51:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhWAFXJJOMkt
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:51:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFADA45FD7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 16:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615827102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFFcd4wD8/CMTprSPx6NQ5pGVPcuBak1/nAOtKKtWKQ=;
 b=YE7ADFAsNwZ+2eBaSK/cApxA2iU6b4z+3ePsf+G2X7MSzlWhCuTsmm2IKLAGL28pB0VGmk
 ld6e9+BDKacfKtEcsMUQ6MOe5+KYbjq2vNtz14/VKWEIWVaGcgFHcZusrQ/+HYhjb6n0/o
 ld39YxAzomd1ru/S3JsRzTSPL7g03uc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-268-HlO-i1j-P7ub0ae-8cCVmA-1; Mon, 15 Mar 2021 12:51:41 -0400
X-MC-Unique: HlO-i1j-P7ub0ae-8cCVmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98F951B2C981;
 Mon, 15 Mar 2021 16:51:39 +0000 (UTC)
Received: from [10.36.112.75] (ovpn-112-75.ams2.redhat.com [10.36.112.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 359965D745;
 Mon, 15 Mar 2021 16:51:31 +0000 (UTC)
Subject: Re: [PATCH v4 06/14] vringh: add vringh_kiov_length() helper
To: Stefano Garzarella <sgarzare@redhat.com>,
 virtualization@lists.linux-foundation.org
References: <20210315163450.254396-1-sgarzare@redhat.com>
 <20210315163450.254396-7-sgarzare@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <b06eb44c-d4e5-e47c-fbf5-26be469aae9e@redhat.com>
Date: Mon, 15 Mar 2021 17:51:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315163450.254396-7-sgarzare@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Xie Yongji <xieyongji@bytedance.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
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

On 15/03/2021 17:34, Stefano Garzarella wrote:
> This new helper returns the total number of bytes covered by
> a vringh_kiov.
> 
> Suggested-by: Jason Wang <jasowang@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
>  include/linux/vringh.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/vringh.h b/include/linux/vringh.h
> index 755211ebd195..84db7b8f912f 100644
> --- a/include/linux/vringh.h
> +++ b/include/linux/vringh.h
> @@ -199,6 +199,17 @@ static inline void vringh_kiov_cleanup(struct vringh_kiov *kiov)
>  	kiov->iov = NULL;
>  }
>  
> +static inline size_t vringh_kiov_length(struct vringh_kiov *kiov)
> +{
> +	size_t len = 0;
> +	int i;
> +
> +	for (i = kiov->i; i < kiov->used; i++)
> +		len += kiov->iov[i].iov_len;
> +
> +	return len;
> +}

Do we really need an helper?

For instance, we can use:

len = iov_length((struct iovec *)kiov->iov, kiov->used);

Or do we want to avoid the cast?

Thanks,
Laurent

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
