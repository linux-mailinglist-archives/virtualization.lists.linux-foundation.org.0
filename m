Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 976A11BA7D0
	for <lists.virtualization@lfdr.de>; Mon, 27 Apr 2020 17:21:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2838487D3D;
	Mon, 27 Apr 2020 15:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TAk7RNhTSNrc; Mon, 27 Apr 2020 15:21:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9C8A687DFE;
	Mon, 27 Apr 2020 15:21:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8B252C0172;
	Mon, 27 Apr 2020 15:21:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 67FF2C0172
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5A96E86016
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 27tM4mN+3eVo
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:21:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 522B6848A3
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 15:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588000870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t0zUuDSHC2LYYJLNAsloYEAAqSEOkEn10YRd/wXdi+k=;
 b=SfZ0IZheyMg6ghHTswOQGdrY+Rpys1Mi/KkEVLlbxCDRtBaItNqwp/1tLm81F1R0dUNVwE
 vZ7R8h9VNwMlVmM/DrOIszdygHdadb3hcjGsOpvO71bnsyupfDTxgC8IYYkElvOa5CiaO/
 +RFALVW2+XmKzEB6dGNJY7orxCdqWy4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-xlkX3vMPPo6VirFsdsqsDw-1; Mon, 27 Apr 2020 11:21:08 -0400
X-MC-Unique: xlkX3vMPPo6VirFsdsqsDw-1
Received: by mail-wr1-f70.google.com with SMTP id i10so10638265wrq.8
 for <virtualization@lists.linux-foundation.org>;
 Mon, 27 Apr 2020 08:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t0zUuDSHC2LYYJLNAsloYEAAqSEOkEn10YRd/wXdi+k=;
 b=hpcJPkG+/7eY5EoQXsI+yHfAf1KTKy16hMc9JLBGFJZezmflyzHwn4KWDSRmcXjmTj
 9EwfwyEV6qDHWO+8pkAUDelGgO7Fzm1fFgs53T1RKHOwAaTqJPDWz07QY7GeG0RHAW1n
 Ow1FXgwBXINlcveDGRm17Km8qhm8Agm3ElYc2Z9311RweIQOKbdSG3VwyNN1Spl8IiSB
 nUpSQ0enb19n9vnthudE59Z09Izg7FWskdm3tIYdnL+JuoX2iQEOWK7UX/Gn/hlYtABo
 bH/dXCfxI2Fy+tHVGbLeJFgyPBX5eOO69wUuoN9sWo+zeyl10evAz3xoksp7khnwsAKI
 MKjw==
X-Gm-Message-State: AGi0PuaC/F3vTjhg4TO+y0ez7YPRvSJ29UntKzTYuOjgfOX+O0qh0SUL
 CyoNWRxlbIi63752UgQSo956GfFgZpsUgcV1gN+mnefccrrPbLEIwRAtxirnbP736zzofOHBZ3Y
 A5DlwXc6NRtUWuNTEPhNOtIhR0AGm0Bc6EotBWTHVuQ==
X-Received: by 2002:a1c:b445:: with SMTP id d66mr38647wmf.187.1588000867454;
 Mon, 27 Apr 2020 08:21:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypIZ5/J/wN/0wkBkOIE/TjfFJ5VeKIYdPSnC6DlZr/llDxsorbTrSb9AdWnEjmL3w4GukHw2OQ==
X-Received: by 2002:a1c:b445:: with SMTP id d66mr38611wmf.187.1588000867197;
 Mon, 27 Apr 2020 08:21:07 -0700 (PDT)
Received: from steredhat (host108-207-dynamic.49-79-r.retail.telecomitalia.it.
 [79.49.207.108])
 by smtp.gmail.com with ESMTPSA id r3sm22637536wrx.72.2020.04.27.08.21.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 08:21:06 -0700 (PDT)
Date: Mon, 27 Apr 2020 17:21:03 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net-next 0/3] vsock: support network namespace
Message-ID: <20200427152103.r65new4r342crfs6@steredhat>
References: <20200116172428.311437-1-sgarzare@redhat.com>
 <20200427142518.uwssa6dtasrp3bfc@steredhat>
 <20200427102828-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200427102828-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org, netdev@vger.kernel.org,
 Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, davem@davemloft.net,
 Jorgen Hansen <jhansen@vmware.com>
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

On Mon, Apr 27, 2020 at 10:31:57AM -0400, Michael S. Tsirkin wrote:
> On Mon, Apr 27, 2020 at 04:25:18PM +0200, Stefano Garzarella wrote:
> > Hi David, Michael, Stefan,
> > I'm restarting to work on this topic since Kata guys are interested to
> > have that, especially on the guest side.
> > 
> > While working on the v2 I had few doubts, and I'd like to have your
> > suggestions:
> > 
> >  1. netns assigned to the device inside the guest
> > 
> >    Currently I assigned this device to 'init_net'. Maybe it is better
> >    if we allow the user to decide which netns assign to the device
> >    or to disable this new feature to have the same behavior as before
> >    (host reachable from any netns).
> >    I think we can handle this in the vsock core and not in the single
> >    transports.
> > 
> >    The simplest way that I found, is to add a new
> >    IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS to /dev/vsock to enable the feature
> >    and assign the device to the same netns of the process that do the
> >    ioctl(), but I'm not sure it is clean enough.
> > 
> >    Maybe it is better to add new rtnetlink messages, but I'm not sure if
> >    it is feasible since we don't have a netdev device.
> > 
> >    What do you suggest?
> 
> Maybe /dev/vsock-netns here too, like in the host?
> 

I'm not sure I get it.

In the guest, /dev/vsock is only used to get the CID assigned to the
guest through an ioctl().

In the virtio-vsock case, the guest transport is loaded when it is discovered
on the PCI bus, so we need a way to "move" it to a netns or to specify
which netns should be used when it is probed.

> 
> > 
> >  2. netns assigned in the host
> > 
> >     As Michael suggested, I added a new /dev/vhost-vsock-netns to allow
> >     userspace application to use this new feature, leaving to
> >     /dev/vhost-vsock the previous behavior (guest reachable from any
> >     netns).
> > 
> >     I like this approach, but I had these doubts:
> > 
> >     - I need to allocate a new minor for that device (e.g.
> >       VHOST_VSOCK_NETNS_MINOR) or is there an alternative way that I can
> >       use?
> 
> Not that I see. I agree it's a bit annoying. I'll think about it a bit.
> 

Thanks for that!
An idea that I had, was to add a new ioctl to /dev/vhost-vsock to enable
the netns support, but I'm not sure it is a clean approach.

> >     - It is vhost-vsock specific, should we provide something handled in
> >       the vsock core, maybe centralizing the CID allocation and adding a
> >       new IOCTL or rtnetlink message like for the guest side?
> >       (maybe it could be a second step, and for now we can continue with
> >       the new device)
> > 

Thanks,
Stefano

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
