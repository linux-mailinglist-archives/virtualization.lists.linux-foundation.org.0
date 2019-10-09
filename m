Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D79D0B9E
	for <lists.virtualization@lfdr.de>; Wed,  9 Oct 2019 11:44:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 399D7F58;
	Wed,  9 Oct 2019 09:44:40 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6F174949
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 09:44:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 181055F4
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 09:44:38 +0000 (UTC)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
	[209.85.221.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 469ACC028320
	for <virtualization@lists.linux-foundation.org>;
	Wed,  9 Oct 2019 09:44:37 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id w10so850881wrl.5
	for <virtualization@lists.linux-foundation.org>;
	Wed, 09 Oct 2019 02:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IgLlslTtHyY/DsCT/GempjMqnPIRbjKjjsT71GS80BU=;
	b=KE8doEh0Na1Q+jvAvSVISD6qEFEG9u2A89ohxjJaw7ICLC4CtdnXuRxALXhensDpJo
	Kc3Zt6Bvgf+rW3j8fKlCtUwQKa9vbVS65X4Mzkpa991CkoCIvhYo9qwiZo7qVl7HUAwy
	VV0SbdGRNB0sjtDI1CrQv+z9lbrK5x4MuaYhumOxtDbpqRB7l3ePus+ZMROryLgBS/EG
	orPm6kx7ckAKPrf5MbhHgpRWu9Mu7AQt8JR5EjswZ8L9dWeCGrOTh2qCjLUmUwsINenT
	vfIYiBb1iMhtMsWj+WCYbt0e04WFfeoaTvpthASm7FwGprytsbMC2qntCneJlaP8RKbS
	32KA==
X-Gm-Message-State: APjAAAXBlOCXvhaQXoJiwWYk+ohBt7LQjYIqWzjFPS3x9hsBgjfVTKZ7
	7hK11kIwp/31NgRoeG3SRJa0K9nwxQ3qg/qfKgO1qbtVKdcmX4UQ8+CaLDSil0nklbeo7dUVZNg
	5R/cUvZMWSf0uuBmt5BZmhKPS58Yd9IrfTsKSkZ+kZg==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr1768167wmb.49.1570614275927; 
	Wed, 09 Oct 2019 02:44:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy4Wse3vGoQIgd/ml9oYw6+IUa/k66QMkr3IXKbfsrgPgFKxrYzXylx/6gMsMm5PeJvNXxJPg==
X-Received: by 2002:a1c:7311:: with SMTP id d17mr1768146wmb.49.1570614275686; 
	Wed, 09 Oct 2019 02:44:35 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174])
	by smtp.gmail.com with ESMTPSA id a3sm1320859wmj.35.2019.10.09.02.44.34
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 09 Oct 2019 02:44:35 -0700 (PDT)
Date: Wed, 9 Oct 2019 11:44:32 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: netdev@vger.kernel.org, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 11/13] vsock: add 'transport_hg' to handle g2h\h2g
	transports
Message-ID: <20191009094432.by5zs4c3binrznpp@steredhat>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-12-sgarzare@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927112703.17745-12-sgarzare@redhat.com>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>, Dexuan Cui <decui@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, linux-kernel@vger.kernel.org,
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

On Fri, Sep 27, 2019 at 01:27:01PM +0200, Stefano Garzarella wrote:
> VMCI transport provides both g2h and h2g behaviors in a single
> transport.
> We are able to set (or not) the g2h behavior, detecting if we
> are in a VMware guest (or not), but the h2g feature is always set.
> This prevents to load other h2g transports while we are in a
> VMware guest.
> 
> This patch adds a new 'transport_hg' to handle this case, reducing
> the priority of transports that provide both g2h and h2g
> behaviors. A transport that has g2h and h2g features, can be
> bypassed by a transport that has only the h2g feature.
> 

Since I'm enabling the VSOCK_TRANSPORT_F_G2H in the vmci_transport only
when we run in a VMware guest, this patch doesn't work well if a KVM (or
HyperV) guest application create an AF_VSOCK socket and no transports are
loaded, because in this case the vmci_transport is loaded
(MODULE_ALIAS_NETPROTO(PF_VSOCK)) and it is registered as transport_h2g.

At this point, if we want to run a nested VM using vhost_transport, we
can't load it.

So, I can leave VSOCK_TRANSPORT_F_G2H always set in the vmci_transport
and this should fix this issue.
Or maybe I need to change how the registering works, e.g. handling a list
of transport registered, setting priority or using the last registered
transport.

Any suggestion?

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
