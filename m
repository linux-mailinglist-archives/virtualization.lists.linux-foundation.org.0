Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4C416033A
	for <lists.virtualization@lfdr.de>; Sun, 16 Feb 2020 10:50:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17E3985ABF;
	Sun, 16 Feb 2020 09:50:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YO9NgIzGqWzo; Sun, 16 Feb 2020 09:50:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C24C385D9B;
	Sun, 16 Feb 2020 09:50:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD52CC013E;
	Sun, 16 Feb 2020 09:50:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 97719C07FF
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 93DAC877AE
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:50:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2AkeKt7Bvqkz
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:50:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E2D9F877A0
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581846639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ib1DnkGh+UyvdqCLLKTPNNeMXjObgOPxob5BC7ny2no=;
 b=VSwqVpZbl6QxFsbC+nukY38p/CLGSC06mtbePs1RPeQUfYwGwHOnEHq3uBT+kZMR4VTNuP
 IV7EUdkzSdjbG08IMZ+BM6BdACRHQoxOL/xiQ1EJzWzODwwotZ6FD/ZayzDv4x4Ax1yeix
 gNnMcAZLp6Z9PgPxLW9+tI3JEMbbVOU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-HjmKTzo9OqWgZhh1fvzvcQ-1; Sun, 16 Feb 2020 04:50:37 -0500
Received: by mail-wr1-f70.google.com with SMTP id t3so7018111wrm.23
 for <virtualization@lists.linux-foundation.org>;
 Sun, 16 Feb 2020 01:50:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ib1DnkGh+UyvdqCLLKTPNNeMXjObgOPxob5BC7ny2no=;
 b=kYSmhwJIuQ72HMxMnqoTG+/ghK5IVhP5cbPcN1rNKiy/qPHO8j0bqUdHg2sOFsfooX
 vmF5IGGXLYCxFo+ZwFdFbsgoV2rDadzx0FqSwpZuR7giA0jgy+OTqX2Wf5baNPS1MrLY
 cbFdXxHTfbsUe7hP/WH1h2tl1i4wSq8RaU+r6eUOYoFJZLR2QYbcyNovyC3wChZWHtAN
 fy4/hSC/SAML3nCw5o7YncqNyu/83/u4TCa5Z4YXu+UiDe3px3LzHC7bPsjAFFNrNGe7
 q1mkROFYPbYKH7uJl40sF0o5F11tjmeIsT/rUctvHJIZL281nWh2Y9T5UnjoilT08eDB
 2z7Q==
X-Gm-Message-State: APjAAAXOtuA7KBXhZcHkssyEEB3a4zM/BZcNgDMZgeLgR5V7TLCSHiyB
 9+CYrs8ZymeSmcg1HtHKEGb0bqdyYWzwOPEJTv5FfaOAHy4VR0qkPba/FZQJ37qnUL5cR+q6jYP
 qnb1OAtUl+vMgNn3MXCBi7vDQTtUQZ+05TysTlwJ29A==
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr15618221wmj.1.1581846636736; 
 Sun, 16 Feb 2020 01:50:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNMrFQHqv71dSXZ95RCgwdZYNzMl1jbONDS4h2qzyUzW0mleNi/Wo/HmWAmrPfI1kdiDOM+g==
X-Received: by 2002:a05:600c:248:: with SMTP id 8mr15618205wmj.1.1581846636526; 
 Sun, 16 Feb 2020 01:50:36 -0800 (PST)
Received: from redhat.com (bzq-79-176-28-95.red.bezeqint.net. [79.176.28.95])
 by smtp.gmail.com with ESMTPSA id
 21sm15813973wmo.8.2020.02.16.01.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 01:50:35 -0800 (PST)
Date: Sun, 16 Feb 2020 04:50:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 3/3] iommu/virtio: Enable x86 support
Message-ID: <20200216045006-mutt-send-email-mst@kernel.org>
References: <20200214160413.1475396-1-jean-philippe@linaro.org>
 <20200214160413.1475396-4-jean-philippe@linaro.org>
 <311a1885-c619-3c8d-29dd-14fbfbf74898@arm.com>
MIME-Version: 1.0
In-Reply-To: <311a1885-c619-3c8d-29dd-14fbfbf74898@arm.com>
X-MC-Unique: HjmKTzo9OqWgZhh1fvzvcQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-pci@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 sebastien.boeuf@intel.com, jacob.jun.pan@intel.com, bhelgaas@google.com
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

On Fri, Feb 14, 2020 at 04:57:11PM +0000, Robin Murphy wrote:
> On 14/02/2020 4:04 pm, Jean-Philippe Brucker wrote:
> > With the built-in topology description in place, x86 platforms can now
> > use the virtio-iommu.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   drivers/iommu/Kconfig | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> > index 068d4e0e3541..adcbda44d473 100644
> > --- a/drivers/iommu/Kconfig
> > +++ b/drivers/iommu/Kconfig
> > @@ -508,8 +508,9 @@ config HYPERV_IOMMU
> >   config VIRTIO_IOMMU
> >   	bool "Virtio IOMMU driver"
> >   	depends on VIRTIO=y
> > -	depends on ARM64
> > +	depends on (ARM64 || X86)
> >   	select IOMMU_API
> > +	select IOMMU_DMA
> 
> Can that have an "if X86" for clarity? AIUI it's not necessary for
> virtio-iommu itself (and really shouldn't be), but is merely to satisfy the
> x86 arch code's expectation that IOMMU drivers bring their own DMA ops,
> right?
> 
> Robin.

In fact does not this work on any platform now?

> >   	select INTERVAL_TREE
> >   	help
> >   	  Para-virtualised IOMMU driver with virtio.
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
