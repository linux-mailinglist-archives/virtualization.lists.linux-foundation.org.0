Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C15434697B0
	for <lists.virtualization@lfdr.de>; Mon,  6 Dec 2021 15:03:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 731D460073;
	Mon,  6 Dec 2021 14:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PASIVf-FznqS; Mon,  6 Dec 2021 14:03:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5B93A600B3;
	Mon,  6 Dec 2021 14:03:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 984B1C0071;
	Mon,  6 Dec 2021 14:03:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D22A9C0012;
 Mon,  6 Dec 2021 14:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C054080BA3;
 Mon,  6 Dec 2021 14:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MTdEiVFAp4ld; Mon,  6 Dec 2021 14:03:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2880B80B8C;
 Mon,  6 Dec 2021 14:03:34 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E2174396; Mon,  6 Dec 2021 15:03:31 +0100 (CET)
Date: Mon, 6 Dec 2021 15:03:30 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v3 0/5] iommu/virtio: Add identity domains
Message-ID: <Ya4YMghK+Ald4soM@8bytes.org>
References: <20211201173323.1045819-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211201173323.1045819-1-jean-philippe@linaro.org>
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org,
 pasic@linux.ibm.com, eric.auger@redhat.com, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, will@kernel.org
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

On Wed, Dec 01, 2021 at 05:33:20PM +0000, Jean-Philippe Brucker wrote:
> Jean-Philippe Brucker (5):
>   iommu/virtio: Add definitions for VIRTIO_IOMMU_F_BYPASS_CONFIG
>   iommu/virtio: Support bypass domains
>   iommu/virtio: Sort reserved regions
>   iommu/virtio: Pass end address to viommu_add_mapping()
>   iommu/virtio: Support identity-mapped domains

Applied, thanks.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
