Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AA7276C0A
	for <lists.virtualization@lfdr.de>; Thu, 24 Sep 2020 10:33:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 323D785CE2;
	Thu, 24 Sep 2020 08:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13PcOjkbO4cw; Thu, 24 Sep 2020 08:33:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 614C68672A;
	Thu, 24 Sep 2020 08:33:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 530EEC0051;
	Thu, 24 Sep 2020 08:33:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D0C9C0051
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 802452E0B5
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyeJ4qRo-b2Z
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:33:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 7D4111FF11
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 08:33:26 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id i26so3237206ejb.12
 for <virtualization@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jyXmkIgY0LNWFTzPLGPT01v9MPN/PKXL0sjKcC6NB5g=;
 b=CULJWZFlgtyrSKeuahx3NPP/IQeQHLWNP8sKhd/TwHs5cpEaqDxw+LVFhTKOm0yEmY
 MfRKM2j7Sg36BSoSSwKL7rvZfAM062viSliCHU57QOQnzPQN2ktici8ihBklwEWk++eL
 Ot6kNZ7vfkYyYTjHlPPusxYSKQSiR1nVKwbVCNowjDAaKoOBhiq1xS2vENWcXMdlm3xL
 ydtMMXz79lVvlL0gZOQMYSdGv8H2GZCjOQgPAoYGjR8p3unq0JmlAR3GPxS5evLUuZKY
 m3Dk4vu1WmwzEl2x6DKPnhByC+J3HO4PdOvZbOOcVw5AT9p/dK+u5XqWvop1s1ra1hT3
 ZKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jyXmkIgY0LNWFTzPLGPT01v9MPN/PKXL0sjKcC6NB5g=;
 b=fqCyEzV4INi67kT4+l5z1auCmtEykHYY0hLyTsic8WZHlzrdd08d/1cqphzFYIFF/A
 6N+r58BwMBIHvmjGD0U0yL4o9VUEtCW/u24tjGucgm2rt5PYdgs+Aax0dcZb1nlc1nPQ
 QzqsH+188NDshfanN0DWuU+FPPFYaQAkce2QG8kB8OZtA+9Vr4uZroV8ygpwohPWDkWq
 bEmvqttn96X8CBIPQaQUv7i3KA0auDu+pICPg11yYty5+mhrtuDHcL6s7JjiHRRUxdth
 Q8lIp5y/WRiKk1NC839rRDHE5fcdNICbShnIFLo1d7MCBw72X61K/ftxrHICfRAgTQqS
 9aQg==
X-Gm-Message-State: AOAM5337HutDFgTK595fDtJdAQwb/qB/FKKVv2oUkQXfUw/hj3NIm5LE
 fnHHDGHYK9fAV2ixXhnXcr2NeA==
X-Google-Smtp-Source: ABdhPJxtcrA4yjr/ahtgkewCxLx0mpHJ/7gjeE+jRO7iJDqgqZNqa+39Vg+vRpg/TCfzV39dzZhP/Q==
X-Received: by 2002:a17:906:a1d4:: with SMTP id
 bx20mr3417412ejb.262.1600936404738; 
 Thu, 24 Sep 2020 01:33:24 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id a5sm2091593edb.9.2020.09.24.01.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 01:33:24 -0700 (PDT)
Date: Thu, 24 Sep 2020 10:33:06 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v3 5/6] iommu/virtio: Support topology description in
 config space
Message-ID: <20200924083306.GB170808@myrica>
References: <20200821131540.2801801-1-jean-philippe@linaro.org>
 <20200821131540.2801801-6-jean-philippe@linaro.org>
 <a52f8a2e-3453-eadf-9761-fd92a20c20f5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a52f8a2e-3453-eadf-9761-fd92a20c20f5@redhat.com>
Cc: virtio-dev@lists.oasis-open.org, lorenzo.pieralisi@arm.com, mst@redhat.com,
 linux-pci@vger.kernel.org, joro@8bytes.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, bhelgaas@google.com
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

On Fri, Sep 04, 2020 at 06:05:35PM +0200, Auger Eric wrote:
> > +static inline int viommu_pci_find_capability(struct pci_dev *dev, u8 cfg_type,
> > +					     struct viommu_cap_config *cap)
> not sure the inline is useful here

No, I'll drop it

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
