Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B36153183
	for <lists.virtualization@lfdr.de>; Wed,  5 Feb 2020 14:15:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2ACDA862BC;
	Wed,  5 Feb 2020 13:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VWvP4WgqNHoO; Wed,  5 Feb 2020 13:15:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4E6A186165;
	Wed,  5 Feb 2020 13:15:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 240A7C0174;
	Wed,  5 Feb 2020 13:15:00 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04581C0174
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E6A6685C11
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQbASsAEimht
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:14:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2F18C844A1
 for <virtualization@lists.linux-foundation.org>;
 Wed,  5 Feb 2020 13:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580908495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QuNXmwS8sysRc0ThXGMCmTTQlX8tFR45lSd0PUTiOGs=;
 b=CzvJwhwXrycMJnKvpCWji+0amMkonKqF/bG//ByPBF59iq3kYYjy0F5ebHXAZlYr9RG7eV
 U690ZpS/GYaOohPjq5mweRKtcUieVkAObnf7tfLLtFPX8+WuzzxwiJXnDcJI+VfOKD/8W1
 1zaCRT901L2/EwMsv8hm36qP5XUPMcA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-R715Qg6ZM3mNPwtMNozxEg-1; Wed, 05 Feb 2020 08:14:54 -0500
Received: by mail-qt1-f197.google.com with SMTP id o18so1274069qtt.19
 for <virtualization@lists.linux-foundation.org>;
 Wed, 05 Feb 2020 05:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QuNXmwS8sysRc0ThXGMCmTTQlX8tFR45lSd0PUTiOGs=;
 b=m3i9wsl2nTlaA6y4H4wlFQrm3b8ndwTwJcJNPEco3AFK8oYRkP9XzM3vCdjtbWP0Lj
 2RPcVOgrHXDGsmHvLlydDyQ11Vt+2LfxStDDSz6mNncFsomknORxVkAI4nmMqbawbBiY
 NjFLi4l4riPo3MhnqjAafA3R0GHsXezGghbDTyadaxApikTUOm9F/xtElOP2phu2Ces6
 ulOWNq/4CJqP3maADSQS1rPUtoOGjzCMsdzkNnvImHKcZnHJga0W4egkOQdGpDhhJZQc
 6rdYmPu/EUml9MQ10tUj9b3KycK4tRrtNxkRbXBFAyGXdqyUria37wQHfHntHgCBj/kc
 mrZw==
X-Gm-Message-State: APjAAAUxH2A5npt331qZpUKMoOmX/f6AssvQbDfnDaI32k95tj1U6q8j
 OeSLiWJX2lR4V3NRYBkeuvnXY6gWGnc0MDU6qKjM0my1bWi8q4mnTvpKu/PolpIT7DZzkWzqjGc
 VL1Ot+BOk339ftrBbhhdHzDurAH+rDCUT0ZL1YJn5DQ==
X-Received: by 2002:a37:6551:: with SMTP id z78mr34386873qkb.144.1580908493726; 
 Wed, 05 Feb 2020 05:14:53 -0800 (PST)
X-Google-Smtp-Source: APXvYqyPJbBNbk5endfccq+ku5moWMnpzgaXCLDqjaEgV35BhSBP12RgV6EFcH2z1a9H9HuZasXKOQ==
X-Received: by 2002:a37:6551:: with SMTP id z78mr34386840qkb.144.1580908493533; 
 Wed, 05 Feb 2020 05:14:53 -0800 (PST)
Received: from redhat.com (bzq-79-176-41-183.red.bezeqint.net. [79.176.41.183])
 by smtp.gmail.com with ESMTPSA id c45sm14187780qtd.43.2020.02.05.05.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 05:14:52 -0800 (PST)
Date: Wed, 5 Feb 2020 08:14:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH] vhost: introduce vDPA based backend
Message-ID: <20200205081210-mutt-send-email-mst@kernel.org>
References: <20200131033651.103534-1-tiwei.bie@intel.com>
 <7aab2892-bb19-a06a-a6d3-9c28bc4c3400@redhat.com>
 <20200205020247.GA368700@___>
 <AM0PR0502MB37952015716C1D5E07E390B6C3020@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <112858a4-1a01-f4d7-e41a-1afaaa1cad45@redhat.com>
 <20200205125648.GV23346@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200205125648.GV23346@mellanox.com>
X-MC-Unique: R715Qg6ZM3mNPwtMNozxEg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
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

On Wed, Feb 05, 2020 at 08:56:48AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 05, 2020 at 03:50:14PM +0800, Jason Wang wrote:
> > > Would it be better for the map/umnap logic to happen inside each device ?
> > > Devices that needs the IOMMU will call iommu APIs from inside the driver callback.
> > 
> > Technically, this can work. But if it can be done by vhost-vpda it will make
> > the vDPA driver more compact and easier to be implemented.
> 
> Generally speaking, in the kernel, it is normal to not hoist code of
> out drivers into subsystems until 2-3 drivers are duplicating that
> code. It helps ensure the right design is used
> 
> Jason

That's up to the sybsystem maintainer really, as there's also some
intuition involved in guessing a specific API is widely useful.
In-kernel APIs are flexible, if we find something isn't needed we just
drop it.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
