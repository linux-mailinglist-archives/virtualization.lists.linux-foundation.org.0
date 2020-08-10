Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 49175240632
	for <lists.virtualization@lfdr.de>; Mon, 10 Aug 2020 14:51:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4C4F86935;
	Mon, 10 Aug 2020 12:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIZy441-Mhxe; Mon, 10 Aug 2020 12:51:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 82CA18679B;
	Mon, 10 Aug 2020 12:51:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40F09C004D;
	Mon, 10 Aug 2020 12:51:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12DA2C004D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0C71788146
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:51:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WaLaoyHqBdX9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:51:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6FF0088091
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 12:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597063881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WbCRipNDdE2rdGG8Ew5oYAs5hi/QBu0fk1zdZZ69+Ag=;
 b=Jp2Cfw0zfjpG0fmiiScJfPPFtBAM9L1uaBn8bO+zSVZUKFFJN2oZKOpcNOrXYp0r6s+o2H
 eIRw1Uob8hSaUVsykwULMK37xKOIJDhm3a95KKOh2ZZtFlEHxGCRsgLNl0ph0j9Q3awmn/
 mMz3cpRvUxp4vIA4lX9azXA1lxxpApo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-Jc5KwJt3Maizn9p1qbTy1A-1; Mon, 10 Aug 2020 08:51:19 -0400
X-MC-Unique: Jc5KwJt3Maizn9p1qbTy1A-1
Received: by mail-wm1-f69.google.com with SMTP id v8so2750950wma.6
 for <virtualization@lists.linux-foundation.org>;
 Mon, 10 Aug 2020 05:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WbCRipNDdE2rdGG8Ew5oYAs5hi/QBu0fk1zdZZ69+Ag=;
 b=ajhNmBUfLkHuSx473AkT9/vRsdfkjCAd3I9RBHgDtg4sP/0oftSAi6AvRd/DP0iVEK
 cHLZuF87DrAC1F3dCHKQDHyyP3bSAjftvipqoN/YM/C0joeWqrAqqegwwfJaHVpSXQ8i
 Fldjsemj/PAL5J867aRrk9KGEzboSRJPJBvYg2rri0BmtGVWeeks2ulWtxJLfx7OKzro
 l44aEPP6IYTZyduFHN8rf2PrAMJ0GDSamPYRSkcuLn/aQPUV1cCnzIsMuMmnX+U/zJd7
 xCw9+g2FO7LvkQp1C9LpnkvJgYSxfe/ae9mE94kNWXN4+sPoGgXqgtWSbeKCHUJ0gowd
 9v9g==
X-Gm-Message-State: AOAM531WsyVZNR1vIlZSrdN6VtzkM5yr1w/ec9BdpgXUAPWNH+5WZDnL
 5UFJboYLiJFkRiusrJqRwZ7KHgC25aVJoZ7PR0N+LDCtOWV4DFSS/XNMWVtZOQHhhXmlpr/tf6T
 0v1dEkeA7d3eFAFaAkduF0t8BgWranEUW0Ff5fgg0tQ==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr23997550wmc.115.1597063878271; 
 Mon, 10 Aug 2020 05:51:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzy3Dz3dF5JO2RN9WQmfJMP4NbRyiuZeMh6LVQ+I1mdOBPFJ/QmTu8RxjAG9ENsA2zx2Z1Uw==
X-Received: by 2002:a1c:660a:: with SMTP id a10mr23997530wmc.115.1597063878140; 
 Mon, 10 Aug 2020 05:51:18 -0700 (PDT)
Received: from redhat.com (bzq-79-180-0-181.red.bezeqint.net. [79.180.0.181])
 by smtp.gmail.com with ESMTPSA id
 g145sm29537435wmg.23.2020.08.10.05.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2020 05:51:17 -0700 (PDT)
Date: Mon, 10 Aug 2020 08:51:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eli Cohen <eli@mellanox.com>
Subject: Re: [PATCH][next] vdpa/mlx5: fix memory allocation failure checks
Message-ID: <20200810085100-mutt-send-email-mst@kernel.org>
References: <20200806160828.90463-1-colin.king@canonical.com>
 <20200809060347.GA48369@mtl-vdi-166.wap.labs.mlnx>
MIME-Version: 1.0
In-Reply-To: <20200809060347.GA48369@mtl-vdi-166.wap.labs.mlnx>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Parav Pandit <parav@mellanox.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Colin King <colin.king@canonical.com>
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

On Sun, Aug 09, 2020 at 09:03:47AM +0300, Eli Cohen wrote:
> On Thu, Aug 06, 2020 at 05:08:28PM +0100, Colin King wrote:
> Acked by: Eli Cohen <eli@mellanox.com>

That should be Acked-by: (with a dash).

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
