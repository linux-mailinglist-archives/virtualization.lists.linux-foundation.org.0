Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C36221CBC
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 08:43:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 377D620439;
	Thu, 16 Jul 2020 06:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HmnxfqHQKnqR; Thu, 16 Jul 2020 06:43:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6879520516;
	Thu, 16 Jul 2020 06:43:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3BB70C0733;
	Thu, 16 Jul 2020 06:43:38 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 572DFC0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3DA018A47A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71ttAxbfrJ7A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:43:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 67ECE89BD7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 06:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594881811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=92A49Ojmn2AU0Fmvk+D6Q53rRv9UoaDayPIPpa5wWcs=;
 b=LTaxAGIcCcttx+dwb0BbKsMU+i2uDjj6Vi4zWJYlQ2fvW1v7O6eTD/pclHVXFa2VOgxFbG
 CLzcMfGQlfgvPV0FBYLKPLGsCDF2krDyNOGiOoas4Z6UhXm3uLni4F8aFMluJ0r1b/GQUB
 Xq80Fluz7o/8A+gAOUn+B8HNyvgQfvs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-LR3LKQmHPrG7_MXPa6Gzog-1; Thu, 16 Jul 2020 02:43:29 -0400
X-MC-Unique: LR3LKQmHPrG7_MXPa6Gzog-1
Received: by mail-wm1-f69.google.com with SMTP id o13so4224703wmh.9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 23:43:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=92A49Ojmn2AU0Fmvk+D6Q53rRv9UoaDayPIPpa5wWcs=;
 b=WcR2OGClSSDKSPTL+hQK8CXP8cskmPR8msBpJzgm8cBef/LDVImg50B2NIhXbBOQkS
 J0/WruPQ1ndjoT6nidm/ErubTNvgHU//bZijd2WLZZ07CyxfLIaXnnMzY0/RkLFHMA5U
 nF79TDGtXblmxKzxseBg4a0ch1BaUq9lmYPUbpFkUqDiYN8HzDaxprhZlkiMEqKDMJrx
 MPJ8mpMvdZHZ/rSo8OomSvg8N31eHEZxVka+RHv3dNrt7A6i+A5iuMipPp26n79Tn4ZB
 u/A8BwC9ZSj1GLZ9FmMIn+MKoS7HChm18fa4kI8GmnMPriY9dnBypcDD2f0GL8EPkosA
 YHwA==
X-Gm-Message-State: AOAM530sAXLFJDegAGNLGDr6ZguU8dLDc2CElAaGqkpozszrVlNmVhZz
 qQAkJhVbvDqRgqoYh9Cdy1OFp4XRv3DS6M8ucmrBfRkzez87XW3khrC5dJxpDZFkHyvmDtO0lvL
 ++D2hX3rJ8NXac/DT6tl1SWquDGyKwRM+lqic2DmnvA==
X-Received: by 2002:a1c:9a07:: with SMTP id c7mr2963451wme.147.1594881808574; 
 Wed, 15 Jul 2020 23:43:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6DpABEgJSEbkgqOOGpGbulniuOcb/AXbRsfBNAusCpgTzcOusCDH2paSBBwm1ZZJQp/CfjQ==
X-Received: by 2002:a1c:9a07:: with SMTP id c7mr2963420wme.147.1594881808359; 
 Wed, 15 Jul 2020 23:43:28 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 g3sm8085920wrb.59.2020.07.15.23.43.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 23:43:27 -0700 (PDT)
Date: Thu, 16 Jul 2020 02:43:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Hui Zhu <teawater@gmail.com>
Subject: Re: [RFC for Linux v4 1/2] virtio_balloon: Add
 VIRTIO_BALLOON_F_CONT_PAGES and inflate_cont_vq
Message-ID: <20200716024114-mutt-send-email-mst@kernel.org>
References: <1594867315-8626-1-git-send-email-teawater@gmail.com>
 <1594867315-8626-2-git-send-email-teawater@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1594867315-8626-2-git-send-email-teawater@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: virtio-dev@lists.oasis-open.org, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, Hui Zhu <teawaterz@linux.alibaba.com>,
 akpm@linux-foundation.org
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

On Thu, Jul 16, 2020 at 10:41:51AM +0800, Hui Zhu wrote:
> diff --git a/include/uapi/linux/virtio_balloon.h b/include/uapi/linux/virtio_balloon.h
> index dc3e656..4d0151a 100644
> --- a/include/uapi/linux/virtio_balloon.h
> +++ b/include/uapi/linux/virtio_balloon.h
> @@ -37,6 +37,7 @@
>  #define VIRTIO_BALLOON_F_FREE_PAGE_HINT	3 /* VQ to report free pages */
>  #define VIRTIO_BALLOON_F_PAGE_POISON	4 /* Guest is using page poisoning */
>  #define VIRTIO_BALLOON_F_REPORTING	5 /* Page reporting virtqueue */
> +#define VIRTIO_BALLOON_F_CONT_PAGES	6 /* VQ to report continuous pages */
>  
>  /* Size of a PFN in the balloon interface. */
>  #define VIRTIO_BALLOON_PFN_SHIFT 12

So how does the guest/host interface look like?
Could you write up something about it?

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
