Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 666076ABF19
	for <lists.virtualization@lfdr.de>; Mon,  6 Mar 2023 13:07:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD2C460BE5;
	Mon,  6 Mar 2023 12:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD2C460BE5
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=P3wWb5ig
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vc597dMP2npv; Mon,  6 Mar 2023 12:07:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8AC4A60BE8;
	Mon,  6 Mar 2023 12:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AC4A60BE8
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B394FC008B;
	Mon,  6 Mar 2023 12:07:54 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B52AC0032
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 12:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A3BE40579
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 12:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A3BE40579
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=P3wWb5ig
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbbmzUOA5qQx
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 12:07:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3106F400C4
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3106F400C4
 for <virtualization@lists.linux-foundation.org>;
 Mon,  6 Mar 2023 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678104471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I0ekj7n7BGA/ETtY6sbgYM92CAukII9oGd0VLpZBNPM=;
 b=P3wWb5igPWJEKTmPiPwY5AHPO8aQ1ua2NVFVLg6+yXl1p9xP5gJyicBRh2E0XACeTvPpZk
 buAE+MaS/AslTiLS5Un+jEqvUcxkr0MTBLY2UcGQCciBbj7jJHhJIOLi1G6JrNokqcXN4i
 zcidXEhXKneFhiLb5gBQY1rHvi9Vxy0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-hVgAcYkwOoSS2dIFG7gz3A-1; Mon, 06 Mar 2023 07:07:47 -0500
X-MC-Unique: hVgAcYkwOoSS2dIFG7gz3A-1
Received: by mail-qt1-f200.google.com with SMTP id
 g13-20020ac8124d000000b003bfba5d76a3so5051837qtj.15
 for <virtualization@lists.linux-foundation.org>;
 Mon, 06 Mar 2023 04:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678104467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0ekj7n7BGA/ETtY6sbgYM92CAukII9oGd0VLpZBNPM=;
 b=HVrtxxmTvgtIqZSGrWIqkaWyAV+H27ug9KDagA1hAAmjrdaakHem4kTRC6UHLvE3yd
 eNb03EKQ++QnIM6XNCBUBcEEE+5EOsyEvIcxoMc5PCGASePs3KTULSFYFrShN0X+AJWO
 qCI5kXRcPxD82rvFbavX4DMwnfzZ214YaYkoi8YoFK93wwWdhSjbxxxYpfntmrxMWKYc
 OFKeE7pRIz1zlYK6ULYTRb3JYCufSY07TAw0yZJrvmpRVAAm2JePJPbi6pOnZihIalPX
 OAWd4BgaoNP+zrgzSIkPGy36QxFBU31CCiit2BG2XSu3xKC0kkGDtIEfcvOzGxEHPgea
 iJfQ==
X-Gm-Message-State: AO0yUKXlEeCxM4cDsT+Qt2n4ZakIJrHYsKW4XQWVjaco+H9ajUEuDgMY
 7xcFavk7WEYLLGiOKHjCKkPmbzPRmCDVqRVyiNYX/awRrUr26CQilunkP0lF0G+GT4btEvdULT9
 Fb0xBKibBhknUd8hj4adEGdLm/5H4k3FOSowMLXMr0eoN5a6Vbg==
X-Received: by 2002:ac8:5846:0:b0:3b8:5f26:e81f with SMTP id
 h6-20020ac85846000000b003b85f26e81fmr17766931qth.26.1678104467250; 
 Mon, 06 Mar 2023 04:07:47 -0800 (PST)
X-Google-Smtp-Source: AK7set+V96PPHCzW88GO7gnogT8Tq/LXjyFpkqulWQDOc7ELP578FLhsQX2W1rCp9GrjRWDk+JnlEg==
X-Received: by 2002:ac8:5846:0:b0:3b8:5f26:e81f with SMTP id
 h6-20020ac85846000000b003b85f26e81fmr17766898qth.26.1678104466945; 
 Mon, 06 Mar 2023 04:07:46 -0800 (PST)
Received: from sgarzare-redhat (host-82-57-51-170.retail.telecomitalia.it.
 [82.57.51.170]) by smtp.gmail.com with ESMTPSA id
 5-20020ac85605000000b003b0766cd169sm7496344qtr.2.2023.03.06.04.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 04:07:46 -0800 (PST)
Date: Mon, 6 Mar 2023 13:07:42 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <avkrasnov@sberdevices.ru>
Subject: Re: [RFC PATCH v2 3/4] virtio/vsock: free skb on data copy failure
Message-ID: <20230306120742.v6ss4w22ku7pe45a@sgarzare-redhat>
References: <a7ab414b-5e41-c7b6-250b-e8401f335859@sberdevices.ru>
 <ef98aad4-f86d-fe60-9a35-792363a78a68@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <ef98aad4-f86d-fe60-9a35-792363a78a68@sberdevices.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Bobby Eshleman <bobby.eshleman@bytedance.com>, kvm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, oxffffaa@gmail.com,
 Eric Dumazet <edumazet@google.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 kernel@sberdevices.ru, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>
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

On Sun, Mar 05, 2023 at 11:08:38PM +0300, Arseniy Krasnov wrote:
>This fixes two things in case when 'memcpy_to_msg()' fails:
>1) Update credit parameters of the socket, like this skbuff was
>   copied to user successfully. This is needed because when skbuff was
>   received it's length was used to update 'rx_bytes', thus when we drop
>   skbuff here, we must account rest of it's data in 'rx_bytes'.
>2) Free skbuff which was removed from socket's queue.
>
>Fixes: 71dc9ec9ac7d ("virtio/vsock: replace virtio_vsock_pkt with sk_buff")
>Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>---
> net/vmw_vsock/virtio_transport_common.c | 6 +++++-
> 1 file changed, 5 insertions(+), 1 deletion(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index 30b0539990ba..ffb1af4f2b52 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -379,8 +379,12 @@ virtio_transport_stream_do_dequeue(struct vsock_sock *vsk,
> 		spin_unlock_bh(&vvs->rx_lock);
>
> 		err = memcpy_to_msg(msg, skb->data, bytes);
>-		if (err)
>+		if (err) {
>+			skb_pull(skb, skb->len);
>+			virtio_transport_dec_rx_pkt(vvs, skb);
>+			consume_skb(skb);

I'm not sure it's the right thing to do, if we fail to copy the content
into the user's buffer, I think we should queue it again.

In fact, before commit 71dc9ec9ac7d ("virtio/vsock: replace
virtio_vsock_pkt with sk_buff"), we used to remove the packet from the
rx_queue, only if memcpy_to_msg() was successful.

Maybe it is better to do as we did before and use skb_peek() at the
beginning of the loop and __skb_unlink() when skb->len == 0.

Thanks,
Stefano

> 			goto out;
>+		}
>
> 		spin_lock_bh(&vvs->rx_lock);
>
>-- 
>2.25.1
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
