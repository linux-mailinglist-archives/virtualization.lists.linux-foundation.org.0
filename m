Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D4A1D101C
	for <lists.virtualization@lfdr.de>; Wed, 13 May 2020 12:45:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9779885F92;
	Wed, 13 May 2020 10:45:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5g2KOJfq0nPZ; Wed, 13 May 2020 10:45:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E29386AB5;
	Wed, 13 May 2020 10:45:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04E4BC016F;
	Wed, 13 May 2020 10:45:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0D6B8C016F
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 10:45:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0509C21543
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 10:45:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzoCFuN6rioR
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 10:45:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 1286D207A9
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 10:45:49 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id u16so27907770wmc.5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 13 May 2020 03:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SmNmuU5Aep/IGe3eSTrjS6oLXRSTGYhw6IFWVs9Iuqc=;
 b=UC/3PHBoun3v1rx7wxmHxa5RFjjGfNLNpaCn6pfowgebDNYC32O8cp+YJHnvOEQaLk
 Nz+CjUwKVJxOPjAc+Am8F0hqrPMDiwM2aoGX5r90B7BN76cDKPh6nr/YlAAyxleAFf96
 NlJANIMYq5DpzZ6aRKewyuez8+MQkdZd9DSO/gtHi1WlvxunYaH+dufi8aFhaGuP+ph9
 zIeuSIUI2UQyBg6TbiMKe6swjsAYzSJuHyWPZUsJLZuCjKUsD55B1251N8tC3tLD40aj
 agDxckNYt6eUv6ydoTJ+56CrQqMMdERHKWIgm0l69OYmgLIINQMDX3EQTlKycym24/V8
 XC8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SmNmuU5Aep/IGe3eSTrjS6oLXRSTGYhw6IFWVs9Iuqc=;
 b=oEPNFLxv2kpquzh1G2OHa35rmAHUxO2gLoZ89CkroYUFhB6OAC2aMDhqGzy1RciY4F
 ENm9WKgkauuqVf02ZxUIhWuOaULu7PHqo3r3FwKC3Agln7kW2ycopC11dtF5AbuOJKin
 4+1vAYq2qPgWkT0gozbQI0kDW3FIYTtSTBEtG4hNFMFgVxP1eaP/IVvKTTKRQfPSHvOU
 bpPdLEAbzHQqlSTxVc+ldllhVgZxw9aAC5sKxl9BVB8ZnKDPQfl9m3206TZXm03Iw4lh
 nq2BHiKL5mqIPnkLDsFC2a7x1FI2N7CyD/x6Ldyqv0yGRQDQNR+Qsw3nzjgmhTCbF3UT
 g33w==
X-Gm-Message-State: AGi0PuZNFggoq/H5XP1QzFmDpNGYGekhIz275R/MUaVT2WMXatcsfC0I
 yWIUALdVzVNmyitZ+zksjvJGGA==
X-Google-Smtp-Source: APiQypJmft0/u1tO86sQKhZsj1C97uNs/XnCzX9fNiwnwt1E0uNsNm62LaV0mFWoR6TcsuBFsKHelA==
X-Received: by 2002:a1c:3c42:: with SMTP id j63mr39555553wma.118.1589366747407; 
 Wed, 13 May 2020 03:45:47 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id g135sm17966353wme.22.2020.05.13.03.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 03:45:46 -0700 (PDT)
Date: Wed, 13 May 2020 12:45:37 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Bharat Bhushan <bbhushan2@marvell.com>
Subject: Re: [EXT] Re: [PATCH v5] iommu/virtio: Use page size bitmap
 supported by endpoint
Message-ID: <20200513104537.GB214296@myrica>
References: <20200505093004.1935-1-bbhushan2@marvell.com>
 <20200505200659-mutt-send-email-mst@kernel.org>
 <MWHPR1801MB1966A23A0298654CA6965FB9E3BF0@MWHPR1801MB1966.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR1801MB1966A23A0298654CA6965FB9E3BF0@MWHPR1801MB1966.namprd18.prod.outlook.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, "joro@8bytes.org" <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
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

On Wed, May 13, 2020 at 09:15:22AM +0000, Bharat Bhushan wrote:
> Hi Jean,
> 
> > -----Original Message-----
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Wednesday, May 6, 2020 5:53 AM
> > To: Bharat Bhushan <bbhushan2@marvell.com>
> > Cc: jean-philippe@linaro.org; joro@8bytes.org; jasowang@redhat.com;
> > virtualization@lists.linux-foundation.org; iommu@lists.linux-foundation.org;
> > linux-kernel@vger.kernel.org; eric.auger.pro@gmail.com; eric.auger@redhat.com
> > Subject: [EXT] Re: [PATCH v5] iommu/virtio: Use page size bitmap supported by
> > endpoint
[...]
> > > +struct virtio_iommu_probe_pgsize_mask {
> > > +	struct virtio_iommu_probe_property	head;
> > > +	__u8					reserved[4];
> > > +	__le64					pgsize_bitmap;
> > > +};
> > > +
> > 
> > This is UAPI. Document the format of pgsize_bitmap please.
> 
> I do not see uapi documentation in "Documentation" folder of other data struct in this file, am I missing something?

I'm not the one requesting this change, but I'm guessing you should add a
comment in this header, above pgsize_bitmap (which should actually be
called page_size_mask to follow the spec). I guess I'd add:

/* Same format as virtio_iommu_config::page_size_mask */

for this field, and then maybe change the comment of virtio_iommu_config,
currently "/* Supported page sizes */", to something more precise such as:

/*
 * Bitmap of supported page sizes. The least significant bit indicates the
 * smallest granularity and the other bits are hints indicating optimal
 * block sizes.
 */

But I don't know how much should be spelled out here, since those details
are available in the spec.

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
