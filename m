Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA74211487
	for <lists.virtualization@lfdr.de>; Wed,  1 Jul 2020 22:47:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D1EEE8909F;
	Wed,  1 Jul 2020 20:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLtXbIpB2Ny2; Wed,  1 Jul 2020 20:47:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3E05389062;
	Wed,  1 Jul 2020 20:47:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1CC7BC0733;
	Wed,  1 Jul 2020 20:47:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 086C3C0733
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 20:47:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id E8CAC8AD7A
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 20:47:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C502QDyZW8FC
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 20:47:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F01FD8AD79
 for <virtualization@lists.linux-foundation.org>;
 Wed,  1 Jul 2020 20:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593636458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MbiyraTJ4trv3FWb4qCBJhr5R70RrnDBw9rQbrUZ784=;
 b=VfFIRYhyN7UAlCmU4ycy3YjrdUnZaix3K83yEmCJ4yw+0MKL3BwuvHujojAeGw/KHJUYyy
 Y6SsKzUGNYq4BV0q2xfZCxCjGX4LJA3yWuprFF0sVrh4rQU/MTjyXc6+cmBsvv5uUMLYRf
 309S+3va0D9/K/zDx6wiFR3gKOdZ6+w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-mwpaLiUyPdyY600UGb7zWg-1; Wed, 01 Jul 2020 16:47:36 -0400
X-MC-Unique: mwpaLiUyPdyY600UGb7zWg-1
Received: by mail-wr1-f72.google.com with SMTP id o25so22272809wro.16
 for <virtualization@lists.linux-foundation.org>;
 Wed, 01 Jul 2020 13:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MbiyraTJ4trv3FWb4qCBJhr5R70RrnDBw9rQbrUZ784=;
 b=iIhoho884Uekko5uG7TgZrYG159bGy2F6dk61JVR8s9eD33nJSIR2c5OvhkLgtMA63
 eLm4AtI9GNU/EXjVFvNwbLN6EhH9L5RFQl+O9bg639TxAodyx4TQmJlAZ0+myhNHOb+9
 TBv2BT7evMvvRXbxUfguhCTmsi+i0EDppmi7vHhUDp1t30gh+UrnbYem3Xg6hW9SyvUC
 4ZttJ1wKPgR1cETtM5e4H8Zr51zor1GDAKBf2jmQa7BpZJYpJ1cqx76uOY71LcyK5Hzi
 4XBcpB6xwGzYbABNE4p+w4C6JNdbTjtqGWbUgD5XulNa7tgR/4GpozUDJ4NUVHLHMhhp
 dP2A==
X-Gm-Message-State: AOAM53054wmSShnZ2LP5pe7pbe7zfhh7Y/2zUXXJFdXHDzuFmp8uBqQG
 VmjDt2WFwPSrzLnaW0PVnvz4bpvosWhXBkA3EP6Fn47Nr14tK91F8bTmvgDLQ71yvqQtEN4gyY6
 JjjWtOZ5Xyh7EdPlRQaEoRJwdNNWgQxldl+beTMQ2Og==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr30433373wro.201.1593636455515; 
 Wed, 01 Jul 2020 13:47:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzi4/QeFIvFvIhW8MFrahcm+NHf1Nr8du8L4WlMn+iG6s23576AuHveqgE2W9yZnAvkgrNyJg==
X-Received: by 2002:adf:ed47:: with SMTP id u7mr30433344wro.201.1593636455219; 
 Wed, 01 Jul 2020 13:47:35 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 h2sm8337653wrw.62.2020.07.01.13.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jul 2020 13:47:32 -0700 (PDT)
Date: Wed, 1 Jul 2020 16:47:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen: introduce xen_vring_use_dma
Message-ID: <20200701164501-mutt-send-email-mst@kernel.org>
References: <20200624050355-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241047010.8121@sstabellini-ThinkPad-T480s>
 <20200624163940-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006241351430.8121@sstabellini-ThinkPad-T480s>
 <20200624181026-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006251014230.8121@sstabellini-ThinkPad-T480s>
 <20200626110629-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2006291621300.8121@sstabellini-ThinkPad-T480s>
 <20200701133456.GA23888@infradead.org>
 <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2007011020320.8121@sstabellini-ThinkPad-T480s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: jgross@suse.com, Peng Fan <peng.fan@nxp.com>, konrad.wilk@oracle.com,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>, iommu@lists.linux-foundation.org,
 linux-imx@nxp.com, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 linux-arm-kernel@lists.infradead.org
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

On Wed, Jul 01, 2020 at 10:34:53AM -0700, Stefano Stabellini wrote:
> On Wed, 1 Jul 2020, Christoph Hellwig wrote:
> > On Mon, Jun 29, 2020 at 04:46:09PM -0700, Stefano Stabellini wrote:
> > > > I could imagine some future Xen hosts setting a flag somewhere in the
> > > > platform capability saying "no xen specific flag, rely on
> > > > "VIRTIO_F_ACCESS_PLATFORM". Then you set that accordingly in QEMU.
> > > > How about that?
> > > 
> > > Yes, that would be fine and there is no problem implementing something
> > > like that when we get virtio support in Xen. Today there are still no
> > > virtio interfaces provided by Xen to ARM guests (no virtio-block/net,
> > > etc.)
> > > 
> > > In fact, in both cases we are discussing virtio is *not* provided by
> > > Xen; it is a firmware interface to something entirely different:
> > > 
> > > 1) virtio is used to talk to a remote AMP processor (RPMesg)
> > > 2) virtio is used to talk to a secure-world firmware/OS (Trusty)
> > >
> > > VIRTIO_F_ACCESS_PLATFORM is not set by Xen in these cases but by RPMesg
> > > and by Trusty respectively. I don't know if Trusty should or should not
> > > set VIRTIO_F_ACCESS_PLATFORM, but I think Linux should still work
> > > without issues.
> > > 
> > 
> > Any virtio implementation that is not in control of the memory map
> > (aka not the hypervisor) absolutely must set VIRTIO_F_ACCESS_PLATFORM,
> > else it is completely broken.
> 
> Lots of broken virtio implementations out there it would seem :-(

Not really, most of virtio implementations are in full control of
memory, being part of the hypervisor.

> 
> > > The xen_domain() check in Linux makes it so that vring_use_dma_api
> > > returns the opposite value on native Linux compared to Linux as Xen/ARM
> > > DomU by "accident". By "accident" because there is no architectural
> > > reason why Linux Xen/ARM DomU should behave differently compared to
> > > native Linux in this regard.
> > > 
> > > I hope that now it is clearer why I think the if (xen_domain()) check
> > > needs to be improved anyway, even if we fix generic dma_ops with virtio
> > > interfaces missing VIRTIO_F_ACCESS_PLATFORM.
> > 
> > IMHO that Xen quirk should never have been added in this form..
> 
> Would you be in favor of a more flexible check along the lines of the
> one proposed in the patch that started this thread:
> 
>     if (xen_vring_use_dma())
>             return true;
> 
> 
> xen_vring_use_dma would be implemented so that it returns true when
> xen_swiotlb is required and false otherwise.

I'll need to think about it. Sounds reasonable on the surface ...

-- 
MST

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
