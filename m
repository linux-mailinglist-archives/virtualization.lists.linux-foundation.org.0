Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B24983DE048
	for <lists.virtualization@lfdr.de>; Mon,  2 Aug 2021 21:46:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EC4083D2D;
	Mon,  2 Aug 2021 19:46:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6u6LAEGjZ_TJ; Mon,  2 Aug 2021 19:46:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2674683D29;
	Mon,  2 Aug 2021 19:46:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DE0AC000E;
	Mon,  2 Aug 2021 19:46:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 535CBC000E
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 19:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A97683D29
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 19:46:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cabP3eoVC_G7
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 19:46:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CCA783D28
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 Aug 2021 19:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627933574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u4LSyR/0hL97TpqHNN7IRSJmq939orqyXRewz9/HhmU=;
 b=DnsxoZIr7cBwKawm3gdKJJmiFfByy0pbZZ0dI3n5SpMT+mrwlWhG0JOQGTGOAyVb5EyBk/
 gmN6DXD5wwEbYEgc7YkeNgWOgVmxB5++E7sr/Wt6JdTM4nHUkWSs+s0SNEZB9R9o4MwfAM
 1Wf9sUobgbAECXcTjmnSuiZIdya9YBk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-Vv-wfdHBOT-K2-0DyqILwQ-1; Mon, 02 Aug 2021 15:46:12 -0400
X-MC-Unique: Vv-wfdHBOT-K2-0DyqILwQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 n24-20020aa7c7980000b02903bb4e1d45aaso9306820eds.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 Aug 2021 12:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u4LSyR/0hL97TpqHNN7IRSJmq939orqyXRewz9/HhmU=;
 b=swoAVKHLSozKGbUvQMUHD3iEYXnz1RvmL/62/koBbiMioB7Gg5yPhVQ/tCkl8D1UI2
 vfhARJ2V0+GOcotLvcLi99EDAbXFPdeELcwEW0qxJ8XpWIhKGRdzM+ox6NTV6hFbMSzY
 twUpSsQckko7eJk8stTxaqWqrk90gY3A5HQWi33POcXntHJR9pEJ0bYbEb5WBgZPaZ9B
 GRsC/tBve/Z1MMhzlZJTfdg8Em5pHV9j704Ec/04rkAbqskUtPP7GiNK8RIrBHaJlS1q
 EG3OhcF37YajKQrKOX6nOHw9C2zdcr7Cn5XL0TdwLINnaeDVXP5d7ajJ77qOeEpVjpGZ
 QahA==
X-Gm-Message-State: AOAM533y8nyABmDgvUZoxC4f1AEmZuCljQ0zVkV13GQNSdv162NRQ2U9
 mUTuDi1sxeA8vN8ivCCw4/Ece51QfnMuHekDqlb7nGKZQueIR/hLY25m9WctKJqqImaaWWxvn1f
 6bRfQamXSqmXUs/qofwlQthRflTg2sXnYjIDtAbmkSQ==
X-Received: by 2002:a05:6402:26d1:: with SMTP id
 x17mr22009501edd.126.1627933571722; 
 Mon, 02 Aug 2021 12:46:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUxeZQ8QWOaFM+a5MHs53Gufa4vyRbkQJ+aLrM7GKCmZ6HoO4YrMab1RKippOjDtVlBAYgBQ==
X-Received: by 2002:a05:6402:26d1:: with SMTP id
 x17mr22009484edd.126.1627933571594; 
 Mon, 02 Aug 2021 12:46:11 -0700 (PDT)
Received: from redhat.com ([2.55.140.205])
 by smtp.gmail.com with ESMTPSA id b3sm5036362ejb.7.2021.08.02.12.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 12:46:11 -0700 (PDT)
Date: Mon, 2 Aug 2021 15:46:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Harshavardhan Unnibhavi <harshanavkis@gmail.com>
Subject: Re: [PATCH net] VSOCK: handle VIRTIO_VSOCK_OP_CREDIT_REQUEST
Message-ID: <20210802152624-mutt-send-email-mst@kernel.org>
References: <20210802173506.2383-1-harshanavkis@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210802173506.2383-1-harshanavkis@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 imbrenda@linux.vnet.ibm.com, stefanha@redhat.com, kuba@kernel.org,
 asias@redhat.com, virtualization@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

On Mon, Aug 02, 2021 at 07:35:06PM +0200, Harshavardhan Unnibhavi wrote:
> The original implementation of the virtio-vsock driver does not
> handle a VIRTIO_VSOCK_OP_CREDIT_REQUEST as required by the
> virtio-vsock specification. The vsock device emulated by
> vhost-vsock and the virtio-vsock driver never uses this request,
> which was probably why nobody noticed it. However, another
> implementation of the device may use this request type.
> 
> Hence, this commit introduces a way to handle an explicit credit
> request by responding with a corresponding credit update as
> required by the virtio-vsock specification.
> 
> Fixes: 06a8fc78367d ("VSOCK: Introduce virtio_vsock_common.ko")
> 
> Signed-off-by: Harshavardhan Unnibhavi <harshanavkis@gmail.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  net/vmw_vsock/virtio_transport_common.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
> index 169ba8b72a63..081e7ae93cb1 100644
> --- a/net/vmw_vsock/virtio_transport_common.c
> +++ b/net/vmw_vsock/virtio_transport_common.c
> @@ -1079,6 +1079,9 @@ virtio_transport_recv_connected(struct sock *sk,
>  		virtio_transport_recv_enqueue(vsk, pkt);
>  		sk->sk_data_ready(sk);
>  		return err;
> +	case VIRTIO_VSOCK_OP_CREDIT_REQUEST:
> +		virtio_transport_send_credit_update(vsk);
> +		break;
>  	case VIRTIO_VSOCK_OP_CREDIT_UPDATE:
>  		sk->sk_write_space(sk);
>  		break;
> -- 
> 2.17.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
