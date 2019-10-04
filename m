Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A78D4CB72D
	for <lists.virtualization@lfdr.de>; Fri,  4 Oct 2019 11:16:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 317B71059;
	Fri,  4 Oct 2019 09:16:12 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3A9DCF3C
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 09:16:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D700C34F
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 09:16:10 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 335A42A09C4
	for <virtualization@lists.linux-foundation.org>;
	Fri,  4 Oct 2019 09:16:10 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id t11so2417634wro.10
	for <virtualization@lists.linux-foundation.org>;
	Fri, 04 Oct 2019 02:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hhPEpgLhkjexE7wGXfmiyqeRzNcW/U3S79ip8ewXhIg=;
	b=Y+2dXKgvGvyv+7JiwxGU8NFejOu7hcjsRA9/bmJZM6StgXQSogK9MvapIwVCt7SU4+
	XMNqgpUVNnoJUyKaM0IgabNWeS8fiLaZvHvhHONRuJOM6XoMLGTX0YM6MtU13Nncj8GN
	dbjjM6YHsfbrm5YFdrYLAF7nUT4IbgTs8SALpM4O0aPeEgRkESpfQNAgwJKc9dtkAKCE
	2G6dDcMp+rrvUtAVqH3Xi+/daNbuLbTGvvRYQjq/2xJr7VIL2GEacKGm+fafRkKyUAl5
	c9dy61SldL3hRV9flXikweJVmcHo11/mnvkQBzCF4E43xBBuGxH9JqDXOnkwL93/YI+L
	WcGQ==
X-Gm-Message-State: APjAAAWFNo3eR45nGQY6kdqItWb7JZHe2vRTz3z3MHMMA7b6oDy/baoX
	AKJ9HxLsogJdUiPNNhoiVa9cgjmlRnmu1bhN92dNiR8mElItZ7+QptQgvDoRGTnCM/aXqTMe0hr
	ISwTIJWohF+FmfmziK+Lm60EnVE8Ik4MdhRuga/KCTA==
X-Received: by 2002:a1c:9d15:: with SMTP id g21mr10287396wme.96.1570180568826; 
	Fri, 04 Oct 2019 02:16:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYyFXc0psA9cM79xGyuf3QCE7kgh2CziA2e0KZxOqK4U+Rh82+kx6tnfpcYC/+KSgegIYtMA==
X-Received: by 2002:a1c:9d15:: with SMTP id g21mr10287358wme.96.1570180568530; 
	Fri, 04 Oct 2019 02:16:08 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	q192sm7660110wme.23.2019.10.04.02.16.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 04 Oct 2019 02:16:07 -0700 (PDT)
Date: Fri, 4 Oct 2019 11:16:05 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [RFC PATCH 00/13] vsock: add multi-transports support
Message-ID: <20191004091605.ayed7iqjhurzrdap@steredhat>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<PU1P153MB0169970A7DD4383F06CDAB60BF9E0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PU1P153MB0169970A7DD4383F06CDAB60BF9E0@PU1P153MB0169.APCP153.PROD.OUTLOOK.COM>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	Stephen Hemminger <sthemmin@microsoft.com>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>,
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

On Fri, Oct 04, 2019 at 12:04:46AM +0000, Dexuan Cui wrote:
> > From: Stefano Garzarella <sgarzare@redhat.com>
> > Sent: Friday, September 27, 2019 4:27 AM
> >  ...
> > Patch 9 changes the hvs_remote_addr_init(). setting the
> > VMADDR_CID_HOST as remote CID instead of VMADDR_CID_ANY to make
> > the choice of transport to be used work properly.
> > @Dexuan Could this change break anything?
> 
> This patch looks good to me.
> 

Thank you very much for your reviews!

> > @Dexuan please can you test on HyperV that I didn't break anything
> > even without nested VMs?
> 
> I did some quick tests with the 13 patches in a Linux VM (this is not
> a nested VM) on Hyper-V and it looks nothing is broken. :-)
> 

Great :-)

> > I'll try to setup a Windows host where to test the nested VMs
> 
> I suppose you're going to run a Linux VM on a Hyper-V host,
> and the Linux VM itself runs KVM/VmWare so it can create its own child 
> VMs. IMO this is similar to the test "nested KVM ( ..., virtio-transport[L1,L2]"
> you have done.

Yes, I think so. If the Hyper-V transport works well without nested VM,
it should work the same with a nested KVM/VMware.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
