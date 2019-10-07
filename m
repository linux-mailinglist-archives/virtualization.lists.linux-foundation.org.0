Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF6CDC89
	for <lists.virtualization@lfdr.de>; Mon,  7 Oct 2019 09:44:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A303B499;
	Mon,  7 Oct 2019 07:43:59 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 63CB6408
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 07:43:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 18CF75F4
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 07:43:58 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 714E96412B
	for <virtualization@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 07:43:57 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id g65so14177727qkf.19
	for <virtualization@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 00:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=lXk6nBFGAT4BSmxIglRrQ4LU7TGp8TlXjdfd6qKXf1s=;
	b=DUJ7EOJ8hel3ks9J7flT86E1rl7fqtGNM2wGRgz4CbyuFKJVmJni3ROjPgJPnU7/bP
	BtpUeJ7njLo8CkDRWwcEzWETLszmvcnh5gtMX1Ix+NCyvbyAjAG16em90UBvfgWv2seK
	U5WqD737dolgDh8yJQEKk+2lQttwW0Y2lWA7J/H5kWt8ln5mZxpfGb4dkUISjuW3V1ol
	h3I+U/jGwmpCLSUNVgHDfO11v9NeQRSX5r/sdnaXoDwKWq1oecPeMs8Xfq4iYLCoYyng
	J/oc9+pE+uBLblpZUBFXwNdVflUWdmG4ThyQKltpoB7O+WCVorNFq1d6Ow+nVj+VjKWR
	IRiA==
X-Gm-Message-State: APjAAAVrqxaJXCAzD6syDtNDaLLCiR55JcuZIXGVAppEEYNk+KCab6aV
	HWzae5d8BWzlZJ2KZZT+X8+Rp7nNoFthVkdQQ1DqBmqOTKHF/wXDY7hP7wMdP8WmzdIqf/qp0q0
	RDjvObE/SRRQXLj+J36Rpm1x6gdvFfV1sSSRps5Bj4A==
X-Received: by 2002:a37:8f86:: with SMTP id
	r128mr11730767qkd.392.1570434236764; 
	Mon, 07 Oct 2019 00:43:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkDu5dwf58X+8XqrTkuWmYKPmGulasUqtYDa0HzyNEwPsxZficIEoe2hRrlOTxmgzFj1vQuA==
X-Received: by 2002:a37:8f86:: with SMTP id
	r128mr11730756qkd.392.1570434236539; 
	Mon, 07 Oct 2019 00:43:56 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	w11sm9017122qtj.10.2019.10.07.00.43.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 00:43:55 -0700 (PDT)
Date: Mon, 7 Oct 2019 03:43:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: jcfaracco@gmail.com
Subject: Re: [PATCH RFC net-next 0/2] drivers: net: virtio_net: Implement
Message-ID: <20191007034208-mutt-send-email-mst@kernel.org>
References: <20191006184515.23048-1-jcfaracco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191006184515.23048-1-jcfaracco@gmail.com>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dnmendes76@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, davem@davemloft.net
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

On Sun, Oct 06, 2019 at 03:45:13PM -0300, jcfaracco@gmail.com wrote:
> From: Julio Faracco <jcfaracco@gmail.com>
> 
> Driver virtio_net is not handling error events for TX provided by 
> dev_watchdog. This event is reached when transmission queue is having 
> problems to transmit packets. To enable it, driver should have 
> .ndo_tx_timeout implemented. This serie has two commits:
> 
> In the past, we implemented a function to recover driver state when this
> kind of event happens, but the structure was to complex for virtio_net
> that moment.

It's more that it was missing a bunch of locks.

> Alternativelly, this skeleton should be enough for now.
>
> For further details, see thread:
> https://lkml.org/lkml/2015/6/23/691
> 
> Patch 1/2:
>   Add statistic field for TX timeout events.
> 
> Patch 2/2:
>   Implement a skeleton function to debug TX timeout events.
> 
> Julio Faracco (2):
>   drivers: net: virtio_net: Add tx_timeout stats field
>   drivers: net: virtio_net: Add tx_timeout function
> 
>  drivers/net/virtio_net.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> -- 
> 2.21.0
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
