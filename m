Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E525533914C
	for <lists.virtualization@lfdr.de>; Fri, 12 Mar 2021 16:31:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 548CF8454B;
	Fri, 12 Mar 2021 15:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRdtbUBaVBEo; Fri, 12 Mar 2021 15:31:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E0F68453A;
	Fri, 12 Mar 2021 15:31:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAA8AC0001;
	Fri, 12 Mar 2021 15:31:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D46CC0001
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 15:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C1696FADC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 15:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8M-bKrB0InC
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 15:31:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7FAC26FA35
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 15:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615563084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dqP8/iSv8z7OYLNatC6uWrHlEt8bV6+WSEJM+AzQzGQ=;
 b=Uf071jnTwDK9Nl0Nor6TmOiMDdDceuXVAsZ4cvj0QPM0qqGlvN/cM7AnhoPtIHiwpxuYRR
 63KXwUfIBxCyaqSGnUOXhFTtoCoH7jI3ZEjjdqL0ZMs7TSwiq8Vz/ksXxWpckVmzBfO0vI
 Dd40Xftp2HUkaCMt6J4T15d6ForTNVg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-iU70ikRFMiW6nzWv0XV0bw-1; Fri, 12 Mar 2021 10:31:20 -0500
X-MC-Unique: iU70ikRFMiW6nzWv0XV0bw-1
Received: by mail-wm1-f69.google.com with SMTP id a3so2176270wmm.0
 for <virtualization@lists.linux-foundation.org>;
 Fri, 12 Mar 2021 07:31:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dqP8/iSv8z7OYLNatC6uWrHlEt8bV6+WSEJM+AzQzGQ=;
 b=SUvayRhI7NWKaGtxf74LSqcFrPC77TNTxovlBwPCQQb7gCIu+c5D3NbbB1zVyUoEtF
 zuDiqJ00H9m+zJCnQOqHXdeNoearpMk5gIWpB3jXr0/mmJJdlVYeH6ESYO7hvyNdl5Q0
 rgUphtISKhqZS+lOksPDNNvcGRNjFMK6gHtzZXMqNJf2a5NPUGBujRzPemHQaRs7e+Gj
 oW8JqCDY9CLCO1SapDagX156Rb4+goSWw4lv5HUybfEqbhgijZbyoG8Q1e1rBovyYK+e
 VxBmDmfy2UEAlbKKbutHxFbxFB5WKYlgN3T41AjQpZHA+sMhYe8jyJiiMeqNnjeojHEw
 3xMA==
X-Gm-Message-State: AOAM532heLU1N9TAEXrwQIsWcj2ytyEiJ6bZLswoUBgV2t29Rlm1s6UM
 UiQV1aoGtnUdn62OPODs5SvPm0tQCOcjphV2BXcmWRRHTk0EzrSgbuyUu2jeCFlve0jSQEtzA5J
 bB5cVhh3RtJGDLnGgnXayHH/OxXJFewIvwZdaqShFkA==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr13968827wmq.73.1615563079596; 
 Fri, 12 Mar 2021 07:31:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsigtJAKBTjGiEoVSbW5etqcx7WQtQts6oCyXsi10ljlCxqfwYO6rEoSzUUEkOfAk+AuCklA==
X-Received: by 2002:a05:600c:198d:: with SMTP id
 t13mr13968802wmq.73.1615563079413; 
 Fri, 12 Mar 2021 07:31:19 -0800 (PST)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id p6sm8096595wru.2.2021.03.12.07.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 07:31:19 -0800 (PST)
Date: Fri, 12 Mar 2021 16:31:16 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v6 09/22] virtio/vsock: set packet's type in
 virtio_transport_send_pkt_info()
Message-ID: <20210312153116.ot7g4dcb2aidwne4@steredhat>
References: <20210307175722.3464068-1-arseny.krasnov@kaspersky.com>
 <20210307180125.3465547-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210307180125.3465547-1-arseny.krasnov@kaspersky.com>
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

On Sun, Mar 07, 2021 at 09:01:22PM +0300, Arseny Krasnov wrote:
>This moves passing type of packet from 'info' structure to  'virtio_
>transport_send_pkt_info()' function. There is no need to set type of
>packet which differs from type of socket. Since at current time only
>stream type is supported, set it directly in 'virtio_transport_send_
>pkt_info()', so callers don't need to set it.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> net/vmw_vsock/virtio_transport_common.c | 19 +++++--------------
> 1 file changed, 5 insertions(+), 14 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
