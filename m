Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CBEA4EC7
	for <lists.virtualization@lfdr.de>; Mon,  2 Sep 2019 07:19:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 81FF89CA;
	Mon,  2 Sep 2019 05:19:27 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6B64B41C
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 05:19:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 98B525D3
	for <virtualization@lists.linux-foundation.org>;
	Mon,  2 Sep 2019 05:19:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECA72C058CA4;
	Mon,  2 Sep 2019 05:19:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-95.ams2.redhat.com
	[10.36.116.95])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D46660127;
	Mon,  2 Sep 2019 05:19:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id C51B316E08; Mon,  2 Sep 2019 07:19:21 +0200 (CEST)
Date: Mon, 2 Sep 2019 07:19:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Chia-I Wu <olvaffe@gmail.com>
Subject: Re: [PATCH] drm/virtio: Use vmalloc for command buffer allocations.
Message-ID: <20190902051921.nczclnaqcmxlh7bz@sirius.home.kraxel.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
	<20190830060857.tzrzgoi2hrmchdi5@sirius.home.kraxel.org>
	<CAASgrz2v0DYb_5A3MnaWFM4Csx1DKkZe546v7DG7R+UyLOA8og@mail.gmail.com>
	<20190830111605.twzssycagmjhfa45@sirius.home.kraxel.org>
	<CAPaKu7QeYDqek7pBSHmg1E5A9h9E=njrvLxBMnkCtqeb3s77Cg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPaKu7QeYDqek7pBSHmg1E5A9h9E=njrvLxBMnkCtqeb3s77Cg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 02 Sep 2019 05:19:23 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
	ML dri-devel <dri-devel@lists.freedesktop.org>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	=?utf-8?B?U3TDqXBoYW5l?= Marchesin <marcheu@chromium.org>,
	"open list:VIRTIO CORE,
	NET AND BLOCK DRIVERS" <virtualization@lists.linux-foundation.org>
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

> > Completely different approach: use get_user_pages() and don't copy the
> > execbuffer at all.
> It would be really nice if execbuffer does not copy.
> 
> The user space owns the buffer and may overwrite the contents
> immediately after the ioctl.

Oh, right.  The exec ioctl doesn't block.  So this doesn't work (breaks
userspace abi).  Scratch the idea then.

> We also need a flag to indicate that the
> ownership of the buffer is transferred to the kernel.

Yes, with an additional flag for the changed behavior it could work.

cheers,
  Gerd

_______________________________________________
Virtualization mailing list
Virtualization@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/virtualization
