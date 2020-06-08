Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD831F150C
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:09:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 196A9845DF;
	Mon,  8 Jun 2020 09:09:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1jchq7_kq-MI; Mon,  8 Jun 2020 09:09:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B5ED785C95;
	Mon,  8 Jun 2020 09:09:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 92552C016F;
	Mon,  8 Jun 2020 09:09:20 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1AFC9C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 15CFD2051B
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IJXyeQ2BqdQO
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:09:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 039CA20474
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591607356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1qzz8q0RXIAT8maH8NVpFy7idcd6AVSk1M7/8bU7JLI=;
 b=D4LT/baqbcWPedk3QGlS7jWP4d0okcBiYzu/WQ11icJo83gE4jg+V4nw536GJZLlEHpJYE
 hI4RQ0EiW2LhRJUFpfrNC/K2iEXBezWZuUiD3mlZBJSJXQ/vWMKx5YuYM4TDTVtbDC/Zxw
 1QP9slsclbp44ixBS/tNUUfl/VozpYk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-nG9wg8nxNiazh5JfHit60A-1; Mon, 08 Jun 2020 05:09:15 -0400
X-MC-Unique: nG9wg8nxNiazh5JfHit60A-1
Received: by mail-wm1-f70.google.com with SMTP id r1so1331835wmh.7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1qzz8q0RXIAT8maH8NVpFy7idcd6AVSk1M7/8bU7JLI=;
 b=LGO8w0xB/GtnhzIFQbSHaaIHsN7J2R9d+et70i0tLcR5KIb1myT6/Rw6rRlGmmO0tQ
 VGxJ1q7AGzUoWRI/OOASJ9bxZYZku9zKeKVPFM48EuwMwW8qyggVIgRTQNaqb0qh1J3s
 BP0OxvCQXSsiFbd3UC3hshOX2kBVQv9gb8s2DH6yS+Sy3NwdD9fi9PkFQoA10LKKIrJA
 q/c/ZMHvqExzI2HBlBzbXAufgmozTf3WYH2R0zES3KuyuR6fwH1eTbeEg5infPUKrb24
 v0nM5i/F2irhTkbt8jwQgvaC3cZE3azPDX4tAYkoZ2QPy5SScByizp11171BmTvm6gsY
 lDQQ==
X-Gm-Message-State: AOAM531YwLF/Pg43LD81wCjTdFvcnSqlvY93cD44o7YeGoa8qmrEM/TB
 FPfMjeLO9A4nTn8ZPG+nV3L6vGbdglV+9gfjFeunhuk9iVXI9tD61I2rxMTYX8RDCJpSZQlUyob
 A6nrM7tuFAboqqZtuK1Pw69x4/6FxxP9Iljj2IUtxtQ==
X-Received: by 2002:adf:a41a:: with SMTP id d26mr23153882wra.324.1591607354006; 
 Mon, 08 Jun 2020 02:09:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxk4C2kFKYGkG3pOjWAb4BdA7+bim0qD4WM5BHVhr/1qFiireNP/Iu0BJQYaiwNrt1nr7CEGA==
X-Received: by 2002:adf:a41a:: with SMTP id d26mr23153862wra.324.1591607353853; 
 Mon, 08 Jun 2020 02:09:13 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 u12sm23301667wrq.90.2020.06.08.02.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:09:13 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:09:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Subject: Re: [PATCH v3 0/5] Add a vhost RPMsg API
Message-ID: <20200608050757-mutt-send-email-mst@kernel.org>
References: <20200527180541.5570-1-guennadi.liakhovetski@linux.intel.com>
 <20200604151917-mutt-send-email-mst@kernel.org>
 <20200605063435.GA32302@ubuntu> <20200608073715.GA10562@ubuntu>
MIME-Version: 1.0
In-Reply-To: <20200608073715.GA10562@ubuntu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, kvm@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 virtualization@lists.linux-foundation.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 sound-open-firmware@alsa-project.org
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

On Mon, Jun 08, 2020 at 09:37:15AM +0200, Guennadi Liakhovetski wrote:
> Hi Michael,
> 
> On Fri, Jun 05, 2020 at 08:34:35AM +0200, Guennadi Liakhovetski wrote:
> > 
> > On Thu, Jun 04, 2020 at 03:23:37PM -0400, Michael S. Tsirkin wrote:
> 
> [snip]
> 
> > > Another it's out of line with 1.0 spec passing guest
> > > endian data around. Won't work if host and guest
> > > endian-ness do not match. Should pass eveything in LE and
> > > convert.
> > 
> > Yes, I have to fix this, thanks.
> 
> Just to make sure my understanding is correct: this would involve also 
> modifying the current virtio_rpmsg_bus.c implementation to add 
> endianness conversions. That's what you meant, right?
> 
> Thanks
> Guennadi

right and if there are legacy compat considerations, using _virtio16 and
friends types, as well as virtio16_to_cpu and friends functions.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
