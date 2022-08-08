Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DA58C67F
	for <lists.virtualization@lfdr.de>; Mon,  8 Aug 2022 12:34:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D85281A15;
	Mon,  8 Aug 2022 10:34:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D85281A15
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEpMmpww
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O80RO1MQvUso; Mon,  8 Aug 2022 10:34:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id DF6FB8195C;
	Mon,  8 Aug 2022 10:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF6FB8195C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1022AC007B;
	Mon,  8 Aug 2022 10:34:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30903C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 10:34:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04782409EA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 10:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04782409EA
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=iEpMmpww
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WnUQiOXf4g_i
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 10:34:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1294086B
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC1294086B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Aug 2022 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659954843;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S0oiLh71RSIVoaGi+EfAcjkjFhoW+EB960Go0IldyoM=;
 b=iEpMmpww3xTIrCfbcwS+xbvFCBVd4i/Bmeyo8QGxA/hLWrWC33V8JN+1hrf3zQTWpFleeJ
 zlM+mOHgY+DH7YgA3G3TeZONvOMDkgg2wh6gGIOK7k91vSnwQFClF34wyAv/ZcFULbb3Qc
 tnMa8GSgnbFhFtRyOKyGCLKNJaPmrqQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-499-cAv8mwh9Oo6lZdqTO3m93Q-1; Mon, 08 Aug 2022 06:34:02 -0400
X-MC-Unique: cAv8mwh9Oo6lZdqTO3m93Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 u15-20020a05620a0c4f00b006b8b3f41303so7512272qki.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Aug 2022 03:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=S0oiLh71RSIVoaGi+EfAcjkjFhoW+EB960Go0IldyoM=;
 b=m2SbXce8Us/PIOm4Rh9ZxiGJl2W35jLvYic5krZZQg0aQEfj+ygaetbmaBllQv4pxZ
 Ig6S8WLD0azVDIU+pHhGTLsgbzw+q8g0gDvaMByD4mD9aScX2YRL+IsgChCvaIuwHM2x
 Qw0u9SMKU3umTGd/2iAz8U4JDPZfGVdK64JXGfrPvt4oaO+1RVl8hSOQdihFEB5Ool/k
 5hdS/wOH7gt+6SSzFQ2LIRLSayXcbfkJf6HWJzJSN4Rj3BkcJSgo14ey0FtjtnUbyOGU
 W0VJGFEiAlxihvvqp4u4odsRh2qUEFNjMucbfLP3KrilO3EZtf33z0bFX0fLgAsaAyeD
 M0JA==
X-Gm-Message-State: ACgBeo2uistxLkHY/lERCCFZ0dZJ4E4ECWkYmFo3X+l5oDrG8lPqSf8S
 8LrHLTF7O8r2Y9Q9GaJDwF88iL4DZVWTZSVtGXkaiH9aionOzReDYpO4iA+EbDtx/ECvTg6gh9R
 GgXBcLCyTAt4UggO86NxGVsWWWdbb9IyLB95tAWbeXA==
X-Received: by 2002:ad4:596a:0:b0:476:7e0d:814d with SMTP id
 eq10-20020ad4596a000000b004767e0d814dmr14913653qvb.54.1659954842073; 
 Mon, 08 Aug 2022 03:34:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5n5s+A4rSh6Kwr7qIkkTbJpQvidZHOgXQA0zDG1SXTSXmxFoSSj6EjiuYLIzJ7H46F5+fW3w==
X-Received: by 2002:ad4:596a:0:b0:476:7e0d:814d with SMTP id
 eq10-20020ad4596a000000b004767e0d814dmr14913632qvb.54.1659954841872; 
 Mon, 08 Aug 2022 03:34:01 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-178.retail.telecomitalia.it.
 [79.46.200.178]) by smtp.gmail.com with ESMTPSA id
 bs30-20020a05620a471e00b006b9122642f5sm7589418qkb.75.2022.08.08.03.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 03:34:01 -0700 (PDT)
Date: Mon, 8 Aug 2022 12:33:51 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Subject: Re: [RFC PATCH v3 3/9] virtio/vsock: use 'target' in notify_poll_in
 callback
Message-ID: <20220808103351.gebdfctorobvbrow@sgarzare-redhat>
References: <2ac35e2c-26a8-6f6d-2236-c4692600db9e@sberdevices.ru>
 <a6844149-6ffc-09a6-b858-f24a27264c83@sberdevices.ru>
MIME-Version: 1.0
In-Reply-To: <a6844149-6ffc-09a6-b858-f24a27264c83@sberdevices.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Vishnu Dasa <vdasa@vmware.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 "sthemmin@microsoft.com" <sthemmin@microsoft.com>,
 Krasnov Arseniy <oxffffaa@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 Dexuan Cui <decui@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, Bryan Tan <bryantan@vmware.com>,
 "edumazet@google.com" <edumazet@google.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>, kernel <kernel@sberdevices.ru>,
 Jakub Kicinski <kuba@kernel.org>, "David S. Miller" <davem@davemloft.net>
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

On Wed, Aug 03, 2022 at 01:55:36PM +0000, Arseniy Krasnov wrote:
>This callback controls setting of POLLIN,POLLRDNORM output bits of poll()
>syscall,but in some cases,it is incorrectly to set it, when socket has
>at least 1 bytes of available data. Use 'target' which is already exists
>and equal to sk_rcvlowat in this case.

Little suggestion:
We should update the commit description, since so far 'target' is not 
equal to sk_rcvlowat.

With that fixed (and adding some spaces after the commas):

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>Signed-off-by: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
>---
> net/vmw_vsock/virtio_transport_common.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/net/vmw_vsock/virtio_transport_common.c b/net/vmw_vsock/virtio_transport_common.c
>index ec2c2afbf0d0..8f6356ebcdd1 100644
>--- a/net/vmw_vsock/virtio_transport_common.c
>+++ b/net/vmw_vsock/virtio_transport_common.c
>@@ -634,10 +634,7 @@ virtio_transport_notify_poll_in(struct vsock_sock *vsk,
> 				size_t target,
> 				bool *data_ready_now)
> {
>-	if (vsock_stream_has_data(vsk))
>-		*data_ready_now = true;
>-	else
>-		*data_ready_now = false;
>+	*data_ready_now = vsock_stream_has_data(vsk) >= target;
>
> 	return 0;
> }
>-- 
>2.25.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
