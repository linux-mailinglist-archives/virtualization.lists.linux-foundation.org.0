Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 7519823BCAB
	for <lists.virtualization@lfdr.de>; Tue,  4 Aug 2020 16:50:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id F15A722613;
	Tue,  4 Aug 2020 14:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpmFYsYs7ik6; Tue,  4 Aug 2020 14:50:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 32B00221FF;
	Tue,  4 Aug 2020 14:50:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04C0AC004C;
	Tue,  4 Aug 2020 14:50:57 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D939C004C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3078987C8C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:50:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1sYQHQOQh-M9
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:50:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7EE94859ED
 for <virtualization@lists.linux-foundation.org>;
 Tue,  4 Aug 2020 14:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596552651;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6YxLRfbCPvEp7fds9gJqZErapKvRhVFigGRNQsWtgis=;
 b=Xx6uBbNh0iJDgOpH48suyP+DkGDzF5B2iPqMLg2jNJe9xc2ix0T1zQi0R4IQMlUysxhYf+
 WOsmwQfcRrw9ei7yFq1Iz/ZokP889w2luZ/TJgutQyFpKAs32qmg+rDG3aRh8LbLsD4kl0
 MSEfoWI8IbbmUGUx41GnNOk6LwMumT4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-OMCkbzNkO12miiPFRDkg0A-1; Tue, 04 Aug 2020 10:50:48 -0400
X-MC-Unique: OMCkbzNkO12miiPFRDkg0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E08580BCB2;
 Tue,  4 Aug 2020 14:50:46 +0000 (UTC)
Received: from gondolin (ovpn-112-169.ams2.redhat.com [10.36.112.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A960069317;
 Tue,  4 Aug 2020 14:50:41 +0000 (UTC)
Date: Tue, 4 Aug 2020 16:50:39 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 17/24] virtio_config: disallow native type fields
Message-ID: <20200804165039.58dcb29e.cohuck@redhat.com>
In-Reply-To: <20200803205814.540410-18-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
 <20200803205814.540410-18-mst@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

On Mon, 3 Aug 2020 16:59:57 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> Transitional devices should all use __virtioXX types.

I think they should use __leXX for those fields that are not present
with legacy devices?

> Modern ones should use __leXX.
> _uXX type would be a bug.
> Let's prevent that.

That sounds right, though.

> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/linux/virtio_config.h | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
> index 64da491936f7..c68f58f3bf34 100644
> --- a/include/linux/virtio_config.h
> +++ b/include/linux/virtio_config.h
> @@ -319,9 +319,8 @@ static inline __virtio64 cpu_to_virtio64(struct virtio_device *vdev, u64 val)
>  	__virtio_pick_type(x, __u8, __u8,					\
>  		__virtio_pick_endian(x, __virtio16, __virtio32, __virtio64,	\
>  			__virtio_pick_endian(x, __le16, __le32, __le64,		\
> -				__virtio_pick_endian(x, __u16, __u32, __u64,	\
> -					/* No other type allowed */		\
> -					(void)0)))))
> +				/* No other type allowed */			\
> +				(void)0))))
>  
>  #endif
>  

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
