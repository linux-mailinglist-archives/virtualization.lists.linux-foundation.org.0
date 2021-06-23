Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id E56293B1E5E
	for <lists.virtualization@lfdr.de>; Wed, 23 Jun 2021 18:10:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643478333E;
	Wed, 23 Jun 2021 16:10:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1Zo0GvNB6zr; Wed, 23 Jun 2021 16:10:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 38E5283B3A;
	Wed, 23 Jun 2021 16:10:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6BC7C000E;
	Wed, 23 Jun 2021 16:10:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D2D9C000E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B77440647
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:10:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmlcQY1I3Jku
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:10:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0833E4063A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 16:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624464623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Rnf1xld2zG7ITor+H4pye+Ce8VDHDjjS7DCz0019lgk=;
 b=gn65iu8+hkJrEqCueKFP+gHGw1VjJMLOgogF4kN9AHIa5EYtvJ+gs9p0nyy6tgmYju46Bm
 CkQGvS1K5DyrRUZybOE3L8qOeD4bciMWNReVOxBqk7QGLhSeQ9ESG+Gz8Fe0ul6zf12xSl
 VAV0DYFavOS4NkrElZOLS272vCAFHAM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-7Y0OXuiDNfmwcGa1uKjrrA-1; Wed, 23 Jun 2021 12:10:23 -0400
X-MC-Unique: 7Y0OXuiDNfmwcGa1uKjrrA-1
Received: by mail-ed1-f70.google.com with SMTP id
 y18-20020a0564022712b029038ffac1995eso1597540edd.12
 for <virtualization@lists.linux-foundation.org>;
 Wed, 23 Jun 2021 09:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Rnf1xld2zG7ITor+H4pye+Ce8VDHDjjS7DCz0019lgk=;
 b=a+LrUjlI0pSz3nhgStvfneU9oITs8vldpC13ZND9gYrzjYH5gQBDI3dI4U/DCM/qBm
 ZfD4i6/bX0tCoK5W/oyl+Dm1p9lhU19+YlUoaYle/2NGVwQLxkOlS13wXinxfqxxHQ/l
 hoBlE/Do8M1d/wnBSwaLoUfUzLFZZQYSY/j2qHLAflS17pXzYW+0McU90yjTUoyj5wsM
 cURreKZZ4PQd/7qqAyb48b1qhRgFS2NXFT3vyR/r8v35xr0Gl8pNaW9X5w5QYvZoIydT
 JuJBX2p/8uzEXJ09oJXVpKymfTziPPqJD8WJuTiDAGODrE4IdKtNHWgR19RvcJMR5xxW
 EiEw==
X-Gm-Message-State: AOAM530vjsOW5Gbegrkgk+RIS7xiCHuScavQBkTR09t6nqjsOkQRKlky
 9hqhlABciypHWBj5eXSnIeDfyeJDiti7MlQZhfH7KD9x5Ixg0m1S+WqY1bP60my53sgknjfG8/1
 PSGVVeLvSzDaJb3AFmONnr7smAlsPIxDPJbHUvDoVew==
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr840280ejk.30.1624464618606; 
 Wed, 23 Jun 2021 09:10:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1pKANbb6hP+TU5DFw0ClGZrpYkWFi0a2by+iDKCeEPzurXLgBC+9knH9a6wa4g8T3K5CnSw==
X-Received: by 2002:a17:906:5049:: with SMTP id e9mr840077ejk.30.1624464616406; 
 Wed, 23 Jun 2021 09:10:16 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id x21sm260208edv.97.2021.06.23.09.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 09:10:15 -0700 (PDT)
Date: Wed, 23 Jun 2021 18:10:13 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Neeraj Upadhyay <neeraju@codeaurora.org>
Subject: Re: [PATCH] vringh: Use wiov->used to check for read/write desc order
Message-ID: <20210623161013.qg3azanyxt7nucgl@steredhat>
References: <1624361873-6097-1-git-send-email-neeraju@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <1624361873-6097-1-git-send-email-neeraju@codeaurora.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, mst@redhat.com
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

On Tue, Jun 22, 2021 at 05:07:53PM +0530, Neeraj Upadhyay wrote:
>As iov->used is incremented when descriptors are processed
>in __vringh_iov(), use it to check for incorrect read
>and write descriptor order.
>
>Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
>---
> drivers/vhost/vringh.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/drivers/vhost/vringh.c b/drivers/vhost/vringh.c
>index 4af8fa2..14e2043 100644
>--- a/drivers/vhost/vringh.c
>+++ b/drivers/vhost/vringh.c
>@@ -359,7 +359,7 @@ __vringh_iov(struct vringh *vrh, u16 i,
> 			iov = wiov;
> 		else {
> 			iov = riov;
>-			if (unlikely(wiov && wiov->i)) {
>+			if (unlikely(wiov && wiov->used)) {
> 				vringh_bad("Readable desc %p after writable",
> 					   &descs[i]);
> 				err = -EINVAL;
>-- 
>QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>hosted by The Linux Foundation
>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
