Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D41B12D2C47
	for <lists.virtualization@lfdr.de>; Tue,  8 Dec 2020 14:55:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 89BFA87242;
	Tue,  8 Dec 2020 13:55:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pvxo7N4EsEMb; Tue,  8 Dec 2020 13:55:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0246A871D7;
	Tue,  8 Dec 2020 13:55:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C62E8C0FA7;
	Tue,  8 Dec 2020 13:55:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70411C013B
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 13:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5A6C0871D0
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 13:55:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bpOTUzFFEh7y
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 13:55:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 71D0C8708A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  8 Dec 2020 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607435712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XdwZVmp6074Z98H6zQEtlKhAw+DWLjOXe9vwluABFMA=;
 b=dXXwsTO00hrRO4/xBxQ4Th82LRkgDH6pd2VqlWQjyzdptHyt3Rno9HIJp1/TSmcJRm6sAm
 qljg/c/XBBNjQJ6ZuZAcAzcNAH1WKNLP5X14oy4inbHssFhQTu+m7VyiZwact89gEErxJO
 Zu+WasfWaf6xOCAfPUpIKpiOo4yXPWo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-w16QjuUhPCeU0LNqEmpaDg-1; Tue, 08 Dec 2020 08:55:10 -0500
X-MC-Unique: w16QjuUhPCeU0LNqEmpaDg-1
Received: by mail-wr1-f70.google.com with SMTP id x10so6228439wrs.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 08 Dec 2020 05:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XdwZVmp6074Z98H6zQEtlKhAw+DWLjOXe9vwluABFMA=;
 b=UUcJTQMz85L1rC/VBwefs8xhMXAS6uIVMx7UEUwhOEX5bwOgtRHG/W+JCvAcdLHr62
 Ne041UBSu6MgMBbWOj9LuOfyA9aU+lPqq15eFUWZkOwEh0+OMFa7rYNmYkDT7VKcyMPN
 6qhovAwidM5vA2Xo2Szs75+8ecKgk3HuC0R4MuUdVZC464i03mQWkbaLgAQap8wLPGDB
 yyzxWra7/LYfohpFuV50TI345Zp3k7b267XoX4fUEhYUtlIdb+8KchnK4nQFL/nwdNsQ
 GXL7ZWOCNrHqU3z+Meg/UHum7kU1eDVkmv54ACUMp2bL0hQ+C7SzPgIylTTsf1EsIvBZ
 eB8A==
X-Gm-Message-State: AOAM533aan4QM2IjYOD2Ccv71e4VPkZor5KN4MqugLcReHtOdsTK05m3
 0z9QD6VsirCZgLfFSJG/Jlw9z9m1sgRDtK407bL+iYqqh7q7kFdXyU7X7Gl800ip2RK7SWIVwry
 KTG5ICUlse6YY9EUlLsiAAzrkM3gvev8bscPgNo2G9A==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr3995062wmi.84.1607435709589; 
 Tue, 08 Dec 2020 05:55:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzA6N3s86U/JDjUOs8NZEIzyA44f8DIyvIaz2dcybq7vg+qYLltQnCtH2dJeOyEBFEGBHspdw==
X-Received: by 2002:a05:600c:211:: with SMTP id
 17mr3995051wmi.84.1607435709452; 
 Tue, 08 Dec 2020 05:55:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id v189sm3702487wmg.14.2020.12.08.05.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 05:55:08 -0800 (PST)
Date: Tue, 8 Dec 2020 08:55:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: liush <liush@allwinnertech.com>
Subject: Re: [PATCH] virtio: replace constant parameter '1' with num
Message-ID: <20201208085423-mutt-send-email-mst@kernel.org>
References: <1607428671-4802-1-git-send-email-liush@allwinnertech.com>
MIME-Version: 1.0
In-Reply-To: <1607428671-4802-1-git-send-email-liush@allwinnertech.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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

On Tue, Dec 08, 2020 at 07:57:51PM +0800, liush wrote:
> 'num' can represent the value of out_sgs(in_sags), no need to pass 
> in constant parameters in 'virtqueue_add'.
> 
> Signed-off-by: liush <liush@allwinnertech.com>

Point being?
A constant is likely easier for the compiler to optimize ...

> ---
>  drivers/virtio/virtio_ring.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index becc776..7583f8b 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -1760,7 +1760,7 @@ int virtqueue_add_outbuf(struct virtqueue *vq,
>  			 void *data,
>  			 gfp_t gfp)
>  {
> -	return virtqueue_add(vq, &sg, num, 1, 0, data, NULL, gfp);
> +	return virtqueue_add(vq, &sg, num, num, 0, data, NULL, gfp);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_add_outbuf);
>  
> @@ -1782,7 +1782,7 @@ int virtqueue_add_inbuf(struct virtqueue *vq,
>  			void *data,
>  			gfp_t gfp)
>  {
> -	return virtqueue_add(vq, &sg, num, 0, 1, data, NULL, gfp);
> +	return virtqueue_add(vq, &sg, num, 0, num, data, NULL, gfp);
>  }
>  EXPORT_SYMBOL_GPL(virtqueue_add_inbuf);
>  
> -- 
> 2.7.4

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
