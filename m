Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD68203BB6
	for <lists.virtualization@lfdr.de>; Mon, 22 Jun 2020 18:00:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF89E8808F;
	Mon, 22 Jun 2020 16:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSiYe0+bUdcz; Mon, 22 Jun 2020 16:00:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3BE3D88859;
	Mon, 22 Jun 2020 16:00:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01FE9C0891;
	Mon, 22 Jun 2020 16:00:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 777C9C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 72D5089496
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:00:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zM9YaOxxMhiH
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:00:15 +0000 (UTC)
X-Greylist: delayed 00:30:04 by SQLgrey-1.7.6
Received: from sonic314-19.consmr.mail.gq1.yahoo.com
 (sonic314-19.consmr.mail.gq1.yahoo.com [98.137.69.82])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 10B1E8942F
 for <virtualization@lists.linux-foundation.org>;
 Mon, 22 Jun 2020 16:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1592841613; bh=ZrqH4CkkktGM5U4f9eYdkRlGgwNo9TU/U6UyKhhS7Nk=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From:Subject;
 b=uHKwPwmF2RduWQ+bhOkqeEscIisjsLrd7hGpHYDqHIo3Cc3/mhYGuX8bJxC1GvAGSH0SMuCPP+445aAssC1trA5Qy9UEwbsjfHlamAUtxOnDBysQxEc2A5egZtb4CHReUGqmTyWkW0QrZuz9ilNjRIh6HkVqKB2lJbrgnJg3nX29nV29+sOUkEkfqmBa4gTfDba80bqUODVSYAS7fD+w7/urGa1ocmSQNBPCN5Y/DknsIKjV91H/W9nvID/bGaU8GHcD/ir9cUT1r8kGrZBeNIAx/elv/vl9fxv6dwaYuPzjGN0EFDeIg+NlDjm+oPRM2ostsmBaycZZQcDYLqa3Ww==
X-YMail-OSG: Cr3SZHIVM1nhNBz0ZZsYMs_M_FiwKACLBt6kQJYR4K4mF8rlKRnT_f7fT.t2sCC
 DipgYeUhA4EqFw.SkQWXpFDSR9OEwLAwPhxJrNDrZntjEiUyBxrucSuQHm_QF14U8f.b2eKVT72N
 qLFP7qiHUNKXQ4SYEPcuZ_q_hvbnxXiCXViFhbZeefE03ucrFdRs4EM21.p1dmjv5xm1mLoCeWIN
 jkgvvhLmjrY8f5pm5D.I7cSGPM0XP4TaGG6w.i1Rm9gkDs8YL.9moWBhj1cX2qg6nJLn_YP9zuaP
 0j4YBbovs_HxALABkTP.KUcbU5likQB6ekjU..0CB5QQqi81Q0Hy7bFSr7FHxVMM12ot7uWaEinI
 JzMYBL7BgegWMHyrDLq0BukuCBzZhQ7HtVDiFAb6SLzynuhFE2s0oduA4_8TuEHwugSN8ABWWMon
 VPs76OFaHB4AiH8rlzDNUDvCs7hdVL4wp9PFB6nn9gIroi814lkRYshQ4SiMu8.x1LxzVQKuj_1K
 AuI6G4xS5qHgGm9tql95oMLMkoCQ_OChr1GN3vdf3AkF.9X9Wc6QF3ClqlTETxkAJr74XyNRNefG
 KKhCUU2Mb6kqNBNzFDJhl1nBfl4J3BT0UE0D3HzQ.zUoHGifRb9ATfXlzwDHyItKsky9dMsmfqtp
 i6TMZweDPyfDW5BjQ.MZTGyShESLRfuuUEljOv8zB54h_Fy7RVp.TsJfycEpERk0eoEc8YtNTOHf
 CcMXxFXSBJJWfuCSoiKgkmgJ.tWI9GYciX5ptLM5SO5ucVKruIh5YWFPlCwnk7h.bBmMVMK6JbYY
 FIzEK18BG84ne8qJn5HcUc4YGExVQ_0VdZ68jSrZOOgnALE7w0Yh7P.5FEyFgcDv5CQRtTlDa9XV
 332GOILLb4zJJheQ0JFSPElT9FH3CBrDs5LCQxJomwN4y7xwltOYhRMK83otrU_Fj_y_eHeotXp5
 XEoZNPauow06YAJ6iF5IF8YixALM0Q7iN05wMbk0d_uc0b55OOLVDb3x3VUYpis0YS82.POsP32I
 ulBQXux3NQlclxawhgWzTJz.jykMGFqABOqUbZETOIhVNH9HkQalW_F5SQXc82W2mLThpOJ_x082
 G.nYAFFP6Iozy3gvrmlA27ubLrteMzz7DLQIULn80k0_6JJr84FSeEkkQDHO2PSnfc8bmvPlGVvp
 18BXWE0ViDKr5zEztaQIMuEjnaJYCCDIS0FBU4hrX67yVYFDBT0y6ZYXCS4tbw1UClE62qzLiBIP
 UN3eLZ.VIszJNb86Rf9A8WrGMP2tM7.UAiknCB.VtjckyXwujOVTk01wBBbAFbL0YYDxIOdYmGmw
 oInI7KsCeCE6pCvJGjT60utyj2RwD2L_Yt9unDDKpSoj3x.XhDmB.
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Mon, 22 Jun 2020 16:00:13 +0000
Received: by smtp418.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 402ae077068331dedde2e55d9ced12f3; 
 Mon, 22 Jun 2020 15:30:08 +0000 (UTC)
Date: Mon, 22 Jun 2020 11:30:04 -0400
Subject: Re: AMD IOMMU + SME + amdgpu regression
To: Joerg Roedel <jroedel@suse.de>
References: <1591915710.rakbpzst8h.none.ref@localhost>
 <1591915710.rakbpzst8h.none@localhost> <20200622100257.GD31822@suse.de>
In-Reply-To: <20200622100257.GD31822@suse.de>
MIME-Version: 1.0
Message-Id: <1592839701.mxvvths2x9.none@localhost>
X-Mailer: WebService/1.1.16138 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.7)
Cc: Heiko Stuebner <heiko@sntech.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Drake <drake@endlessm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 David Rientjes <rientjes@google.com>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Kukjin Kim <kgene@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
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
From: "Alex Xu \(Hello71\) via Virtualization"
 <virtualization@lists.linux-foundation.org>
Reply-To: "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Excerpts from Joerg Roedel's message of June 22, 2020 6:02 am:
> Hi Alex,
> 
> On Thu, Jun 11, 2020 at 07:05:21PM -0400, Alex Xu (Hello71) wrote:
>> I am using an ASRock B450 Pro4 with Ryzen 1600 and ASUS RX 480. I don't 
>> understand this code at all, but let me know what I can do to 
>> troubleshoot.
> 
> Does it boot without SME enabled?
> 
> 
> Regards,
> 
> 	Joerg
> 

Yes, it works with SME off with dbed452a078 ("dma-pool: decouple 
DMA_REMAP from DMA_COHERENT_POOL") applied.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
