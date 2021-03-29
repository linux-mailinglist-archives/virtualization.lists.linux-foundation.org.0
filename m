Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id A844434D504
	for <lists.virtualization@lfdr.de>; Mon, 29 Mar 2021 18:26:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5117440142;
	Mon, 29 Mar 2021 16:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TRamVZaibd-t; Mon, 29 Mar 2021 16:26:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27A2B4012E;
	Mon, 29 Mar 2021 16:26:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ADAE0C000A;
	Mon, 29 Mar 2021 16:26:11 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E1339C000A
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 16:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF8FB4012E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 16:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFPZ-BN574bR
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 16:26:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EE1C40125
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 16:26:09 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id x7so13463658wrw.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=T74W0nsf8Eu00PANoOWWFVGfSYum6qWwsn0Bw2THZ+s=;
 b=YUIEgiI1qQRI29mfubywR7B14Uyqk60nwvE2KF7gqROs2K/Or1NYVxhiZL1RMZ9LIb
 sxYMJOnaFcJ3QryDjmsfpUP4evW0yxJ3rw8eNH8PHzeO+fHHzIgI/Y0wybDi44c6cS0p
 QD0Yt7+edAu6/oJ0axLyyHLhGCJaiV+68wfh48hVfETIQjrodfMWWyd+Il3hV/R+JQ4o
 cyRYUBscybFXnPjsct6pzbq61epkXDbc8+yQhoNk/cjCgWp2QmhEqfFS91Bxoq0/v6At
 TaRW1iDGlxWbVJKNyQv0AhTpMf6zO8lTwMDtFHfw9Hf03gYJdaNK09LuH1HAz/RAPwuU
 eMaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T74W0nsf8Eu00PANoOWWFVGfSYum6qWwsn0Bw2THZ+s=;
 b=XXAKFtFRxNiuQ+0w+iO2nwR2xjbksar6TSZc1lIhkOw0B4Q4zdwOWKrwvVHrjdxZNB
 hsx8KXh+SXeoIX6OoRRAlNIrJL/PhWyL96nS5F1CeYK+IOUhI9Aud8jYgw3QjUpLl5co
 owiKWXHYcttjAA6jItyQBSk9UqIaTue6NiUYR8+1BRGECQgApfXzrzdq3Y+wjLtYi4hG
 tswnW8+iRIQzRrBKq8zfFLIfzLUE7pwLE/nsNXsEVdfeq04Bqesd212tN9Xz7z23n7cu
 AYPf2VcF1e+z2UhjejndfNgx9MA9Pai/ZuWvFyB6DTgY/QBQ+05OalORrDdRtzxmzZR1
 bYXw==
X-Gm-Message-State: AOAM533xociI9yuafNskIYcHCj7+U5pBYnCTCh/47o6r3Q7Q9nODenQS
 vQavh5IffuAvrJAx/ZJI8Q580g==
X-Google-Smtp-Source: ABdhPJyAv1xefDsH4RnBTD3wTIb5bRlvWKvplwmh2Mjf9I5mC7dc85r3sKdv9DNWLYwkDvTL7Er6sg==
X-Received: by 2002:a05:6000:18d2:: with SMTP id
 w18mr29581974wrq.88.1617035167386; 
 Mon, 29 Mar 2021 09:26:07 -0700 (PDT)
Received: from myrica ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id m3sm30135465wme.40.2021.03.29.09.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 09:26:07 -0700 (PDT)
Date: Mon, 29 Mar 2021 18:25:48 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Vivek Kumar Gautam <vivek.gautam@arm.com>
Subject: Re: [PATCH RFC v1 02/15] iommu: Add a simple PASID table library
Message-ID: <YGH/jJPeG9ltT8uu@myrica>
References: <20210115121342.15093-1-vivek.gautam@arm.com>
 <20210115121342.15093-3-vivek.gautam@arm.com>
 <YD/DU8XNYHlTzTay@myrica>
 <cd030006-2701-206d-5fca-e0e7afff316a@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd030006-2701-206d-5fca-e0e7afff316a@arm.com>
X-TUID: 5GTwZm4l3gMS
Cc: jacob.jun.pan@linux.intel.com, mst@redhat.com, joro@8bytes.org,
 will.deacon@arm.com, linux-kernel@vger.kernel.org,
 shameerali.kolothum.thodi@huawei.com,
 virtualization@lists.linux-foundation.org, eric.auger@redhat.com,
 iommu@lists.linux-foundation.org, yi.l.liu@intel.com,
 lorenzo.pieralisi@arm.com, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org
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

On Fri, Mar 12, 2021 at 06:17:55PM +0530, Vivek Kumar Gautam wrote:
> > Regarding the overall design, I was initially assigning page directories
> > instead of whole PASID tables, which would simplify the driver and host
> > implementation. A major complication, however, is SMMUv3 accesses PASID
> > tables using a guest-physical address, so there is a messy negotiation
> > needed between host and guest when the host needs to allocate PASID
> > tables. Plus vSMMU needs PASID table assignment, so that's what the host
> > driver will implement.
> 
> By assigning the page directories, you mean setting up just the stage-1 page
> table ops, and passing that information to the host using ATTACH_TABLE?

Yes. And we can support nested translation with SMMUv2 that way. But with
SMMUv3 the guest has to manage the whole PASID table.

> Right now when using kvmtool, the struct iommu_pasid_table_config is
> populated with the correct information, and this whole memory is mapped
> between host and guest by creating a mem bank using
> kvm__for_each_mem_bank().
> Did I get you or did I fail terribly in understanding the point you are
> making here?

Makes sense

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
