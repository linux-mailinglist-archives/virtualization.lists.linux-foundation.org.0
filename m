Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 47033D5616
	for <lists.virtualization@lfdr.de>; Sun, 13 Oct 2019 14:01:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 69D8D2385;
	Sun, 13 Oct 2019 12:01:01 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 69087EFE
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:52:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E681E5D3
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:52:33 +0000 (UTC)
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
	[209.85.222.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5EC7B86668
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 11:52:33 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id g65so14091670qkf.19
	for <virtualization@lists.linux-foundation.org>;
	Sun, 13 Oct 2019 04:52:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=jwWOYBcdL+FwVmThH20DZa26zpPO65kQYvR5F6FTbNE=;
	b=SC6Zy9NIiNGEDKsqf90czLPsoVP9EmhbpNEhCCFKJOdBKExdQJ4KsqGuPpCzIlOR+D
	cDn42sDQpdV8x+1x5lII6jsb1fm9Qbtvf3PlQjnS7TXYjYDc8P7whIBnFYdRHKcVkLef
	9RgDCwSx+3PGYszG7EbwQVjkhFJ01wyiHsGQlpCePcWMFXOEdq/RK7UPZ7qgDNIy8eJN
	sTFh22hYKydQvl381U8BuHu8sc3T09yxuUZcT9aHM4smoj7gpcgnHgsFtz3Y1GeeZcPT
	9jFXiZKk9GV4VNWgYmcLYLLyE0DsGvgk8YjBD7ImxTyXdbmvPabrTNb46bpSMfQ5oldg
	9r7A==
X-Gm-Message-State: APjAAAV4mZNkhbAtRFhTP2013Onb/aGGjJFWZ76YTLD2Y7tM/zxw2UoL
	fTfv4VddUDSJ2HORCbu82HX6RE5pN3MdQqhxbMT/xJyTlvNhp5pEyOK54IY1wnmLlhz6WNB+/mT
	6D2DzutvdvC7oRI/81RN1tpoMaZ/D1LMFNKT4zzOYJQ==
X-Received: by 2002:ac8:145:: with SMTP id f5mr27764091qtg.44.1570967552663;
	Sun, 13 Oct 2019 04:52:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxN/2XdDR7sYa6uOVIhJGXLQk/ZKI4RjasPsuZJqmI3iyCmuePxmDioaM2ULCIpeXuq/AD/vQ==
X-Received: by 2002:ac8:145:: with SMTP id f5mr27764084qtg.44.1570967552501;
	Sun, 13 Oct 2019 04:52:32 -0700 (PDT)
Received: from redhat.com (bzq-79-176-10-77.red.bezeqint.net. [79.176.10.77])
	by smtp.gmail.com with ESMTPSA id
	c14sm7871766qta.80.2019.10.13.04.52.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 13 Oct 2019 04:52:31 -0700 (PDT)
Date: Sun, 13 Oct 2019 07:52:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@web.de>
Subject: Re: [PATCH] tools/virtio: Fix build
Message-ID: <20191013075107-mutt-send-email-mst@kernel.org>
References: <4b686914-075b-a0a9-c97b-9def82ee0336@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b686914-075b-a0a9-c97b-9def82ee0336@web.de>
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>
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

On Sun, Oct 13, 2019 at 11:03:30AM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> Various changes in the recent kernel versions broke the build due to
> missing function and header stubs.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>

Thanks!
I think it's already fixes in the vhost tree.
That tree also includes a bugfix for the test.
Can you pls give it a spin and report?
Thanks!

> ---
>  tools/virtio/crypto/hash.h       | 0
>  tools/virtio/linux/dma-mapping.h | 2 ++
>  tools/virtio/linux/kernel.h      | 2 ++
>  3 files changed, 4 insertions(+)
>  create mode 100644 tools/virtio/crypto/hash.h
> 
> diff --git a/tools/virtio/crypto/hash.h b/tools/virtio/crypto/hash.h
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/tools/virtio/linux/dma-mapping.h b/tools/virtio/linux/dma-mapping.h
> index f91aeb5fe571..db96cb4bf877 100644
> --- a/tools/virtio/linux/dma-mapping.h
> +++ b/tools/virtio/linux/dma-mapping.h
> @@ -29,4 +29,6 @@ enum dma_data_direction {
>  #define dma_unmap_single(...) do { } while (0)
>  #define dma_unmap_page(...) do { } while (0)
> 
> +#define dma_max_mapping_size(d)	0
> +
>  #endif
> diff --git a/tools/virtio/linux/kernel.h b/tools/virtio/linux/kernel.h
> index 6683b4a70b05..ccf321173210 100644
> --- a/tools/virtio/linux/kernel.h
> +++ b/tools/virtio/linux/kernel.h
> @@ -141,4 +141,6 @@ static inline void free_page(unsigned long addr)
>  #define list_for_each_entry(a, b, c) while (0)
>  /* end of stubs */
> 
> +#define xen_domain() 0
> +
>  #endif /* KERNEL_H */
> --
> 2.16.4
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
