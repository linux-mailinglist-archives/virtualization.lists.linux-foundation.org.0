Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5B8D4351
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 16:46:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 40ABA1462;
	Fri, 11 Oct 2019 14:46:42 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6FD9D145E
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:39:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EE72C8B4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:39:34 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B4227EBAE
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 14:39:34 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id x11so2823594wro.15
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 07:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=liQbAgHSmXMDz2MwPXfH9RoWMwZsEiL9QVC3TV8t25k=;
	b=UB5rupLXfkD7kiqbjFhceMcoSYm3NQGbw0ivtyRQmHoMJZ/7kbTXMR2yvWvwTR22ZA
	Kwpzd3iLnn8GI4CEXZAJxrU8SiP6N0vETaw2cXiHIWuuLXi492nzeIiZOEdVLOjZUnhH
	IaTKV98YPDMTvhbZstntVBja5PmutmrOXBQ6qPWHCv/GUNj3BDvpD/bgjSeyRUmWk4oe
	NyTviX3H5MI3gpcsfbg3X28OHkTKPq2Bl3HJM+3mQ7j0jRuVXoKo8VgZQwonl6MXgQb9
	WvVyAX1dItzX7g5Li8IaSKmz7NC51PWeb1MrYJtw+vJwuuq+h5CcaJuYNoRiaS2xc7M1
	F5VA==
X-Gm-Message-State: APjAAAWq3j9gWO4l4ZklW7rFL2sC0DxteHmoAjrIvJ396vbsGGscWzi9
	A8OvSEhiZPO8u9IX0iasjrGAd1UGeAL1XeUGvUjVRnj6zr0MS7eQNUAzaKVW/kRz+tXFyOIfzbZ
	KWAUQVMwFL3eGMC4Lj9rdULlK3OG4WFsjgrFaLPHCDA==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr13566582wru.43.1570804773105; 
	Fri, 11 Oct 2019 07:39:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxOgGfiWykQOZWxvAQCAQ5lTZZlOEdFhFzDrlVB3KHciz9JN8beokYLGpmV6a5f51pd2LT9pQ==
X-Received: by 2002:a5d:6984:: with SMTP id g4mr13566561wru.43.1570804772906; 
	Fri, 11 Oct 2019 07:39:32 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174])
	by smtp.gmail.com with ESMTPSA id u25sm9661696wml.4.2019.10.11.07.39.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 07:39:32 -0700 (PDT)
Date: Fri, 11 Oct 2019 16:39:30 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH net 2/2] vhost/vsock: don't allow half-closed socket in
	the host
Message-ID: <20191011143930.hs2pkz5i2bci7igs@steredhat>
References: <20191011130758.22134-1-sgarzare@redhat.com>
	<20191011130758.22134-3-sgarzare@redhat.com>
	<20191011102246-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011102246-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=unavailable version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Adit Ranadive <aditr@vmware.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>, Jorgen Hansen <jhansen@vmware.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

On Fri, Oct 11, 2019 at 10:26:34AM -0400, Michael S. Tsirkin wrote:
> On Fri, Oct 11, 2019 at 03:07:58PM +0200, Stefano Garzarella wrote:
> > vmci_transport never allowed half-closed socket on the host side.
> > In order to provide the same behaviour, we changed the
> > vhost_transport_stream_has_data() to return 0 (no data available)
> > if the peer (guest) closed the connection.
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> 
> I don't think we should copy bugs like this.
> Applications don't actually depend on this VMCI limitation, in fact
> it looks like a working application can get broken by this.
> 
> So this looks like a userspace visible ABI change
> which we can't really do.
> 
> If it turns out some application cares, it can always
> fully close the connection. Or add an ioctl so the application
> can find out whether half close works.
> 

I got your point.
Discard this patch.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
