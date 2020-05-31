Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83D1E968A
	for <lists.virtualization@lfdr.de>; Sun, 31 May 2020 11:22:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A407D2039D;
	Sun, 31 May 2020 09:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WswWpTkStImB; Sun, 31 May 2020 09:21:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE2532036B;
	Sun, 31 May 2020 09:21:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97DE5C0863;
	Sun, 31 May 2020 09:21:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E17DC0176
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 44756880B3
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:21:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQWvyRQXoeMZ
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:21:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 6F76C88084
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 09:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590916915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ywTf4qZlZwxY3+4hdzNIdEQ5uHrIZLnoqwJn0ChNVtk=;
 b=PCwsA+xG8WKxm8E64o6JLhiCH5qqMmi4ft1HxNicoJI75RdxTZTpSBlv3LGdZLRSSPlw2d
 7yABzbDVZ6tku9AcHde7k1ffxekQ1pDb7BOVo3RQ2QnFoPbXUH/11DE+ClvU9ZNwz6IBz7
 jvLsE5ohO5sG3XNy+/4og8Av1f87Rxg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-x2X9-93uNDShJvFqppPnhg-1; Sun, 31 May 2020 05:21:53 -0400
X-MC-Unique: x2X9-93uNDShJvFqppPnhg-1
Received: by mail-wr1-f70.google.com with SMTP id w4so3261824wrl.13
 for <virtualization@lists.linux-foundation.org>;
 Sun, 31 May 2020 02:21:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ywTf4qZlZwxY3+4hdzNIdEQ5uHrIZLnoqwJn0ChNVtk=;
 b=FrjunJDiI7CjuDBcNfPlS/v8tSY863/QeieR21oKp3VocHTZ+32aXaKtPXKmJfIi5v
 qJXti60evaUv6viQam7LvcKAp9AmJk3NAuL3ITakIgaEKMfjYKV0LDbI0xr5x0lLtPp9
 k7mkKa9jcMe5DTJiRYE8hKT19YjVwmvoUVlJ9XQ/Thop8oLR/zrPQoAiST3PDeQyabt3
 dAtGIu9hzmAJzaFe8pEmyIZbGO7zusMWomlgCOD0/ImtYk402M45KvPVvSv6aGsR/jTq
 VA9BP/JhMYzxSj2mMkS0Asyj1UOfFeXxRvMERYqtvXwurYeqj6ki494/wO9NE0o3SVJW
 F3Lw==
X-Gm-Message-State: AOAM533/bV5QvF4mwiTJAU4QgOYOIHocLFmxMNeY+W7JrOtopYpfsZEp
 L1TV2DmWcvDE3iGDagkQGTr/9qBFP4QRD1DMJogYPFEYFC7apZ2pZjd1p9xs5CVSz4lq8ObKDp+
 WurrN8PD37DUMPO9JX0xS5SypydPm6tH+dTzHw4pSvg==
X-Received: by 2002:a1c:230a:: with SMTP id j10mr16369536wmj.124.1590916911669; 
 Sun, 31 May 2020 02:21:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzcgV6CUih1OZuVP6HyzHPhx3Qo76tys5xO9OetvdQfwhqn22ihHvFUhLx7Ow9OvlukxlV9g==
X-Received: by 2002:a1c:230a:: with SMTP id j10mr16369518wmj.124.1590916911412; 
 Sun, 31 May 2020 02:21:51 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 23sm7468291wmo.18.2020.05.31.02.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 02:21:50 -0700 (PDT)
Date: Sun, 31 May 2020 05:21:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH v2 2/2] crypto: virtio: Fix use-after-free in
 virtio_crypto_skcipher_finalize_req()
Message-ID: <20200531052126-mutt-send-email-mst@kernel.org>
References: <20200526031956.1897-3-longpeng2@huawei.com>
 <20200526141138.8410D207FB@mail.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200526141138.8410D207FB@mail.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Markus Elfring <Markus.Elfring@web.de>, linux-crypto@vger.kernel.org,
 "Longpeng\(Mike\)" <longpeng2@huawei.com>,
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

On Tue, May 26, 2020 at 02:11:37PM +0000, Sasha Levin wrote:
> <20200123101000.GB24255@Red>
> References: <20200526031956.1897-3-longpeng2@huawei.com>
> <20200123101000.GB24255@Red>
> 
> Hi
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a "Fixes:" tag
> fixing commit: dbaf0624ffa5 ("crypto: add virtio-crypto driver").
> 
> The bot has tested the following trees: v5.6.14, v5.4.42, v4.19.124, v4.14.181.
> 
> v5.6.14: Build OK!
> v5.4.42: Failed to apply! Possible dependencies:
>     eee1d6fca0a0 ("crypto: virtio - switch to skcipher API")
> 
> v4.19.124: Failed to apply! Possible dependencies:
>     eee1d6fca0a0 ("crypto: virtio - switch to skcipher API")
> 
> v4.14.181: Failed to apply! Possible dependencies:
>     500e6807ce93 ("crypto: virtio - implement missing support for output IVs")
>     67189375bb3a ("crypto: virtio - convert to new crypto engine API")
>     d0d859bb87ac ("crypto: virtio - Register an algo only if it's supported")
>     e02b8b43f55a ("crypto: virtio - pr_err() strings should end with newlines")
>     eee1d6fca0a0 ("crypto: virtio - switch to skcipher API")
> 
> 
> NOTE: The patch will not be queued to stable trees until it is upstream.
> 
> How should we proceed with this patch?

Mike could you comment on backporting?

> -- 
> Thanks
> Sasha

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
