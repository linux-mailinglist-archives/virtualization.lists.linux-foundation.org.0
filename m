Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F38C1CFB41
	for <lists.virtualization@lfdr.de>; Tue, 12 May 2020 18:47:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5805B87566;
	Tue, 12 May 2020 16:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CoJqlMAgM2ZL; Tue, 12 May 2020 16:47:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C83A0874D2;
	Tue, 12 May 2020 16:47:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B51C8C0893;
	Tue, 12 May 2020 16:47:17 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C95ABC016F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 16:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C590888558
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 16:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zA9D3CApj2Gd
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 16:47:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED99E8853F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 16:47:14 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z72so14620303wmc.2
 for <virtualization@lists.linux-foundation.org>;
 Tue, 12 May 2020 09:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jyNo/FD8DQaK2ucnwvUAdPJG4owWhdE2wKYx5rVGxYI=;
 b=clatA++vihr5sTI7dUupzacVS/N7lCVLYB3yV/N5dBG1B2tTi3SyMIL+AT9rTNF4RM
 whaaPPqLKdjztbhQ6G88AUdB+KZ6RgutaBFsYMakAU5CewEq5W5Z2IKQNcDNtMNOdJia
 S+Wi+0vcoouQSemfz+P2d3pyqaWJGMB1Teackt4osIMCTle/Q/wCH0Ojbm5v82RWocy0
 gxsD8/lNkUdxZjnAAheAO7kqpIMxV9U2axJMnC1aeKnEubwnt8djZJ4/U1FMtzNtqjSj
 9bb/GI48q0BZqY/mg0V1iXr6dJRTXCAScM395uW6IHfakeiexg7rOaqobfoR4E0ezkNz
 gIMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jyNo/FD8DQaK2ucnwvUAdPJG4owWhdE2wKYx5rVGxYI=;
 b=g86EUMig9gSI+4FqgIX1XbQVcBeqj7DDS6LzOMfFi+P/0cEXoU6YMNDqk9hDT9N7nd
 EiChWiPJpFyz9Au85SV2sDLoya/jGbDYPFLBM0wcVM1sAc/YKq4f2byh2yqiQqtxqYvl
 tfWFmrnkf82dxxoFmx7JqewCsB1DbEHSe7PGBuaujnn3P7DZlWiFdMypByNEJhrCyrJV
 hIo4oYdBhRuNrGsPM4bvSXPaOLmGClploS0HHDKz/GylX1Z9HK3zlooEkl045uZz5BQ/
 kuY0xuPZ1KqwP0jR1g3q8zAhNNMJPO914Ort4grzDMFDThyg7+J0X/F+QopPdg5XdDmv
 sEcg==
X-Gm-Message-State: AGi0PuYq5C+44M1ttzykzLMe9/bxCZGlvQtTI/kjHiZdDhMn591yDPfu
 GC/MtQaqtnxF0/wY1oNa4X+7bA==
X-Google-Smtp-Source: APiQypK91Q773XCjNUOrLaxJtSW2iijZMl+ZhfoxDdGoHWSVwaGxx48FOaDpn4r3TPN8Hn4Crs5OJA==
X-Received: by 2002:a1c:e903:: with SMTP id q3mr36930985wmc.76.1589302033401; 
 Tue, 12 May 2020 09:47:13 -0700 (PDT)
Received: from myrica ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id a8sm23851429wrg.85.2020.05.12.09.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 09:47:12 -0700 (PDT)
Date: Tue, 12 May 2020 18:47:03 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5] iommu/virtio: Use page size bitmap supported by
 endpoint
Message-ID: <20200512164703.GA1902@myrica>
References: <20200505093004.1935-1-bbhushan2@marvell.com>
 <20200512105149-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200512105149-mutt-send-email-mst@kernel.org>
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 eric.auger@redhat.com, iommu@lists.linux-foundation.org,
 Bharat Bhushan <bbhushan2@marvell.com>, joro@8bytes.org,
 eric.auger.pro@gmail.com
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

On Tue, May 12, 2020 at 10:53:39AM -0400, Michael S. Tsirkin wrote:
> >  static int viommu_add_resv_mem(struct viommu_endpoint *vdev,
> >  			       struct virtio_iommu_probe_resv_mem *mem,
> >  			       size_t len)
> > @@ -499,6 +513,9 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
> >  		case VIRTIO_IOMMU_PROBE_T_RESV_MEM:
> >  			ret = viommu_add_resv_mem(vdev, (void *)prop, len);
> >  			break;
> > +		case VIRTIO_IOMMU_PROBE_T_PAGE_SIZE_MASK:
> > +			ret = viommu_set_pgsize_bitmap(vdev, (void *)prop, len);
> > +			break;
> >  		default:
> >  			dev_err(dev, "unknown viommu prop 0x%x\n", type);
> >  		}
> 
> So given this is necessary early in boot, how about we
> add this in the config space? And maybe ACPI too ...

A page_size_mask field is already in the config space and applies to all
endpoints. Here we add a property to override the global value for
individual endpoints. It can be necessary when mixing physical (pass-
through) and virtual endpoints under the same virtio-iommu device.

Thanks,
Jean
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
