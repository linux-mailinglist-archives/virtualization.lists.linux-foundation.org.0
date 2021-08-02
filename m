Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EBB3DDF54
	for <lists.virtualization@lfdr.de>; Mon,  2 Aug 2021 20:35:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A26748305A;
	Mon,  2 Aug 2021 18:35:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LeQekVXz6rLi; Mon,  2 Aug 2021 18:35:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 5455182F19;
	Mon,  2 Aug 2021 18:35:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA37EC000E;
	Mon,  2 Aug 2021 18:35:05 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62FF9C000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 18:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 44D096082E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 18:35:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrMtHej2LkZa
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 18:35:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15BF56076D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 18:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627929301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wminINGDgWcNHoLPUasL8rgS7uCgoeCj4rIW6d1gFd0=;
 b=YvBg4D6Ok09eOJC7TpSEwFAEQ2FIpkAD3RnFGXJllgtpEvvvY32RT1vEPaP+v9hID1svZ8
 IadKbOyRJWI8L53OId502PzHZFsdKqe9b3ZT219OP8kpZrOG124J/W9kmYAeKeXtHkZ1v6
 kb346tGfSInQ8X5ngvqAx7EFrrPb2rg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-q9oLcTtuMvmqLroXSJUKkg-1; Mon, 02 Aug 2021 14:35:00 -0400
X-MC-Unique: q9oLcTtuMvmqLroXSJUKkg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a19-20020a1709063e93b0290551ea218ea2so5011651ejj.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Aug 2021 11:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wminINGDgWcNHoLPUasL8rgS7uCgoeCj4rIW6d1gFd0=;
 b=O3T1F1AWk1Og8TNi/swKF//c3cXeNVxcHx120KmParizZMnkhC6mD2IbzIhtxdDfyG
 H8UzBZnqn1JUPQLV9v3jF0WFgQQkTZcQ07VNQMggdSpcogZbe34QleO+KQ3GbAi885Ir
 RRYIr2LBD9ENkQn+5A5uI6ohnVEovTwaCk3s7xrBj3PROTEK1svf/FXTlOVBtneeGH5s
 h9p6FEWY3tPCsI6gxJ4A4mDAFJCsRQ5sA5T+dnUtFLagEhGANSqpW9NcdVnJurIcdDzT
 M2G7dSZSUO5M8+267jeEdmb8RuUPixZdpz8TFTsXwB0OgeUu3R2hu1N0g7ZulGALCj9H
 Jp1g==
X-Gm-Message-State: AOAM533a4I1rLD9HngCBlpFb8w4gmyDEOxnAS4aPgBMSorefeWteBG89
 OOd4J8BiN17+El+KDrT5Zj43T9kBUlTtkGroO5iZoRsgs/9Po2vTSYCQQINDXlsNWnHKqMhM6Ac
 BKgbVtIaFGwCSQFmTPhwmrINtpdm0183TzvZaFlkL8w==
X-Received: by 2002:a50:fb18:: with SMTP id d24mr20985346edq.225.1627929299327; 
 Mon, 02 Aug 2021 11:34:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoCyMdXrDgg3jX2cUmgPnbyHqQZI1zsIxFF27gl9okbIV2OgI+ba2TaS/45evhjSuB8kSK5g==
X-Received: by 2002:a50:fb18:: with SMTP id d24mr20985334edq.225.1627929299147; 
 Mon, 02 Aug 2021 11:34:59 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id n13sm6705376eda.36.2021.08.02.11.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 11:34:58 -0700 (PDT)
Date: Mon, 2 Aug 2021 20:34:56 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Harshavardhan Unnibhavi <harshanavkis@gmail.com>
Subject: Re: [PATCH net] VSOCK: handle VIRTIO_VSOCK_OP_CREDIT_REQUEST
Message-ID: <20210802183456.zvr6raqtgwrm3s52@steredhat>
References: <20210802173506.2383-1-harshanavkis@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210802173506.2383-1-harshanavkis@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, mst@redhat.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imbrenda@linux.vnet.ibm.com, stefanha@redhat.com,
 kuba@kernel.org, asias@redhat.com, virtualization@lists.linux-foundation.org,
 davem@davemloft.net
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

On Mon, Aug 02, 2021 at 07:35:06PM +0200, Harshavardhan Unnibhavi wrote:
>The original implementation of the virtio-vsock driver does not
>handle a VIRTIO_VSOCK_OP_CREDIT_REQUEST as required by the
>virtio-vsock specification. The vsock device emulated by
>vhost-vsock and the virtio-vsock driver never uses this request,
>which was probably why nobody noticed it. However, another
>implementation of the device may use this request type.
>
>Hence, this commit introduces a way to handle an explicit credit
>request by responding with a corresponding credit update as
>required by the virtio-vsock specification.
>
>Fixes: 06a8fc78367d ("VSOCK: Introduce virtio_vsock_common.ko")
>
>Signed-off-by: Harshavardhan Unnibhavi <harshanavkis@gmail.com>
>---
> net/vmw_vsock/virtio_transport_common.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c 
>b/net/vmw_vsock/virtio_transport_common.c
>index 169ba8b72a63..081e7ae93cb1 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -1079,6 +1079,9 @@ virtio_transport_recv_connected(struct sock *sk,
> 		virtio_transport_recv_enqueue(vsk, pkt);
> 		sk->sk_data_ready(sk);
> 		return err;
>+	case VIRTIO_VSOCK_OP_CREDIT_REQUEST:
>+		virtio_transport_send_credit_update(vsk);
>+		break;
> 	case VIRTIO_VSOCK_OP_CREDIT_UPDATE:
> 		sk->sk_write_space(sk);
> 		break;
>-- 2.17.1
>

The patch LGTM, thanks for fixing this long-time issue!

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
