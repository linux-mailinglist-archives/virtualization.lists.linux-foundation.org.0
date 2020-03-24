Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A06E91905E6
	for <lists.virtualization@lfdr.de>; Tue, 24 Mar 2020 07:48:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CCAA587880;
	Tue, 24 Mar 2020 06:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k+axl2wQq4yE; Tue, 24 Mar 2020 06:48:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E227E878C0;
	Tue, 24 Mar 2020 06:48:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A9C2EC0177;
	Tue, 24 Mar 2020 06:48:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C26FCC0177
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 06:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A9886864CD
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 06:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1Fs94l6YlMv
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 06:48:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4578086008
 for <virtualization@lists.linux-foundation.org>;
 Tue, 24 Mar 2020 06:48:21 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d198so1993353wmd.0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 23 Mar 2020 23:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pM79P8WLUvqTpjnBcVWxWm+du1cmnhFRqw1TS0kYTjU=;
 b=vtNjrGJ2nV7JntUhJh8mAha08p5hAxg0iZENC9BJ9ptrRCuc8l4oq4IKDFx3Ther+N
 8MDSzEgcpcUmDg2jLaoCaAZ4xMhLRsnqaXQbv6UMyIEgpuRzVGlF9c3NnkpPaz1jVHoo
 bPCLpN+aZbpT/1POqokaFP6aHNZmryOkvDp/mAHGztxhYgethYpzWfs4/xfgr52JHNO9
 CFFBSxKCw8IG//RB6MWn7Jd9XiyVvcYAqBIpiulsJkn/DochfYKLzDHCHCyyQvCX8mYs
 HsmoCZJDBLvICAdpAZOoGnic+yf9JoMkjBhb0Fq7QFPgUD25YAGV4cFWbALW7glduuL4
 +LQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pM79P8WLUvqTpjnBcVWxWm+du1cmnhFRqw1TS0kYTjU=;
 b=GsfTEnjMvOPveJAlZm3MAVQXl5YgdYeVJgHyJcwPLxjaaOtIhhKg4y4xOn6Z3oQfl4
 u8iQtqBuLx8gHYNsOlw8uXVm+w9YK8G1tM7Gfxmf2XiluGfgLEYGXQwlrsHdwC13spwa
 8smW1ur23hwJ/b2EgsRXN6ATuQIYK0392e5jNlEAvH/bpMZS/8Y9n7+hAZN/iTB7rzoq
 Ae+L3Tg6xEJvswZ0u1llMLEaqZiurfltS8cfz39haCyVtADmRNvlPrcBll70veyVZGFX
 UnTHh2/jGuaDNxfvDOTMwIBSc0ndR0CGBswtgZTntO/VXYeqK12HFOA2iUto2mfex4KD
 mDgQ==
X-Gm-Message-State: ANhLgQ3Sn+swHVsNjQGMMLT7h3AIjj6PaenTDBuZ4qc5BDHIlrsgQkOC
 EGw09LdPMwF5hCs+v/tPMVFceQ==
X-Google-Smtp-Source: ADFU+vvXbZf7pds9tOsbx7NvWduS1GM+4eKvdA5SFYqYs8l7wPtutVQWw/JqWZa6EfWb8l/nwFtC+g==
X-Received: by 2002:a1c:4e0f:: with SMTP id g15mr3817814wmh.163.1585032499527; 
 Mon, 23 Mar 2020 23:48:19 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y5sm2905739wmi.34.2020.03.23.23.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 23:48:18 -0700 (PDT)
Date: Tue, 24 Mar 2020 07:48:11 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [EXT] Re: [PATCH RFC] iommu/virtio: Use page size bitmap
 supported by endpoint
Message-ID: <20200324064811.GA2173442@myrica>
References: <20200323084108.1721-1-bbhushan2@marvell.com>
 <20200323095943.GA2038940@myrica>
 <MWHPR1801MB1966865A8DE5AB8FFFAEC85FE3F00@MWHPR1801MB1966.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR1801MB1966865A8DE5AB8FFFAEC85FE3F00@MWHPR1801MB1966.namprd18.prod.outlook.com>
Cc: "mst@redhat.com" <mst@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

On Mon, Mar 23, 2020 at 06:04:37PM +0000, Bharat Bhushan wrote:
> > > -static int viommu_domain_finalise(struct viommu_dev *viommu,
> > > +static int viommu_domain_finalise(struct viommu_endpoint *vdev,
> > >  				  struct iommu_domain *domain)
> > >  {
> > >  	int ret;
> > >  	struct viommu_domain *vdomain = to_viommu_domain(domain);
> > > +	struct viommu_dev *viommu = vdev->viommu;
> > >
> > >  	vdomain->viommu		= viommu;
> > >  	vdomain->map_flags	= viommu->map_flags;
> > >
> > > -	domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> > > +	if (vdev->pgsize_bitmap)
> > > +		domain->pgsize_bitmap = vdev->pgsize_bitmap;
> > > +	else
> > > +		domain->pgsize_bitmap	= viommu->pgsize_bitmap;
> > > +
> > 
> > nit: it could be nicer to initialize vdev->pgsize_bitmap in add_device(),
> 
> To what size we should initialize in add_device, PAGE_SIZE?

No to viommu->pgsize_bitmap

Thanks,
Jean

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
