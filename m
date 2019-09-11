Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E999AFE20
	for <lists.virtualization@lfdr.de>; Wed, 11 Sep 2019 15:52:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 975AC1492;
	Wed, 11 Sep 2019 13:52:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5CF571472
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:52:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 01A8C8A3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:52:31 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
	[209.85.160.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82302C059B7C
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 13:52:31 +0000 (UTC)
Received: by mail-qt1-f200.google.com with SMTP id o1so23877117qtp.3
	for <virtualization@lists.linux-foundation.org>;
	Wed, 11 Sep 2019 06:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=bTpTDYaW4L1Gk4pQTaJgOsQGofG8+keatPi5K+boUSM=;
	b=kLWHw8h7idm8SP6/6lWUB9JQn3QrMIVtLgWFMxThB8XCSRavl0RqQb7COuAEugTGO0
	QOWV3EXdwG7HLFQvL2BhMiNx1mAD4oKyBNFQ2kaSMBzx2X5SU1k6ZxArEipisgZgszQb
	xeGAi1yWcfTiuujs+3mFqLGEYGl5Mq9tYVh1ShD1HjZiPoW8+KG8hPI0mXGir8u7pfmp
	j6xLC4Bl7v5BsrzoAtwokfl2scsnvBtldpx8o+NodEN4uQkzqLI1EODi9Q75arakVTnO
	zxNkQOizO4VrScfx+VM5qQAZHs9zOmJbwTdFVILtdDFvRR2ocvAC2zHD65lOP92RVJVn
	wEUg==
X-Gm-Message-State: APjAAAW/IQwOrFbQYzgWvhLctfohpdZgqFivz3RygjkKtiRMps7hiP1E
	c33M2iOF+LFXCD/rmok6DwE0hXjaPktb6pIdQCpSXrcJxcP+80sjSWrlPNogymzyQW64EJZwOc5
	UPGrv1ycd1Sf+KBsRs3zbR3zhJe1pud4U4HtaUmDyVQ==
X-Received: by 2002:a37:4651:: with SMTP id t78mr35308380qka.259.1568209950748;
	Wed, 11 Sep 2019 06:52:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzAArEKuceihQtc6r95FHhQta9AhTzn+LrxDRMztlrzqQf2WbTHO7axIccFjavXyHt6DHiEWw==
X-Received: by 2002:a37:4651:: with SMTP id t78mr35308358qka.259.1568209950581;
	Wed, 11 Sep 2019 06:52:30 -0700 (PDT)
Received: from redhat.com ([80.74.107.118]) by smtp.gmail.com with ESMTPSA id
	n62sm9969475qkd.124.2019.09.11.06.52.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Sep 2019 06:52:29 -0700 (PDT)
Date: Wed, 11 Sep 2019 09:52:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] vhost: block speculation of translated descriptors
Message-ID: <20190911095147-mutt-send-email-mst@kernel.org>
References: <20190911120908.28410-1-mst@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911120908.28410-1-mst@redhat.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	RCVD_IN_SORBS_WEB autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: netdev@vger.kernel.org, security@kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org
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

On Wed, Sep 11, 2019 at 08:10:00AM -0400, Michael S. Tsirkin wrote:
> iovec addresses coming from vhost are assumed to be
> pre-validated, but in fact can be speculated to a value
> out of range.
> 
> Userspace address are later validated with array_index_nospec so we can
> be sure kernel info does not leak through these addresses, but vhost
> must also not leak userspace info outside the allowed memory table to
> guests.
> 
> Following the defence in depth principle, make sure
> the address is not validated out of node range.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> Tested-by: Jason Wang <jasowang@redhat.com>
> ---

Cc: security@kernel.org

Pls advise on whether you'd like me to merge this directly,
Cc stable, or handle it in some other way.

> changes from v1: fix build on 32 bit
> 
>  drivers/vhost/vhost.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
> index 5dc174ac8cac..34ea219936e3 100644
> --- a/drivers/vhost/vhost.c
> +++ b/drivers/vhost/vhost.c
> @@ -2071,8 +2071,10 @@ static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
>  		_iov = iov + ret;
>  		size = node->size - addr + node->start;
>  		_iov->iov_len = min((u64)len - s, size);
> -		_iov->iov_base = (void __user *)(unsigned long)
> -			(node->userspace_addr + addr - node->start);
> +		_iov->iov_base = (void __user *)
> +			((unsigned long)node->userspace_addr +
> +			 array_index_nospec((unsigned long)(addr - node->start),
> +					    node->size));
>  		s += size;
>  		addr += size;
>  		++ret;
> -- 
> MST
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
