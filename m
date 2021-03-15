Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA833B10B
	for <lists.virtualization@lfdr.de>; Mon, 15 Mar 2021 12:28:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F002543015;
	Mon, 15 Mar 2021 11:28:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_4N71UFP-VB; Mon, 15 Mar 2021 11:28:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEBDC430D9;
	Mon, 15 Mar 2021 11:28:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5A419C0012;
	Mon, 15 Mar 2021 11:28:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50DD0C0001
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 11:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 367C74B398
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 11:28:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wLlpcp-RJCxA
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 11:28:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F7FD4AAEE
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 11:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615807716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6+Ab4d7pdKrk5yb3Huo0eOHzorz4U2kFO+nloggYgTE=;
 b=OcUYvPCdxjkF2sc/qvdK0P4v6Pja5Sfm3ns5etFBiZeoVnPsGUpiIbSJrYU1uTvDy9Lp3x
 8noaAOtJl6mW4gXstQxMX07GMX/W+VWbKZ7heSzZDtzQsZVo6X1v8KdBR3VtWt/Pyliq8P
 1RJrYO4OihV/L/BFSP3iD/MxfKX5IaY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-335-U0NMEEgvMLac-XtLuM60iw-1; Mon, 15 Mar 2021 07:28:34 -0400
X-MC-Unique: U0NMEEgvMLac-XtLuM60iw-1
Received: by mail-wr1-f69.google.com with SMTP id y5so14954658wrp.2
 for <virtualization@lists.linux-foundation.org>;
 Mon, 15 Mar 2021 04:28:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6+Ab4d7pdKrk5yb3Huo0eOHzorz4U2kFO+nloggYgTE=;
 b=r/VqGFcKGx1TesE8/bvLVZ2B70YUcF8UMK4xpU5bx3l373hy5uP6AqOiRoe9GGAQVY
 iATSStYol/cRK8KTYcQRS9jbbyacu9crrV6rC/a1ufMxg1dTcz2/2SWhcBUaRP46MOhM
 VpImtGR1MJ96ejvxHqvU4j/3KcgZaSylEpcPqi+176YFp8QiYoq26CqLO6NwjynVPIty
 l62x8ienp6FkqElLcgY0CjwFiQRxqlF31rary9kzKX2NFcEbKHcBecpmrKBFHAJ1Mega
 SIKvBqV7uULjbVUnp5DJCJYSo/MOn0EdZJEkvCq82TK/NvvTTMwVs+4ark1nHiyILQGL
 1ytg==
X-Gm-Message-State: AOAM532R5VfVIETgB9BvJKyz4tbvhavZsQdcIkq5/nuVsLQm6qgRhDy8
 NTDGvxsHLDEtzq4p75WLvX3yAs9r/xyt8SLOfKEnDTQvOx0U6UkwSpSHQvVNaMjzllmSEH5oAon
 EkcV6j+S4lMwXsqtw7KBMPvYdrII/Z9zEUk2P/qSqeA==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr26369007wmq.159.1615807713328; 
 Mon, 15 Mar 2021 04:28:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB7EBmQowN5naQMkVQx5KsUpgIu5+ZOQSWr7rwjRrAdNKAoaTOGMg/KcI/Bgs8opSa6gMvzg==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr26368990wmq.159.1615807713161; 
 Mon, 15 Mar 2021 04:28:33 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id 1sm12342744wmj.2.2021.03.15.04.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 04:28:32 -0700 (PDT)
Date: Mon, 15 Mar 2021 12:28:30 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v6 16/22] vhost/vsock: SEQPACKET feature bit support
Message-ID: <20210315112830.3yqqjnqcgym2sdpg@steredhat>
References: <20210307175722.3464068-1-arseny.krasnov@kaspersky.com>
 <20210307180344.3466469-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210307180344.3466469-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, stsp2@yandex.ru,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 oxffffaa@gmail.com, Norbert Slusarek <nslusarek@gmx.net>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
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

On Sun, Mar 07, 2021 at 09:03:41PM +0300, Arseny Krasnov wrote:
>This adds handling of SEQPACKET bit: if guest sets features with
>this bit cleared, then SOCK_SEQPACKET support will be disabled.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> drivers/vhost/vsock.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)

I think is better to move this patch after we set the seqpackets ops,
so we are really able to handle SEQPACKET traffic.

>
>diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
>index 5e78fb719602..3b0a50e6de12 100644
>--- a/drivers/vhost/vsock.c
>+++ b/drivers/vhost/vsock.c
>@@ -31,7 +31,8 @@
>
> enum {
> 	VHOST_VSOCK_FEATURES = VHOST_FEATURES |
>-			       (1ULL << VIRTIO_F_ACCESS_PLATFORM)
>+			       (1ULL << VIRTIO_F_ACCESS_PLATFORM) |
>+			       (1ULL << VIRTIO_VSOCK_F_SEQPACKET)
> };
>
> enum {
>@@ -785,6 +786,9 @@ static int vhost_vsock_set_features(struct vhost_vsock *vsock, u64 features)
> 			goto err;
> 	}
>
>+	if (features & (1ULL << VIRTIO_VSOCK_F_SEQPACKET))
>+		vhost_transport.seqpacket_allow = true;
>+
> 	for (i = 0; i < ARRAY_SIZE(vsock->vqs); i++) {
> 		vq = &vsock->vqs[i];
> 		mutex_lock(&vq->mutex);
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
