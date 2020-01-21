Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBD3143F2C
	for <lists.virtualization@lfdr.de>; Tue, 21 Jan 2020 15:16:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 63B338767B;
	Tue, 21 Jan 2020 14:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tuJ0aHELgBCN; Tue, 21 Jan 2020 14:16:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 55F3387541;
	Tue, 21 Jan 2020 14:16:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40C0DC0174;
	Tue, 21 Jan 2020 14:16:24 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA47CC0174
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C500F86569
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CV5mQNHCbb8d
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:16:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 99D448651E
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579616174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OtPQLFnT52uoZGzAoyi/3S949ctnhGBbphedOmgQ5wE=;
 b=TzXmpIPh7YTX+4YAcFiGvqIth/xMkJ+3ANA//C4hzErY2xiktczZ66fnDgd1wjhKG1zamM
 CTDphGQPAFZa4sZvex5Hxez2yEGXspAx7bMF7YFs6OVA6eBLVxr/Gva5gxNLLNzMI9zzRO
 CM3gqx3kXjvLCfA2HbaylVbjgpFNFJM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-3fWNYd31MDOYNpKXAbyfPg-1; Tue, 21 Jan 2020 09:16:12 -0500
Received: by mail-qt1-f198.google.com with SMTP id b7so1951644qtg.23
 for <virtualization@lists.linux-foundation.org>;
 Tue, 21 Jan 2020 06:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OtPQLFnT52uoZGzAoyi/3S949ctnhGBbphedOmgQ5wE=;
 b=rpR4KRCGZNnCCGijh2pJKf5n4J/j42C1CyS4YdLsiXlH6NpoouZxsSEpM5WWkI7MGF
 3sXrgCtIdvUxn+7pLihcToi/AbKiO0lUj9aa5jBlAoXR5YzcTAzpaNPRQwiEMkD5safK
 8vMV+qmZbDa1LTY/7Env3+aa+9LjQv+AcrtQKTdF5NS4PFGuVqwb2GXa2VHDJ0jMEnXQ
 Gl6DxNvdXrrTzRaAp/cdp1QtJa7zZ5GMhFa3OKfz1D9+JK40sVxPpMclgBF2JCeAEVFi
 BBuB/rsO2uBq48qrSodiLPkVSEGcuK1RgC+9iHYfL0YWeBJZQhM+7UhQaVneNrevO//9
 R5TA==
X-Gm-Message-State: APjAAAXfCK89mfjuevi96VOSuWJqdEBQXPYg7EI39hQobDq3JuoRz6bL
 07ztegJXYDrxAQ+4DAx0qy82JK480Q9VXqkpmjHzSU4niXF33uqxNaAaYlx8v1rCBevdJuz9xgq
 IWvWaGvYACeUO04N1PdkfgB98FDmEw062sun46DNT5g==
X-Received: by 2002:a37:4f8d:: with SMTP id d135mr4735787qkb.455.1579616172186; 
 Tue, 21 Jan 2020 06:16:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQgYijZdgXt853mYL5TwvzVQ8pujRfHDSMvSEtlc0v2iUY5t9/9HUHWxN10Q3Sbj5SYLpKCg==
X-Received: by 2002:a37:4f8d:: with SMTP id d135mr4735725qkb.455.1579616171759; 
 Tue, 21 Jan 2020 06:16:11 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id u55sm19847250qtc.28.2020.01.21.06.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:16:11 -0800 (PST)
Date: Tue, 21 Jan 2020 09:16:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200121091540-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-4-jasowang@redhat.com>
 <20200117070324-mutt-send-email-mst@kernel.org>
 <239b042c-2d9e-0eec-a1ef-b03b7e2c5419@redhat.com>
 <CAJPjb1+fG9L3=iKbV4Vn13VwaeDZZdcfBPvarogF_Nzhk+FnKg@mail.gmail.com>
 <AM0PR0502MB379553984D0D55FDE25426F6C3330@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <d69918ca-8af4-44b2-9652-633530d4c113@redhat.com>
 <20200120174933.GB3891@mellanox.com>
 <AM0PR0502MB3795C92485338180FC8059CFC3320@AM0PR0502MB3795.eurprd05.prod.outlook.com>
 <20200120162449-mutt-send-email-mst@kernel.org>
 <20200121140755.GB12330@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200121140755.GB12330@mellanox.com>
X-MC-Unique: 3fWNYd31MDOYNpKXAbyfPg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 Rob Miller <rob.miller@broadcom.com>, "lulu@redhat.com" <lulu@redhat.com>,
 "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>, "Wang, Xiao W" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "Wang,
 Zhihong" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 Netdev <netdev@vger.kernel.org>, "Zhu, Lingshan" <lingshan.zhu@intel.com>
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

On Tue, Jan 21, 2020 at 02:07:59PM +0000, Jason Gunthorpe wrote:
> On Mon, Jan 20, 2020 at 04:25:23PM -0500, Michael S. Tsirkin wrote:
> > On Mon, Jan 20, 2020 at 08:51:43PM +0000, Shahaf Shuler wrote:
> > > Monday, January 20, 2020 7:50 PM, Jason Gunthorpe:
> > > > Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
> > > > 
> > > > On Mon, Jan 20, 2020 at 04:43:53PM +0800, Jason Wang wrote:
> > > > > This is similar to the design of platform IOMMU part of vhost-vdpa. We
> > > > > decide to send diffs to platform IOMMU there. If it's ok to do that in
> > > > > driver, we can replace set_map with incremental API like map()/unmap().
> > > > >
> > > > > Then driver need to maintain rbtree itself.
> > > > 
> > > > I think we really need to see two modes, one where there is a fixed
> > > > translation without dynamic vIOMMU driven changes and one that supports
> > > > vIOMMU.
> > > > 
> > > > There are different optimization goals in the drivers for these two
> > > > configurations.
> > > 
> > > +1.
> > > It will be best to have one API for static config (i.e. mapping can be
> > > set only before virtio device gets active), and one API for dynamic
> > > changes that can be set after the virtio device is active. 
> > 
> > Frankly I don't see when we'd use the static one.
> > Memory hotplug is enabled for most guests...
> 
> If someone wants to run a full performance application, like dpdk,
> then they may wish to trade memory hotplug in that VM for more
> performance.

Right. But let let's get basic functionality working first.

> Perhaps Shahaf can quantify the performance delta?
> 
> Jason

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
