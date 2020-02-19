Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E08E163A9E
	for <lists.virtualization@lfdr.de>; Wed, 19 Feb 2020 04:00:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 426BB8488E;
	Wed, 19 Feb 2020 03:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nEkOhNpcE4J5; Wed, 19 Feb 2020 03:00:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 827098499A;
	Wed, 19 Feb 2020 03:00:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 642F2C013E;
	Wed, 19 Feb 2020 03:00:08 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5966DC013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 03:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 453F984397
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 03:00:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YrkNdd7ifGfM
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 03:00:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 888FC842B8
 for <virtualization@lists.linux-foundation.org>;
 Wed, 19 Feb 2020 03:00:05 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Feb 2020 19:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,458,1574150400"; d="scan'208";a="348830245"
Received: from dpdk-virtio-tbie-2.sh.intel.com (HELO ___) ([10.67.104.74])
 by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2020 18:59:58 -0800
Date: Wed, 19 Feb 2020 10:59:48 +0800
From: Tiwei Bie <tiwei.bie@intel.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH V2 3/5] vDPA: introduce vDPA bus
Message-ID: <20200219025948.GA972742@___>
References: <cf7abcc9-f8ef-1fe2-248e-9b9028788ade@redhat.com>
 <20200212125108.GS4271@mellanox.com>
 <12775659-1589-39e4-e344-b7a2c792b0f3@redhat.com>
 <20200213134128.GV4271@mellanox.com>
 <ebaea825-5432-65e2-2ab3-720a8c4030e7@redhat.com>
 <20200213150542.GW4271@mellanox.com>
 <8b3e6a9c-8bfd-fb3c-12a8-2d6a3879f1ae@redhat.com>
 <20200214135232.GB4271@mellanox.com>
 <01c86ebb-cf4b-691f-e682-2d6f93ddbcf7@redhat.com>
 <20200218135608.GS4271@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218135608.GS4271@mellanox.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "rob.miller@broadcom.com" <rob.miller@broadcom.com>,
 "lulu@redhat.com" <lulu@redhat.com>, "hanand@xilinx.com" <hanand@xilinx.com>,
 "hch@infradead.org" <hch@infradead.org>,
 "eperezma@redhat.com" <eperezma@redhat.com>,
 "haotian.wang@sifive.com" <haotian.wang@sifive.com>,
 "mhabets@solarflare.com" <mhabets@solarflare.com>,
 Shahaf Shuler <shahafs@mellanox.com>, Parav Pandit <parav@mellanox.com>,
 Jiri Pirko <jiri@mellanox.com>,
 "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "zhihong.wang@intel.com" <zhihong.wang@intel.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "maxime.coquelin@redhat.com" <maxime.coquelin@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
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

On Tue, Feb 18, 2020 at 01:56:12PM +0000, Jason Gunthorpe wrote:
> On Mon, Feb 17, 2020 at 02:08:03PM +0800, Jason Wang wrote:
> 
> > I thought you were copied in the patch [1], maybe we can move vhost related
> > discussion there to avoid confusion.
> >
> > [1] https://lwn.net/Articles/811210/
> 
> Wow, that is .. confusing.
> 
> So this is supposed to duplicate the uAPI of vhost-user? But it is
> open coded and duplicated because .. vdpa?

Do you mean the vhost-user in DPDK? There is no vhost-user
in Linux kernel.

Thanks,
Tiwei

> 
> > So it's cheaper and simpler to introduce a new bus instead of refactoring a
> > well known bus and API where brunches of drivers and devices had been
> > implemented for years.
> 
> If you reason for this approach is to ease the implementation then you
> should talk about it in the cover letters/etc
> 
> Maybe it is reasonable to do this because the rework is too great, I
> don't know, but to me this whole thing looks rather messy. 
> 
> Remember this stuff is all uAPI as it shows up in sysfs, so you can
> easilly get stuck with it forever.
> 
> Jason
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
