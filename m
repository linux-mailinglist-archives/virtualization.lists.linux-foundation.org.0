Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9263E23DF
	for <lists.virtualization@lfdr.de>; Fri,  6 Aug 2021 09:20:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA91D83759;
	Fri,  6 Aug 2021 07:20:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LmuB_D5EVxrA; Fri,  6 Aug 2021 07:20:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 521AE8378A;
	Fri,  6 Aug 2021 07:20:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D4079C000E;
	Fri,  6 Aug 2021 07:20:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD626C000E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 07:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5D764014E
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 07:20:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsiRGsTruhI6
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 07:20:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D220340124
 for <virtualization@lists.linux-foundation.org>;
 Fri,  6 Aug 2021 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628234429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HTm9fbXgLtcZGdGW/3I21kvZ1VGYI5U7k0mhmEpEDg0=;
 b=FSTa0CY5QWVMGSAhJkJC7vjnuHrBQCQfqwkY3HEfrr+B3P9NL1ZZzdAfJtB+3FwPXwV1nx
 2WS96G0N6qoKpi1YBaXeve/LdBjuzFszM7dgnpn9eUQH9IyYQFj5DsxiApY/6bHmjiEmYU
 bWdDXK9GSg1mp+a/TUA8U1aSU2vMsns=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-JYemRZ9aPumgz91Q77IW1w-1; Fri, 06 Aug 2021 03:20:28 -0400
X-MC-Unique: JYemRZ9aPumgz91Q77IW1w-1
Received: by mail-ej1-f71.google.com with SMTP id
 g19-20020a1709065953b02905a4506b6d92so2869177ejr.7
 for <virtualization@lists.linux-foundation.org>;
 Fri, 06 Aug 2021 00:20:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HTm9fbXgLtcZGdGW/3I21kvZ1VGYI5U7k0mhmEpEDg0=;
 b=dOeoJ6DU93AI8xQnNCuKbrnPvziBGBZi5hx7/K225s5/Os6wCXrH9kBoM38oQxxdaY
 087ugTj20IB3j6NFdfwC8jJ1hy7bCqwILLBsNE5+JmuJEMFFqC2yJfnCX20uNh9nICNc
 UxK4cwJ7urBRcEK1QV003XTLJIyT0dk2FWEu+LaJq/FSCrGmJ5aNAun/WBW3+nKoEWqn
 MB5tCOMJjEvzlmdzx+mGucBasPETt+aC+BmNzxtwOxkNPblGvOvzMjhFhLeFtxOxJ/fH
 e+WpRw8ua78TxqUl48xawOZHnF5nWOAhH4fzpf0s0RgmvVI3+bCkv8EARCspnKSXu3vN
 H/ng==
X-Gm-Message-State: AOAM533ujGezJJsS2Nz7onLgFxpHrB8vtYUXGRlR3MA6MTCJ0setp2jP
 Wu6b/5R/BVDo+AXjd7Vi7+gb4Uay+Ekyp3qkwv2ZUK1kPP2Goa2qMwpO+y02NGQBxIp+Tu5RHHh
 gRCI3SVlPY2QbRIXcZe8qz0L5HRce/2dJrXUnqOac3g==
X-Received: by 2002:a05:6402:361:: with SMTP id
 s1mr11209649edw.172.1628234427597; 
 Fri, 06 Aug 2021 00:20:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyuVKndM6vRqX10g0DMF+zN0NMme5c3sOtXbrtFonOTm7kn0n+W/NJwkU2ojVAcnd/691RvGg==
X-Received: by 2002:a05:6402:361:: with SMTP id
 s1mr11209627edw.172.1628234427450; 
 Fri, 06 Aug 2021 00:20:27 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id p16sm3396595eds.73.2021.08.06.00.20.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 00:20:27 -0700 (PDT)
Date: Fri, 6 Aug 2021 09:20:24 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Arseny Krasnov <arseny.krasnov@kaspersky.com>
Subject: Re: [RFC PATCH v1 2/7] vsock: rename implementation from 'record' to
 'message'
Message-ID: <20210806072024.ejp2d5sgfatga6oz@steredhat>
References: <20210726163137.2589102-1-arseny.krasnov@kaspersky.com>
 <20210726163328.2589649-1-arseny.krasnov@kaspersky.com>
MIME-Version: 1.0
In-Reply-To: <20210726163328.2589649-1-arseny.krasnov@kaspersky.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Andra Paraschiv <andraprs@amazon.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
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

On Mon, Jul 26, 2021 at 07:33:25PM +0300, Arseny Krasnov wrote:
>As 'record' is not same as 'message', rename current variables,
>comments and defines from 'record' concept to 'message'.
>
>Signed-off-by: Arseny Krasnov <arseny.krasnov@kaspersky.com>
>---
> drivers/vhost/vsock.c                   | 18 +++++++++---------
> net/vmw_vsock/virtio_transport_common.c | 14 +++++++-------
> 2 files changed, 16 insertions(+), 16 deletions(-)


This patch is fine, I think you can move here the renaming of the flag 
too.

Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
