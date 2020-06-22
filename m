Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B85320391A
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 16:26:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 01D5887D9C;
	Mon, 22 Jun 2020 14:26:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HY0rr9jqG3AB; Mon, 22 Jun 2020 14:26:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id F2D97894B9;
	Mon, 22 Jun 2020 14:26:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D5F38C016F;
	Mon, 22 Jun 2020 14:26:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7A4E7C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 14:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4527A259C9
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 14:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uL5fCTodpRIH
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 14:26:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 6E8BF1FCB5
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 14:26:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E4AB5C1C9;
 Mon, 22 Jun 2020 14:26:20 +0000 (UTC)
Date: Mon, 22 Jun 2020 12:02:57 +0200
From: Joerg Roedel <jroedel@suse.de>
To: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: AMD IOMMU + SME + amdgpu regression
Message-ID: <20200622100257.GD31822@suse.de>
References: <1591915710.rakbpzst8h.none.ref@localhost>
 <1591915710.rakbpzst8h.none@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591915710.rakbpzst8h.none@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Heiko Stuebner <heiko@sntech.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Drake <drake@endlessm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
 Andy Gross <agross@kernel.org>, David Rientjes <rientjes@google.com>,
 linux-s390@vger.kernel.org, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
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

Hi Alex,

On Thu, Jun 11, 2020 at 07:05:21PM -0400, Alex Xu (Hello71) wrote:
> I am using an ASRock B450 Pro4 with Ryzen 1600 and ASUS RX 480. I don't 
> understand this code at all, but let me know what I can do to 
> troubleshoot.

Does it boot without SME enabled?


Regards,

	Joerg
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
