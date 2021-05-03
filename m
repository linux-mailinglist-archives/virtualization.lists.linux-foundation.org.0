Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DAF371263
	for <lists.virtualization@lfdr.de>; Mon,  3 May 2021 10:20:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9BF8A605B2;
	Mon,  3 May 2021 08:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lu18U-035wvj; Mon,  3 May 2021 08:20:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EBDE605CA;
	Mon,  3 May 2021 08:20:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05C13C0001;
	Mon,  3 May 2021 08:20:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7E305C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:20:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F40D60B16
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:20:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SUZszuIirgd2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:20:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C6B0605B2
 for <virtualization@lists.linux-foundation.org>;
 Mon,  3 May 2021 08:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620030006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1iQg39S7/yQcUAfdd2josWY92R4FYw1/luzJ6UFBUE=;
 b=ibHbSmRaAq+XPv1liziHCEBf+UJmrN7Q7577y7usOQ+0xzvWxUODGIkguVuF87cgwQnRWU
 S73SAyFYQJzXm+Hh8f0+pslDOmHtq7WGtHJQPOCMEBSCfd/5KuaBY7sd+kS7a2OiO4cdOU
 zCpemh7i46lvi9F0ihzbfvqiwc2Pm7Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-oVBNBSRXMwiIjSnU426J5g-1; Mon, 03 May 2021 04:20:04 -0400
X-MC-Unique: oVBNBSRXMwiIjSnU426J5g-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so3464781wrl.20
 for <virtualization@lists.linux-foundation.org>;
 Mon, 03 May 2021 01:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Y1iQg39S7/yQcUAfdd2josWY92R4FYw1/luzJ6UFBUE=;
 b=HKhSurr9vKisXJmYuOwAFD/EPBpafIxj0HYI6JrhOVf5NvbQWZVcJFZcMYWNmf9wSZ
 AIyCzpAIp9E3tSeGhgeif2+LAFjWsE75Bs2eZzEL7YLIivb87ebeymbgdhqSR54Wx2i9
 sb2jAOsmg53DwD2dsKIsFkvTq+L9wKzFKfCjEUJGABTpweHJOUL+ECLML7JE5BuSVrnS
 7ZnVq5gverOdc0UAvjCY56UqUUGw64kqNkqg4y2LPnLdEDTaykfCUFn7ZS3gpiSo4lky
 h7RBWhwCuvo0V/OGo9PS2etZmtBLsxG7eSnepYvL0729j8bhLHMerTz5SJzK2Dwzw9Gz
 minQ==
X-Gm-Message-State: AOAM530lWT7oAD5zGYkg17CgG0k0Pej+2m50LOe58Y6igggFuSxvwBES
 gPHuKupws+VKL+KCeuh09KozlFwQzE1zHkH3qTCldjhrdJDEQjXmYKh+dMOdkobCihN7edEs+on
 4EtS73v6n+Z/5lR+j2vNPAMrkMfgjSg70v0BoAeqQEA==
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr20341800wmj.175.1620030003796; 
 Mon, 03 May 2021 01:20:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqXbKqLMVYj7jCfahNg53ORbH8cpXtpuR0Wp8+7ALOqrnsRfqpqjRjjxsQkluF9/EwSQpkcg==
X-Received: by 2002:a05:600c:249:: with SMTP id
 9mr20341784wmj.175.1620030003623; 
 Mon, 03 May 2021 01:20:03 -0700 (PDT)
Received: from redhat.com (bzq-79-178-133-9.red.bezeqint.net. [79.178.133.9])
 by smtp.gmail.com with ESMTPSA id
 b7sm3449828wri.83.2021.05.03.01.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 01:20:03 -0700 (PDT)
Date: Mon, 3 May 2021 04:20:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] sound: virtio: correct the function name in kernel-doc
 comment
Message-ID: <20210503041943-mutt-send-email-mst@kernel.org>
References: <20210415052645.14465-1-rdunlap@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210415052645.14465-1-rdunlap@infradead.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: alsa-devel@alsa-project.org, virtualization@lists.linux-foundation.org,
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

On Wed, Apr 14, 2021 at 10:26:45PM -0700, Randy Dunlap wrote:
> Fix kernel-doc warning that the wrong function name is used in a
> kernel-doc comment:
> 
> ../sound/virtio/virtio_ctl_msg.c:70: warning: expecting prototype for virtsnd_ctl_msg_request(). Prototype was for virtsnd_ctl_msg_response() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Anton Yakovlev <anton.yakovlev@opensynergy.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: alsa-devel@alsa-project.org

Acked-by: Michael S. Tsirkin <mst@redhat.com>

Pls feel free to apply to the correct tree.

> ---
>  sound/virtio/virtio_ctl_msg.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linux-next-20210414.orig/sound/virtio/virtio_ctl_msg.c
> +++ linux-next-20210414/sound/virtio/virtio_ctl_msg.c
> @@ -61,7 +61,7 @@ void *virtsnd_ctl_msg_request(struct vir
>  }
>  
>  /**
> - * virtsnd_ctl_msg_request() - Get a pointer to the response header.
> + * virtsnd_ctl_msg_response() - Get a pointer to the response header.
>   * @msg: Control message.
>   *
>   * Context: Any context.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
