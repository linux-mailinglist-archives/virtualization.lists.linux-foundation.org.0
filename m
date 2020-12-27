Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F232E30A0
	for <lists.virtualization@lfdr.de>; Sun, 27 Dec 2020 10:40:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3AF49204DE;
	Sun, 27 Dec 2020 09:40:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M+NiRGDcbTEN; Sun, 27 Dec 2020 09:40:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 709DF204DA;
	Sun, 27 Dec 2020 09:40:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5AAD1C0891;
	Sun, 27 Dec 2020 09:40:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 46777C0891
 for <virtualization@lists.linux-foundation.org>;
 Sun, 27 Dec 2020 09:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 35ED286FC5
 for <virtualization@lists.linux-foundation.org>;
 Sun, 27 Dec 2020 09:40:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lZfqthOSQv2r
 for <virtualization@lists.linux-foundation.org>;
 Sun, 27 Dec 2020 09:40:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E5E9886FC3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 27 Dec 2020 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609062024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ba+iHfK0bJtNwDKtVlH80Ke13TbgM723LjJZBC9s0JU=;
 b=NR/m0dQaRouQFBDKKFzF0lCQMAIre5uibWHWS507zwuQo9POa8RBy3Pesrf+08JbCe6fDk
 56hz+9NkUDZ79m8vwUI3V9uyn42NhVhzGyZ+PJy5cMdc7FfopXNzDasACbmV6EXJf5reCd
 GlOFI8Kz7wLn2XeFjjF+hcvjsDcA+sw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-eyHe99DeMXSFOx24sOOgTA-1; Sun, 27 Dec 2020 04:40:22 -0500
X-MC-Unique: eyHe99DeMXSFOx24sOOgTA-1
Received: by mail-wr1-f72.google.com with SMTP id g16so4977901wrv.1
 for <virtualization@lists.linux-foundation.org>;
 Sun, 27 Dec 2020 01:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ba+iHfK0bJtNwDKtVlH80Ke13TbgM723LjJZBC9s0JU=;
 b=W1bm+QuKlGfq7rqQ1Kt10bwCcCM7NPD8Rd9v+ky6/UB8oIBMj94K243/PL/KaLtffd
 isq787ReTwqaEzD2lnD+2jxlJlzs0Pkvy3qaIxHx4lIJupGtnKRv1V6ig1cKVZikdzIc
 NSuPvZXmF972zwKj9QiJ38lhHDbC9sSC4/6JfE3PkWSXEDoUW7GqKO8AH1naaB0ntII1
 atuuNMWuBy0KVSYG9XNMB896amitKRprDDZpWAUk7AbWPV3ps4D15vWrWedOMHB76rwH
 apfuXoy6tm79t2pSEK0ECX9gUsqhcU66VrKYsP+2MSJX4NzpPvQ2Blzps3XSU6TgynhP
 B3Tg==
X-Gm-Message-State: AOAM531WqX/DTLWi6veV94/tFQzaeW/IqeWR/3UGA8vG1BmyPgOAE8yF
 HE4UcoE+13Rpq0IN2XyTSS62BIOSHuTx2cTClXsYJ1aA/sxQpI8f47LNh+yrUd09Aj+zKpFJTng
 cAfk5f9AJu5nOdaf6zuz4jeZAuirkf9fhwjOoQcfmRQ==
X-Received: by 2002:a1c:204e:: with SMTP id g75mr15980190wmg.100.1609062021402; 
 Sun, 27 Dec 2020 01:40:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn868LZXUswFzyOxoPt97OHLb1MgVvijGp9IAQ57ejvsHPsC2xdjBSXRQPWvCCGJfMwTu/Cg==
X-Received: by 2002:a1c:204e:: with SMTP id g75mr15980178wmg.100.1609062021283; 
 Sun, 27 Dec 2020 01:40:21 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id o83sm14758474wme.21.2020.12.27.01.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Dec 2020 01:40:20 -0800 (PST)
Date: Sun, 27 Dec 2020 04:40:17 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: wangyunjian <wangyunjian@huawei.com>
Subject: Re: [PATCH net v2] tun: fix return value when the number of iovs
 exceeds MAX_SKB_FRAGS
Message-ID: <20201227044010-mutt-send-email-mst@kernel.org>
References: <1608864736-24332-1-git-send-email-wangyunjian@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1608864736-24332-1-git-send-email-wangyunjian@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: willemdebruijn.kernel@gmail.com, netdev@vger.kernel.org,
 jerry.lilijun@huawei.com, virtualization@lists.linux-foundation.org,
 xudingke@huawei.com, brian.huangbin@huawei.com, chenchanghu@huawei.com
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

On Fri, Dec 25, 2020 at 10:52:16AM +0800, wangyunjian wrote:
> From: Yunjian Wang <wangyunjian@huawei.com>
> 
> Currently the tun_napi_alloc_frags() function returns -ENOMEM when the
> number of iovs exceeds MAX_SKB_FRAGS + 1. However this is inappropriate,
> we should use -EMSGSIZE instead of -ENOMEM.
> 
> The following distinctions are matters:
> 1. the caller need to drop the bad packet when -EMSGSIZE is returned,
>    which means meeting a persistent failure.
> 2. the caller can try again when -ENOMEM is returned, which means
>    meeting a transient failure.
> 
> Fixes: 90e33d459407 ("tun: enable napi_gro_frags() for TUN/TAP driver")
> Signed-off-by: Yunjian Wang <wangyunjian@huawei.com>
> Acked-by: Willem de Bruijn <willemb@google.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> v2:
>   * update commit log suggested by Willem de Bruijn
> ---
>  drivers/net/tun.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/tun.c b/drivers/net/tun.c
> index 2dc1988a8973..15c6dd7fb04c 100644
> --- a/drivers/net/tun.c
> +++ b/drivers/net/tun.c
> @@ -1365,7 +1365,7 @@ static struct sk_buff *tun_napi_alloc_frags(struct tun_file *tfile,
>  	int i;
>  
>  	if (it->nr_segs > MAX_SKB_FRAGS + 1)
> -		return ERR_PTR(-ENOMEM);
> +		return ERR_PTR(-EMSGSIZE);
>  
>  	local_bh_disable();
>  	skb = napi_get_frags(&tfile->napi);
> -- 
> 2.23.0

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
