Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 3953B37F6F1
	for <lists.virtualization@lfdr.de>; Thu, 13 May 2021 13:42:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1EB1844F1;
	Thu, 13 May 2021 11:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0HIoAjopfREv; Thu, 13 May 2021 11:42:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF52844F3;
	Thu, 13 May 2021 11:42:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 486C8C001C;
	Thu, 13 May 2021 11:42:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3D8F1C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 11:42:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B7DE403A9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 11:42:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8mQe_1jEMhzB
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 11:42:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F186C401C3
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 11:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620906140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R+xpriwoqMR4hMxYIDQ9tzTIIOzNsv7iGskqwPCMAtI=;
 b=OI27jo8NIxgomqRr60ykXGsCjDHgwrGm6G0QX0rLYa7GqsbaWTFZBEyG2DSoBKKFUH4mDT
 fvl90ygMZEZH9fjAwXot8JUE1E6HdyYmdmBLyfdu+kELMjMPqK3XRN965emRnKKApcYXaR
 wsT+QkA80iJTLKt3zc29VpCMlHUYNCo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-Ks-D3Y3kM4mA9VQhhNyFmw-1; Thu, 13 May 2021 07:42:18 -0400
X-MC-Unique: Ks-D3Y3kM4mA9VQhhNyFmw-1
Received: by mail-ed1-f69.google.com with SMTP id
 i19-20020a05640242d3b0290388cea34ed3so14467927edc.15
 for <virtualization@lists.linux-foundation.org>;
 Thu, 13 May 2021 04:42:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R+xpriwoqMR4hMxYIDQ9tzTIIOzNsv7iGskqwPCMAtI=;
 b=THBOIAugmxhhaxDXUJgchUjeh9xQ3dazB0CmDafCTgbFvR7aT5bye7jIn9Cnd/mXpX
 Ce3Dl12M9TtDpkKB8GOIA5l/lcBJvmv8x77jNry0MMiasom0Z9Aggjcel9SOQFe/4dLC
 LJ/divnlDrRp9Vqxy+dGpOqYUg6n6+nl0DBqwP1TSFI0PsU1Y9UUrechjqzOFfesYgWh
 gRKo6RpaP39X+j3bS4wq7xiKYICG23RXI/1fxbN28Hgy0o/B9XHiJumfwNvvU5xz3CyJ
 JohsHjKSWh0f/Ej9xqXDFL1QulYnsW9xfozmHygYEbfA5WYxIYCXfxlA5qdFkE9lvm6g
 iaiA==
X-Gm-Message-State: AOAM531q7qBbCabMXBE4oHgClku8moHtZH4nssjuGgze8yEtdCqg2S8q
 pnY6M9xZmoRVJwCMR2gSrHzLJ/30X2Np5Dy9TQjz4t+q86xjZ5TYg6ws5Z4w2Fm39uq6Cp/6N0D
 N2SmWsxy5aJeq+9rxuwbV0s3MWhd7i8zNhe07ZWbn/g==
X-Received: by 2002:a17:906:11d5:: with SMTP id
 o21mr39425180eja.176.1620906137651; 
 Thu, 13 May 2021 04:42:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4evvrqMGAM5r4UR85o5vJGUe4V1rA7BD2JGHOAS51E0jB0311f1ua3YMBd6FJgtBjiTezpQ==
X-Received: by 2002:a17:906:11d5:: with SMTP id
 o21mr39425159eja.176.1620906137418; 
 Thu, 13 May 2021 04:42:17 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id q25sm1704765ejd.9.2021.05.13.04.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 04:42:17 -0700 (PDT)
Date: Thu, 13 May 2021 13:42:14 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v9 06/19] af_vsock: rest of SEQPACKET support
Message-ID: <20210513114214.66mfm76tp65af5yq@steredhat>
References: <20210508163027.3430238-1-arseny.krasnov@kaspersky.com>
 <20210508163350.3431361-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210508163350.3431361-1-arseny.krasnov@kaspersky.com>
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

On Sat, May 08, 2021 at 07:33:46PM +0300, Arseny Krasnov wrote:
>This does rest of SOCK_SEQPACKET support:
>1) Adds socket ops for SEQPACKET type.
>2) Allows to create socket with SEQPACKET type.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

This patch is changed, so usually you should remove the R-b tags.

>---
> include/net/af_vsock.h   |  1 +
> net/vmw_vsock/af_vsock.c | 36 +++++++++++++++++++++++++++++++++++-
> 2 files changed, 36 insertions(+), 1 deletion(-)
>
>diff --git a/include/net/af_vsock.h b/include/net/af_vsock.h
>index 5860027d5173..1747c0b564ef 100644
>--- a/include/net/af_vsock.h
>+++ b/include/net/af_vsock.h
>@@ -140,6 +140,7 @@ struct vsock_transport {
> 				     int flags, bool *msg_ready);
> 	int (*seqpacket_enqueue)(struct vsock_sock *vsk, struct msghdr *msg,
> 				 size_t len);
>+	bool (*seqpacket_allow)(u32 remote_cid);

I'm thinking if it's better to follow .dgram_allow() and .stream_allow(),
specifying also the `port` param, but since it's not used, we can add
later if needed.

So, I think this is fine:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
