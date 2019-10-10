Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF42FD26B9
	for <lists.virtualization@lfdr.de>; Thu, 10 Oct 2019 11:53:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1539114C6;
	Thu, 10 Oct 2019 09:52:58 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4D8E0B50
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 09:52:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E89228A7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 09:52:55 +0000 (UTC)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
	[209.85.128.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4628881F31
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 09:52:55 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id l3so2365996wmf.8
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 02:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=TqIbFc3q/Gn71WMn1cgD1WOyhahKFHqycUgmiD17c60=;
	b=FLHbOb2VNRBSlArZd6TzOn0rEC3+PDseGoIsO/M1IroPlczPQAWI3LJEundD9Xdgmk
	JfNdnhBYhW0E1lzAepzK6lc1nhn23Ht2wDZb686WAmB6LowRgwnujLHcbD4IGJlP8tuW
	TPQzUPKkSltoQoxEuJ2JgCEQVhlHydu3gX4Pd+nyyZQDKDz4Hkdlsvlwn6M7ifStyRRr
	/DZfRa2Gsd14HqQDf5jwyJMo5AkSkgLiHfGw2zDWK579bncljUgfs8aqDmXWyDOwY/0Y
	p5vftjRcK1ltnDKs7ZGf5pgv+a0O+d4ZvgRHx80NxRxRJH5lVnMokGA1aQVFX28bCFZ+
	5spg==
X-Gm-Message-State: APjAAAXJyOYdZgBgYyiA2MJ1O9ATuemSLxq6HpoG+MtjdHXXsONg4nJy
	T0pGPe9DTDkidz2JZkanw5+fKJaKesTCYUrrQnTRf0bOhYg2RyTDhUO3uTKvHSNX9kjMYmU7tR6
	2AvNbwWkEKuswdyuzRtmIt5VZCVoPZ8H/64sP1p2G3Q==
X-Received: by 2002:a05:600c:28d:: with SMTP id
	13mr198471wmk.100.1570701173968; 
	Thu, 10 Oct 2019 02:52:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypapq2mOJT0UwRrfDwUNCu9powWRCw63cVBYVEzLpMWYF3N5fg0WGtA5sfkqGUCAP/OmrMBQ==
X-Received: by 2002:a05:600c:28d:: with SMTP id
	13mr198456wmk.100.1570701173753; 
	Thu, 10 Oct 2019 02:52:53 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174])
	by smtp.gmail.com with ESMTPSA id c6sm5901462wrm.71.2019.10.10.02.52.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 02:52:53 -0700 (PDT)
Date: Thu, 10 Oct 2019 11:52:50 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [RFC PATCH 08/13] vsock: move vsock_insert_unbound() in the
	vsock_create()
Message-ID: <20191010095250.zmwmce7bgqgf3nv4@steredhat>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-9-sgarzare@redhat.com>
	<20191009123423.GI5747@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009123423.GI5747@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
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

On Wed, Oct 09, 2019 at 01:34:23PM +0100, Stefan Hajnoczi wrote:
> On Fri, Sep 27, 2019 at 01:26:58PM +0200, Stefano Garzarella wrote:
> > vsock_insert_unbound() was called only when 'sock' parameter of
> > __vsock_create() was not null. This only happened when
> > __vsock_create() was called by vsock_create().
> > 
> > In order to simplify the multi-transports support, this patch
> > moves vsock_insert_unbound() at the end of vsock_create().
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  net/vmw_vsock/af_vsock.c | 13 +++++++++----
> >  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> Maybe transports shouldn't call __vsock_create() directly.  They always
> pass NULL as the parent socket, so we could have a more specific
> function that transports call without a parent sock argument.  This
> would eliminate any concern over moving vsock_insert_unbound() out of
> this function.  In any case, I've checked the code and this patch is
> correct.

Yes, I agree with you, I can add a new patch to do this cleaning.

> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
