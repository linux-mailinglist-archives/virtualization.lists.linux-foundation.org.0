Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 140071F15CD
	for <lists.virtualization@lfdr.de>; Mon,  8 Jun 2020 11:45:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C6A8687EAE;
	Mon,  8 Jun 2020 09:45:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZvsrYCtXAax; Mon,  8 Jun 2020 09:45:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6602D87EB5;
	Mon,  8 Jun 2020 09:45:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5644DC016F;
	Mon,  8 Jun 2020 09:45:43 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF114C016F
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBC0284993
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:45:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cWDJK6jDBIaJ
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:45:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 483D3848A0
 for <virtualization@lists.linux-foundation.org>;
 Mon,  8 Jun 2020 09:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kol/mTHTVhoGIwKuk6EIdanpIihMAd/NI3dQP6aMTfw=;
 b=AHWIpy0RXKXX+j5yvXSxnRmk/r1QdJmhG6wr+x2gumnXCZtqxyDFKRaJZ5echyeatkSacd
 2v4zFaU379o2bgGMUNiXMzJ9hWPJ9Vlwy0p1NnEEWUPtMWf7aj5i20IaWhg1ETpUGkAKwP
 Q4bXyFrYlspHZuypDstyfZchaD/5xx8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-FcqxJ9jaOoeIB8cqiJ9vKQ-1; Mon, 08 Jun 2020 05:45:36 -0400
X-MC-Unique: FcqxJ9jaOoeIB8cqiJ9vKQ-1
Received: by mail-wr1-f69.google.com with SMTP id p9so6941682wrx.10
 for <virtualization@lists.linux-foundation.org>;
 Mon, 08 Jun 2020 02:45:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kol/mTHTVhoGIwKuk6EIdanpIihMAd/NI3dQP6aMTfw=;
 b=QJkuLk0nCsDIztH4TcM+Cxh1gV7nFjfCuajaSfs90oFs4b+SQ0a80jO8M4h3qQaI3/
 CMIABMxxhwo/4u0HdxV+xEGLBaP4yBN9txIoFxbUQWvZyBWt5vlAFZ6HQif5wdHSVXoH
 PQoZHRT/nFRHrDzgvHAHy9OPrEtYliymwPc7bnNgWA7X90LBOQzA6NAexDyqlKGaWGWX
 rX/jxZkk/E06tSYQxTdynSauHUk2RJODYvBiMZVjq/o8y3JV0akvSs95G1mmMgYLb/QU
 sZz5raWIyc7sytfDgCX68KukawdHmVsGRf4Aw0SkSr7DVfWJDapEu/1wpZPjl4UR7dWt
 dYGA==
X-Gm-Message-State: AOAM533vN8HvIsEsB3iuR4cTua+F3TQlIQlGvXUhSbm59vpDoTz2j+73
 Ur06zuy6nFtUtz8+X1CXoyQ1Oxxqj7hvG0pBQ/bZA3bKYXfXbUUVhf3ufAVqj2QfteF8iO7E4MR
 NkN3EMpD1P0o8I8tFiWyztf9ZeYIOHPReEQdytyWfeA==
X-Received: by 2002:a1c:6606:: with SMTP id a6mr14991274wmc.37.1591609535378; 
 Mon, 08 Jun 2020 02:45:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxxXd0c9S/NR+8Ws+FH4J22BlV9unbe3nngLympHYF/P34pWnt/4AiItXOTdFoZndGfb3hfQ==
X-Received: by 2002:a1c:6606:: with SMTP id a6mr14991247wmc.37.1591609535163; 
 Mon, 08 Jun 2020 02:45:35 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 o10sm23169984wrj.37.2020.06.08.02.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:45:34 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:45:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 5/6] vdpa: introduce virtio pci driver
Message-ID: <20200608054453-mutt-send-email-mst@kernel.org>
References: <20200529080303.15449-6-jasowang@redhat.com>
 <20200602010332-mutt-send-email-mst@kernel.org>
 <5dbb0386-beeb-5bf4-d12e-fb5427486bb8@redhat.com>
 <6b1d1ef3-d65e-08c2-5b65-32969bb5ecbc@redhat.com>
 <20200607095012-mutt-send-email-mst@kernel.org>
 <9b1abd2b-232c-aa0f-d8bb-03e65fd47de2@redhat.com>
 <20200608021438-mutt-send-email-mst@kernel.org>
 <a1b1b7fb-b097-17b7-2e3a-0da07d2e48ae@redhat.com>
 <20200608052041-mutt-send-email-mst@kernel.org>
 <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
MIME-Version: 1.0
In-Reply-To: <9d2571b6-0b95-53b3-6989-b4d801eeb623@redhat.com>
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

On Mon, Jun 08, 2020 at 05:43:58PM +0800, Jason Wang wrote:
> > 
> > > Looking at
> > > pci_match_one_device() it checks both subvendor and subdevice there.
> > > 
> > > Thanks
> > 
> > But IIUC there is no guarantee that driver with a specific subvendor
> > matches in presence of a generic one.
> > So either IFC or virtio pci can win, whichever binds first.
> 
> 
> I'm not sure I get there. But I try manually bind IFCVF to qemu's
> virtio-net-pci, and it fails.
> 
> Thanks

Right but the reverse can happen: virtio-net can bind to IFCVF first.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
