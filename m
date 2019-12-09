Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 066DD1175F9
	for <lists.virtualization@lfdr.de>; Mon,  9 Dec 2019 20:34:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8C55A87814;
	Mon,  9 Dec 2019 19:34:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f64jeb8zQHkF; Mon,  9 Dec 2019 19:34:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id A90868780F;
	Mon,  9 Dec 2019 19:34:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81284C0881;
	Mon,  9 Dec 2019 19:34:46 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B9659C0881
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 19:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id A720E20794
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 19:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iZrEjOBQVQnv
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 19:34:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id B90A42038B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  9 Dec 2019 19:34:43 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id x3so13225038oto.11
 for <virtualization@lists.linux-foundation.org>;
 Mon, 09 Dec 2019 11:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=PFE1nWxTiyfBRgn/J6q9Y8I6dNPJrpPO2zwkS+e8TbI=;
 b=l57bR7j5YoTdsraECl+v5XCXZ2L9yCiOQaei6qnxTgzBKu6DHPdEP2L91+oIkroRMl
 dBW16Yn7M2d5zqpGrKHHu9zqC1Iwdbrm/Bior7UUkbmS7Dzt7c2vA1rIVGXy7w1Xq7jI
 7cTqZ73LSKdFPLYOPe9dsTyCkkvaHQTmaqpczWxscNNewc8+95w6VQ25TW+OJnEExH9R
 TrA/R3/6pFOehNsWxcSaOGZ1Crp1aSlN3xuRW9HZitoMTe6QRU4p/4G7m3uVAmI3K8+1
 St0Rh2zNQH94IiQoZhUthkIOMFEG13Y9CSu0Mg3X/4ibfQ9xRUJCsmdzpZFts0nuLUJE
 Je0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=PFE1nWxTiyfBRgn/J6q9Y8I6dNPJrpPO2zwkS+e8TbI=;
 b=JfGG5ofdZnxO3Xv1bCoVHv/h69LlU0qnCzZ7rcccLri2xeM8X67SHMJ6hlJLz1HA2z
 5xN6EEUge2YMD4JjdiAQw1Ndjn1+HZ1To74Vg74OAau8rCZoOCt39sd96meRFaIAkw3F
 lHxSRqI3ZU2LGG22k+bRTzhxEJDSex2cHVIhIu1jc+MP2NoSn0ANybRjo/QVwxGKZ9od
 Yb5cFE/2ysAnCVMH0GSrSBkdPd4/G+H0izPMFO8xfYXpNh1VMcu39bVB+u88J+ffoSi2
 5/Vzo+TJSSSrkNa6xmOF6ZhGGiSErGNEN3qK3NYwe6O4w1cKWryhS7Otewln8gLc431O
 ROeA==
X-Gm-Message-State: APjAAAVNIIVYLvsLpkOUxLeJIMXHrG9TGKwTE5WC0zd6+NgW+887fipN
 QWpzHw31pRpZMh0VuxdBLIA=
X-Google-Smtp-Source: APXvYqxSnopGKPKS40Fp2UWWVvhccgBBkC3FGIBGVtKql552IcLIhIyHMgbgNBjN89Vl/gf2tP5iZg==
X-Received: by 2002:a9d:6a92:: with SMTP id l18mr23312145otq.37.1575920082851; 
 Mon, 09 Dec 2019 11:34:42 -0800 (PST)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id x16sm296462oto.41.2019.12.09.11.34.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:34:42 -0800 (PST)
Date: Mon, 9 Dec 2019 12:34:40 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next v9 1/3] netdev: pass the stuck queue to the
 timeout handler
Message-ID: <20191209193440.GA15189@ubuntu-m2-xlarge-x86>
References: <20191209162727.10113-1-mst@redhat.com>
 <20191209162727.10113-2-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191209162727.10113-2-mst@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: dnmendes76@gmail.com, Jakub Kicinski <jakub.kicinski@netronome.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, clang-built-linux@googlegroups.com,
 Martin Habets <mhabets@solarflare.com>, Julio Faracco <jcfaracco@gmail.com>,
 Shannon Nelson <snelson@pensando.io>, davem@davemloft.net,
 Heiner Kallweit <hkallweit1@gmail.com>
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

Hi Michael,

On Mon, Dec 09, 2019 at 11:29:03AM -0500, Michael S. Tsirkin wrote:
> This allows incrementing the correct timeout statistic without any mess.
> Down the road, devices can learn to reset just the specific queue.
> 
> The patch was generated with the following script:
> 
<snip>
> 
> where the list of files and functions is simply from:
> 
> git grep ndo_tx_timeout, with manual addition of headers
> in the rare cases where the function is from a header,
> then manually changing the few places which actually
> call ndo_tx_timeout.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Heiner Kallweit <hkallweit1@gmail.com>
> Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> Acked-by: Shannon Nelson <snelson@pensando.io>
> Reviewed-by: Martin Habets <mhabets@solarflare.com>
> 
> changes from v8:
> 	fix up a missing direct call to timeout
> 	rebased on net-next
> changes from v7:
> 	fixup leftovers from v3 change
> changes from v6:
> 	fix typo in rtl driver
> changes from v5:
> 	add missing files (allow any net device argument name)
> changes from v4:
> 	add a missing driver header
> changes from v3:
>         change queue # to unsigned
> Changes from v2:
>         added headers
> Changes from v1:
>         Fix errors found by kbuild:
>         generalize the pattern a bit, to pick up
>         a couple of instances missed by the previous
>         version.
> ---
<snip>
> diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> index 6a9d12dad5d9..ad0ecebb1b34 100644
> --- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> +++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
> @@ -288,7 +288,7 @@ static int dpaa_stop(struct net_device *net_dev)
>  	return err;
>  }
>  
> -static void dpaa_tx_timeout(struct net_device *net_dev)
> +static void dpaa_tx_timeout(struct net_device *net_dev, int txqueue)

This needs to be unsigned int, otherwise there is a build error:

../drivers/net/ethernet/freescale/dpaa/dpaa_eth.c:2622:20: error: incompatible pointer types initializing 'void (*)(struct net_device *, unsigned int)' with an expression of type 'void (struct net_device *, int)' [-Werror,-Wincompatible-pointer-types]
        .ndo_tx_timeout = dpaa_tx_timeout,
                          ^~~~~~~~~~~~~~~
1 error generated.

Cheers,
Nathan
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
