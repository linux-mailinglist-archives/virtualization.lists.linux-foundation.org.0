Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9C11BCD97
	for <lists.virtualization@lfdr.de>; Tue, 28 Apr 2020 22:41:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 803DD81A1A;
	Tue, 28 Apr 2020 20:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I3jYEIxDQSsl; Tue, 28 Apr 2020 20:41:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D031B867C6;
	Tue, 28 Apr 2020 20:41:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6FA5C0172;
	Tue, 28 Apr 2020 20:41:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2D8E8C0172
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 294F8875A7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIzQeuP5Uo8C
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:41:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7E3368753F
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 20:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588106471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4eENH6tB0EGZ/BA2dzhb17ThkK45wZijHpRT5Rx0P7Q=;
 b=XGrwQTpu8pFriydV1NgZDH0yBZpe9wwndwTZClFps71bZnTf7NG9BkbtrFytEmF/aBJbOv
 pAIStCYapt0TkY8Ye4VlR86LXPitdO4QNZNCJ3c38LWX9osQQux3XiVEEOGDd9AEW4Jt3L
 xXZBp9/KC+kC3d8njgpvXgrbOoAKix8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-7DHqntUOOXiFs9zabf3Ccw-1; Tue, 28 Apr 2020 16:41:09 -0400
X-MC-Unique: 7DHqntUOOXiFs9zabf3Ccw-1
Received: by mail-wm1-f71.google.com with SMTP id h6so26032wmi.7
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 13:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4eENH6tB0EGZ/BA2dzhb17ThkK45wZijHpRT5Rx0P7Q=;
 b=rgM627IkBZdhFmGlj2U/EuQ5foQp1NO8/CbGKCRW7gqjyQxAc3hMAM1I5iogGTCzxj
 ABSMK9hsnf6SAR2WJHhEtWlyiN8HYFZU0x4i+/QKPFIEN65/2CcZgnOfWipx041NR3Ig
 FaMKLcFfR3Wet6lElbcqRYhnw8D+vR41qyIPnL+nMq1PXVMccH/LuCOQ0ejSIBxjQzOA
 35+ejykwbUJjR3QI2e2XtaaGPVhUitXUmiFn2Yv9y75vsFMbiyHv5b6BAiM6Zizx0IzX
 PWqN1aSseEGNtGqa8H0vf9tEPezysYyIt/Ir1WVFZBVKN9TvrqQFIYNeWxFs/8b4tTvp
 U3vA==
X-Gm-Message-State: AGi0PuYZI/bNs+kpHQi8BM2UHMmjlDEjvzcfntaq73KUXJR6Ds+wuVui
 O92iam4fxbGnnhO4JLgNh6kD+BG81kYwbvQ04S1sLWkZGFa8nRu95QA38k0lnVHMMS5AcUBw0en
 1GkYCpmosm9e5K7w2UJt8w2zhcO/6schujqfFk8ECmA==
X-Received: by 2002:adf:a3d5:: with SMTP id m21mr35941312wrb.54.1588106468428; 
 Tue, 28 Apr 2020 13:41:08 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ29J3wRFwAKcd5VfgZy6d80BpVLKwPqj7y7vEzsoMHleANkL6oMYbQYlmbWERgm90rIizbxg==
X-Received: by 2002:adf:a3d5:: with SMTP id m21mr35941287wrb.54.1588106468180; 
 Tue, 28 Apr 2020 13:41:08 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 33sm27359373wrp.5.2020.04.28.13.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 13:41:07 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:41:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200428163448-mutt-send-email-mst@kernel.org>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20200428174952.GA5097@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, will@kernel.org, linux-kernel@vger.kernel.org,
 pratikp@codeaurora.org
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

On Tue, Apr 28, 2020 at 11:19:52PM +0530, Srivatsa Vaddagiri wrote:
> * Michael S. Tsirkin <mst@redhat.com> [2020-04-28 12:17:57]:
> 
> > Okay, but how is all this virtio specific?  For example, why not allow
> > separate swiotlbs for any type of device?
> > For example, this might make sense if a given device is from a
> > different, less trusted vendor.
> 
> Is swiotlb commonly used for multiple devices that may be on different trust
> boundaries (and not behind a hardware iommu)?

Even a hardware iommu does not imply a 100% security from malicious
hardware. First lots of people use iommu=pt for performance reasons.
Second even without pt, unmaps are often batched, and sub-page buffers
might be used for DMA, so we are not 100% protected at all times.


> If so, then yes it sounds like a
> good application of multiple swiotlb pools.
> 
> > All this can then maybe be hidden behind the DMA API.
> 
> Won't we still need some changes to virtio to make use of its own pool (to
> bounce buffers)? Something similar to its own DMA ops proposed in this patch?

If you are doing this for all devices, you need to either find a way
to do this without chaning DMA ops, or by doing some automatic change
to all drivers.


> > > +void virtio_bounce_set_dma_ops(struct virtio_device *vdev)
> > > +{
> > > +	if (!bounce_buf_paddr)
> > > +		return;
> > > +
> > > +	set_dma_ops(vdev->dev.parent, &virtio_dma_ops);
> > 
> > 
> > I don't think DMA API maintainers will be happy with new users
> > of set_dma_ops.
> 
> Is there an alternate API that is more preffered?

all this is supposed to be part of DMA API itself. new drivers aren't
supposed to have custom DMA ops.

> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
