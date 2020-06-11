Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E94021F70E9
	for <lists.virtualization@lfdr.de>; Fri, 12 Jun 2020 01:35:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D624869F6;
	Thu, 11 Jun 2020 23:35:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hyTTNexk1tQV; Thu, 11 Jun 2020 23:35:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E289869E2;
	Thu, 11 Jun 2020 23:35:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 02902C016F;
	Thu, 11 Jun 2020 23:35:35 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA3E2C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 23:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B10B2884A9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 23:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jn6S56gU9-lA
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 23:35:32 +0000 (UTC)
X-Greylist: delayed 00:30:03 by SQLgrey-1.7.6
Received: from sonic315-55.consmr.mail.gq1.yahoo.com
 (sonic315-55.consmr.mail.gq1.yahoo.com [98.137.65.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7FD8088494
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Jun 2020 23:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591918532; bh=4YUy2dnKX+aLfXhIKF01g98COCeJaRGO0uIb0VS79Kk=;
 h=Date:From:Subject:To:Cc:References:From:Subject;
 b=j/wtLf33T4rI1GNvQBZMK8AuPJzlOo1rAfCBbLpJVCrlb1sdWWvON9mHjMdzfW+msTbqklCq/0lNpjY7bfAFAZ5jxCeuNkvsG1/qzBN1N1H+dy+m4naZIxrqrnDNm/NVD3kIEr+fjJw++SdOIosFl9RXdBnGUP4B3XojHn6O/IRjbgRxSmlndoCAeaG3hVu5Za16I8F3ETozOvvrxLfBt/O/acFrg4PFZXAZQ9//yzc4q6qBwHJXg80Val6ZiUWEd31dtIDUX1p7aFtydy6gbucS4N0RzY7qxV04uhM/c5z63zINHmZ52yz3+vqGyTRMnWAA6PHdWkpmBeZS9V63xA==
X-YMail-OSG: VeI5KAIVM1l8FZBKKOcgI77XPMQpX1yRxgEuJkG2HwGiwftSWlMzUhg.wI9RpCO
 0m9mb_xDfGj9T2zqhX.uH.ouvYYHvpDFZhv1pWFL5y1aS4v9hb1LGwKsLcCxtdjVmrndIAxlrgTz
 8LO3W4t7Y60g_t0QstSujZEh68oL_wRlHCSB5Td_M.HVxGsUQjqWM2qr_3.AkhSA0yutg5qcke8K
 Tv4I9pYJd9awi6FeCBU8.AW0hdjLa6mwHM8hm8SCtmWxN5P9kgX8HCxAaSA2wWYE5BgfOiUDY0eN
 8SdF4xfPgafkYHgez7VCD9nxGHLJtR8PsxeXciMIqqC1F9E63fd4UIcXYfSp5mCCnXf1pW2oA0VZ
 eHnF2Lf5MUvy0KsxA7VkbSJfJnhx72DN4PMW15_Pqypq2CTc5FOh7t_XE2x5gmqPfv8aAgem9Z6S
 G754j7JvVIvxR16NyP1NJHKbTMsWHNX0qPQnbyQSB5vpRmVwkBOq_AHkSPmPavoJRKp4qbzy6bBO
 Bgl5ef0LdH1w0IGoNwlRH.UR8MrIAnwak32wCqG5lf.SwS9m.j1yNpS4_5D0o_3_e09XXbmbVT87
 JydTvntH.WypWlGKDwbEeflUZOlJnJ07XyPmONgYYP36533AICJBEt96Va3.mhtjhlFw3.29ZciX
 DUnx7ZrUMS58v2ROWoMShz.kIsuifGl.62rbZy_X8r4vO.Uxo5XJwzW4msMSwsvTqaOqT_X2DSbr
 LLj_UnAnYi2D4y9bOLYthO6rgknJsjH5NNK_yfRdTmQy.0mTEM7K9s8uzcE9CTS8fKfsDaVPyVxh
 xVmmJFX.A8jqmra2IrNsfF8nyaPIwxTRtGkfxuk34ZNH.5c0amNlvLcBd8.CT2wpn_WASLVEIrIT
 lDlihOCfti987bgw5CyoUnMPwNm0_HyhWtZkakVcpPqyn4HsvO_sGZRdcb0.0tEu_C025pvdxswN
 rmgxGP8nc8FxFl_ewO1mGzIfh.LwtPgP6qxJHGwfAB.8sgV6oyaOcpklbPCK0mtb2TNuawY.gM1Y
 4EIewDISpLaEHGybdY02ejlYI9grt4UFGP66cBLM98U9eaSs476RtjcbgJDnZF0_b5o12Ivh3yDE
 .RRrOjKXttZUE3n3qAJp9VaVUkrJ1tU13bF05OPpKcgEydjxVzV7vX1CE71IihUl_3XGlg_spYT1
 ddNGRuEIqFA0z2RSjAXwv25g7eOX4gy.2PVQRZ6tqkn.PDou7IfhlVk8_1frFp5r3OUVYDW2Om7X
 b38HOjsBTSMFQLSdrTiz56K7c1Ygr8lUnUMCqgmgaJUxAZUUchMUduSb9Ii8mcXGP569B9NwAMAc
 y3hNB5BRs5SQzb2xm6fsFam.vFlKXVBiNz6MHR.jitsw1wi_Lt0BaPaD8ibirje_yAw4-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Thu, 11 Jun 2020 23:35:32 +0000
Received: by smtp422.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 385a77de6a3948fc2d5a9f83b3566fac; 
 Thu, 11 Jun 2020 23:05:25 +0000 (UTC)
Date: Thu, 11 Jun 2020 19:05:21 -0400
Subject: AMD IOMMU + SME + amdgpu regression
To: Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Message-Id: <1591915710.rakbpzst8h.none@localhost>
References: <1591915710.rakbpzst8h.none.ref@localhost>
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
Cc: Heiko Stuebner <heiko@sntech.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Drake <drake@endlessm.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Joerg Roedel <jroedel@suse.de>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com,
 David Woodhouse <dwmw2@infradead.org>, Rob Clark <robdclark@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
From: "Alex Xu \(Hello71\) via Virtualization"
 <virtualization@lists.linux-foundation.org>
Reply-To: "Alex Xu \(Hello71\)" <alex_y_xu@yahoo.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Hi,

amdgpu + IOMMU + SME is now working for me on 5.7, yay! But, it is 
broken on torvalds master, boo. On boot, depending on which exact commit 
I test, it either hangs immediately (with built-in driver, before 
starting initramfs), displays some errors then hangs, or spams the 
screen with many amdgpu errors.

I bisected the black screen hang to:

commit dce8d6964ebdb333383bacf5e7ab8c27df151218
Author: Joerg Roedel <jroedel@suse.de>
Date:   Wed Apr 29 15:36:53 2020 +0200

    iommu/amd: Convert to probe/release_device() call-backs

    Convert the AMD IOMMU Driver to use the probe_device() and
    release_device() call-backs of iommu_ops, so that the iommu core code
    does the group and sysfs setup.

    Signed-off-by: Joerg Roedel <jroedel@suse.de>
    Link: https://lore.kernel.org/r/20200429133712.31431-16-joro@8bytes.org
    Signed-off-by: Joerg Roedel <jroedel@suse.de>

Testing torvalds master (623f6dc593) with the containing merge 
(98bdc74b36) plus the DMA mapping merge (4e94d08734) reverted allows 
amdgpu + IOMMU + SME to once again work.

I think that nobody is really working on amdgpu + SME, but it would be a 
shame if it was supported and then incidentally broken by a small 
change.

I am using an ASRock B450 Pro4 with Ryzen 1600 and ASUS RX 480. I don't 
understand this code at all, but let me know what I can do to 
troubleshoot.

Thanks,
Alex.
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
