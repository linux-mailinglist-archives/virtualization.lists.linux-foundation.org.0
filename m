Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E594F73730
	for <lists.virtualization@lfdr.de>; Wed, 24 Jul 2019 21:02:27 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4E71514B4;
	Wed, 24 Jul 2019 18:59:29 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DE004C58;
	Mon, 22 Jul 2019 13:57:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8206C224;
	Mon, 22 Jul 2019 13:56:58 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 62B0C217F9;
	Mon, 22 Jul 2019 13:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563803818;
	bh=bQfkIbf6XvrrfgVB6dqgFGaZ+h0Cn+0vIdllQGKDcAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8tS7392/+6aK0cYmP+vQ9RmGPXef4dDqMkLjhO6alko1nydst/YuXyfD6a/gygLH
	i850A3sQfeK3UW+PqYy2iv50KnWxO5O1G2Hm9nVU5ixBjqyn4iOZ0Mvu6xhwOTWBoL
	aTNPSsJodTo2Otm/KNbTLdjSX6p7UQcWjNJoQyNY=
Date: Mon, 22 Jul 2019 14:56:53 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update my email address
Message-ID: <20190722135652.se2ba5ithml37dtz@willie-the-truck>
References: <20190722134438.31003-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722134438.31003-1-jean-philippe@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Wed, 24 Jul 2019 18:59:23 +0000
Cc: virtio-dev@lists.oasis-open.org, lorenzo.pieralisi@arm.com, mst@redhat.com,
	maz@kernel.org, joro@8bytes.org, virtualization@lists.linux-foundation.org,
	iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
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

On Mon, Jul 22, 2019 at 02:44:40PM +0100, Jean-Philippe Brucker wrote:
> Update MAINTAINERS and .mailmap with my @linaro.org address, since I
> don't have access to my @arm.com address anymore.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index 0fef932de3db..8ce554b9c9f1 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -98,6 +98,7 @@ Jason Gunthorpe <jgg@ziepe.ca> <jgunthorpe@obsidianresearch.com>
>  Javi Merino <javi.merino@kernel.org> <javi.merino@arm.com>
>  <javier@osg.samsung.com> <javier.martinez@collabora.co.uk>
>  Jean Tourrilhes <jt@hpl.hp.com>
> +<jean-philippe@linaro.org> <jean-philippe.brucker@arm.com>
>  Jeff Garzik <jgarzik@pretzel.yyz.us>
>  Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>
>  Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 783569e3c4b4..bded78c84701 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17123,7 +17123,7 @@ F:	drivers/virtio/virtio_input.c
>  F:	include/uapi/linux/virtio_input.h
>  
>  VIRTIO IOMMU DRIVER
> -M:	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
> +M:	Jean-Philippe Brucker <jean-philippe@linaro.org>
>  L:	virtualization@lists.linux-foundation.org
>  S:	Maintained
>  F:	drivers/iommu/virtio-iommu.c

Thanks (and your new address is easier to remember ;). I can take this one
via arm64, since I already have a bunch of MAINTAINERS updates queued for
-rc2.

Will
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
