Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E4C1EB4F3
	for <lists.virtualization@lfdr.de>; Tue,  2 Jun 2020 07:15:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B28FF87F9C;
	Tue,  2 Jun 2020 05:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tcd-l2IAH+pa; Tue,  2 Jun 2020 05:15:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4651B87F71;
	Tue,  2 Jun 2020 05:15:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23385C0176;
	Tue,  2 Jun 2020 05:15:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23748C0176
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 06CE0204D3
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:15:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rc6vNnVVNPSy
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:15:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id 4A7FB204A5
 for <virtualization@lists.linux-foundation.org>;
 Tue,  2 Jun 2020 05:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591074922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Omt9gJipjlxk0xAiBkDipMLYpK/jCtWILzTzD1eFi2g=;
 b=DMOlNj2kC67Rh+nW0FEbWCW3fhsxES1FsnH3RYzKYaW6K0Svk7zg4Q2YYlK0qW23eWLtb5
 xEaT+pIHFezEV+N1RwDplknN411j/f17HBamBBGCX1cEkSgoYQ7pYqb9NrBkx7G8WWydsW
 izpz5TGoScgbWwWs29ij+cCXC0x1V1A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-___mwaCZNsm19dc90j-5Wg-1; Tue, 02 Jun 2020 01:09:38 -0400
X-MC-Unique: ___mwaCZNsm19dc90j-5Wg-1
Received: by mail-wr1-f71.google.com with SMTP id f4so875126wrp.21
 for <virtualization@lists.linux-foundation.org>;
 Mon, 01 Jun 2020 22:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Omt9gJipjlxk0xAiBkDipMLYpK/jCtWILzTzD1eFi2g=;
 b=ADWz8qEs8ravbg19ATi10362owSmCH5aS/8Z+Wm07oLnDRPNJs9vDqxeblu03IAHRc
 AmJQZqNqHyuREYmY6h+wHr48VgHmmtKaPetvRtpa8WK2etGdvcWu6x9PumewGa/+8K7Z
 XsVwqL+itjLnB9t+J94y4nipMUB3dL0jUf0X5uwSaIdZLtjPMjUs/Ith1nuchDwB2OHW
 qIxAAPTo4OEWnLl+BV6HLBwGMveHcXbsHr2xLz94+SZSwu4hnh/9bWa7Pee7/Cfh+cZX
 Sfirl57r+YSTPSDs+V1KEP3j965JwadmB3twPfyHdf4S5lhFpNH08uGThcsdO2aIHV72
 ikew==
X-Gm-Message-State: AOAM530KsoODuDpSE94PiBGH659JQURCavq9shZwaK3fgwThVlhplzSW
 iEeV4izWVkIvETKhNDR6+XmX5slIWF30PmcyK/WguptRSn+Bc3tfvJbjeT595kWn+xaI3we8IU/
 AeSSt9/0ltZmb72S+nRD0aCo39KCinYrmNMBSOCkRsg==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr23481654wrx.141.1591074577590; 
 Mon, 01 Jun 2020 22:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzC4LVeDOhERR8qf9AS4nc4Mi6WpaPRsevGBTu/GWRHQywd6PHu2y8E93bGd9V5IBqDeftUgQ==
X-Received: by 2002:a05:6000:11cd:: with SMTP id
 i13mr23481639wrx.141.1591074577444; 
 Mon, 01 Jun 2020 22:09:37 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 a3sm1785369wmb.7.2020.06.01.22.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 22:09:36 -0700 (PDT)
Date: Tue, 2 Jun 2020 01:09:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200602010809-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-1-jasowang@redhat.com>
 <20200529080303.15449-6-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200529080303.15449-6-jasowang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: shahafs@mellanox.com, lulu@redhat.com, kvm@vger.kernel.org,
 saugatm@xilinx.com, netdev@vger.kernel.org, mhabets@solarflare.com,
 vmireyno@marvell.com, linux-kernel@vger.kernel.org, gdawar@xilinx.com,
 virtualization@lists.linux-foundation.org, eperezma@redhat.com,
 hanand@xilinx.com, zhangweining@ruijie.com.cn, eli@mellanox.com,
 lingshan.zhu@intel.com, rob.miller@broadcom.com
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

On Fri, May 29, 2020 at 04:03:02PM +0800, Jason Wang wrote:
> Note that since virtio specification does not support get/restore
> virtqueue state. So we can not use this driver for VM. This can be
> addressed by extending the virtio specification.

Looks like exactly the kind of hardware limitation VDPA is supposed to
paper over within guest. So I suggest we use this as
a litmus test, and find ways for VDPA to handle this without
spec changes.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
