Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 1400C99062
	for <lists.virtualization@lfdr.de>; Thu, 22 Aug 2019 12:08:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7E631DC2;
	Thu, 22 Aug 2019 10:08:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CEC83B8E
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 10:08:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30C7367F
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 10:08:40 +0000 (UTC)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
	[209.85.221.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9241B11A06
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 10:08:39 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id m7so2949100wrw.22
	for <virtualization@lists.linux-foundation.org>;
	Thu, 22 Aug 2019 03:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+QZ6pW149hcLIfsZZS+dKkZglSU+Xi8vHC91tSDHm3c=;
	b=oxKbPDb0dgsqIXwdyz3TEjOjFMPaMjaiPKmhQQ+xt1w05qo5YVMKHsenI4sK1mDA59
	3W6KYVANsLQsAAMFOiRn6XoyrnGPU3+6LTb7faQ0uXRTgmY1gfiTviXXianlatxHDaLW
	k9p50gvj1peL+Xy9GJU93XLYVPWhzzRLHwN6P+SeMIjnMOrGMTrvqTl9W5y8tiEYav3W
	d9ycqTH6DVYi/pozmKWE9dqgt1btm4ur9OjOYx3ydiNEG9vPCQgEjLfj010lm2ElxP5f
	VUWsWl+OKr1xAU4Oz+GR41szsDhLc15ooGmZqONJnbe3mNRs0JxGfr4lJYbGa6vJzjtN
	m6dw==
X-Gm-Message-State: APjAAAUFzaVWiZT7k3NhpvaKCXlyCqrv3tCzNk8EGB+JT+/trXQdDpmC
	o/L5P/F+ofc+W4xwOBuaRaIEEINxJnOnHNNryZvpgKxBPq9o/QUr8Df0mdjZ2srL9BXiyHzwTBs
	cGRvAOS6QTy+Ym43OvlG0fXXvQEwEOrS04lw1kQI8aw==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr5210671wmc.126.1566468518290; 
	Thu, 22 Aug 2019 03:08:38 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0XnwkglmAIZNRemEqCnbp6/DI7ya5vpk8WBx5UrfbHbyKJgBnEIawFQuaHzBUlbkohxgoxQ==
X-Received: by 2002:a1c:7513:: with SMTP id o19mr5210642wmc.126.1566468518041; 
	Thu, 22 Aug 2019 03:08:38 -0700 (PDT)
Received: from steredhat (host80-221-dynamic.18-79-r.retail.telecomitalia.it.
	[79.18.221.80]) by smtp.gmail.com with ESMTPSA id
	o129sm7596453wmb.41.2019.08.22.03.08.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 22 Aug 2019 03:08:37 -0700 (PDT)
Date: Thu, 22 Aug 2019 12:08:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>, Jorgen Hansen <jhansen@vmware.com>
Subject: Re: [PATCH v2 10/11] vsock_test: skip read() in test_stream*close
	tests on a VMCI host
Message-ID: <20190822100835.7u27ijlaydk72orv@steredhat>
References: <20190801152541.245833-1-sgarzare@redhat.com>
	<20190801152541.245833-11-sgarzare@redhat.com>
	<20190820083203.GB9855@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190820083203.GB9855@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	"David S. Miller" <davem@davemloft.net>
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

On Tue, Aug 20, 2019 at 09:32:03AM +0100, Stefan Hajnoczi wrote:
> On Thu, Aug 01, 2019 at 05:25:40PM +0200, Stefano Garzarella wrote:
> > When VMCI transport is used, if the guest closes a connection,
> > all data is gone and EOF is returned, so we should skip the read
> > of data written by the peer before closing the connection.
> 
> All transports should aim for identical semantics.  I think virtio-vsock
> should behave the same as VMCI since userspace applications should be
> transport-independent.

Yes, it is a good point!

> 
> Let's view this as a vsock bug.  Is it feasible to change the VMCI
> behavior so it's more like TCP sockets?  If not, let's change the
> virtio-vsock behavior to be compatible with VMCI.

I'm not sure it is feasible to change the VMCI behavior. IIUC reading the
Jorgen's answer [1], this was a decision made during the implementation.

@Jorgen: please, can you confirm? or not :-)

If it is the case, I'll change virtio-vsock to the same behavior.


Thanks,
Stefano

[1] https://patchwork.ozlabs.org/cover/847998/#1831400
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
