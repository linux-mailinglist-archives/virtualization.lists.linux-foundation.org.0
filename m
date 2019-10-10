Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1E6D2A4E
	for <lists.virtualization@lfdr.de>; Thu, 10 Oct 2019 15:04:52 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 286C914D5;
	Thu, 10 Oct 2019 13:04:45 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 05FC114C7
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 13:04:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A85308BC
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 13:04:43 +0000 (UTC)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
	[209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 175F083F3C
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 13:04:43 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id k184so2605537wmk.1
	for <virtualization@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 06:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2MtH4zvS+teTx0r1qM2asg1XxOF0qUFTTboopmawOE4=;
	b=TML2b0ke0B3QPFPzM6PgWxdHdWqFLbgraAjQcaAVGPoo1vgMsLkLwmpvyhTDowFsH5
	Ou8M/vXs7ovj6cMkUzYzFvWgapvodJdCxh6MR2qZO5Qu/Wr0vFyqlYxC20Kfi8kOlR15
	98eRU+NSGWRV6TJ2WZqToP/FP2sq4ftQq0PObUruGd778ucYhZMdWxDaay1T2+ddy9QU
	IqEBTuqCSG9TSqpi/5w9Qir+J4YtPRezbUhcKO36NnlQwOXPqjBETSBL2/aR+5Aufzg/
	bnOxweEij8YyizInZ+NXM6MMav+NUuiKzz9Q3WdDtm0QzbVTGUCNoUk957oFlFWrASPQ
	Fyrg==
X-Gm-Message-State: APjAAAXP1g17TvT1DE/byYpktbBNe/Ta87GOn5kYf4lbM9BJ/bFvycD5
	LCyhOln6dz5lROWRmD1CEZPEbzVxkxlveyBhr+bGNZzo8B5nD9+5ORNG2YWigvQThFbFTIofLgx
	cENwnLyMezB6G95pgbOp9sUcvYHqA+Err89w7PCsuQQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id
	e9mr7070282wma.74.1570712681788; 
	Thu, 10 Oct 2019 06:04:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKWS9Yagf4LaasayMPOMgQigEaVeXAInUpVNhLSOAsaDv27fYHGGISL/SEaullOo401iX5OQ==
X-Received: by 2002:a05:600c:2549:: with SMTP id
	e9mr7070261wma.74.1570712681580; 
	Thu, 10 Oct 2019 06:04:41 -0700 (PDT)
Received: from steredhat (host174-200-dynamic.52-79-r.retail.telecomitalia.it.
	[79.52.200.174])
	by smtp.gmail.com with ESMTPSA id r7sm4504378wrt.28.2019.10.10.06.04.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 06:04:40 -0700 (PDT)
Date: Thu, 10 Oct 2019 15:04:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: [RFC PATCH 11/13] vsock: add 'transport_hg' to handle g2h\h2g
	transports
Message-ID: <20191010130438.3hbv33fgslmlprtf@steredhat>
References: <20190927112703.17745-1-sgarzare@redhat.com>
	<20190927112703.17745-12-sgarzare@redhat.com>
	<20191009131643.GL5747@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191009131643.GL5747@stefanha-x1.localdomain>
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

On Wed, Oct 09, 2019 at 02:16:43PM +0100, Stefan Hajnoczi wrote:
> On Fri, Sep 27, 2019 at 01:27:01PM +0200, Stefano Garzarella wrote:
> > VMCI transport provides both g2h and h2g behaviors in a single
> > transport.
> > We are able to set (or not) the g2h behavior, detecting if we
> > are in a VMware guest (or not), but the h2g feature is always set.
> > This prevents to load other h2g transports while we are in a
> > VMware guest.
> 
> In the vhost_vsock.ko case we only register the h2g transport when
> userspace has loaded the module (by opening /dev/vhost-vsock).
> 
> VMCI has something kind of similar: /dev/vmci and the
> vmci_host_active_users counter.  Maybe we can use this instead of
> introducing the transport_hg concept?

Yes, maybe we can register the host in the vmci_host_do_init_context().

I also don't like a lot the transport_hg concept, so I'll try to found
an alternative.

Thanks,
Stefano
_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
