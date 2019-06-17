Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 483E4485C1
	for <lists.virtualization@lfdr.de>; Mon, 17 Jun 2019 16:43:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 79DA5DC3;
	Mon, 17 Jun 2019 14:43:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D0C6AD88
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:43:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7AD512C3
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 14:43:15 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y57so11008625qtk.4
	for <virtualization@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 07:43:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=lxS/dzQw4wkh+Z+PAMdqgR2Kw5xVW/ETkqpwQQdohjY=;
	b=B+nPzpUFPV2s9VhhYH4364cq8WhY2vreGyQWMtX9rQJY/1q/bTmILKlS0bupLTgZZz
	QVjXF4X3RSy3APVf3jRt7YDjAsDCGCK95KbYkTZd4exGd4V3Cj9GOOhIq/wC95D/N2U4
	5na715zaZOv80on+x+kuW11OPJIasb7UPBU+pp9v/1qJ9T92fS6NDnpTOe2EqhjaJIom
	z/XC+Zlv29GY3znhbAwU4CEp4EhR0MnMbQfAqSAvaG9zbcaU6TtZyUWNUgL0eAEK5WoK
	liO+z9nDIRGae3qYhlMVR4kZmNP+8v5ebzbpmbXHP0wVU5tXPFJgpUiyJXde5Eeu1fUD
	d1yA==
X-Gm-Message-State: APjAAAUaEOMZE05hIkvISPBFQLPjCfhLDePVukdNU2kzmFgBk4T7hnWI
	xagCEU9y3a4N/O89wii2RNi9Gw==
X-Google-Smtp-Source: APXvYqwavvGjRNDaa71vDWp/7KVZgO3Ghhc2s0zA1b8b++lVdLmzk98FDf0R90PixvOg24leSYkxow==
X-Received: by 2002:a0c:b5dd:: with SMTP id o29mr21771848qvf.85.1560782594646; 
	Mon, 17 Jun 2019 07:43:14 -0700 (PDT)
Received: from redhat.com (pool-100-0-197-103.bstnma.fios.verizon.net.
	[100.0.197.103])
	by smtp.gmail.com with ESMTPSA id s44sm8410210qtc.8.2019.06.17.07.43.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 17 Jun 2019 07:43:13 -0700 (PDT)
Date: Mon, 17 Jun 2019 10:43:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH net-next] vhost_net: disable zerocopy by default
Message-ID: <20190617104301-mutt-send-email-mst@kernel.org>
References: <20190617092054.12299-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617092054.12299-1-jasowang@redhat.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, huhai@kylinos.cn, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Mon, Jun 17, 2019 at 05:20:54AM -0400, Jason Wang wrote:
> Vhost_net was known to suffer from HOL[1] issues which is not easy to
> fix. Several downstream disable the feature by default. What's more,
> the datapath was split and datacopy path got the support of batching
> and XDP support recently which makes it faster than zerocopy part for
> small packets transmission.
> 
> It looks to me that disable zerocopy by default is more
> appropriate. It cold be enabled by default again in the future if we
> fix the above issues.
> 
> [1] https://patchwork.kernel.org/patch/3787671/
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>


Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  drivers/vhost/net.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
> index 2d9df786a9d3..21e0805e5e60 100644
> --- a/drivers/vhost/net.c
> +++ b/drivers/vhost/net.c
> @@ -36,7 +36,7 @@
>  
>  #include "vhost.h"
>  
> -static int experimental_zcopytx = 1;
> +static int experimental_zcopytx = 0;
>  module_param(experimental_zcopytx, int, 0444);
>  MODULE_PARM_DESC(experimental_zcopytx, "Enable Zero Copy TX;"
>  		                       " 1 -Enable; 0 - Disable");
> -- 
> 2.18.1
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
