Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D391BD510
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 08:50:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8CFF888303;
	Wed, 29 Apr 2020 06:50:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vuex4OHU88fY; Wed, 29 Apr 2020 06:50:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 94DB28832D;
	Wed, 29 Apr 2020 06:50:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B63DC0865;
	Wed, 29 Apr 2020 06:50:55 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 120BFC0865
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 06:50:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0079188303
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 06:50:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S+dfs0Vd2FfB
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 06:50:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0084388187
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588143050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6znVgwkady/qyUcC0Ymv6eZmqJfdKpDAylZrbci5xI=;
 b=Um5htUAJ2VZu8FyejF842iCCwuyts9inT3FCYOoTD9gvb2UezeHOJztRHJCjTUZvFyM8iq
 yzL0aiTa/21rV4PX0RIK/PKhzMUClAiy8aimo3/DHq4m/6Zl1nRHiO2cikFxzc0wsgfyeR
 KUE5+PTCmPlMD0YQkesPbRAazsycJ30=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-2ldGeLjWP9-Ffba6ac1e7w-1; Wed, 29 Apr 2020 02:50:47 -0400
X-MC-Unique: 2ldGeLjWP9-Ffba6ac1e7w-1
Received: by mail-wr1-f70.google.com with SMTP id x15so1262841wrn.0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 28 Apr 2020 23:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n6znVgwkady/qyUcC0Ymv6eZmqJfdKpDAylZrbci5xI=;
 b=oJC12C4gfjFOzS35xCbPzS8hh/btsFa42sJoDsRH84zr4ns11fLkPUmH4gBUnvX/qi
 Ipva6bcawlsrq9GoUYw1kCPjnee85KwFH+vOQZoxxjAtOrvO6UhuvZEeUo8jlOQoVs00
 KfSxGJY5rlcJ3tYXhc8uKJZH1qOggPL1majyhuQamFbjIWEMU76X7NPPp8WrKLHqeEOQ
 lgj8MSXZJflrmSXpth1yxoIYMroRZ+udFK64B7cZFkzQ4RN3F2Pcl1szyN+93EOFiBh/
 0tjMBAZJ9fDm99qFEyhV48MfRO+CyHWWWvEygW5VGmhlVeV6TJWrzZNmnJzbwz6bGv97
 aI/g==
X-Gm-Message-State: AGi0PuZTjRlzqlEEggtLCNrW5RJm/K3ikAenHv2jJDAWSQxDr7IQOTcd
 5cY5uFXWg3TKMk5Sj9ZtX4E3m0W1/8ZlvCxY44QzIXABPhmF0ixa6QqdmnbOw+Xd2Las/h7BPbp
 t1ih/FnsazjDkRW8x9XmKAv0iARscjAKs4p+WHtKmNw==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr35944456wrn.176.1588143046016; 
 Tue, 28 Apr 2020 23:50:46 -0700 (PDT)
X-Google-Smtp-Source: APiQypKU82H1b9Eisqn07oeKyQe6zR7NModgo5aa23/Lf5/4LUDkNy1nlXScGKG6HiNZbbe2ek65jg==
X-Received: by 2002:adf:ee05:: with SMTP id y5mr35944419wrn.176.1588143045703; 
 Tue, 28 Apr 2020 23:50:45 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 g74sm6479515wme.44.2020.04.28.23.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 23:50:44 -0700 (PDT)
Date: Wed, 29 Apr 2020 02:50:41 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200429023842-mutt-send-email-mst@kernel.org>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
 <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
 <20200429004531-mutt-send-email-mst@kernel.org>
 <b676430c-65b3-096e-ca48-ceebf10f4b28@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <b676430c-65b3-096e-ca48-ceebf10f4b28@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org, will@kernel.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com,
 Srivatsa Vaddagiri <vatsa@codeaurora.org>, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, linux-kernel@vger.kernel.org,
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

On Wed, Apr 29, 2020 at 01:42:13PM +0800, Lu Baolu wrote:
> On 2020/4/29 12:57, Michael S. Tsirkin wrote:
> > On Wed, Apr 29, 2020 at 10:22:32AM +0800, Lu Baolu wrote:
> > > On 2020/4/29 4:41, Michael S. Tsirkin wrote:
> > > > On Tue, Apr 28, 2020 at 11:19:52PM +0530, Srivatsa Vaddagiri wrote:
> > > > > * Michael S. Tsirkin<mst@redhat.com>  [2020-04-28 12:17:57]:
> > > > > 
> > > > > > Okay, but how is all this virtio specific?  For example, why not allow
> > > > > > separate swiotlbs for any type of device?
> > > > > > For example, this might make sense if a given device is from a
> > > > > > different, less trusted vendor.
> > > > > Is swiotlb commonly used for multiple devices that may be on different trust
> > > > > boundaries (and not behind a hardware iommu)?
> > > > Even a hardware iommu does not imply a 100% security from malicious
> > > > hardware. First lots of people use iommu=pt for performance reasons.
> > > > Second even without pt, unmaps are often batched, and sub-page buffers
> > > > might be used for DMA, so we are not 100% protected at all times.
> > > > 
> > > 
> > > For untrusted devices, IOMMU is forced on even iommu=pt is used;
> > 
> > I think you are talking about untrusted *drivers* like with VFIO.
> 
> No. I am talking about untrusted devices like thunderbolt peripherals.
> We always trust drivers hosted in kernel and the DMA APIs are designed
> for them, right?
> 
> Please refer to this series.
> 
> https://lkml.org/lkml/2019/9/6/39
> 
> Best regards,
> baolu

Oh, thanks for that! I didn't realize Linux is doing this.

So it seems that with modern Linux, all one needs
to do on x86 is mark the device as untrusted.
It's already possible to do this with ACPI and with OF - would that be
sufficient for achieving what this patchset is trying to do?

Adding more ways to mark a device as untrusted, and adding
support for more platforms to use bounce buffers
sounds like a reasonable thing to do.

> > 
> > On the other hand, I am talking about things like thunderbolt
> > peripherals being less trusted than on-board ones.
> 
> 
> 
> > 
> > Or possibly even using swiotlb for specific use-cases where
> > speed is less of an issue.
> > 
> > E.g. my wifi is pretty slow anyway, and that card is exposed to
> > malicious actors all the time, put just that behind swiotlb
> > for security, and leave my graphics card with pt since
> > I'm trusting it with secrets anyway.
> > 
> > 
> > > and
> > > iotlb flush is in strict mode (no batched flushes); ATS is also not
> > > allowed. Swiotlb is used to protect sub-page buffers since IOMMU can
> > > only apply page granularity protection. Swiotlb is now used for devices
> > > from different trust zone.
> > > 
> > > Best regards,
> > > baolu
> > 

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
