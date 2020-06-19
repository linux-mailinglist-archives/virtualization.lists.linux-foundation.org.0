Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 987D42007FB
	for <lists.virtualization@lfdr.de>; Fri, 19 Jun 2020 13:39:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AAA858992C;
	Fri, 19 Jun 2020 11:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iR9UWO2xfVSy; Fri, 19 Jun 2020 11:39:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0BEE58995B;
	Fri, 19 Jun 2020 11:39:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB434C016E;
	Fri, 19 Jun 2020 11:39:19 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E69DC016E
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 11:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 42516898DC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 11:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2IuFto9RNSgU
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 11:39:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 289AE898D4
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 11:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592566754;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9d0X2yH4PD3KFMTh5p2Qj9w09XEwXAFgHugUlN26sqY=;
 b=QO1nuBOJ7MgCvQHY3guCqnjZlWA/jnfoFgDKU/fYUzImBiAKE6pNmp1Q2Wds2zCDIV/Yaj
 0UKH9SKT282kQ3RgCH8X4CRsjdQa+gPxkBkMMFRscgU80IlGwHfD8jUBSrSXg+sOdgx96S
 ecnsTz81Jhu9ldgr5T0N+xZFVxvUveU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-lGQVjsYKNp6HjxhMIJqnAg-1; Fri, 19 Jun 2020 07:39:10 -0400
X-MC-Unique: lGQVjsYKNp6HjxhMIJqnAg-1
Received: by mail-wm1-f72.google.com with SMTP id r1so3880758wmh.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 19 Jun 2020 04:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9d0X2yH4PD3KFMTh5p2Qj9w09XEwXAFgHugUlN26sqY=;
 b=Ec1m+IRZJgNTiY8zQk0wZ5rEtKqha9OfcelrfbylmqKFFcHIHvVHMdQqZ1DMEDjpL8
 GcoTjAmHGl9F2pZ+E47J8AnnJ7MkbabLOgKFEMeLSKM78JOwqbFx2zBTDPMRAwqN73JT
 w0wbiKb0eMi0KeXDIKYMEvY7r9wXsariB8f+y9JIrq3tzBRthJK4dKjYGOS0h1vc0dpV
 ycUgHie87tgsAXLZKsfT+U5uQIRHRcQHy6mdbsZUgn7Nix1ahhYXyQRkF0nyPppF8xMc
 t2wRJxUJt3/MNvtfjIFuqowHDdVWsiR96WFVy4/qWqfqxyp5oQbclklIdAzTk4MvHur/
 6vQw==
X-Gm-Message-State: AOAM530lww8A/7jq/hLSywKNqUQiZDdCiyL4NWNo7YZkThW2EyJ28JjH
 qeGVKdysnyLJgLZS4VtwPZv5i3dm+b5nAUuIMDEOT8GH7O4Jkhtcj8H20DGcRDes/lBU2Jkcbs+
 hAjh0uQ9ESUHHuiO16v1gs6YuFeFZPWwUdeOXMnZbww==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr2567537wrw.18.1592566749430; 
 Fri, 19 Jun 2020 04:39:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcRzn891sh2mmuqWJN1VVmUBNitsV9W5VKxNvKYYNB1FoJVfn8DXQQL1zuCyP5PRvsbUnX8g==
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr2567517wrw.18.1592566749259; 
 Fri, 19 Jun 2020 04:39:09 -0700 (PDT)
Received: from redhat.com (bzq-79-178-18-124.red.bezeqint.net. [79.178.18.124])
 by smtp.gmail.com with ESMTPSA id k206sm6799460wma.39.2020.06.19.04.39.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 04:39:08 -0700 (PDT)
Date: Fri, 19 Jun 2020 07:39:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Weilong Chen <chenweilong@huawei.com>
Subject: Re: [PATCH] virtio-mem: Fix build error due to improper use 'select'
Message-ID: <20200619073841-mutt-send-email-mst@kernel.org>
References: <20200619080333.194753-1-chenweilong@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20200619080333.194753-1-chenweilong@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: lizefan@huawei.com, linux-kernel@vger.kernel.org,
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

On Fri, Jun 19, 2020 at 04:03:33PM +0800, Weilong Chen wrote:
> As noted in:
> https://www.kernel.org/doc/Documentation/kbuild/kconfig-language.txt
> "select should be used with care. select will force a symbol to a
> value without visiting the dependencies."
> Config VIRTIO_MEM should not select CONTIG_ALLOC directly.
> Otherwise it will cause an error:
> https://bugzilla.kernel.org/show_bug.cgi?id=208245
> 
> Signed-off-by: Weilong Chen <chenweilong@huawei.com>

Cc virtio mem maintainer:
M:      David Hildenbrand <david@redhat.com>


> ---
>  drivers/virtio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/virtio/Kconfig b/drivers/virtio/Kconfig
> index 5809e5f5b157..5c92e4a50882 100644
> --- a/drivers/virtio/Kconfig
> +++ b/drivers/virtio/Kconfig
> @@ -85,7 +85,7 @@ config VIRTIO_MEM
>  	depends on VIRTIO
>  	depends on MEMORY_HOTPLUG_SPARSE
>  	depends on MEMORY_HOTREMOVE
> -	select CONTIG_ALLOC
> +	depends on CONTIG_ALLOC
>  	help
>  	 This driver provides access to virtio-mem paravirtualized memory
>  	 devices, allowing to hotplug and hotunplug memory.
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
