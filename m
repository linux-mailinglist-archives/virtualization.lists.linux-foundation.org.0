Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BC51BDA03
	for <lists.virtualization@lfdr.de>; Wed, 29 Apr 2020 12:45:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E327883B0;
	Wed, 29 Apr 2020 10:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WFNfVctU7MJV; Wed, 29 Apr 2020 10:45:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id AEEC1883AC;
	Wed, 29 Apr 2020 10:45:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 944CDC0172;
	Wed, 29 Apr 2020 10:45:22 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15EA1C0172
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 04BDC883AC
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VC-UXnrfUDN7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:45:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2C83D8813E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 10:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588157118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ivrbfu7nXm6urIi13dgUtl5GkaF/JA7ff8SBWPZh/VU=;
 b=J1BQnt9hsHifiwHswMLsKd1Wee+nsZcxh2h4BBYNCefDwW7bH8hs+jnHLj2bJPNzQXLoCT
 mq6ZardIadafSWyRtEdXG5fnBb0GZVkQyv68aWZXi/5LPran6BZue1SOtqJNvpxtGLJFy1
 J1J6Qq3CCeoADSO/viZGOVJ0hcYGBQM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-MFIAZDnvNme3eGoBbdd3wQ-1; Wed, 29 Apr 2020 06:45:15 -0400
X-MC-Unique: MFIAZDnvNme3eGoBbdd3wQ-1
Received: by mail-wr1-f71.google.com with SMTP id r11so1503679wrx.21
 for <virtualization@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 03:45:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ivrbfu7nXm6urIi13dgUtl5GkaF/JA7ff8SBWPZh/VU=;
 b=F01cm5eNcFrlfwEde0OcKMJPsij92zOfkcRgVMZlK4GVRdKtdnolTgAlxBIDba2V55
 QDKuuV5MIfJvY61/PyPXmY943kSuDQCBFF1yQUfX/41okcK7twgl9znRYQpNYgvN2rIB
 NeY8UUetXiCxAbX6mkTIr9ceBLZwnAwGEsJvCfkakOKQcfGQsMZezauA5bq5cRMYqWy7
 wh72CD/jMxPC7FKoWU2uqTB30V5bvI4BF5NvlmJUjaLyvcBC+EVfmTiIGI2f7BtwzbuK
 tx1QgvqEhFlzMCnOW+fO7bzJWr/2llxbaxDCtyhwEFOqsweml0GEa+1enyeMQwy1rSjp
 415w==
X-Gm-Message-State: AGi0PuamItPQtQct1kZpbDY2WbN4hTO5paUWk00/P9GEVifFwbinUWUH
 yItLyXQ4x3LqZNtq+ffrmrWQ4nasds5EVW3PjedqovPLoAhJj2ma7Y9XH3aQ1CeoGwo/giSU147
 9NTmPOWjyeZCQS+0s9iWrPWzkW7cLiJ7Tv6kGjK9s0g==
X-Received: by 2002:a1c:770f:: with SMTP id t15mr2494530wmi.178.1588157114026; 
 Wed, 29 Apr 2020 03:45:14 -0700 (PDT)
X-Google-Smtp-Source: APiQypLWNbQEy2iyMW7HWmtuY5GYzKFC5cfUOhqKta7BJe6nQlsQf8vGhfuT+8lQWfwqNmKnzgzCfQ==
X-Received: by 2002:a1c:770f:: with SMTP id t15mr2494510wmi.178.1588157113807; 
 Wed, 29 Apr 2020 03:45:13 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 y70sm7706812wmc.36.2020.04.29.03.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Apr 2020 03:45:13 -0700 (PDT)
Date: Wed, 29 Apr 2020 06:45:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200429064458-mutt-send-email-mst@kernel.org>
References: <20200428163448-mutt-send-email-mst@kernel.org>
 <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
 <20200429004531-mutt-send-email-mst@kernel.org>
 <b676430c-65b3-096e-ca48-ceebf10f4b28@linux.intel.com>
 <20200429023842-mutt-send-email-mst@kernel.org>
 <20200429094410.GD5097@quicinc.com>
 <20200429055125-mutt-send-email-mst@kernel.org>
 <20200429100953.GE5097@quicinc.com>
 <20200429061621-mutt-send-email-mst@kernel.org>
 <f52556e2-253e-2dbc-cb7a-a7991e3bcfde@siemens.com>
MIME-Version: 1.0
In-Reply-To: <f52556e2-253e-2dbc-cb7a-a7991e3bcfde@siemens.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, will@kernel.org,
 Srivatsa Vaddagiri <vatsa@codeaurora.org>, christoffer.dall@arm.com,
 pratikp@codeaurora.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, stefano.stabellini@xilinx.com,
 linux-kernel@vger.kernel.org, Lu Baolu <baolu.lu@linux.intel.com>
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

On Wed, Apr 29, 2020 at 12:26:43PM +0200, Jan Kiszka wrote:
> On 29.04.20 12:20, Michael S. Tsirkin wrote:
> > On Wed, Apr 29, 2020 at 03:39:53PM +0530, Srivatsa Vaddagiri wrote:
> > > That would still not work I think where swiotlb is used for pass-thr devices
> > > (when private memory is fine) as well as virtio devices (when shared memory is
> > > required).
> > 
> > So that is a separate question. When there are multiple untrusted
> > devices, at the moment it looks like a single bounce buffer is used.
> > 
> > Which to me seems like a security problem, I think we should protect
> > untrusted devices from each other.
> > 
> 
> Definitely. That's the model we have for ivshmem-virtio as well.
> 
> Jan

Want to try implementing that?

> -- 
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
> Corporate Competence Center Embedded Linux

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
