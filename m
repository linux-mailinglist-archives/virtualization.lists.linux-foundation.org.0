Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id CD08B33EB68
	for <lists.virtualization@lfdr.de>; Wed, 17 Mar 2021 09:26:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62D154EDAC;
	Wed, 17 Mar 2021 08:26:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t425mTNNVwao; Wed, 17 Mar 2021 08:26:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id F02DF4EDB0;
	Wed, 17 Mar 2021 08:26:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66C69C0001;
	Wed, 17 Mar 2021 08:26:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 26459C0001
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 08:26:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F28296F69D
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 08:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sXz5HpymJ6Ps
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 08:26:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1C336F4E1
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615969591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EwapMQi0nkg7eVnbf33AM5coVysoOM+HGdcBLVsx95o=;
 b=f/QzM11EGVFDOr1Tc43DKvtcbTyLiMlvmeqvzew7008PcXWVR/UYeHiFysFo6yfqmh8Po5
 X8G35CihJ32ATZQFav1VDOoBq+kzzJ4XAunclTIog8PuuGbF4PNAK9GkBP1vGTmx57DLM9
 4mQjlScJEBqzdPge2h1pWlujCOh9TMY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-lGirqZVDOtSn3fviGB4x7w-1; Wed, 17 Mar 2021 04:26:29 -0400
X-MC-Unique: lGirqZVDOtSn3fviGB4x7w-1
Received: by mail-ej1-f71.google.com with SMTP id gn30so14782294ejc.3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 17 Mar 2021 01:26:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EwapMQi0nkg7eVnbf33AM5coVysoOM+HGdcBLVsx95o=;
 b=QG5RM/Y3DAo2Yp5d3OznS/vSkAb8SL0uqK/sWjqQoyHjJ8VtnLlD4Xl/EWvupJCpev
 Ag+8+C+i1tTxoyXpfHMZfz/LqdtcTgqpOSgBP9LlUyg43W5MeDsIncDsiH55+sbT5PKr
 SpBomWKiA6xbYR32Fp3a86paYE0Z4vXF/8oDbqNR/lC6APWuvS4SNnThgWyY8owIWCV9
 1IMoVmEAuLFbUaP4WSpMEsz92Nczc/cBi6nKmgOBJ4rwYkpkHVh4xmZv7C8xaMvosWUf
 zhEZGqJaFLoXUO/VgIzt0+/bjvpDeRr6kCAquzjC5kvqKpLjyWq12pwyxC4U6yzjhGmY
 JS3g==
X-Gm-Message-State: AOAM530/nHQKHst1HeNY+EXEtIEMy4ajhvAVAPYxYSD2JqNVA8Mbwke4
 Q1SZq2cacpyLKJMWUFTnQoUC5r2p2eSY1RKdP54bNJqJLOPT7yg33UbYdkrllGUprNbbqDgnDd0
 5CQKfQ/1ckdLPQ1aT32JIJI0DSXKylUHZBePE8386Pg==
X-Received: by 2002:a05:6402:34c8:: with SMTP id
 w8mr42273344edc.235.1615969588490; 
 Wed, 17 Mar 2021 01:26:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs2IfIabALxEDPdD531JeAvmlPd3oXH08kwxGnDTWawZHEErYQNxcoHlVJ8xZAWJMW4AVeug==
X-Received: by 2002:a05:6402:34c8:: with SMTP id
 w8mr42273327edc.235.1615969588341; 
 Wed, 17 Mar 2021 01:26:28 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id r19sm11964199edp.52.2021.03.17.01.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 01:26:27 -0700 (PDT)
Date: Wed, 17 Mar 2021 09:26:25 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] vhost: Fix vhost_vq_reset()
Message-ID: <20210317082625.euxknnggg4gv7i5m@steredhat>
References: <20210312140913.788592-1-lvivier@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210312140913.788592-1-lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org
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

On Fri, Mar 12, 2021 at 03:09:13PM +0100, Laurent Vivier wrote:
>vhost_reset_is_le() is vhost_init_is_le(), and in the case of
>cross-endian legacy, vhost_init_is_le() depends on vq->user_be.
>
>vq->user_be is set by vhost_disable_cross_endian().
>
>But in vhost_vq_reset(), we have:
>
>    vhost_reset_is_le(vq);
>    vhost_disable_cross_endian(vq);
>
>And so user_be is used before being set.
>
>To fix that, reverse the lines order as there is no other dependency
>between them.
>
>Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>---
> drivers/vhost/vhost.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
