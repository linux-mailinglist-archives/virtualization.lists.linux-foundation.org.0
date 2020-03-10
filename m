Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970717F74A
	for <lists.virtualization@lfdr.de>; Tue, 10 Mar 2020 13:19:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9C48385F6C;
	Tue, 10 Mar 2020 12:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8O5moyKSWL9r; Tue, 10 Mar 2020 12:19:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B6ACB85F60;
	Tue, 10 Mar 2020 12:19:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CAEBC0177;
	Tue, 10 Mar 2020 12:19:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76E03C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 12:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6668C85F51
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 12:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GxGhPEzltfhO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 12:19:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id D8F9685F4C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 12:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583842778;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qoDjVfCyMen1kfloMIClESpphvSaHWNU06cu9u+0VdQ=;
 b=GOEqDWhSSRuxuU/4nfGDXKiY0iNpouwuWTG//HW5Bmx3CcQCyqVxdJdUOsLFo4m3hx7MRS
 m1yK+4rvbHlULINKnJ4T6nYxg3QMv5XCkKirx1Tua2fV+45h4YuVOUcvg+tV3EHmoA9MsP
 c5jPXLANxj/ReWIGJSWiPjPOu3weiLY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-7fKEI3EEPfKnHIsgbcxpQQ-1; Tue, 10 Mar 2020 08:19:37 -0400
X-MC-Unique: 7fKEI3EEPfKnHIsgbcxpQQ-1
Received: by mail-qk1-f197.google.com with SMTP id e13so9509056qkm.23
 for <virtualization@lists.linux-foundation.org>;
 Tue, 10 Mar 2020 05:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qoDjVfCyMen1kfloMIClESpphvSaHWNU06cu9u+0VdQ=;
 b=hpYST3+yU98IwPMnJ1ny/9ExNIt9hcIM5Wiktu84Zknj3GX9G0hAauwiInyUXkmiQc
 GmyWVyMZd4fjhp15kIoJz798VguP6Ac4twhhmnJ62r6qZiDmw4F8Md5Yrl33IwpDBx/t
 zSrg1FUFtS3cgApBwJNevISbHUFmZvPQJOWpQu5P8koNBNz9ZtM6sb5YCJuaS/6KAIZK
 FOD+hgbP83sfHHn0Y1kKc4XvAIhLv0DXjtcj5ESnoz2Mx/toa1IhARADFVPNn9dFFJcd
 NgHv/qZqSanJrPj5qC2URaZZEa8TbwOZBcH5dOWgDlQpiC2klPUC9Rd9yWUPAuOcwZ68
 prrA==
X-Gm-Message-State: ANhLgQ344byiztlhkZj7giabaQu5Hu2IjvcZlL9uBtw4fo+fNj/E49Ec
 V25hy1A0hhEiL9tBgT+Gs0KLWaVbtTcWbwjRP1MtmySjR3g3HHi1uHR0rRoBw1+AagcxPivCfob
 gZxtza9+RTaO/5d1xJqYs/PRMzQhnCmc9po/VuNceKw==
X-Received: by 2002:a0c:c783:: with SMTP id k3mr18816399qvj.241.1583842776749; 
 Tue, 10 Mar 2020 05:19:36 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu02wK5j5HqaBUlUP94aV2l+2NXRf1hgehYJ+CaAbsYTYbQKE4jxeirYry6aBbd1OWhTAdxvw==
X-Received: by 2002:a0c:c783:: with SMTP id k3mr18816387qvj.241.1583842776557; 
 Tue, 10 Mar 2020 05:19:36 -0700 (PDT)
Received: from redhat.com (bzq-79-178-2-19.red.bezeqint.net. [79.178.2.19])
 by smtp.gmail.com with ESMTPSA id f13sm10035959qte.53.2020.03.10.05.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Mar 2020 05:19:35 -0700 (PDT)
Date: Tue, 10 Mar 2020 08:19:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1] MAINTAINERS: Add myself as virtio-balloon co-maintainer
Message-ID: <20200310081850-mutt-send-email-mst@kernel.org>
References: <20200310115411.12760-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200310115411.12760-1-david@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Luiz Capitulino <lcapitulino@redhat.com>, linux-kernel@vger.kernel.org,
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

On Tue, Mar 10, 2020 at 12:54:11PM +0100, David Hildenbrand wrote:
> As suggested by Michael, let's add me as co-maintainer of virtio-balloon.
> While at it, also add "include/linux/balloon_compaction.h" to the file
> list.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Yea I don't think Jason actually has time to look at balloon patches.
Thanks for helping out!
I'll queue this.

> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c555f4be8c4e..da9f53a05d0e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17800,6 +17800,15 @@ F:	drivers/block/virtio_blk.c
>  F:	include/linux/virtio*.h
>  F:	include/uapi/linux/virtio_*.h
>  F:	drivers/crypto/virtio/
> +
> +VIRTIO BALLOON
> +M:	"Michael S. Tsirkin" <mst@redhat.com>
> +M:	David Hildenbrand <david@redhat.com>
> +L:	virtualization@lists.linux-foundation.org
> +S:	Maintained
> +F:	drivers/virtio/virtio_balloon.c
> +F:	include/uapi/linux/virtio_balloon.h
> +F:	include/linux/balloon_compaction.h
>  F:	mm/balloon_compaction.c
>  
>  VIRTIO BLOCK AND SCSI DRIVERS
> -- 
> 2.24.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
