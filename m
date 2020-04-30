Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C93711BF4ED
	for <lists.virtualization@lfdr.de>; Thu, 30 Apr 2020 12:08:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7246D87E08;
	Thu, 30 Apr 2020 10:08:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZFwBkW2QqDe0; Thu, 30 Apr 2020 10:08:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E44A687E24;
	Thu, 30 Apr 2020 10:08:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CD135C016F;
	Thu, 30 Apr 2020 10:08:06 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B68C2C016F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A56198535F
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:08:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F6HnVYIVvzOS
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:08:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E8EFA84B60
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 10:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588241283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4neCHXAikGnDrEWLfrOwLMssDcW49SbEXywLj9zmi5k=;
 b=UD6FMXzNZlbJLJGlzJDZJ4xgMtznMU/Z4L82ofSoIMRqwqT0WjnFy7WequhRXCFwu3ROoC
 XUOujor2EdVEw/N25IbXZFLclbkKLOn3d117XuDWwe2vpSLJ8FLxDbMxi2IHpoBD1hIkCc
 ESssA7HCz3IiQbd1H/Pfr5fYmGBO7+0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-oE9GrBhTNP6KsAOodWmRCA-1; Thu, 30 Apr 2020 06:08:01 -0400
X-MC-Unique: oE9GrBhTNP6KsAOodWmRCA-1
Received: by mail-wr1-f70.google.com with SMTP id v9so3609568wrt.7
 for <virtualization@lists.linux-foundation.org>;
 Thu, 30 Apr 2020 03:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4neCHXAikGnDrEWLfrOwLMssDcW49SbEXywLj9zmi5k=;
 b=YwgwoEbCUmK4lXQgC6UIsKI6UBAJw/9Ec0e+SmcjUNICe3qINM8kRFNtL2DD1nB/1R
 7AkVK8gPAwwTCwt8QPWOGsnq2Lu204O1XO62V11ub61IZiX/glzzKX/S5ZBfJwPEHEzb
 YJJMU9PGnSxlJtBJx4dtjgCHHTiQKDsg8LVY7PhZV8flhNbiHhcTDCrWoo26nRFQCFVw
 RqsgHbtVltKAERp6ZZRK1uN5uwQYJTKETGB3Rq5BoFhTh/vR43A79bipX6FrJgc7IA+f
 tm95C3OMIcMKvNepTvX1QkOshrw0B6B2I4Rg8dJwAZMzsi1aPsi187S9Rcyrv4LKZPQD
 pX1A==
X-Gm-Message-State: AGi0PuacR73YHgOfkg3II57aENMbxuwAsFyuscZflNv++sSEzn7EG7uF
 mQD8ElKS88qcckeh5m+S8k8g5u5LIfv9/255O8gYcB/g5EenuLX9MrAHv/RW4F/pmQLZ1u2jOp0
 4OnTAHoe9382GP/WB90I0H5AfA+Exua/Q7KGBMcyKbw==
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr2145476wmt.153.1588241280239; 
 Thu, 30 Apr 2020 03:08:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLHlrCbfCYrZ88o6DhjV70fA6mpNnqgpx+WR9c06xN4peVmevPZw2FufGVhiRy6EDg6FWX7OQ==
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr2145451wmt.153.1588241279982; 
 Thu, 30 Apr 2020 03:07:59 -0700 (PDT)
Received: from redhat.com (bzq-109-66-7-121.red.bezeqint.net. [109.66.7.121])
 by smtp.gmail.com with ESMTPSA id
 u30sm3470829wru.13.2020.04.30.03.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 03:07:59 -0700 (PDT)
Date: Thu, 30 Apr 2020 06:07:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Subject: Re: [RFC/PATCH 0/1] virtio_mmio: hypervisor specific interfaces for
 MMIO
Message-ID: <20200430060653-mutt-send-email-mst@kernel.org>
References: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
MIME-Version: 1.0
In-Reply-To: <1588240976-10213-1-git-send-email-vatsa@codeaurora.org>
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

On Thu, Apr 30, 2020 at 03:32:55PM +0530, Srivatsa Vaddagiri wrote:
> The Type-1 hypervisor we are dealing with does not allow for MMIO transport. 

How about PCI then?

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
