Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA83D3BCE
	for <lists.virtualization@lfdr.de>; Fri, 11 Oct 2019 11:00:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id CF2D213DC;
	Fri, 11 Oct 2019 09:00:44 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C142110D4
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:52:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6186514D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:52:03 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
	[209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2FC93DE0F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 08:52:02 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id k2so4043149wrn.7
	for <virtualization@lists.linux-foundation.org>;
	Fri, 11 Oct 2019 01:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=bm3aGONhK4qHoU5UjTbFZHuFrC1vqMKeEY0f1MpcuKs=;
	b=By6gOsqD/WNBEJWqoAgLOcMwusohd8Jld4DYxkIwK13+6YUkUjklR/Zrtj2AD2tQww
	wuVjLfOt7U6tcP28GK6acLj8eWXKzEJb3JWWeDIBQIgHAYdcEx9legCwZ9oHb7lsaU8B
	Xsl4AkbJZdKBSLy+tXkS+WxZ2TSr0m91YzKcX72m/9Toc1u+8+73CvgBJbfal19jpgfl
	xi/9dCW6dWPxQlq0pE+QhbcpmkTPqLW9qFvKz59+B4TcVu1N49Y/iDRBDbih+v0Idd3r
	L/JnBN94QLSkDEQ2R+IzkEaMuCHF0KgchbDKkuezTjWwXKX7K93XnwTzbiMUzTcwlGH5
	9naw==
X-Gm-Message-State: APjAAAWEftL/mcAwkJDiasupeS3b7+ZCHyDFvwWqXT4eHLE/aNPgI8GC
	eSBnzpLGhv5PEJhpl/1y2yUpY75WJtyuIiZDOcEn9xi+GrFdoMtT1k3WPIwS72wkML+qjuDvVpg
	mqJv6kmVuYEP2HU98PhQ5UlV5mEww1RTG7xhicdnZJw==
X-Received: by 2002:adf:f50b:: with SMTP id q11mr8542918wro.310.1570783921675; 
	Fri, 11 Oct 2019 01:52:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy1tPYaVEApdDIIQuAyje0VVr9AdUGsps1WDvoQMdr3X8xYr+LiIbxou3tR8pwnY/h86mPFNQ==
X-Received: by 2002:adf:f50b:: with SMTP id q11mr8542895wro.310.1570783921424; 
	Fri, 11 Oct 2019 01:52:01 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174]) by smtp.gmail.com with ESMTPSA id
	z189sm13295813wmc.25.2019.10.11.01.51.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 11 Oct 2019 01:52:00 -0700 (PDT)
Date: Fri, 11 Oct 2019 10:51:58 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [RFC PATCH 07/13] vsock: handle buffer_size sockopts in the core
Message-ID: <20191011085158.wiiv4av5fgipm4k7@steredhat>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-8-sgarzare@redhat.com>
	<20191009123026.GH5747@stefanha-x1.localdomain>
	<20191010093254.aluys4hpsfcepb42@steredhat>
	<20191011082714.GF12360@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011082714.GF12360@stefanha-x1.localdomain>
User-Agent: NeoMutt/20180716
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sasha Levin <sashal@kernel.org>, linux-hyperv@vger.kernel.org,
	Stephen Hemminger <sthemmin@microsoft.com>, kvm@vger.kernel.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Jorgen Hansen <jhansen@vmware.com>
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

On Fri, Oct 11, 2019 at 09:27:14AM +0100, Stefan Hajnoczi wrote:
> On Thu, Oct 10, 2019 at 11:32:54AM +0200, Stefano Garzarella wrote:
> > On Wed, Oct 09, 2019 at 01:30:26PM +0100, Stefan Hajnoczi wrote:
> > > On Fri, Sep 27, 2019 at 01:26:57PM +0200, Stefano Garzarella wrote:
> > > Another issue is that this patch drops the VIRTIO_VSOCK_MAX_BUF_SIZE
> > > limit that used to be enforced by virtio_transport_set_buffer_size().
> > > Now the limit is only applied at socket init time.  If the buffer size
> > > is changed later then VIRTIO_VSOCK_MAX_BUF_SIZE can be exceeded.  If
> > > that doesn't matter, why even bother with VIRTIO_VSOCK_MAX_BUF_SIZE
> > > here?
> > > 
> > 
> > The .notify_buffer_size() should avoid this issue, since it allows the
> > transport to limit the buffer size requested after the initialization.
> > 
> > But again the min set by the user can not be respected and in the
> > previous implementation we forced it to VIRTIO_VSOCK_MAX_BUF_SIZE.
> > 
> > Now we don't limit the min, but we guarantee only that vsk->buffer_size
> > is lower than VIRTIO_VSOCK_MAX_BUF_SIZE.
> > 
> > Can that be an acceptable compromise?
> 
> I think so.
> 
> Setting buffer sizes was never tested or used much by userspace
> applications that I'm aware of.  We should probably include tests for
> changing buffer sizes in the test suite.

Good idea! We should add a test to check if min/max are respected,
playing a bit with these sockopt.

I'll do it in the test series!

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
