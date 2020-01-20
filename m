Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A14C143391
	for <lists.virtualization@lfdr.de>; Mon, 20 Jan 2020 22:56:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A9B5A204D2;
	Mon, 20 Jan 2020 21:56:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfCJnNThky9F; Mon, 20 Jan 2020 21:56:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A93420499;
	Mon, 20 Jan 2020 21:56:25 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 51715C0174;
	Mon, 20 Jan 2020 21:56:25 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2248C0174
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A79A85B1D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:56:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UjTczlY0C8+N
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:56:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4C304859C0
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 21:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579557380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=62LNkLQMXjSxzZ1qGIQnfYNgDgSpvkpj5nXVuzQSLnI=;
 b=TZigfF0dNW9STHwyQngtKeQN48lMP9KWiJl3qUFi3M9AQfKkR1mqi5362rIVzOmQaUv66r
 BUSU6Owh7l71ZFT0AoFC3XgQ+uMsUXPscWpXbuGE6B+yAZUmZDWRHH7mYyhIev6e2fqYVo
 0Ftcwqo9We29KjVTM7dXgAG5NINwnsY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-oKGpb4qMNpO3HBmQwUQ3ug-1; Mon, 20 Jan 2020 16:56:16 -0500
Received: by mail-qk1-f197.google.com with SMTP id n128so554437qke.19
 for <virtualization@lists.linux-foundation.org>;
 Mon, 20 Jan 2020 13:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=62LNkLQMXjSxzZ1qGIQnfYNgDgSpvkpj5nXVuzQSLnI=;
 b=TKorWNzXL4mN9qGKfdUu2Zq+22IsyyLDLwnw66mRbULUdYXmVObGz2V80pTNwkUr1o
 wKTcGdloLEh5zvuu48x6HSpLkoHO+ySFsg++oMMOrh9sgknFEEE4sxOXU9pgVCGUaYZA
 233bH2XvAch3LALVmJyAOL+kfu0Hoak5YnFLVp4+X0xwTYo/zxQTbBMYj9gfSqKLFQX2
 ziVm4pL0U1hY271bZpssGTjYXIiik43cdIHWGLPxKEfZfpGZLc349T8RtGpb9PE/ZfEk
 3BYkBdcrzjr/vefDiZQp1OLg/Bm4cg05m7Iz2M9PkGF+CcGUfBd8MiE37F/k51u4tJoR
 5n6A==
X-Gm-Message-State: APjAAAVloxL2eAWjo2Rzjh0lrDhN4y3NPbEa8CnNYJ5GKqiGlFr4AcYC
 Xt5+5rwvwmyYzCknkKbrvqM+rMxiPQe+qXTVzndwmKyC393CouVLtPA5hvTEJRxzEERfqVsFlZW
 nJRF6dFDnvYekEBzGXZ93LFH0XJzb9hSCQLnZnOk92w==
X-Received: by 2002:aed:27de:: with SMTP id m30mr1474681qtg.151.1579557376429; 
 Mon, 20 Jan 2020 13:56:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqw38PiLJQwBkH5yonvL8qdp0NwjRgW2RVHdE4B/0tWoQNPZFObTe7mxpwhkFj/2blsxmgzW3w==
X-Received: by 2002:aed:27de:: with SMTP id m30mr1474647qtg.151.1579557376187; 
 Mon, 20 Jan 2020 13:56:16 -0800 (PST)
Received: from redhat.com (bzq-79-179-85-180.red.bezeqint.net. [79.179.85.180])
 by smtp.gmail.com with ESMTPSA id z15sm7493120qtv.56.2020.01.20.13.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 13:56:15 -0800 (PST)
Date: Mon, 20 Jan 2020 16:56:06 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: [PATCH 3/5] vDPA: introduce vDPA bus
Message-ID: <20200120164916-mutt-send-email-mst@kernel.org>
References: <20200116124231.20253-1-jasowang@redhat.com>
 <20200116124231.20253-4-jasowang@redhat.com>
 <20200116152209.GH20978@mellanox.com>
 <03cfbcc2-fef0-c9d8-0b08-798b2a293b8c@redhat.com>
 <20200117135435.GU20978@mellanox.com>
 <20200120071406-mutt-send-email-mst@kernel.org>
 <20200120175050.GC3891@mellanox.com>
MIME-Version: 1.0
In-Reply-To: <20200120175050.GC3891@mellanox.com>
X-MC-Unique: oKGpb4qMNpO3HBmQwUQ3ug-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: "jakub.kicinski@netronome.com" <jakub.kicinski@netronome.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
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

On Mon, Jan 20, 2020 at 05:50:55PM +0000, Jason Gunthorpe wrote:
> On Mon, Jan 20, 2020 at 07:17:26AM -0500, Michael S. Tsirkin wrote:
> > On Fri, Jan 17, 2020 at 01:54:42PM +0000, Jason Gunthorpe wrote:
> > > > 1) "virtio" vs "vhost", I implemented matching method for this in mdev
> > > > series, but it looks unnecessary for vDPA device driver to know about this.
> > > > Anyway we can use sysfs driver bind/unbind to switch drivers
> > > > 2) virtio device id and vendor id. I'm not sure we need this consider the
> > > > two drivers so far (virtio/vhost) are all bus drivers.
> > > 
> > > As we seem to be contemplating some dynamic creation of vdpa devices I
> > > think upon creation time it should be specified what mode they should
> > > run it and then all driver binding and autoloading should happen
> > > automatically. Telling the user to bind/unbind is a very poor
> > > experience.
> > 
> > Maybe but OTOH it's an existing interface. I think we can reasonably
> > start with bind/unbind and then add ability to specify
> > the mode later. bind/unbind come from core so they will be
> > maintained anyway.
> 
> Existing where?

Driver core.

> For vfio? vfio is the only thing I am aware doing
> that, and this is not vfio..
> 
> Jason


vfio is not doing anything. anyone can use a combination
of unbind and driver_override to attach a driver to a device.

It's not a great interface but it's there without any code,
and it will stay there without maintainance overhead
if we later add a nicer one.

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
