Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ACF5179E3
	for <lists.virtualization@lfdr.de>; Tue,  3 May 2022 00:21:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D316D416C3;
	Mon,  2 May 2022 22:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z3M4C1E8PYy2; Mon,  2 May 2022 22:21:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 402A9416C5;
	Mon,  2 May 2022 22:21:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A3D9C007E;
	Mon,  2 May 2022 22:21:07 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 198A3C002D
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 22:21:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDA4A60ECA
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 22:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWXJgPQRSBGP
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 22:21:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CF7160EB0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  2 May 2022 22:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651530060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t+pDY+Ex4Ewd/QjNKkxD0rhZSfDGQ+G9GZjOekpOl0o=;
 b=OBJq52eQeITk+/GlTMJS8tuzB4hnjQbih0/GAYxRMX0EExZYffW0wxdGrLP2eYgD7pjjdY
 da2vNN0yiwAYV68lMnTUpYPXOXM28Wa+GtekNT67iupSyG+AWAQKjLJw2DUEerGrhxTKsV
 UZlUHZHAXchVLvyZAEUhgxZsTUoLswU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-q2mPq_2NMZWwjqHR7xuYdg-1; Mon, 02 May 2022 18:20:59 -0400
X-MC-Unique: q2mPq_2NMZWwjqHR7xuYdg-1
Received: by mail-wm1-f71.google.com with SMTP id
 v184-20020a1cacc1000000b00393e492a398so328018wme.5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 02 May 2022 15:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t+pDY+Ex4Ewd/QjNKkxD0rhZSfDGQ+G9GZjOekpOl0o=;
 b=0pe9pgTLjjWOGvomBL1hLiFhliRU20uEYPDUawA2JoXz65VUnfu3pYXV86fU77yF+d
 dBOdOJTtawDJunwsIlg6LbCKG6IvDxkQm8VzXkmdTXgPPQb7BbwMb/IlDc/QMngL4V86
 5vdzyvbU55rvpbgcVgZZ1XZyKS6t60q9vYYAIsHcGNEn8u/U+uCyJ9IdP24rICgRN7RJ
 zjV9HiGQr80p/v3B7vI8KrzEhcr/Pqdf+M2yFoF+SD/yQoCvVH8el9p6boEg3Ld4oBj3
 qi+7isAgApc3dNrfFUVUNHvGVYhqsVXSeXNGWOgc8dbCqMB1KkV7mHQrU7bdFc2+mjTx
 YWVQ==
X-Gm-Message-State: AOAM532vARz6natyCjnxAyNey93PLmevtcC2nvdaLR4SXCmlVsdpdk/E
 duG+SnX6SJVhmTEbpayA1SchHroELEocSOcP/hWyAtTp996odONIN6c9hBpp1Ympa3pw3GJ3FoD
 1HgwMbDvFHAE/1rXB2CrLh8mx2EwLDw892HpTiLgISA==
X-Received: by 2002:a05:600c:4f06:b0:393:ef13:62c5 with SMTP id
 l6-20020a05600c4f0600b00393ef1362c5mr902018wmq.33.1651530057000; 
 Mon, 02 May 2022 15:20:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxuoQW8PNhRMhYZlNoJGzUoUBWE/Jea5rFAz7zLOoPbWOoUwrZafgD8evcGGLl1zeR1+/hnyg==
X-Received: by 2002:a05:600c:4f06:b0:393:ef13:62c5 with SMTP id
 l6-20020a05600c4f0600b00393ef1362c5mr901998wmq.33.1651530056770; 
 Mon, 02 May 2022 15:20:56 -0700 (PDT)
Received: from redhat.com ([2.55.174.117]) by smtp.gmail.com with ESMTPSA id
 w7-20020adf8bc7000000b0020c5253d8f9sm7963822wra.69.2022.05.02.15.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 May 2022 15:20:56 -0700 (PDT)
Date: Mon, 2 May 2022 18:20:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH net-next 0/2] vsock/virtio: add support for device
 suspend/resume
Message-ID: <20220502180554-mutt-send-email-mst@kernel.org>
References: <20220428132241.152679-1-sgarzare@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220428132241.152679-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Vilas R K <vilas.r.k@intel.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S. Miller" <davem@davemloft.net>
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

On Thu, Apr 28, 2022 at 03:22:39PM +0200, Stefano Garzarella wrote:
> Vilas reported that virtio-vsock no longer worked properly after
> suspend/resume (echo mem >/sys/power/state).
> It was impossible to connect to the host and vice versa.
> 
> Indeed, the support has never been implemented.
> 
> This series implement .freeze and .restore callbacks of struct virtio_driver
> to support device suspend/resume.
> 
> The first patch factors our the code to initialize and delete VQs.
> The second patch uses that code to support device suspend/resume.
> 
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> Stefano Garzarella (2):
>   vsock/virtio: factor our the code to initialize and delete VQs
>   vsock/virtio: add support for device suspend/resume
> 
>  net/vmw_vsock/virtio_transport.c | 197 ++++++++++++++++++++-----------
>  1 file changed, 131 insertions(+), 66 deletions(-)
> 
> -- 
> 2.35.1

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
