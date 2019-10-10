Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DF797D243D
	for <lists.virtualization@lfdr.de>; Thu, 10 Oct 2019 10:50:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 71A451026;
	Thu, 10 Oct 2019 08:50:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9C2CF101F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 08:50:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 36C2A8AB
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 08:50:25 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A7C9590916
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 08:50:24 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id w10so2407356wrl.5
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 01:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kbUGk/zH7Jd7BlhB+4/oDRz4mPdioNN/Nf5e+ZFx1KA=;
	b=RTmt+tUdE6Mak4x6JAK875uN/zoBoNTZ7bttmLtxBgZMmt/fqU/CjGytgZdrPS3vCh
	s4NiZ603ZenclC7VzM4pGDCL8qWtplyId79i5wlrderiwxyg8ELt+xqHVR3Z6/cWiwZ8
	IicYNQ7iGcvXyKY44OOPNjF3Op7hCryUELCQEyKu3hyB0sW8gv6LYrpcC1pq7dhOdtOl
	PeaBl8vOYvCWXRLK+xNH+PXmiZcVW/sMVl4XDCXhzOnBOEwrP+4Am7rubZg5iXj3AeuA
	EbzrH9XB7TRZ02j76khs/F5+dr+/lBMO8IPvyKF8ZEnJ+mPnyLskamSuEqe4l8KuAL+e
	kcmA==
X-Gm-Message-State: APjAAAVXUTYE4VBC7pkuLSSVf3TsZ5kEKX4uqAMEsk1V7aiUvSguUeGL
	Is6/7pMqC8gvmW07Hf0G+PGZIBEM+plK1uVWWnJcpC7QaNkBEBVZiEVRrd/jPWZZA0yHBZJl+od
	WX4CeejUq19cLr4pP6Jhm2gHuJhL29PHaEStfca7wmQ==
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr7690228wrw.286.1570697423413; 
	Thu, 10 Oct 2019 01:50:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwoCA81jZEGW66oRDsEIESbM+AgkqiF20vI6cPaP0YoBTkJocF4+GdZwig79Aeir6Qomx30bw==
X-Received: by 2002:a5d:6a4e:: with SMTP id t14mr7690208wrw.286.1570697423217; 
	Thu, 10 Oct 2019 01:50:23 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174])
	by smtp.gmail.com with ESMTPSA id y8sm6284711wrm.64.2019.10.10.01.50.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 01:50:22 -0700 (PDT)
Date: Thu, 10 Oct 2019 10:50:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [RFC PATCH 06/13] vsock: add 'struct vsock_sock *' param to
	vsock_core_get_transport()
Message-ID: <20191010085020.w5mbse7mnpzalhyr@steredhat>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-7-sgarzare@redhat.com>
	<20191009115433.GG5747@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009115433.GG5747@stefanha-x1.localdomain>
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

On Wed, Oct 09, 2019 at 12:54:33PM +0100, Stefan Hajnoczi wrote:
> On Fri, Sep 27, 2019 at 01:26:56PM +0200, Stefano Garzarella wrote:
> > -const struct vsock_transport *vsock_core_get_transport(void)
> > +const struct vsock_transport *vsock_core_get_transport(struct vsock_sock *vsk)
> >  {
> >  	/* vsock_register_mutex not taken since only the transport uses this
> >  	 * function and only while registered.
> >  	 */
> > -	return transport_single;
> 
> This comment is about protecting transport_single.  It no longer applies
> when using vsk->transport.  Please drop it.

Right, dropped.

> 
> Otherwise:
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
