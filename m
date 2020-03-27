Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D162A1954E6
	for <lists.virtualization@lfdr.de>; Fri, 27 Mar 2020 11:11:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F2E6894E7;
	Fri, 27 Mar 2020 10:11:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F28G-P0yM5Ge; Fri, 27 Mar 2020 10:11:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9F8548950D;
	Fri, 27 Mar 2020 10:11:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 90475C0177;
	Fri, 27 Mar 2020 10:11:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B386EC0177;
 Fri, 27 Mar 2020 10:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A0BF587383;
 Fri, 27 Mar 2020 10:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1tp0zTjgMJ2z; Fri, 27 Mar 2020 10:11:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5815871FD;
 Fri, 27 Mar 2020 10:11:12 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id AD2522C8; Fri, 27 Mar 2020 11:11:10 +0100 (CET)
Date: Fri, 27 Mar 2020 11:11:09 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v2 0/3] iommu/virtio: Misc fixes
Message-ID: <20200327101109.GA3103@8bytes.org>
References: <20200326093558.2641019-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326093558.2641019-1-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: mst@redhat.com, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, iommu@lists.linux-foundation.org, bbhushan2@marvell.com
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

On Thu, Mar 26, 2020 at 10:35:55AM +0100, Jean-Philippe Brucker wrote:
> A collection of fixes for the virtio-iommu driver. It might be too late
> for v5.6 since they need more review. Patch 2 is new, the others were
> posted separately. 
> 
> Jean-Philippe Brucker (3):
>   iommu/virtio: Fix sparse warning
>   iommu/virtio: Fix freeing of incomplete domains
>   iommu/virtio: Reject IOMMU page granule larger than PAGE_SIZE

Applied, thanks.

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
