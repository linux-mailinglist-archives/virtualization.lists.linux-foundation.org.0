Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FCC360E4B
	for <lists.virtualization@lfdr.de>; Thu, 15 Apr 2021 17:14:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8F6F83BF1;
	Thu, 15 Apr 2021 15:14:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8yg4On87dBK; Thu, 15 Apr 2021 15:14:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4D1284759;
	Thu, 15 Apr 2021 15:14:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B432C000A;
	Thu, 15 Apr 2021 15:14:39 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01385C000A
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:14:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E30E1606FF
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:14:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ifiWLuBtGqmC
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:14:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9FB3B605E6
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 15:14:35 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id w3so37451271ejc.4
 for <virtualization@lists.linux-foundation.org>;
 Thu, 15 Apr 2021 08:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jqtDHjyGp8glZULp1bf2Fq7JNPjH6B0xPTqIRRY0Vf8=;
 b=Su9JjJ2DVw939t0pkGaDodcmBB0LfGVIA7EqtWYA+JDZL6IUJt9WzpYd+TVbmfGDve
 Xkc9Qc/sx3wCD57Q8wezmrLxxOmL+TuVAH5BzBdSAOAeC1i+T5aZpMHxTD2QThxvDVtN
 FAXHpjYdJCn861GPL+yEilgLS3Jpz2bN2Uk/ZDt2SYqWMxe9ar88zoEGdxu1bhEKppM9
 8bqqS4l6VToBIZ1oCDVBICa4D4T/EfL52whwC2FwHEqT4YXTGol3Qdeegdf4qo7UdEF3
 qdcRJRUXT9fzTVuPEiT10aLKkglzTkWbDr3WULjFvShmtcHyMv6QCIok0VlZ+ZjXgidt
 gsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jqtDHjyGp8glZULp1bf2Fq7JNPjH6B0xPTqIRRY0Vf8=;
 b=ALgzwgkNmzqKY3n4A1SAS0kG7k/L+r53NcpXE9FjT3Ae+d40wwTql0UOVF6ZNvviyw
 pcsHkSayDg9ytDqfEth1/QkDa+oegNu9kvJm0bytZ8ct81QIJUTysllKMLrg3nfDmyvz
 R3hFUn1vhAtZZMOkSYUab1ticoD/u64cD8dpmVj350QC+3s8O2tliSPNUA3CQ/Nx5+8H
 C9haO4mVyy5X90JhgyKz7lhZaAzOtWJU2nX6chGt/ZoqkGwS+TTfQqVD5R/XE2xFDrrv
 odHBas1JBRLpjQuhGIPl4tX/DwKn18sGcNvRfpH/tUw8Fx1S0+yhMnL5NSkH9z3R8QLB
 LG7Q==
X-Gm-Message-State: AOAM530Nai5ZausSBHyUH+xm1vehyKzuuQg3JwoU88a/7qq6yieFeOvK
 SawRe7u2j+xoKkI98eimKzF1+Q==
X-Google-Smtp-Source: ABdhPJzHQ/B5VFA6RKe5yV0g+kYRtxE0OHiWFPsrsA4mNSUD1awk9FIgvIDi9Gm/28MC3cEU5uG19A==
X-Received: by 2002:a17:906:6dd9:: with SMTP id
 j25mr3863285ejt.507.1618499673911; 
 Thu, 15 Apr 2021 08:14:33 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id m5sm2783111edi.52.2021.04.15.08.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 08:14:33 -0700 (PDT)
Date: Thu, 15 Apr 2021 17:14:13 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
Message-ID: <YHhYRQlDdCLfmDnf@myrica>
References: <20210316191652.3401335-1-jean-philippe@linaro.org>
 <20210316191652.3401335-4-jean-philippe@linaro.org>
 <2d57860b-8a1c-f345-1105-62680c003fb5@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2d57860b-8a1c-f345-1105-62680c003fb5@arm.com>
Cc: lorenzo.pieralisi@arm.com, mst@redhat.com, joro@8bytes.org,
 rjw@rjwysocki.net, virtualization@lists.linux-foundation.org,
 linux-acpi@vger.kernel.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, eric.auger@redhat.com, will@kernel.org,
 lenb@kernel.org
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

On Thu, Mar 18, 2021 at 11:43:38AM +0000, Robin Murphy wrote:
> On 2021-03-16 19:16, Jean-Philippe Brucker wrote:
> > With the VIOT support in place, x86 platforms can now use the
> > virtio-iommu.
> > 
> > The arm64 Kconfig selects IOMMU_DMA, while x86 IOMMU drivers select it
> > themselves.
> 
> Actually, now that both AMD and Intel are converted over, maybe it's finally
> time to punt that to x86 arch code to match arm64?

x86 also has CONFIG_HYPERV_IOMMU that doesn't use IOMMU_DMA, and might not
want to pull in dma-iommu.o + iova.o (don't know if they care about guest
size). There also is the old gart driver, but that doesn't select
IOMMU_SUPPORT. 

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
